def application(environ, start_response):
	start_response('200 OK', [('Content-Type', 'text/plain')])
	query = environ.get('QUERY_STRING', '')
	result = "";
	for value : qs.split('&')
		result = result + value + '\n'