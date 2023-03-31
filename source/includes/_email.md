# Consulta de emails

Fazemos um controle de "reputação" de nosso serviço de email, de forma a diminuir a chance dos emails enviados serem considerados spam pelos servidores de destino. Alguns aspectos que afetam a reputação de envio:

* Quantidade de endereços de emails inválidos
* Quantidade de endereços de emails inexistentes
* Quantidade de endereços de emails com problemas (ex: usuário inexistente, usuário sem espaço em sua caixa de email)
* Quantidade de notificações de spam por parte do destinatário da mensagem

Supõe-se que servidores que enviam muitos emails com problemas são servidores utilizados para enviar email não
solicitado (spam).

Desta forma mantemos uma lista de emails onde foi identificado algum problema. Assim a API não irá tentar enviar novamente
um email para este endereço, ignorando o envio se necessário. Com isto procuramos manter nossa taxa de erros baixa para
que os demais servidores de emails da Internet confiem em nosso serviço.

Nós mantemos uma API para que possa ser consultado quais emails não irão receber nossas
mensagens devido a alguns dos problemas acima. Em alguns casos é possível solicitar a remoção do endereço de email com problema de forma que nossa API possa tentar novamente o envio em uma próxima ocasião.

## URLs

Método | URL (recurso) | Ação
-------|---------------|------
GET|/v2/blocked_emails/EMAIL | Consulta um possível email bloqueado
DELETE|/v2/blocked_emails/EMAIL | Solicita exclusão do bloqueio

## Consulta de email bloqueado

Utilize o método GET com o endereço abaixo:

`https://api.focusnfe.com.br/v2/blocked_emails/EMAIL`

Este endereço não faz diferenciação entre ambientes (homologação e produção) pois ambos utilizam o mesmo serviço de envio
de emails.

```shell
curl -u "token obtido no cadastro da empresa:" \
  "https://api.focusnfe.com.br/v2/blocked_emails/test@example.com"
```

>Exemplo de resposta de email bloqueado

```json
{
  "email": "test@example.com",
  "block_type": "bounce",
  "bounce_type": "transient",
  "diagnostic_code": "smtp; 554 4.4.7 Message expired: unable to deliver in 1440 minutes.<421 4.4.0 Unable to lookup DNS for example.com>",
  "blocked_at": "2020-04-16T12:24:29-03:00"
}
```
>Exemplo de resposta de email não encontrado

```json
{
  "codigo": "nao_encontrado",
  "mensagem": "Email não encontrado na lista de bloqueios"
}
```

A API irá devolver o status HTTP 200 se o email for encontrado ou 404 se não for encontrado.

Os campos devolvidos são descritos abaixo:

* email: Email bloqueado
* block_type: pode ser dos seguites tipos:
  * bounce - O email foi devolvido por algum motivo
  * complaint - O email foi marcado como spam pelo destinatário
* bounce_type: Se o block_type for do tipo "bounce", este campo irá ter um dos valores abaixo:
  * transient - Indica um erro transiente que pode ser resolvido nos próximos dias. Exemplo: usuário sem espaço em sua caixa de email.
  * permanent - Indica um erro considerado permanente. Exemplo: o usuário não é encontrado no domínio especificado.
* diagnostic_code - Indica a mensagem de erro, se houver, devolvida pelo servidor de email do destinatário.
* blocket_at - Data do bloqueio

## Solicitação de exclusão de email bloqueado

É possível solicitar a exclusão de um bloqueio, e caso ele seja aceito, o email será removido da lista de bloqueio
podendo ser utilizado novamente.

Utilize o método DELETE com o endereço abaixo:

`https://api.focusnfe.com.br/v2/blocked_emails/EMAIL`

```shell
curl -X DELETE -u "token obtido no cadastro da empresa:" \
  "https://api.focusnfe.com.br/v2/blocked_emails/test@example.com"
```

>Exemplo de resposta de solicitação não atendida

```json
{
  "codigo": "requisicao_invalida",
  "mensagem": "Email bloqueado por motivo de reclamação não pode ser excluído. Entre em contato com o suporte."
}
```

Caso o endereço de email seja excluído, será devolvido o status HTTP 200. Caso o email não seja encontrado, será devolvido
o status 404. Por fim, se o email existir mas não ser possível sua exclusão será devolvido o status HTTP 422.

Alguns endereços podem ter sua solicitação de exclusão negada, como por exemplo endereços cujo destinatário marcou
alguma mensagem enviada pelo nosso servidor como spam. Neste caso, contate o suporte técnico para entendermos melhor a
sua solicitação.
