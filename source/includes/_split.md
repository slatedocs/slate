# Split de Transação (Marketplace) [Plano Enterprise]

## Adicionar Parceiros no Sistema

1. Acesse o [**Painel iPag**](https://painel.ipag.com.br);
2. Acesse o menu "Marketplace" > "Parceiros"
3. Clique em "Novo Registro"
4. Adicione um novo parceiro. Faça as devidas configurações de Split. Lembre-se você irá identificar seu parceiro   através do Login dele.

Esse acesso deve ser passado a seu Parceiro, assim ele pode visualizar e fazer pedidos de saque.

O login atríbuido ao Parceiro será utilizado para idenficá-lo no momento de enviar uma transação com split.

<aside class="warning">
Caso venha a fazer uma transação com valor de split errado, o valor na transação não poderá ser alterado, aconselhamos realizar alguns testes antes para checar se está tudo ok.
</aside>

<aside class="notice">
Não é possível adicionar um parceiro via API.
</aside>

## Integração com Split
Para enviar uma transação com split é necessário adicionar mais um parâmetro a sua requisição ao iPag (POST)
Documentação: [Requisição Padrão](#submiss-o-de-pagamentos)

Além do parâmetro **"identificacao"** que identifica sua conta, é necessário enviar o parâmetro **"identificacao2"**, onde deve ser enviado o **login** do seu Parceiro. Caso envie o login errado a transação não sofrerá o split.

Parâmetro | size | type | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
identificacao | 50 | string | sim | Seu Login
identificacao2 | 50 | string | sim | Login do Parceiro

## Solicitação de Saque
Após o período definido no cadastro de seu parceiro, ele poderá realizar Solicitações de Saque, que ao ser solicitado irá enviar um email para o Marketplace e para o Parceiro informando sobre a solicitação.

O Marketplace e o Parceiro poderão visualizar as solicitações de saque no menu "Marketplace" > "Solicitações de Saque". Onde é possível visualizar quem fez o pedido, quando foi feito, um código de referência e o valor.

## Extrato Financeiro
No extrato financeiro é possível verificar todos os splits e solicitações de saque realizados. (Funciona como um extrato bancário, com entradas e saídas de crédito).
