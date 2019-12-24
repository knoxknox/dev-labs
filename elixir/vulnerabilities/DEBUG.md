# Debug overview

Quick overview of debugging techniques.

## IO.inspect

```
my_list = [1, 2, 3]
IO.inspect(my_list) # => [1, 2, 3]
```
```
[1, 2, 3]
|> IO.inspect(label: "s1")
|> Enum.map(&(&1 * 2))
|> IO.inspect(label: "s2")
|> Enum.sum
# => s1: [1, 2, 3], s2: [2, 4, 6]
```
