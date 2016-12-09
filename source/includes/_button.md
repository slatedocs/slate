# Checkout iPag

> Checkout iPag (VPOS)

```php
<form method='post' action='http://sandbox.ipag.com.br/vpos'>
    <input type='hidden' name='identificacao' value='LOGIN_IPAG'/>
    <input type='hidden' name='operacao' value='Pagamento'/>
    <input type='hidden' name='pedido' value=''/>
    <input type='hidden' name='valor' value='1.00'/>
    <input type="hidden" name="plugin" value="html" />
    <input type="hidden" name="item_quant_1" value="1" />
    <input type="hidden" name="item_descr_1" value="NOME_PRODUTO" />
    <input type="hidden" name="item_valor_1" value="1.00" />
    <input type="hidden" name="item_id_1" value="123" />
    <input type="image" src="http://sandbox.ipag.com.br/images/comprar100px.png" name="submit" alt="Comprar" />
</form>
```

```html
<form method='post' action='http://sandbox.ipag.com.br/vpos'>
    <input type='hidden' name='identificacao' value='LOGIN_IPAG'/>
    <input type='hidden' name='operacao' value='Pagamento'/>
    <input type='hidden' name='pedido' value=''/>
    <input type='hidden' name='valor' value='1.00'/>
    <input type="hidden" name="plugin" value="html" />
    <input type="hidden" name="item_quant_1" value="1" />
    <input type="hidden" name="item_descr_1" value="NOME_PRODUTO" />
    <input type="hidden" name="item_valor_1" value="1.00" />
    <input type="hidden" name="item_id_1" value="123" />
    <input type="image" src="http://sandbox.ipag.com.br/images/comprar100px.png" name="submit" alt="Comprar" />
</form>
```

Com o **Checkout do iPag** você não precisa desenvolver seu próprio Checkout, apenas envie um POST com as informações abaixo para criar uma transação no iPag em seu nome.

Para configurar o Checkout iPag acesse o 
**Painel iPag** > Configurações > Configurações do Checkout

**Parâmetros do Checkout iPag**

Parâmetro | Obrigatório | Descrição
----------|-------------|---------
identificacao|sim|Identificação no iPag
operacao|sim|Tipo da Operação (Pagamento)
pedido|não|Número do pedido 
valor|sim|Valor que será cobrado do cliente
plugin|sim|Parâmetro necessário para enviar um requisição ao Checkout iPag
item_quant_1|não|Quantidade do Produto/Serviço
item_descr_1|não|Descrição do Item
item_valor_1|não|Valor unitário do Produto
item_id_1|não|SKU do Produto
url_retorno|não|Endpoint que o iPag irá enviar um POST quando há atualização de status da transação
nome|não|Nome do Cliente
documento|não|Documento do Cliente
email|não|Email do Cliente
fone|não|Telefone do Cliente
endereco|não|Endereço do Cliente
numero_endereco|não|Número do endereço do Cliente
bairro|não|Bairro do Cliente
complemento|não|Complemento do Cliente
cidade|não|Cidade do Cliente
estado|não|Estado do Cliente (formato:SP)
cep|não|CEP do Cliente


