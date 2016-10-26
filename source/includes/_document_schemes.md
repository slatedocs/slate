# Document Schemes

  Utilize este método para cadastrar o tipo de documento que você deseja emitir/arquivar.

  Através do endpoint `/document_schemes` é possível listar, exibir, criar, atualizar e deletar tipos documentos.


##Objeto `document_scheme`
  Parâmetro |  Descrição
  -------------- | --------------
  **name**  <br> String | *Nome do documento.*
  **code**  <br> String | *Código para identificação(Por exemplo:"NFS-e").*
  **type**  <br> String | *Tipo de documento que deve ser emitido/arquivado* <br> *Tipos:* `Invoice::Nfse`
  **status** <br> Default: active | *Define se o esquema de documento está ativado ou não na API.*
  **credentials** <br>[`attributes`]<br> Hash | *Consulte a [tabela](#credenciais) de refêrencia para cada tipo de <br>`document_scheme`.*
  **sequence**  <br> Int | *Número sequencial do último documento emitido/armazenado deste tipo.*


## Criando um esquema de documento

  > POST https://api.fastnotas.com/v1/document_schemes

  ```shell
  curl -X POST https://api.fastnotas.com/v1/document_schemes \
    -u 'YOUR_API_KEY:' \
    -d 'name=Nota fiscal de serviço' \
    -d 'code=NFS-e' \
    -d 'type=Invoice::Nfse' \
    -d 'credentials=[attribute_1]' \
    -d 'credentials=[attribute_2]' \
    -d 'credentials=[attribute_3]'
 ```

  Parâmetro |  Descrição
  -------------- | --------------
  **name**  <br> <p>obrigatório</p>  | *Nome do documento.*
  **code**  <br> <p>obrigatório</p>  | *Código para identificação(Por exemplo:"NFS-e").*
  **type**  <br> <p>obrigatório</p>  | *Aceita o tipo do esquema do documento* <br> `Invoice::Nfse`
  **credentials<br>[`attributes`]** <br> <p>obrigatório</p> | *Consulte a [tabela](#credenciais) de refêrencia para cada tipo de <br>`document_scheme`.*


<br> <br> <br> <br> <br> <br>
## Retornando um tipo de documento solicitado.

  > GET https://api.fastnotas.com/v1/document_schemes/{DOCUMENT_SCHEME_ID}

   ```shell
    curl -X GET https://api.fastnotas.com/v1/document_schemes/{DOCUMENT_SCHEME_ID} \
    -u 'YOUR_API_KEY:'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "b7658863-988b-4e44-9632-a93a282dd41a",
      "name": "Nota fiscal de serviço",
      "code": "NFS-e",
      "type": "Invoice::Nfse",
      "status": "active",
      "sequence": 1,
      "credentials": {
        "certificate": [FILTERED],
        "password": [FILTERED],
        "expiration_date": "2020-12-30"
      }
    }
  ```

  Retorna os dados do tipo de documento solicitado.

  Parâmetro | Descrição
 -------------- | --------------
**:id** <br> <p>obrigatório</p> | *Id do esquema de documento.*


<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
## Atualizando dados e credenciais de um tipo de documento.

  > PUT https://api.fastnotas.com/v1/document_scheme/{DOCUMENT_SCHEME_ID}

  ```shell
  curl -X PUT https://api.fastnotas.com/v1/document_schemes/{DOCUMENT_SCHEME_ID} \
  -u 'YOUR_API_KEY:' \
  -d 'credentials=[attribute_1]' \
  -d 'credentials=[attribute_2]' \
  -d 'credentials=[attribute_3]'
 ```

  > Exemplo de retorno JSON:

  ```json
    {
      "id": "b7658863-988b-4e44-9632-a93a282dd41a",
      "name": "Nota fiscal de serviço",
      "code": "NFS-e",
      "type": "Invoice::Nfse",
      "status": "active",
      "sequence": 1,
      "credentials": {
        "certificate": [FILTERED],
        "password": [FILTERED],
        "expiration_date": "2020-12-30"
      }
    }
  ```

  <br>
  As `credentials` representam os parâmetros necessários para acessar cada tipo de documento. Para cada um existem regras diferentes, para mais informações consulte a [tabela de credenciais](#credenciais)
  <br> <br> <br>

Parâmetro | Descrição
 -------------- | --------------
**:id** <br> <p>obrigatório</p> | *Id do esquema de documento.*
**credentials** <br> <p>obrigatório</p> | *Hash de credenciais seguindo a especificação da* [tabela](#credenciais)


## Credenciais

### Notas Fiscais de Serviço (NFS-e)

  As credenciais de NFS-e variam de acordo com o munícipio, a tabela abaixo descreve os dados necessários para cada município que o Fast Notas possuí integração.

  Estado | Município | Credenciais
 -------------- | -------------- | --------------
  SP | São Paulo | `certificate`: Arquivo contendo o certificado A1 (.p12 ou .pfx) <br> `password`: Senha do certificado
  RJ | Rio de Janeiro | `certificate`: Arquivo contendo o certificado A1 (.p12 ou .pfx) <br> `password`: Senha do certificado


## Deletando um esquema de documento
  Deleta o esquema de documento solicitado.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do esquema de documento*

  > DELETE https://api.fastnotas.com/v1/document_schemes/{DOCUMENT_SCHEME_ID}

  ```shell
    curl -X DELETE https://api.fastnotas.com/v1/document_schemes/{DOCUMENT_SCHEME_ID} \
    -u 'YOUR_API_KEY:'
  ```
