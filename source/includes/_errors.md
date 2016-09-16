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
