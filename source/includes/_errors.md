# Erros
Caso seja retornado erro, ele terá o seguinte formato em xml:

```xml
<?xml version="1.0" encoding="utf-8" ?>
<error>
    <code>002</code>
    <message>Método de pagamento não configurado ou inativo no iPag.Acesse o Painel para verificar.</message>
</error>
```

## Erros de Submissão

Código | Descrição
------|------
001 | Sua conta não está elegível para realizar transações no iPag.
002 | Método de pagamento não configurado ou inativo no iPag.
003 | O pedido já está sendo processado. Em caso de dúvidas, entre em contato com o lojista.


## Erros de Consulta

Código | Descrição
------|------
100 | O campo [xpto] é obrigatório.
101 | Sua conta não está elegível para realizar consulta de transações no iPag.
102 | Transação não foi aceita pela operadora, ou houve um problema para recuperar o retorno da mesma.
103 | Não existe transação no iPag com número de pedido informado.

## Erros de Captura

Código | Descrição
------|------
100 | O campo [xpto] é obrigatório.
201 | Sua conta não está elegível para realizar captura de transações no iPag.
202 | Transação com o transId informado não foi encontrado.
203 | Método de pagamento não configurado ou inativo no iPag.
204 | A transação já foi capturada.
205 | Operação não permitida

## Erros de Cancelamento

Código | Descrição
------|------
100 | O campo [xpto] é obrigatório.
301 | Não existe transação no iPag com número de pedido informado.
302 | Operação não permitida.


## Bloqueio de IP

O bloqueio de IP ocorre após 3 tentativas de aprovar um pedido vindos do mesmo requisitante.

```xml
<?xml version="1.0" encoding="utf-8" ?>
<retorno>
    <num_pedido>20170420155155</num_pedido>
    <status_pagamento>7</status_pagamento>
    <mensagem_transacao>(99) Transação não autorizada</mensagem_transacao>
    <operadora_mensagem>Transação bloqueada: Email do cliente bloqueado após exceder o limite de 3 transações recusadas em menos de uma hora. Para desbloquear acesse o Painel iPag/Segurança/Blacklist.</operadora_mensagem>
    <metodo>visa</metodo>
    <redirect>false</redirect>
</retorno>
```

Código | Descrição
-------|----------
99 | Transação bloqueada: Email do cliente bloqueado após exceder o limite de 3 transações recusadas em menos de uma hora. Para desbloquear acesse o Painel iPag/Segurança/Blacklist.
