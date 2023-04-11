# MDF-e

A MDF-e (Manifesto Eletrônico de Documentos Fiscais) é utilizada para rastrear a circulação física da carga em transportes interestaduais, transporte de carga fracionada ou por transporte de bens que utilizam mais de uma NFe.

As seguintes operações estão disponíveis:

* Emissão de MDF-e com geração da DAMDF-e
* Inclusão de condutor
* Inclusão de DFe
* Cancelamento de MDF-e
* Encerramento de MDF-e

Através da API MDF-e é possível:

* Emitir MDF-e (Conhecimento de Transporte Eletrônico) utilizando dados simplificados. Este processo é **assíncrono**. Ou seja, após a emissão a nota será enfileirada para processamento.
* Cancelar uma MDF-e
* Consultar o status de MDF-e emitidas.
* Emitir os eventos: inclusão de condutor, inclusão de DFe e encerramento.

## URLs

Método | URL (recurso) | Ação
-------|-------|-----
POST |  /v2/mdfe?ref=REFERENCIA | Cria uma MDF-e e envia para processamento.
GET  | /v2/mdfe/REFERENCIA  | Consulta a MDF-e com a referência informada e o seu status de processamento
DELETE |  /v2/mdfe/REFERENCIA | Cancela uma MDF-e com a referência informada
POST |  /v2/mdfe/REFERENCIA/inclusao_condutor | Inclui um novo condutor.
POST |  /v2/mdfe/REFERENCIA/inclusao_dfe  | Inclui um novo DFe.
POST |  /v2/mdfe/REFERENCIA/encerrar  | Encerra uma MDF-e

## Campos de um MDF-e

> Abaixo um exemplo de dados de uma MDF-e:

```json

{
  "modal_aereo": {
    "marca_nacionalidade_aeronave": "ABCD",
    "marca_matricula_aeronave": "123456",
    "numero_voo": "AB1234",
    "aerodromo_embarque": "OACI",
    "aerodromo_destino": "OACI",
    "data_voo": "2018-06-15"

  },
  "emitente": "1",
  "tipo_transporte": "1",
  "serie": "1",
  "modo_transporte": "2",
  "data_emissao": "2019-01-30",
  "uf_inicio": "BA",
  "uf_fim": "PR",
  "municipios_carregamento": [
    {
      "codigo": "2927408",
      "nome": "Salvador"
    }
  ],
  "percursos": [
    {
      "uf_percurso": "PR"
    }
  ],
  "data_hora_previsto_inicio_viagem": "2019-01-16",
  "cnpj_emitente": "22274451000119",
  "inscricao_estadual_emitente": "25231737",
  "municipios_descarregamento": [
    {
      "codigo": "4119152",
      "nome": "Pinhais",
      "conhecimentos_transporte": [
        {
          "chave_cte": "21111100317911000149570011000000051123456786"
        }
      ]
    }
  ],
  "quantidade_total_cte": 1,
  "valor_total_carga": "20000.00",
  "codigo_unidade_medida_peso_bruto": "01",
  "peso_bruto": "11.0000"
}


```

Abaixo você poderá consultar os campos da MDF-e. Nesta página, você pode buscar os campos pela TAG XML ou pela nossa tradução para API.

[Documentação completa dos campos MDF-e](https://campos.focusnfe.com.br/mdfe/MDFeXML.html)

Além dos campos descritos acima, cada MDF-e deverá obrigatoriamente informar um **modal**, que é a forma de transporte da carga. Você deverá informar uma das seguintes chaves nos dados, clique em cada link para visualizar os campos completos:

* modal_rodoviario [para transporte rodoviário.](https://campos.focusnfe.com.br/mdfe/TransporteRodoviarioXML.html)
* modal_aereo [para transporte aéreo.] (https://campos.focusnfe.com.br/mdfe/TransporteAereoXML.html)
* modal_aquaviario [para transporte aquaviário.] (https://campos.focusnfe.com.br/mdfe/TransporteAquaviarioXML.html)
* modal_ferroviario [para transporte ferroviário.] (https://campos.focusnfe.com.br/mdfe/TransporteFerroviarioXML.html)


## Status API

Aqui você encontra os status possíveis

HTTP CODE/STATUS | Status API Focus | Descrição | Correção
---|---|---|---|
422 - unprocessable entity | erro_validacao_schema | Erro na validação do Schema XML | Verifique o detalhamento do erro na resposta da API.
400 - bad request | forma_emissao_invalida | A forma de emissão utilizada é inválida | As formas de emissão disponíveis estão contidas na documentação da API.
400 - bad request | campos_invalidos | OCampo 'X não é válido | Onde X é o nome do campo inválido. Verifique a documentação dos campos da API para MDF-e.
400 - bad request | campos_invalidos_modal | Esse status indica erros nos campos do modal usado. Verifique os campos informados e compare com a nossa documentação de campos.
400 - bad request | empresa_nao_habilitada | Empresa ainda não habilitada para emissão de MDF-e | Verifique o cadastro do emitente no Painel API, deve-se habilitar MDF-e para começar a emitir este documento.
409 - conflict | mdfe_ja_autorizado | Já existe um MDF-e autorizado utilizando esta referência | Altere a referência da requisição e tente novamente.
409 - conflict | mdfe_em_processamento | Já existe um MDF-e utilizando essa referencia e ele está em processamento | Altere a referência da requisição e tente novamente.
404 - not found | nao_encontrado | MDF-e não encontrado| MDF-e informado na requisição não foi encontrado.
400 - bad request | requisicao_invalida | Sua requisição é inválida porque alguns dos paramêtros básicos não foram cumpridos. Entre em contato com o nosso suporte.


## Envio

```shell
# arquivo.json deve conter os dados da MDF-e
curl -u "token obtido no cadastro da empresa:" \
  -X POST -T arquivo.json https://homologacao.focusnfe.com.br/v2/mdfe?ref=12345
```


Para enviar uma MDF-e utilize a URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Envia uma **MDF-e** para autorização:

`https://api.focusnfe.com.br/v2/mdfe?ref=REFERENCIA`

Utilize o comando **HTTP POST** para enviar a sua nota para nossa API. Envie como corpo do POST os dados em formato JSON da MDF-e.

Nesta etapa, é feita uma primeira validação dos dados da nota. Caso ocorra algum problema, por exemplo, algum campo faltante, formato incorreto
ou algum problema com o emitente a nota **não será aceita para processamento** e será devolvida a mensagem de erro apropriada. Veja a seção [erros](#introducao_erros).

Caso a nota seja validada corretamente, a nota será **aceita para processamento**. Isto significa que a nota irá para uma fila de processamento
onde eventualmente será processada (processamento assíncrono). Com isto, a nota poderá ser autorizada ou ocorrer um erro na autorização, de acordo com a validação da SEFAZ.

Para verificar se a nota já foi autorizada, você terá que efetuar uma [consulta](#mdfe_consulta).

### Emissão em contingência offline

Para enviar uma MDF-e em contingência offline utilize a URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

`https://api.focusnfe.com.br/v2/mdfe?ref=REFERENCIA&contingencia=1`

É importante ressaltar que atualmente não há a possibilidade de envio de MDF-e em contingência offline de forma automática, apenas de forma manual, utilizando o parâmetro **contingencia=1**.

## Consulta

```shell
curl -u "token obtido no cadastro da empresa:" \
  https://homologacao.focusnfe.com.br/v2/mdfe/12345
```

Para consultar uma MDF-e utilize a URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Consultar as informações de uma MDF-e:

`https://api.focusnfe.com.br/v2/mdfe/REFERENCIA?completa=(0|1)`

Utilize o comando **HTTP GET** para consultar a sua nota para nossa API.

Parâmetro Opcional | Ação
-------|-------|-----
completa = 0 ou 1 | Habilita a API há mostrar campos adicionais na requisição de consulta.

Campos de retorno:

* **cnpj_emitente**: O CNPJ emitente da MDF-e (o CNPJ de sua empresa).
* **ref**:A referência da emissão.
* **status**: A situação da MDF-e, podendo ser:
  - **processando_autorizacao**: A nota ainda está em processamento pela API. Você deverá aguardar o processamento pela SEFAZ.
  - **autorizado**: A nota foi autorizada, neste caso é fornecido os dados completos da nota como chave e arquivos para download
  - **cancelado**: O documento foi cancelado, neste caso é fornecido o caminho para download do XML de cancelamento (caminho_xml_cancelamento).
  - **encerrado**: O documento foi autorizado e posteriormente encerrado, neste caso é fornecido o caminho para download do XML de encerramento (caminho_xml_encerramento).
  - **erro_autorizacao**: Houve um erro de autorização por parte da SEFAZ. A mensagem de erro você encontrará nos campos status_sefaz e mensagem_sefaz. É possível fazer o reenvio da nota com a mesma referência se ela estiver neste estado.
  - **denegado**: O documento foi denegado. Uma SEFAZ pode denegar uma nota se houver algum erro cadastral nos dados do destinatário ou do emitente. A mensagem de erro você encontrará nos campos status_sefaz e mensagem_sefaz. Não é possível reenviar a nota caso este estado seja alcançado pois é gerado um número, série, chave de MDF-e e XML para esta nota. O XML deverá ser armazenado pelo mesmo período de uma nota autorizada ou cancelada.
* **status_sefaz**: O status da nota na SEFAZ.
* **mensagem_sefaz**: Mensagem descritiva da SEFAZ detalhando o status.
* **serie**: A série da MDF-e, caso ela tenha sido autorizada.
* **numero**: O número da MDF-e, caso ela tenha sido autorizada.
* **modelo**: O modelo da MDF-e, caso ela tenha sido autorizada. No momento sempre assume o valor 58.
* **chave_mdfe**: A chave da MDF-e, caso ela tenha sido autorizada.
* **caminho_xml_nota_fiscal**: caso a nota tenha sido autorizada, retorna o caminho para download do XML.
* **caminho_damdfe**: caso a nota tenha sido autorizada retorna o caminho para download do DAMDF-e.
* **caminho_xml**: caso tenha sido emitida alguma carta de correção, aqui aparecerá o caminho para fazer o download do XML.
* **caminho_xml_cancelamento**: Caso a MDFe esteja cancelada, é fornecido o caminho para fazer o download do XML de cancelamento.
* **caminho_xml_encerramento**: Caso a MDFe esteja encerrada, é fornecido o caminho para fazer o download do XML de encerramento.

Caso na requisição seja passado o parâmetro `completa=1` será adicionado mais 6 campos:

* **requisicao**: Inclui os dados completos da requisição da MDF-e, da mesma forma que constam no XML da nota.
* **protocolo**: Inclui os dados completos do protocolo devolvido pela SEFAZ.
* **requisicao_cancelamento**: Inclui os dados completos da requisição de cancelamento da MDF-e.
* **protocolo_cancelamento**: Inclui os dados completos do protocolo devolvido pela SEFAZ.
* **requisicao_encerramento**: Inclui os dados completos da requisição de cancelamento da MDF-e.
* **protocolo_encerramento**: Inclui os dados completos do protocolo devolvido pela SEFAZ.
* **condutores_incluidos**: Inclui uma lista de dados de condutores que foram incluídos posteriormente. Cada chave contém:
  * **requisicao**: Inclui os dados completos da requisição de inclusão de condutores
  * **protocolo**: Inclui os dados completos do protocolo devolvido pela SEFAZ.
* **dfes_incluidos**: Inclui uma lista de dados de documentos fiscais que foram incluídos posteriormente. Cada chave contém:
  * **requisicao**: Inclui os dados completos da requisição de inclusão de DFe's
  * **protocolo**: Inclui os dados completos do protocolo devolvido pela SEFAZ.


> Exemplo de resposta da consulta de MDF-e:

```json
{
    "cnpj_emitente": "11111151000119",
    "ref": "ref123",
    "status": "autorizado",
    "status_sefaz": "100",
    "mensagem_sefaz": "Autorizado o uso do MDF-e",
    "chave": "MDFe21111114611151000119570010000000111973476363",
    "numero": "11",
    "serie": "1",
    "modelo": "58",
    "caminho_xml": "https://focusnfe.s3-sa-east-1.amazonaws.com/arquivos_development/11111151000119/201805/XMLs/311110000007009_v03.00-protMDF-e.xml",
}
```

> Exemplo de resposta com o parâmetro, completa, recebendo o valor "1":

```json
{

  "cnpj_emitente": "11111151000119",
  "ref": "ref123",
  "status": "autorizado",
  "status_sefaz": "100",
  "mensagem_sefaz": "Autorizado o uso do CT-e",
  "chave": "MDF-e21111114611151000119570010000000111973476363",
  "numero": "11",
  "serie": "1",
  "modelo": "57",
  "caminho_xml": "https://focusnfe.s3-sa-east-1.amazonaws.com/arquivos_development/11111151000119/201805/XMLs/311110000007009_v03.00-protMDF-e.xml",
  "caminho_xml_carta_correcao": "https://focusnfe.s3-sa-east-1.amazonaws.com/arquivos_development/11111151000119/201805/XMLs/311110000007012_v03.00-eventoMDF-e.xml"
  "requisicao": {
    /* campos da MDF-e aqui omitida */
  }
  "protocolo": {
    "versao": "3.00",
    "id_tag": "MDFe329180000007009",
    "ambiente": "2",
    "versao_aplicativo": "RS20180430143216",
    "chave": "21111114611151000119570010000000111973476363",
    "data_recimento": "2018-05-10T15:23:36-03:00",
    "protocolo": "329180000007009",
    "digest_value": "PsPzcf7bCOwvNW+v2F+ZAzJPXJE=",
    "status": "100",
    "motivo": "Autorizado o uso do MDF-e"
  },
}
```


## Cancelamento


```shell
curl -u "token obtido no cadastro da empresa:" \
  -X DELETE -d '{"justificativa":"Teste de cancelamento"}' \
  https://homologacao.focusnfe.com.br/v2/mdfe/12345
```

> Resposta da API para a requisição de cancelamento:

```json
{
  "status_sefaz": "135",
  "mensagem_sefaz": "Evento registrado e vinculado a MDF-e",
  "status": "cancelado",
  "caminho_xml": "https://focusnfe.s3-sa-east-1.amazonaws.com/arquivos_development/14674451000119/201805/XMLs/329180000006929_v03.00-eventoMDF-e.xml"
}
```

Para cancelar uma MDF-e, basta fazer uma requisição à URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Cancelar uma MDF-e já autorizada:

`https://api.focusnfe.com.br/v2/mdfe/REFERENCIA`

Utilize o comando **HTTP DELETE** para cancelar a sua nota para nossa API. Este método é síncrono, ou seja, a comunicação com a SEFAZ será feita imediatamente e devolvida a resposta na mesma requisição.

O parâmetros de cancelamento deverão ser enviados da seguinte forma:

* **justificativa**: Justificativa do cancelamento. Deverá conter de 15 a 255 caracteres.

A API irá em seguida devolver os seguintes campos:

* **status**: cancelado, se a nota pode ser cancelada, ou erro_cancelamento, se houve algum erro ao cancelar a nota.
* **status_sefaz**: O status do cancelamento na SEFAZ.
* **mensagem_sefaz**: Mensagem descritiva da SEFAZ detalhando o status.
* **caminho_xml**: Caso a nota tenha sido cancelada, será informado aqui o caminho para download do XML de cancelamento.

### Prazo de cancelamento
A MDF-e poderá ser cancelada em até 24 horas após a emissão.

## Inclusão de Condutor


```shell
curl -u "token obtido no cadastro da empresa:" \
  -X POST -d '{"nome":"João da Silva","cpf":"68971569140"}' \
  https://homologacao.focusnfe.com.br/v2/mdfe/12345/inclusao_condutor
```

> Resposta da API para a requisição de cancelamento:

```json
{
  "status_sefaz": "135",
  "mensagem_sefaz": "Evento registrado e vinculado a MDF-e",
  "status": "incluido",
  "caminho_xml": "https://focusnfe.s3-sa-east-1.amazonaws.com/arquivos_development/14674451000119/201805/XMLs/329180000006929_v03.00-eventoMDF-e.xml"
}
```

Para incluir um condutor adicional em uma MDF-e autorizada, basta fazer uma requisição à URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Incluir um condutor em uma MDF-e autorizada:

`https://api.focusnfe.com.br/v2/mdfe/REFERENCIA/inclusao_condutor`

Utilize o comando **HTTP POST** para incluir um condutor. Este método é síncrono, ou seja, a comunicação com a SEFAZ será feita imediatamente e devolvida a resposta na mesma requisição.

Os parâmetros de inclusão deverão ser enviados da seguinte forma:

* **nome**: Nome completo do condutor
* **cpf**: CPF do condutor

A API irá em seguida devolver os seguintes campos:

* **status**: incluido, se o condutor foi incluído com sucesso, ou erro_inclusao, se houve algum erro ao incluir o condutor
* **status_sefaz**: O status da operação na SEFAZ.
* **mensagem_sefaz**: Mensagem descritiva da SEFAZ detalhando o status.
* **caminho_xml**: Caso o condutor tenha sido incluído, será informado aqui o caminho para download do XML de inclusão.

## Inclusão de DFe


```shell
curl -u "token obtido no cadastro da empresa:" \
  -X POST -d '{
    "protocolo": "110011000001101",
    "codigo_municipio_carregamento": "5107875",
    "documentos": [
        {
            "codigo_municipio_descarregamento": "5107875",
            "chave_nfe": "51210810425282002508550010000186761100123456"
        }
    ]
  }' \
  https://homologacao.focusnfe.com.br/v2/mdfe/12345/inclusao_dfe
```

> Resposta da API para a requisição de cancelamento:

```json
{
  "status_sefaz": "135",
  "mensagem_sefaz": "Evento registrado e vinculado a MDF-e",
  "status": "incluido",
  "caminho_xml": "https://focusnfe.s3-sa-east-1.amazonaws.com/arquivos_development/14674451000119/201805/XMLs/329180000006929_v03.00-eventoMDF-e.xml"
}
```

Para incluir um DFe adicional em uma MDF-e autorizada (com indicativo de carregamento posterior), basta fazer uma requisição à URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Incluir um DFe em uma MDF-e autorizada:

`https://api.focusnfe.com.br/v2/mdfe/REFERENCIA/inclusao_dfe`

Utilize o comando **HTTP POST** para incluir um DFe. Este método é síncrono, ou seja, a comunicação com a SEFAZ será feita imediatamente e devolvida a resposta na mesma requisição.

Os parâmetros de inclusão deverão ser enviados da seguinte forma:

* **protocolo**: Nº do Protocolo de Autorização do MDF-e (Obrigatório)
* **codigo_municipio_carregamento**: Código do Município de Carregamento (Obrigatório)
* **nome_municipio_carregamento**: Nome do Município de Carregamento
* **documentos**: Grupo de informações dos documentos que serão inseridos no MDF-e (Obrigatório)
 * **codigo_municipio_descarregamento**: Código do Município de Descarregamento (Obrigatório)
 * **nome_municipio_descarregamento**: Nome do Município de Descarregamento
 * **chave_nfe**: Chave da NF-e (Obrigatório)

A API irá em seguida devolver os seguintes campos:

* **status**: incluido, se o DFe foi incluído com sucesso, ou erro_inclusao, se houve algum erro ao incluir o DFe.
* **status_sefaz**: O status da operação na SEFAZ.
* **mensagem_sefaz**: Mensagem descritiva da SEFAZ detalhando o status.
* **caminho_xml**: Caso o DFe tenha sido incluído, será informado aqui o caminho para download do XML de inclusão.

## Encerramento


```shell
curl -u "token obtido no cadastro da empresa:" \
  -X POST -d '{"data":"2019-03-05","sigla_uf":"SP","nome_municipio":"São Paulo"}' \
  https://homologacao.focusnfe.com.br/v2/mdfe/12345/encerrar
```

> Resposta da API para a requisição de encerramento:

```json
{
  "status_sefaz": "135",
  "mensagem_sefaz": "Evento registrado e vinculado a MDF-e",
  "status": "encerrado",
  "caminho_xml": "https://focusnfe.s3-sa-east-1.amazonaws.com/arquivos_development/14674451000119/201805/XMLs/329180000006929_v03.00-eventoMDF-e.xml"
}
```

Após o término da operação, o MDFe terá que ser obrigatoriamente encerrado. Para isso basta fazer uma requisição à URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Encerrar uma MDF-e autorizada:

`https://api.focusnfe.com.br/v2/mdfe/REFERENCIA/encerrar`

Utilize o comando **HTTP POST** para incluir um condutor. Este método é síncrono, ou seja, a comunicação com a SEFAZ será feita imediatamente e devolvida a resposta na mesma requisição.

Os parâmetros de encerramento deverão ser enviados da seguinte forma:

* **data**: Data do encerramento
* **sigla_uf**: UF do município de encerramento
* **nome_municipio**: Nome do município de encerramento

A API irá em seguida devolver os seguintes campos:

* **status**: encerrado, se o MDFe foi encerrado com sucesso, ou erro_encerramento, se houve algum erro ao encerrar o MDFe
* **status_sefaz**: O status da operação na SEFAZ.
* **mensagem_sefaz**: Mensagem descritiva da SEFAZ detalhando o status.
* **caminho_xml**: Caso o encerramento tenha sido realizado, será informado aqui o caminho para download do XML.
