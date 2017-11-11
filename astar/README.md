# astar

This is implementation of A* search algorithm.<br/>
It is based on arrays (instead of PriorityQueue).<br/>
The reason 'why?' is simplicity and educational purposes.

Example:
```
Start node: S [0, 0]
Target node: T [25, 25]
Disable diagonal search: true
```

```
S O   +       +                   + + +
  O + + +       +         +       +               +   +
+ O         +   +         +       +   +       +
O O +           + +       + +   + +   + +   + +     +
O +   + +       +   +       +     + +     + +         +   +
O   +     +   + + +     +   +     +
O + + +     +   +         +       +         + + + +
O O O   +       +   +                   +         +   +
    O + +   + + +           +         + + +   +           +
+ + O +     O O O +   + +     +         +             +   +
    O +     O + O         + + +   +             +   + +
+   O + O O O + O O     +   + +   + + + +             +
+   O O O +     + O     + +       +       + + +           +
+ + + + +   + +   O O   +           + + +   +             +
+                   O O O O             + + + + +   +     +
        + + +   +     +   O O O O   + + +               +
              +     +     +     O +                   + +
    +     + + + +       +       O +   +     +           +
  +   + +   +             +     O O   O O O     +         +
      +     +         +         + O O O + O O   +         +
+           +     + +   +       +     +   + O +   + + +
              +     + +   +       +     + O O   +   +   +
    +     +         +   + +     + +   +   O + + +   +
                    +       +         +   O +     + +   +
  +   + +     + +       +   + + +   +     O + + T O O +
                    +         +           O O   + + O +
  +     + + +   +     +                   + O O + O O + +
        +     + +   +                   +   + O O O
+       +   +     + +     +         + +       + + +       +
  +         +               +   +     +           + + + +
```
