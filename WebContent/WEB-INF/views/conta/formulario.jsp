<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contas</title>
</head>
<body>
<h3>Contas</h3>
	<form action="salvarConta" method="POST">
		Descrição:<br /> <textarea name="descricao" rows="5" cols="100">${conta.descricao}</textarea>
		<form:errors path="conta.descricao" />
		<br /> 
		Valor: <br /> <input type="text" name="valor" value="${conta.valor}" /> <br />
		Tipo:<br /> 
		<select name="tipo">
			<option value="ENTRADA"  <c:if test="${conta.tipo eq 'ENTRADA'}">selected="selected"</c:if>>Entrada</option>
			<option value="SAIDA" <c:if test="${conta.tipo eq 'SAIDA'}">selected="selected"</c:if>>Saída</option>
		</select> <br />
		 <br/>
        Pago? <input type="checkbox" name="paga"     ${conta.paga?'checked':''} />
        <br/>
        Data de Pagamento: <input type="text" name="dataPagamento" value="<fmt:formatDate value="${conta.dataPagamento.time}" pattern="dd/MM/yyyy" />" />
        <br/>
        <input type="hidden" name="id" value="${conta.id}"/>
        <br />
		<br /> <input type="submit" value="Adicionar" />
	</form>
</body>
</html>