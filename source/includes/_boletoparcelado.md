# Boleto Parcelado

## Campos adicionais para boleto parcelado
Para enviar transação de boleto parcelado são necessários dois campos adicionais:

Parâmetro | size | type | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
boleto_parcelas | 128 | number | obrigatório | Número de parcelas que o boleto será parcelado.
url_parcelamento | 256 | string | obrigatório | Url de retorno com os dados da conta (Conta iPag) que irá gerenciar as cobranças

## Dados de Retorno Boleto Parcelado

Parâmetro | Descrição
--------- | ---------
valor | Valor total da conta
num_pedido | Número do pedido
quant_parcelas | Número de parcelas
idconta | ID da conta vinculada no iPag
primeiro_vencimento | Data de vencimento da primeira cobrança
operadora | Método do Boleto Bancário (ex. boleto_itau)

## Observações

No boleto parcelado são utilizados as duas Urls de retorno

* **url_retorno** (Url que retornará os pagamentos efetuados dos boletos)
* **url_parcelamento** (Url que retornará os dados da conta criada no iPag)
