
# Addresses

  Um endereço pertence à um cliente ou uma empresa. Use a rota `addresses` para criar, deletar e atualizar endereços.

<br> <br>

## Objeto address

   Parâmetro |  Descrição
 -------------- | --------------
  **country** <br> String | *Abreviação do país*
  **zipcode** <br>String | *Números do CEP sem separadores*
  **state** <br> String | *Estado*
  **city** <br>String | *Cidade*
  **neighborhood** <br> String | *Bairro*
  **street** <br> String | *Rua*
  **number** <br>String | *Número da casa/prédio*
  **additional_details** <br> String | *Detalhes adcionais*

<br> <br>

## Criando um endereço

  > POST https://api.fastnotas.com/v1/addresses

  ```shell
    curl -v -X POST https://api.fastnotas.com/v1/addresses/ \
    -d '[ {
            country: "BR",
            zipcode: "11111111",
            number: "123"
          }
        ]'
  ```
  <br> <br> <br>

  Parâmetro |  Descrição
 -------------- | --------------
  **country** <br> <p>obrigatório</p> | *Abreviação do país*
  **zipcode** <br> <p>obrigatório</p> | *Números do CEP sem separadores*
  **number** <br> <p>obrigatório</p> | *Número da casa/prédio*
  **state**  | *Estado*
  **city** | *Cidade*
  **neighborhood**  | *Bairro*
  **street**  | *Rua*
  **additional_details**  | *Detalhes adcionais*

<br> <br>

##Retornando um endereço
  > GET https://api.fastnotas.comv1/addresses/:id

   ```shell
    curl -v -X GET https://api.fastnotas.com/v1/addresses/:id \
    -d 'api_key=YOUR_API_KEY'
  ```
  > Exemplo de retorno em JSON:

  ```json
  {
    “id”: “9bf4xxxxxxxxxe37”,
    “neighborhood”: “Vila Clementino”,
    “street”: “Rua Doutor Diogo de Faria”,
    “number”: “123”,
    “additional_details”: null,
    “zipcode”: “04635021”,
    “city”: “São Paulo”,
    “state”: “SP”,
    “country”: “BR”
  }
  ```

  Retorna os dados do endereço criado ou solicitado pelo id.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do endereço criado.*



<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
<br> <br> <br> <br> <br> <br> <br> <br>

##Retornando endereços

  Retorna um array contendo objetos de Address.

  > GET https://api.fastnotas.com/v1/addresses/

  ```shell
    curl -v -X GET https://api.fastnotas.com/v1/addresses/
  ```
  > Exemplo de retorno em JSON:

  ```json
    [
  {
    "id": "9bxxxxxxxxxxxxx8e37",
    "neighborhood": "Vila Alexandria",
    "street": "Rua Palacete das Águias",
    "number": "123",
    "additional_details": null,
    "zipcode": "04635021",
    "city": "São Paulo",
    "state": "SP",
    "country": "BR"
  }
  {
    "id": "9bxxxxxxxxxxxxxxx7",
    "neighborhood": "Vila Clementino",
    "street": "Rua Doutor Diogo de Faria",
    "number": "123",
    "additional_details": null,
    "zipcode": "046xxxx1",
    "city": "SãoPaulo",
    "state": "SP",
    "country": "BR"
  }

]

  ```

## Atualizando um endereço

  Retorna o endereço solicitado com os parâmetros atualizados

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do endereço criado.*

  > PUT https://api.fastnotas.com/v1/addresses/:id

  ```shell
    curl -v -X PUT https://api.fastnotas.com/v1/addresses/:id
    -d '[ {
            number: "400"
          }
        ]'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
    "id": "9bxxxxxxxxxxxxxxx7",
    "neighborhood": "Vila Clementino",
    "street": "Rua Doutor Diogo de Faria",
    "number": "400",
    "additional_details": null,
    "zipcode": "046xxxx1",
    "city": "SãoPaulo",
    "state": "SP",
    "country": "BR"
  }
  ```

## Deletando um endereço
  Deleta o endereço solicitado.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do endereço que será deletado.*

  > DELETE https://api.fastnotas.com/v1/addresses/:id

  ```shell
    curl -v -X DELETE https://api.fastnotas.com/v1/addresses/:id
  ```
