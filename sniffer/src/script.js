/**
 * Documentation:
 * https://github.com/bettercap/bettercap/blob/master/modules/http_proxy_js_request.go#L18-L27
 * https://github.com/bettercap/bettercap/blob/master/modules/http_proxy_js_response.go#L14-L17
 */

function logText(req) {
  log('> Text');
  log(req.ReadBody());
}

function logForm(req) {
  log('> Form');
  var form = req.ParseForm();
  for (var key in form) {
    log(key + ': ' + form[key]);
  }
}

function logHeaders(req) {
  log('> Headers');
  var headers = req.Headers;
  for (var i = 0; i < headers.length; i++) {
    log(headers[i].Name + ': ' + headers[i].Value);
  }
}

function logRequest(req) {
  var query = req.Query ? '?' + req.Query : '';
  var fullPath = req.Hostname + req.Path + query;
  log(req.Client + ' > ' + req.Method + ' ' + fullPath);
}

function onRequest(req, res) {
  logRequest(req);
  logHeaders(req);

  if (req.ContentType.indexOf('text/plain') != -1) {
    logText(req);
  }
  else if (req.ContentType.indexOf('application/json') != -1) {
    logText(req);
  }
  else if (req.ContentType.indexOf('application/x-www-form-urlencoded') != -1) {
    logForm(req);
  }
  else {
    log(req.ReadBody());
  }
}
