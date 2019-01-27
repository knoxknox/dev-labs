/**
 * Documentation:
 * https://github.com/bettercap/bettercap/blob/master/modules/http_proxy_js_request.go#L18-L27
 * https://github.com/bettercap/bettercap/blob/master/modules/http_proxy_js_response.go#L14-L17
 */

function onRequest(req, res) {
  log_warn('Request: ' + req.ReadBody());
}

function onResponse(req, res) {
  log_warn('Response: ' + res.Status + ', ' + res.ReadBody());
}
