# Limite de requisições

A API é limitada a 100 créditos/minuto por token de acesso. Cada requisição consome 1 crédito. Isto é válido para requisições de qualquer documento fiscal, para qualquer método. Todas as respostas da API incluem os cabeçalhos abaixo, que descrevem os limites atuais da sua aplicação:

 * Rate-Limit-Limit - Número de créditos para o período atual
 * Rate-Limit-Remaining - Número de créditos que restam no período atual
 * Rate-Limit-Reset - Número de segundos até que seja reinicializado o contador de créditos
 
Se o limite é atingido, é devolvido o código status HTTP 429 (Too many requests) e sua aplicação deverá aguardar o término do período (Rate-Limit-Reset) para poder fazer novas requisições.
