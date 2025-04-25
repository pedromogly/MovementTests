extends Node

func _ready():
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)
	
	var error = http_request.request("https://httpbin.org/get")
	if error != OK:
		push_error("Erro pra conectar nessa budega")
		
	
func _http_request_completed(result,response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get)
	var response = json.get_string_from_utf8()
	
	print(response.origin)
