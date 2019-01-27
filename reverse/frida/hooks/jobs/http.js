Java.perform(function() {

  var RealCall = Java.use('okhttp3.RealCall');
  var OkHttpClient = Java.use('okhttp3.OkHttpClient');
  var RestClient = Java.use('com.lookout.restclient.DefaultLookoutRestClient');

  // newCall(Request request)
  OkHttpClient.newCall.implementation = function(request) {
    var result = this.newCall(request);
    console.log('http request: ' + request.toString());

    return result;
  }

  // getResponseWithInterceptorChain()
  RealCall.getResponseWithInterceptorChain.implementation = function() {
    var result = this.getResponseWithInterceptorChain();
    console.log('http response: ' + result.toString());

    return result;
  }

  // logChunkedMessage(Object object, String header)
  RestClient.logChunkedMessage.implementation = function(object, header) {
    console.log(object);
    this.logChunkedMessage(object, header).call(this);
  }

  // logObjectIfEnabled(Object object, String header)
  RestClient.logObjectIfEnabled.implementation = function(object, header) {
    console.log(object);
    this.logObjectIfEnabled(object, header).call(this);
  }

});
