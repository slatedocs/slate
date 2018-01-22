# Autenticação API

## Para o que é utilizada a API KEY ?

A API KEY é utilizada para realizar a autenticação para as operações na API do iPag.

## IPAG API KEY

**Acesse:**

[SANDBOX - Painel iPag - Minha Conta](http://sandbox.ipag.com.br/ipag-painel/?r=admin/alterardados&navegation=addplus ).

<aside class="notice">
<b>Caso não possua uma API KEY em sua conta, faça a requisição para suporte@ipag.com.br.</b>
</aside>

##Autenticação

A autenticação para a API ocorre através de [HTTP basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication). Você encontrará mais detalhes sobre Autenticação básica no [IETF RFC 2617](https://www.ietf.org/rfc/rfc2617.txt).

Forneça seu login e sua chave secreta de API como o nome e senha de usuário de autenticação básico.

Toda a comunicação deve ser criptografada via SSL. O token de autenticação básica é reversível, no entanto, quando toda a comunicação é sobre HTTPS o contexto de segurança está completamente protegido. Um aplicativo deve enviar um HEADER HTTP Authorization contendo o nome de usuário e senha com cada solicitação.

Todas as chamadas de API devem ser feitas em HTTPS para garantir a segurança.

Basic Auth é trivial para usar de bibliotecas cliente HTTP. Ferramentas como cURL fornecem opções de linha de comando correspondentes.

<aside class="notice">
<b>Você deve manter sua chave API segura não importa o quê! NÃO COMPARTILHE sua chave de API com ninguém, nem mesmo nos canais de suporte do iPag. Ninguém que represente de forma legítima o iPag nunca lhe pedirá sua chave da API!</b>
</aside>
....