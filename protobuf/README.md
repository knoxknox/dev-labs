# protoc

How to use:
```
$ ./protoc3 --ruby_out /tmp example.proto
$ ./protoc2 --java_out /tmp example.proto
$ ./protoc2 --python_out /tmp example.proto
```

Encoding/Decoding:
- https://protogen.marcgravell.com/decode
- https://developers.google.com/protocol-buffers/docs/encoding

Example of decoding:
```
12 04 74 65 73 74 1A 06 73 74 72 69 6E 67

Algorithm:
- read int from stream;
- get wire type (last 3 bits);
- get field number (right-shift by 3);
- handle metadata and read value for field;

12 => 0x12 => 18 => 10010 => 10[010] => num[wire] => num=2, wire=2
This means that field type is string(2) and field number is equal to 2.
```

```
bytes = [
  0x12, 0x04, 0x74, 0x65, 0x73, 0x74,
  0x1A, 0x06, 0x73, 0x74, 0x72, 0x69, 0x6E, 0x67
]

read -> { n = read_uint64; wire = n & 0x7; number = n >> 3; }

0x12                            - 2:String
0x04                            - length=4
0x74 0x65 0x73 0x74             - payload="test"
0x1A                            - 3:String
0x06                            - length=6
0x73 0x74 0x72 0x69 0x6E 0x67   - payload="string"

12 => 0x12 => 18 => 10010 => 10[010] => num[wire] => num=2, wire=2
1A => 0x1A => 26 => 11010 => 11[010] => num[wire] => num=2, wire=3
```
