# Integração Magento

<aside class="notice">
    Atenção: Caso esteja usando o módulo Idev OneStepCheckout, note que este módulo é compatível apenas com o Idev OneStepCheckout 3.1 e superiores
</aside>

Copie o conteúdo do arquivo Zip para o diretório onde o seu Magento está instalado.
<aside class="notice">
    Note que é necessário instalar também o módulo WLPayment e Controle de Fraudes.
</aside>

Crie a pasta log dentro do diretório var do Magento, ficará <magentodir>/var/log. Este diretório deve ter permissões gerais de escrita (777).

## Configuração no painel de administração do Magento

1. Entre na página de administração do Magento.

2. Vá em Sistema->Configuração->Cache Management.
	No campo "All Cache", escolha "Atualizar"
	Em seguida clique em "Salvar configurações de cache"

3. Nas opções do módulo iPag, preencha os campos como demonstrado abaixo:
 * Habilitado: Sim
 * Título: Cartões de Crédito
 * Status de novos pedidos: Processando ou Pendente
 * Código/Login iPag: Preencha o campo com o login utilizado para acessar nosso painel
 * Ambiente: Produção
 * Taxa de Juros (%): Taxa de juros mensal. Deixe em branco caso não queira cobrar juros
 * Número de parcelas para valor a vista: Número máximo de parcelas para as quais não se cobrará juros.
 * Pagamento países permitidos: Todos os países permitidos
 * Debug: não

<aside class="notice">
    Certifique-se de copiar o diretório app/design/frontend/base/default/template/librepag/ para o diretório correspondente do template que está sendo utilizado.
</aside>

## Páginas de Sucesso e de Falha
<aside class="warning">
    Certifique-se de que você copiou os arquivos abaixo para o seu template.
	Esses arquivos contém alterações para que as páginas de sucesso e de falha exibam informações sobre a transação.
	Sem isso, a operadora não homologará a loja.
</aside>
*app/design/frontend/default/default/template/checkout/onepage/failure.phtml*
*app/design/frontend/default/default/template/checkout/success.phtml*


Caso esteja utilizando o módulo OneStepCheckout da Idev, atualize também o arquivo summary.phtml que se encontra no diretório abaixo

*app/design/frontend/default/default/template/onestepcheckout/summary.phtml*

A atualização deste arquivo é opcional, mas garante que o valor das parcelas seja exibido corretamente no checkout.

## Observação

```css
.sp-methods .form-list .input-box {width: 100%}
.sp-methods .form-list label {float: none}
```
Na versão 1.4 do Magento, para melhorar a aparência do Checkout, pode ser necessário inserir os comandos no arquivo styles.css

## Configuração dos Métodos de Pagamento
Acesse sua conta no <a href="https://painel.ipag.com.br"> Painel do iPag</a> e configure os métodos de pagamento.
<aside class="notice">
    Em caso de dúvidas, entre em contato conosco enviando um email para suporte@ipag.com.br
</aside>
