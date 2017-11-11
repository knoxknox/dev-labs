# astar

This is implementation of A* search algorithm.<br/>
It is based on arrays (instead of PriorityQueue).<br/>
The reason 'why?' is simplicity and educational purposes.

Example:
```
Start node: S [0, 0]                              | Start node: S [0, 0]
Target node: T [20, 20]                           | Target node: T [20, 20]
Disable diagonal search: true                     | Disable diagonal search: false
```

```
O O       +   + +     + + + + +     +             | O     +       + +   + + + +   + + + +   + +   + +
  O O +   +   +       +   +   + +   +     +   + + |   O + +     +       + + + +   + +   + +   +     +
  + O O O     + + + + +   +   + +   + + + +   + + | + O +     +       + + +           + +       + + +
  + + + O O   +               +   + +   +   +     | + O +     +   + +         + + +       +   + +   +
+ + + + + O O O   + +       +   + + +   +     + + |   O +       + + + + + + +               +   + +
+ +     +   + O   +   +   +           + +   + + + | + O + + + + +   +     + + +       + + +       +
+         + + O   +   + +   +   +     + +     + + |   O + + + +   + +   + +     +     + +   +   + + +
  +       + + O +   +   +   +   +     + +     +   | O + +             + +   + + + +     + + +     + +
  + +     + + O O O O O   +   + +     +       +   | + O + +   +     +   + +   +   + + +     +     + +
+     + +   + + + + + O O O   + + + +           + |     O O O + + + + +   +   +   + + +       + + + +
        + +         + + + O +     + + + + + + + + | +   + + + O   + + + +     + + + + +   +   + + +
+       + + +   +   + +   O O O     + + +         | + +   + O +   + + + +   + + + + +   + +     + + +
        +           +   + + + O +           +   + | +   +   O + + + +   +     +   + +   + + + + + + +
      + + +   +   +     + + + O               + + |   +   +   O O O O O + + + + + + + + +   + + +   +
    + +   +   +     + + O O O O   +           +   | + +   + + + + + + + O + + +   + + +   +     +   +
  +     +     +   + +   O +   +   + + + + +   +   | +   +   +     + + +   O O + +     + + + + + + + +
+ +     +     +       + O O +   +     +     + +   | + +   + + + +       + + + O +   + +       +     +
        + + +   +     +   O O O O O       + +     | +     +   + + +         + O +   + +       + +
+   + +   +     +           + + + O +     +     + |     + + + + + + + +     +   O + + O O +     +   +
  +   +   +         +     +       O O O     +   + | + +   +   + + +       +   O + + O + + O +   + + +
    +   +       + +       + + +           + +     | + +   + + + + + + + +   O + + O   + +   + + + + +
    + +             +           +     + + + + +   | +   +   +   + + +   + + + O O +     + +       +
+     +               +   + +         + + +       |   + + + +   + + + +   + + + O +   +     +   +   +
+   +       +       + +               +   + +     |   + +       + +   +   +   + + +       + +   + + +
+ +                       +   + +     +   +   + + | + + + +   +   + + + +     + +   + +         + + +
```
