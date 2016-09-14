<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.*, java.lang.Float"%>

<%
	String[] valor = request.getParameterValues("valor");
	String historia = ""; // default para que el HTML no marque error
	String resultado = ""; // default para que el HTML no marque error
	if (valor != null) {
		String operador = request.getParameter("operador"); // sólo pide esto si existe valor
		historia = request.getParameter("historia"); // sólo pide esto si existe valor
		if (historia == null) historia = "";
		float v0 = Float.parseFloat(valor[0]); 
		float v1 = Float.parseFloat(valor[1]);
		switch (operador) {
			case "suma": resultado = v0 + " + " + v1 + " = " + (v0 + v1); break;
			case "resta": resultado = v0 + " - " + v1 + " = " + (v0 - v1); break;
			case "multiplicación": resultado = v0 + " * " + v1 + " = " + (v0 * v1); break;
			case "división": resultado = v0 + " / " + v1 + " = " + (v0 / v1); break;
		}
		historia += "\n" + resultado;
	} 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ejemplo de suma de dos valores</title>
</head>

<body>
<form method="GET">
<textarea name="historia" rows="10" cols="30" readonly><%= historia %></textarea><br>
<input type="text" name="valor" autofocus>
<select name="operador">
  <option value="suma">+</option>
  <option value="resta">-</option>
  <option value="multiplicación">*</option>
  <option value="división">/</option>
</select>
<input type="text" name="valor">
<input type="submit">
<br>
<%= resultado %>

</form>
</body>
</html>
