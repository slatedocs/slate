# Paginação

 ```shell
    curl -X GET https://api.fastnotas.com/v1/items/?page=2&per_page=5 \
      -u 'YOUR_API_KEY:'
  ```

Todos os recursos de listagem da API têm suporte à paginação. Para utilizar a paginação, você pode passar os parâmetros via QueryString:

Parâmetro |  Descrição
-------------- | --------------
**page:** <br> `Default: 1` |  *Implementação de uma paginação de resultados do objeto*
**per_page:**<br>`Default:50` | *Retorna `n` objetos por página*


Todas as requisições de listagem retornam os dados referentes à paginação através dos seguintes `headers`:

HTTP Header | Descrição
-------------- | --------------
**Current-Page** | *Página atual*
**Total-Pages** | *Total de páginas*
**Per-Page** | *Objetos por página*

