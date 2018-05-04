# adb

Implementation of ADB (Android Debug Bridge) binary protocol.<br/>
This protocol used by your computer to communicate with android devices.<br/>
This is an application layer protocol, which can sit inside TCP or USB (See AOSP).

Example of `connect` command:
```
$ hexdump -C proto.bin
0x0000  43 4e 58 4e 00 00 00 01  00 10 00 00 12 00 00 00  |CNXN............|
0x0010  f5 06 00 00 bc b1 a7 b1  68 6f 73 74 3a 30 3a 6c  |........host:0:l|
0x0020  6f 6f 6b 6f 75 74 5f 61  64 62                    |ookout_adb|
0x002A
```

Internally it is based on `bindata` gem:
```
> packet.to_binary_s                 - returns binary representation
> Adb::PacketStructure.read(binary)  - reads and assigns binary data from IO
> Adb::PacketStructure.write(output) - writes binary data of the object to IO
```

For debug purposes you can use `adb` like:
```
> Open3.capture2e('adb connect 172.25.0.5')[0].lines.to_a - output of command
> Open3.capture2e('adb connect 172.25.0.5')[1].exitstatus - status code of command
```
