<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.*, java.lang.Float"%>

<%
	String historia = request.getParameter("historia");
	String ultima_operacion = request.getParameter("ultima_operacion");
	if (ultima_operacion != null)
			historia += "\n" + ultima_operacion;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ejemplo de suma de dos valores</title>
</head>

<body>
<form method="GET">
<textarea name="historia" rows="10" cols="30"><%= historia %></textarea><br>
<input type="text" name="valor" autofocus>
<select name="operador">
  <option value="suma">+</option>
  <option value="resta">-</option>
  <option value="multiplicación">*</option>
  <option value="división">/</option>
</select>
<input type="text" name="valor">
<input type="submit">
</form>
<%
	String[] valor = request.getParameterValues("valor");
	String operador = request.getParameter("operador");
	String resultado="";
	if (valor != null) {
		float v0 = Float.parseFloat(valor[0]); 
		float v1 = Float.parseFloat(valor[1]);
		switch (operador) {
			case "suma": resultado = v0 + " + " + v1 + " = " + (v0 + v1); break;
			case "resta": resultado = v0 + " - " + v1 + " = " + (v0 - v1); break;
			case "multiplicación": resultado = v0 + " * " + v1 + " = " + (v0 * v1); break;
			case "división": resultado = v0 + " / " + v1 + " = " + (v0 / v1); break;
		}
		out.println(resultado);
		out.println("<input type='hidden' name='ultima_operacion' value='" + resultado + "'>");
	} 
%>

</body>
</html>
