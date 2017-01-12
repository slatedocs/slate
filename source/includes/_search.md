# Busca

 ```shell
    curl -X GET https://api.fastnotas.com/v1/customers/?query=registry_code:CPF do cliente \
      -u 'YOUR_API_KEY:'
  ```

Todos os recursos de listagem da API têm suporte à busca. Você pode utilizar uma ou mais condições, opcionalmente agrupada por operadores *(AND/and e OR/or)* para criar uma consulta. Passe o parâmetro via QueryString:

Parâmetro |  Descrição
-------------- | --------------
**query** |  *Filtro a ser utilizado para obter os resultados do objeto:* <br> `query=<atributo><operador><valor>`

###Exemplo
`query=operation_type=issue` <br>
**atributo:** "operation_type" <br>
**operador:** "=" igual <br>
**valor:**    "issue"

Os seguintes operadores são suportados pela API:

Operador | Descrição | Exemplo
-------------- | -------------- | --------------
: | Contém | email:gmail.com
= | Igual | sequence=230
> | Maior | created_at>2017-01-11
>= | Maior ou igual | amount>=500
< | Menor | created_at<2017-01-11
<= | Menor ou igual | amount<=500
NOT/not/- | Negação | -status:active
( )| Agrupa condições | (status:active AND name:paulo) OR name:mariana

Os campos que podem user usados nos filtros estão definidos dentro da documentação de cada recurso.
