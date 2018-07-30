# ipag.js

O ipag.js ajuda na manipulação dos dados sensíveis do cartão de crédito, criando transações mais seguras diretamente pelo cliente (Evita de enviar dados sensíveis do cartão para o servidor da Loja).

## Incluindo o ipag.js

Inclua o script antes do fechamendo da tag **body**

[Ver Script na aba HTML](?html#ipag-js)

```html
<!-- Inclua o script antes do fechamento da tag </body> -->
<script type="text/javascript" src="https://sandbox.ipag.com.br/js/dist/ipag.js"></script>
```

## Recuperando seu SessionToken

`GET /service/sessionToken`

```php
<?php
// Exemplo em PHP
try {
    $username = "IPAG_ID";
    $password = "IPAG_KEY";
    $remote_url = 'https://sandbox.ipag.com.br/service/sessionToken';

    $opts = array(
        'http' => array(
            'method' => "GET",
            'header' => "Authorization: Basic ".base64_encode("$username:$password"),
        ),
    );

    $context = stream_context_create($opts);

    $response = file_get_contents($remote_url, false, $context);
    $sessionToken = json_decode($response, true)['token'];

    // atribua o $sessionToken ao script
} catch (Exception $e) {
    print_r($e->__toString());
}
```

Para recuperar o **SessionToken**, enviar um GET para `/service/sessionToken` apenas com os headers:

`"Content-Type": "application/json"`

`"Authorization": "Basic am9uYXRoYW46REM4QS00QzE2ONHSNS1EQTZBRUY2O92SDRkQ2RDMyOC0wRjAz"`

Você deve recuperar o **SessionToken** via Server Side por segurança, utilizar apenas o Session Token no Client Side.

> Resposta da chamada do SessionToken

```
{
    "token": "E0D5-246E12FD-431CDAD2-01D05180-B27E",
    "expires_at": "2018-07-30 09:17:05"
}
```

<aside class="notice">
    Alterar o Authorization para as suas credenciais <a href="?javascript#autentica-o-api">Ver autenticação</a>
</aside>

Após recuperar seu **SessionToken**, atribua no método **iPag.setIpagId('SESSION_TOKEN')** do ipag.js [Veja na aba JavaScript](?javascript#incluindo-o-ipag-js).

```javascript
iPag.setIpagId('COLOCAR SEU SESSION_TOKEN AQUI');
```


## Habilitando o modo Sandbox

```javascript
...
iPag.setTestMode();
...
```

O modo Sandbox (Teste) é utilizado para que os tokens temporários sejam criados em ambiente sandbox.

Caso não seja chamado, será feito uma tentativa de envio para o ambiente de produção do iPag.

[Veja na aba JavaScript](?javascript#habilitando-o-modo-sandbox)

## Entradas de Texto Formatadas com Formatter.js

O ipag.js detecta automaticamente se você possuí o Formatter.js e tenta formatar as entradas de dados de cartão. Você pode saber mais sobre o Formatter.js no [GitHub](https://github.com/jaridmargolin/formatter.js).

Para isto você deve definir o seguinte atributo para o input do número do cartão: data-ipag="number" e chamar a função iPag.setup().

>Exemplo de input com data-ipag="number"

```
//html
<input id="cc-number" name="cc-number" type="tel" class="cc-number" required="" data-ipag="number" value="">
```

```
//js
...
iPag.setup();
...
```

## Criando um token de pagamento (Processo completo com validação)

[Veja na aba JavaScript](?javascript#criando-um-token-de-pagamento-processo-completo-com-valida-o)

>O script abaixo utiliza a biblioteca do JQuery

```javascript
jQuery(function($) {
  $(document).ready(function() {
    iPag.setup();
  })

  $("#payment-button").click(function(evt) {
      var form = $(this).parents('form');
      var createToken = function() {
        iPag.setIpagId('COLOCAR SEU SESSION_TOKEN AQUI');
        iPag.setTestMode();

        // Valida se o campo titular do cartão não está vazio.
        if (!iPag.validateHolder($('*[data-ipag="holder"]').val())) {
            return alert('Titular é inválido!');
        }
        // Valida se a data de vencimento é válida.
        if (!iPag.validateExpiration(
            $('*[data-ipag="expiry_month"]').val(),
            $('*[data-ipag="expiry_year"]').val()
        )) {
            return alert('Vencimento é inválido.');
        }

        /** Valida se o número do cartão de crédito é um número válido.
         ** Se sim, recupera os dados do form, instância um cartão e faz a chamada para criar um token
         ** Se não houver nenhum erro, o token será devolvido no método then(function(response)) ...
         **/
        if (iPag.validateCreditCardNumber($('*[data-ipag="number"]').val())) {
            iPag.setCreditCard(
                $('*[data-ipag="holder"]').val(),
                $('*[data-ipag="number"]').val(),
                $('*[data-ipag="expiry_month"]').val(),
                $('*[data-ipag="expiry_year"]').val(),
                $('*[data-ipag="cvv"]').val()
            );
            iPag.createToken()
            .then(function(response){
                if (response.token) {
                    $("#token").val( response.token );
                    $('*[data-ipag="holder"]').val('');
                    $('*[data-ipag="number"]').val('');
                    $('*[data-ipag="expiry_month"]').val('');
                    $('*[data-ipag="expiry_year"]').val('');
                    $('*[data-ipag="cvv"]').val('');
                    // Você pode fazer outras verificações antes de fazer o submit
                    form.get(0).submit();
                } else {
                    alert("Erro salvando cartão: " + JSON.stringify(response));
                }
            })
            .catch(function(error){
                alert("Erro salvando cartão: " + JSON.stringify(error));
            });
        } else {
            return alert('Número do cartão inválido!');
        }
      }
      createToken();
  });
});
```

O Token representa um cartão de crédito, e deve ser enviado no campo **token_cartao** para API do iPag.

Os campos do formulário devem ter o atributo data-ipag para cada campo abaixo:

* holder => Titular do cartão
* number => Número do cartão
* cvv => Código de segurança do cartão
* expiry_month => Mês de vencimento do cartão
* expiry_year => Ano de vencimento do cartão

## Funções Auxiliares

[Veja na aba JavaScript](?javascript#fun-es-auxiliares)

### iPag.validateCreditCardNumber
Valida o número do cartão de crédito utilizando o algoritmo Luhn

> iPag.validateCreditCardNumber

```javascript
iPag.validateCreditCardNumber('5454545454545454') // retorna true
iPag.validateCreditCardNumber('1234') // retorna false
```

### iPag.validateHolder

> iPag.validateHolder

Valida se o titular do cartão não é vazio

```javascript
iPag.validateHolder('FULANO DA SILVA') // retorna true
iPag.validateHolder('') // retorna false
```

### iPag.validateExpiration

> iPag.validateExpiration

Valida se a data de vencimento do cartão é válida.

```javascript
iPag.validateExpiration('10', '2021') // retorna true
iPag.validateExpiration('10', '21') // retorna true
iPag.validateExpiration('08', '2016') // retorna false
```

## Formulário (Checkout) de Exemplo

[Clique aqui para visualizar o formulário](https://sandbox.ipag.com.br/checkout-demo)
