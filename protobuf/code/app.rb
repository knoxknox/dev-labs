$CLASSPATH << File.join(Dir.pwd, 'target')
$CLASSPATH << File.join(Dir.pwd, 'target/protobuf-java-2.6.1.jar')

java_import 'com.chrome.Settings'
java_import 'java.io.FileInputStream'
java_import 'java.io.FileOutputStream'

proto = com.chrome.Settings::OS
message = proto.new_builder.set_linux('4.0').set_windows('W10').build
puts "#{message.to_byte_array}: #{proto.parse_from(message.to_byte_array)}"

output_file = FileOutputStream.new('/tmp/data.bin')

message.write_to(output_file)
binary_input_file = FileInputStream.new('/tmp/data.bin')
puts "parse proto: #{proto.parse_from(binary_input_file).windows}"

output_file.close
binary_input_file.close
