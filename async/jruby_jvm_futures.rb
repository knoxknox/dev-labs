java_import java.util.concurrent.CompletableFuture

# 1
future = CompletableFuture.supply_async { 'Hello' }

# 2
future = CompletableFuture.supply_async { 'Hello' }.
  then_apply { |x| "#{x} world" }.then_apply { |x| x.size }

# 3
future = CompletableFuture.supply_async { 'Hello' }.
  then_apply { |x| "#{x} world" }.then_accept { |x| puts x }

# 4
future = CompletableFuture.supply_async { 'Hello' }.
  then_compose { |x| CompletableFuture.supply_async { "#{x}!!!" } }

# 5
future1 = CompletableFuture.supply_async { '1' }
future2 = CompletableFuture.supply_async { '2' }
future3 = CompletableFuture.supply_async { '3' }
CompletableFuture.all_of(future1, future2, future3)

# 6
future = CompletableFuture.supply_async { raise 'Error' }
future.handle { |success, failure| puts "#{success}, #{failure}" }

CompletableFuture.supply_async { raise 'Error' }.
  exceptionally { |ex| puts ex }.then_accept { puts 'future complete' }
