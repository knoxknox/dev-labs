import sys, frida

code = """
Java.perform(function() {
  var pinner = Java.use("okhttp3.CertificatePinner");

  pinner.check.overload('java.lang.String', 'java.util.List').implementation = function(hostname, certificates) {
    console.log("Called check for java.util.List - " + hostname);
    return;
  };

  pinner.check.overload('java.lang.String', '[Ljava.security.cert.Certificate;').implementation = function(hostname, certificates) {
    console.log("Called check for java.security.cert.Certificate - " + hostname);
    return;
  };
});
"""

def handle_message(message, data):
  print('{0}: {1}'.format(message['type'], message))

device = frida.get_usb_device()
process = device.attach('com.lookout')
script_to_inject = process.create_script(code)
script_to_inject.on('message', handle_message)
print('Injected...')
script_to_inject.load()

sys.stdin.read()
