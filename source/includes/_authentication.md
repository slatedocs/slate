
# Autenticação

  A autenticação na API é realizada através do método HTTP Basic, utilizando a chave da API no campo destinado ao usuário, sem a necessidade de informar uma senha. Vale lembrar que a API Fast Notas só pode ser utilizada através do protocolo HTTPS. Por motivos de segurança, requisições HTTP não serão redirecionadas automaticamente para o protocolo HTTPS.

> Para se autenticar utilize o código abaixo em conjunto com o endpoint que deseja acessar:


```shell
curl https://api.fastnotas.com/v1/ \
  -H Content-Type:application/json \
  -u YOUR_API_KEY:
```

`Authorization: Basic YOUR_API_KEY`

<aside class="notice">
Você deve substituir <code>YOUR_API_KEY</code> pela sua chave de API.
</aside>
