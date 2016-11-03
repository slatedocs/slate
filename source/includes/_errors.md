# Erros
Caso seja retornado erro, ele terá o seguinte formato em xml:

```xml
<retorno>
    <erro>002</erro>
    <mensagem>Método de pagamento não configurado ou inativo no iPag.Acesse o Painel para verificar.</mensagem>
</retorno>
```

## Erros de Submissão

Código | Descrição
------|------
001 | Sua conta não está elegível para realizar transações no iPag.
002 | Método de pagamento não configurado ou inativo no iPag.
 

## Erros de Consulta

Código | Descrição
------|------
101 | Sua conta não está elegível para realizar consulta de transações no iPag.
102 | Transação não foi aceita pela operadora, ou houve um problema para recuperar o retorno da mesma.
103 | Não existe transação no iPag com número de pedido informado.

## Erros de Captura

Código | Descrição
------|------
201 | Sua conta não está elegível para realizar captura de transações no iPag.
202 | Transação com o transId informado não foi encontrado.
203 | Método de pagamento não configurado ou inativo no iPag.
204 | A transação já foi capturada.
205 | Operação não permitida

## Bloqueio de IP

O bloqueio de IP ocorre após 3 tentativas de aprovar um pedido vindos do mesmo requisitante.

```xml
<retorno>
	<num_pedido>000001</num_pedido>
	<mensagem_transacao>(99) Transação não autorizada</mensagem_transacao>
	<operadora_mensagem>IP do Cliente bloqueado após exceder o limite de 3 transações recusadas em menos de uma hora</operadora_mensagem>
    <metodo>visa</metodo>
    <redirect>false</redirect>
</retorno>
```

Código | Descrição
-------|----------
99 | IP do Cliente bloqueado após exceder o limite de 3 transações recusadas em menos de uma hora
