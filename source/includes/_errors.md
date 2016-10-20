# HTTP status codes

A API do Fast Notas segue o padrão de usa códigos de resposta HTTP convencionais para indicar o sucesso ou fracasso de uma solicitação da API. Em geral, os códigos na gama 2xx indicar sucesso, os códigos na gama 4xx indicar um erro que falhou dada a informação fornecida (por exemplo, um parâmetro necessário foi omitido, ou informado com um valor errado, etc), e os códigos na gama indicam um 5xx de erro com os servidores da listra (estes são raros).

HTTP Status:


Código | Significado
---------- | -------
200 - OK | Request realizado com sucesso.
201 - Created | Cadastro criado com sucesso.
204 - No Content | Requisição sem conteúdo
400 - Bad Request| Erro de sintaxe JSON no corpo do request.
404 - Not Found | Registro não encontrado.
422 - Unprocessable Entity | Parâmetros inválidos. Verificar erro na resposta.
429 - Too Many Requests | Limite de requisições excedido.
500 - Internal Server Error | Erro interno do servidor
