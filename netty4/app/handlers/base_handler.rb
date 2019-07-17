require 'uri'
require 'app/core/executor'

java_import 'io.netty.buffer.Unpooled'
java_import 'io.netty.util.CharsetUtil'
java_import 'java.util.concurrent.Callable'
java_import 'io.netty.channel.ChannelFutureListener'
java_import 'io.netty.handler.codec.http.HttpHeaders'
java_import 'io.netty.handler.codec.http.HttpVersion'
java_import 'io.netty.handler.codec.http.HttpResponseStatus'
java_import 'io.netty.handler.codec.http.DefaultFullHttpResponse'

module Labs
  class BaseHandler
    attr_reader :env, :request

    def initialize(ctx, request)
      @request = request
      @env = initialize_env(ctx, request)
      @executor_service = Executor.instance
    end

    def send_data(ctx, response)
      body = response.fetch(:body)
      status = response.fetch(:status)
      headers = response.fetch(:headers, {})

      content = Unpooled.copied_buffer(body, CharsetUtil::UTF_8)
      response = DefaultFullHttpResponse.new(HttpVersion::HTTP_1_1, status, content)

      response.headers.set(HttpHeaders::Names::DATE, Time.now.to_i)
      response.headers.set(HttpHeaders::Names::CONTENT_TYPE, 'application/json')
      response.headers.set(HttpHeaders::Names::CONTENT_LENGTH, content.readable_bytes)
      headers.each_pair { |header_name, value| response.headers.set(header_name, value) }

      future = ctx.write_and_flush(response)
      future.add_listener(ChannelFutureListener::CLOSE) if !@env[:keep_alive]
    end

    def send_error(ctx, response)
      default_status = HttpResponseStatus::INTERNAL_SERVER_ERROR
      send_data(ctx, body: response[:body], status: response.fetch(:status, default_status))
    end


    private

    def initialize_env(ctx, request)
      uri = URI.parse(request.get_uri)
      {
        time: Time.now,
        path: uri.path.to_s,
        query: uri.query.to_s,
        method: request.get_method.to_s,
        version: request.get_protocol_version.to_s,
        remote_addr: ctx.channel.remote_address.to_s,
        keep_alive: HttpHeaders::is_keep_alive(request),
        user_agent: request.headers.get(HttpHeaders::Names::USER_AGENT)
      }
    end

  end
end
