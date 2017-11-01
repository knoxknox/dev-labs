require_relative 'path'
require_relative 'map/map'
require_relative 'map/node'
require_relative 'math/distance'
require_relative 'render/renderer'

# create map
map = Map.new(10)
start = map.at(1, 1)
target = map.at(10, 10)

# create random barriers
0.upto(map.size - 1) do |i|
  0.upto(map[i].size - 1) do |j|
    map.fill(i, j) if rand < 0.2 && (i != target.x && j != target.y)
  end
end

# render optimal path to target
Renderer.new(map, Path.new(map, start: start, target: target).find).render
