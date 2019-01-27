// To patch APK you need to provide proper Activity.
// This can be done via patching method 'get_launchable_activity'.
// https://github.com/sensepost/objection/blob/6d3c935a45ba26d1d8bfeace3a04733a73c076bd/objection/utils/patchers/android.py#L264
//
// How to do this:
// 1) pip3 show objection
// 2) vim /usr/local/lib/python3.6/site-packages/objection/utils/patchers/android.py
// ```
// def _get_launchable_activity(self) -> str:
//     activity = ''
//     # By default we return:
//     # > com.squareup.leakcanary.internal.DisplayLeakActivity
//     # This activity is not main activity so we need to patch it.
//     return 'com.lookout.phoenix.ui.view.registration.RegistrationActivity'
// ```
//
// To check that it works, load test module: `import ~/Downloads/frida/test.js`
Java.perform(function() {
  console.log('Loaded...');

  var string = Java.use('java.lang.String');
  string.length.implementation = function() {
    var length = this.length.call(this);
    console.log('length of string: ' + length);

    return length;
  }
});
