# Botão Comprar

<aside class="notice">
    Exemplo de Botão Comprar (Formulário)
</aside>

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
