module Labs
  class HealthHandler < BaseHandler

    def process(ctx, msg)
      if msg.java_kind_of?(HttpRequest)
        @executor_service.submit(
          ProcessHealthCallable.new(ctx, self),
          ProcessHealthCallback.new(ctx, self))
      end
    end

    class ProcessHealthCallable
      include Callable

      def initialize(ctx, handler)
        @ctx = ctx
        @handler = handler
      end

      def call
        host = java.net.InetAddress.get_local_host.get_host_name
        memory = java.lang.management.ManagementFactory.get_memory_mx_bean
        runtime = java.lang.management.ManagementFactory.get_runtime_mx_bean
        uptime = Time.at((runtime.get_start_time / 1000).floor).utc
        traffic_counter = @ctx.pipeline.get('traffic').traffic_counter.to_s

        body = {
          'host' => host,
          'uptime' => uptime,
          'traffic' => traffic_counter,
          'executors' => Executor.instance.stats,
          'heap_memory_usage' => memory.get_heap_memory_usage.to_string,
          'non_heap_memory_usage' => memory.get_non_heap_memory_usage.to_string
        }

        { body: body.to_s, status: HttpResponseStatus::OK }
      end
    end

    class ProcessHealthCallback
      include FutureCallback

      def initialize(ctx, handler)
        @ctx = ctx
        @handler = handler
      end

      def onSuccess(result)
        @handler.send_data(@ctx, result.slice(:body, :status))
      end

      def onFailure(exception)
        @handler.send_error(@ctx, body: "Error happens: #{exception}")
      end
    end

  end
end
