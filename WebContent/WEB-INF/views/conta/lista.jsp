<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listar Contas</title>
<script src="resources/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	function deuCerto(dadosDaResposta) {
		alert("Conta paga com sucesso");
	}
	function pagaAgora(id) {
		$.get("pagaConta?id=" + id, deuCerto);
		/*$.post("pagaConta", {'id' : id}, function() {
			  $("#conta_"+id).html("Paga");
			});*/
	}
</script>
</head>
<body>
	<h3>Lista de Contas</h3>
	<table>
		<thead>
			<tr>
				<th>Código</th>
				<th>Descrição</th>
				<th>Valor</th>
				<th>Tipo</th>
				<th>Pago</th>
				<th>Data Pagamento</th>
				<th>Ações</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${contas}" var="conta">
				<tr>
					<td>${conta.id}</td>
					<td>${conta.descricao}</td>
					<td>${conta.valor}</td>
					<td>${conta.tipo}</td>
					<td>
						<c:if test="${conta.paga eq true }">Sim</c:if> 
						<c:if test="${conta.paga eq false }">Não</c:if>
					</td>
					<td>
						<fmt:formatDate value="${conta.dataPagamento.time}"	pattern="dd/MM/yyyy" />
					</td>
					<td id="conta_${conta.id}">
						<a
						href="removeConta?id=${conta.id}">Deletar</a> | <a
						href="form?id=${conta.id}">Alterar</a> | 
						<c:if	test="${conta.paga eq false }">
							<a href="#" onclick="pagaAgora(${conta.id});">Pagar</a>
						</c:if></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

</body>
</html>