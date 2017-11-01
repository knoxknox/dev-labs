##
# Estimates cost from node to target.
# http://theory.stanford.edu/~amitp/GameProgramming/Heuristics.html
#
class Distance
  def self.estimate(node, target_x, target_y)
    Math.sqrt((target_x - node.x) ** 2 + (target_y - node.y) ** 2).floor
  end
end
