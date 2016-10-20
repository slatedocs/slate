
# Addresses

  Um endereço é a associado à um cliente ou uma empresa.

  Através do endpoint `/addresses` é possível listar, exibir, criar, atualizar e deletar endereços.

<br> <br>

## Objeto `address`

   Parâmetro |  Descrição
 -------------- | --------------
  **country** <br> String | *Código do país no formato ISO 3166-1 alpha-2. Exemplo: BR*
  **zipcode** <br>String | *Números do Código postal sem separadores*
  **state** <br> String | *Código do estado no formato ISO 3166-2. Exemplo: SP*
  **city** <br>String | *Cidade*
  **neighborhood** <br> String | *Bairro*
  **street** <br> String | *Rua*
  **number** <br>String | *Número do endereço*
  **additional_details** <br> String | *Complemento*

<br> <br>

## Criando um endereço

  > POST https://api.fastnotas.com/v1/addresses

  ```shell
    curl -X POST http://api.fastnotas.dev:3000/v1/addresses/ \
      -u 'YOUR_API_KEY:' \
      -d 'street= Rua Doutor Diogo de Faria' \
      -d 'number=775' \
      -d 'additional_details=Cj. 123' \
      -d 'zipcode=04037003' \
      -d 'neighborhood=Vila Mariana' \
      -d 'city=São Paulo' \
      -d 'state=SP' \
      -d 'country=BR'
  ```

  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "b7658863-988b-4e44-9632-a93a282dd41a",
      "neighborhood": "Rua Doutor Diogo de Faria",
      "street": "Rua Doutor Diogo de Faria",
      "number": "775",
      "additional_details": "Cj. 123",
      "zipcode": "04037003",
      "city": "São Paulo",
      "state": "SP",
      "country": "BR"
    }
  ```

  <br> <br> <br>

  Parâmetro |  Descrição
 -------------- | --------------
  **country** <br> <p>obrigatório</p> | *Código do país no formato ISO 3166-1 alpha-2. Exemplo: BR*
  **zipcode** <br> <p>obrigatório</p> | *Números do Código postal sem separadores*
  **number** <br> <p>obrigatório</p> | *Número do endereço*
  **state**  | *Código do estado no formato ISO 3166-2. Exemplo: SP*
  **city** | *Cidade*
  **neighborhood**  | *Bairro*
  **street**  | *Rua*
  **additional_details**  | *Complemento*

<br> <br>

##Retornando um endereço
  > GET https://api.fastnotas.comv1/addresses/{ADDRESS_ID}

   ```shell
    curl -X GET https://api.fastnotas.com/v1/addresses/{ADDRESS_ID} \
      -u 'YOUR_API_KEY'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "b7658863-988b-4e44-9632-a93a282dd41a",
      "neighborhood": "Rua Doutor Diogo de Faria",
      "street": "Rua Doutor Diogo de Faria",
      "number": "775",
      "additional_details": "Cj. 123",
      "zipcode": "04037003",
      "city": "São Paulo",
      "state": "SP",
      "country": "BR"
    }
  ```

  Retorna os dados do endereço solicitado.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do endereço*

<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
<br> <br> <br> <br> <br> <br> <br> <br>

##Retornando endereços

  Retorna um array contendo objetos de endereço.

  > GET https://api.fastnotas.com/v1/addresses/

  ```shell
    curl -X GET https://api.fastnotas.com/v1/addresses/ \
    -u 'YOUR_API_KEY'
  ```
  > Exemplo de retorno em JSON:

  ```json
    [
      {
        "id": "b7658863-988b-4e44-9632-a93a282dd41a",
        "neighborhood": "Rua Doutor Diogo de Faria",
        "street": "Rua Doutor Diogo de Faria",
        "number": "775",
        "additional_details": "Cj. 123",
        "zipcode": "04037003",
        "city": "São Paulo",
        "state": "SP",
        "country": "BR"
      },
      {
        "id": "0ff70195-6b8a-41bc-b394-f1f9c9eb50d9",
        "neighborhood": "Rua dos Otonis",
        "street": "Rua dos Otonis",
        "number": "639",
        "additional_details": "5º andar",
        "zipcode": "04037003",
        "city": "São Paulo",
        "state": "SP",
        "country": "BR"
      }
    ]

  ```

## Atualizando um endereço

  Atualiza o endereço solicitado e retorna o mesmo com os parâmetros atualizados.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do endereço*

  > PUT https://api.fastnotas.com/v1/addresses/{ADDRESS_ID}

  ```shell
    curl -X PUT https://api.fastnotas.com/v1/addresses/{ADDRESS_ID} \
      -u 'YOUR_API_KEY:' \
      -d 'number=775'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "0ff70195-6b8a-41bc-b394-f1f9c9eb50d9",
      "neighborhood": "Rua dos Otonis",
      "street": "Rua dos Otonis",
      "number": "775",
      "additional_details": "5º andar",
      "zipcode": "04037003",
      "city": "São Paulo",
      "state": "SP",
      "country": "BR"
    }
  ```

## Deletando um endereço
  Deleta o endereço solicitado.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do endereço que será deletado.*

  > DELETE https://api.fastnotas.com/v1/addresses/{ADDRESS_ID}

  ```shell
    curl -X DELETE https://api.fastnotas.com/v1/addresses/{ADDRESS_ID} \
    -u 'YOUR_API_KEY:'
  ```
