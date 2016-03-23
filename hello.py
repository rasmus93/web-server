def application(environ, start_response):
	start_response('200 OK', [('Content-Type', 'text/plain')])
	query = environ.get('QUERY_STRING', '')
	result = ""
	for value in qs.split('&'):
		result = result + value + '\n'
	return [result]