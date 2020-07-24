##
# This:
# > map = %{}
# > Enum.each([1, 2, 3], fn(x) -> Map.put(map, x, x) end)
#
# Should be changed to code below in FP:
# > Enum.reduce([1, 2, 3], %{}, fn(x, acc) -> Map.put(acc, x, x) end)
#
# We can't mutate data structures, so map in 1-st block of code will be empty.
# Every time you call Map.put(..) it will return a new map. See reduce (or fold).
#

blogs = [
  %{ owner: "owner1", posts: ["post1", "post2", "post3"] },
  %{ owner: "owner2", posts: ["post3", "post4", "post5"] },
  %{ owner: "owner3", posts: ["post3", "post4", "post6"] },
]

Enum.reduce blogs, %{}, fn(blog, result) ->
  Enum.reduce blog.posts, result, fn(post, result) ->
    if !Map.has_key?(result, post) do
      Map.put(result, post, blog.owner)
    else
      owner = Map.get(result, post)
      Map.put(result, post, "#{owner}, #{blog.owner}")
    end
  end
end

# returns map %{"post1" => "owner1", "post2" => "owner1", "post5" => "owner2",
#   "post3" => "owner1, owner2, owner3", "post4" => "owner2, owner3", "post6" => "owner3"}
