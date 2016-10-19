# Document Schemes
  Atráves da criação de um Document Scheme você cria o próprio esquema do documento que deseja salvar. Através da rota de `document_scheme` é possível criar os parâmetros para a **nota fiscal de serviço**.



##Objeto `document_scheme`
  Parâmetro |  Descrição
  -------------- | --------------
  **name**  <br> String | *Nome do documento.*
  **code**  <br> String | *Código para identificação(Por exemplo:"NFS-e").*
  **type**  <br> String | *Aceita o tipo do esquema do documento* <br> `Invoice::Nfse`
  **status** <br> Default: 1 | *Status ativo(1) ou inativo(0 - deletado).*
  **credentials<br>[`attributes`]** <br> Hash | *Consulte a [tabela](#credenciais) de refêrencia para cada tipo de <br>`document_scheme`.*
  **sequence**  <br> Int | *O documento é guardado com uma sequência.*
  **company_id** <br> String | *O document_scheme pertence à uma empresa.*


## Criando um esquema de documento

  > POST https://api.fastnotas.com/v1/document_schemes

  ```shell
  curl -X POST https://api.fastnotas.com/v1/document_schemes \
  -d '[
        {
          "name": "Nota fiscal de serviço",
          "code": "NFS-e",
          "type": "Invoice::Nfse",
        }
      ]'
 ```

  Parâmetro |  Descrição
  -------------- | --------------
  **name**  <br> <p>obrigatório</p>  | *Nome do documento.*
  **code**  <br> <p>obrigatório</p>  | *Código para identificação(Por exemplo:"NFS-e").*
  **type**  <br> <p>obrigatório</p>  | *Aceita o tipo do esquema do documento* <br> `Invoice::Nfse`
  **credentials<br>[`attributes`]** | *Consulte a [tabela](#credenciais) de refêrencia para cada tipo de <br>`document_scheme`.*
  **company_id** <br> <p>obrigatório</p>  | *O document_scheme pertence à uma empresa.*


<br> <br> <br> <br> <br> <br>
## Retornando um esquema de documento
  > GET https://api.fastnotas.com/v1/document_schemes/:id

   ```shell
    curl -v -X GET https://api.fastnotas.com/v1/document_schemes/:id
  ```
  > Exemplo de retorno em JSON:

  ```json

    {
      "name": "Notas fiscais de serviço",
      "code": "invoice_nfse",
      "type": "Invoice::Nfse",
      "status": 1,
      "sequence": 1,
      "credentials": null
    }
  ```

  Retorna os dados do esquema criado ou solicitado pelo id.

  Parâmetro | Descrição
 -------------- | --------------
**:id** <br> <p>obrigatório</p> | *Id do esquema de documento criado.*


<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
## Atualizando as credenciais para o esquema de documento

  > PUT https://api.fastnotas.com/v1/document_scheme/:id

  ```shell
  curl -X PUT https://api.fastnotas.com/v1/document_schemes/:id \
  -d '[
        {
          "credentials": "{
            "certificate": "MyString",
            "password": "123",
            "expiration_date": "2016-09-06"
          }"
        }
      ]'
 ```

  > Exemplo de retorno JSON:

  ```json
    {
      "name": "Notas fiscais de serviço",
      "code": "invoice_nfse",
      "type": "DocumentScheme::Invoice::Nfse",
      "status": 1,
      "sequence": 1,
      "credentials": "{
                        "certificate": "MyString",
                        "password": "123",
                        "expiration_date": "2016-09-06"
                      }"
    }
  ```

  <br>
  As `credentials` representam os parâmetros necessários para acessar cada tipo de documento. No caso da Nota Fiscal de Serviço, pode ser exigido o certificado digital, usuário e senha, etc.
  <br> <br> <br>

Parâmetro | Descrição
 -------------- | --------------
**:id** <br> <p>obrigatório</p> | *Id do esquema de documento criado.*
**credentials** | *Parâmetros válidos para determinado esquema de documento.*





## Credenciais

### Notas Fiscais de Serviço (NFS-e)

  As credenciais de NFS-e variam de acordo com o munícipio, a tabela abaixo descreve os dados necessários para cada município que o Fast Notas possuí integração.

  Estado | Município | Credenciais
 -------------- | -------------- | --------------
  SP | São Paulo | `certificate`: Arquivo contendo o certificado A1 (.p12 ou .pfx) <br> `password`: Senha do certificado
  RJ | Rio de Janeiro | `certificate`: Arquivo contendo o certificado A1 (.p12 ou .pfx) <br> `password`: Senha do certificado


# Items

# Settings

# Documents

# Customers

# Operations

# Transactions
