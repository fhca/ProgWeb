from wsgiref.simple_server import make_server

def aplicacion(ambiente, inicia_respuesta):
	cuerpo = """
<html>
<body>
  <h1>ola ke ase</h1>
</body>
</html>
"""
	long_contenido = len(cuerpo)
	status = "200 OK"
	encabezados = [
        	('Content-Type', 'text/html'),
       		('Content-Length', str(long_contenido))
	]
	inicia_respuesta(status, encabezados)
	return (cuerpo)

httpd = make_server('localhost', 8051, aplicacion)
httpd.handle_request()
