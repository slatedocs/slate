# Webhooks

Durante a implementação da API poderão existir momentos em que você precisará aguardar alguma ação externa antes de prosseguir com seu processo. Suponha que você necessite confirmar a emissão de uma nota fiscal antes de emitir a cobrança. Uma prática desaconselhável seria, por exemplo, agendar uma consulta diária ao serviço de documentos do Fast Notas para verificar o status de emissao de todas as suas notas fiscais pendentes.

Além de desperdiçar recursos de processamento, você também sofreria com o atraso entre o momento real da emissão e da consulta do webservice. Isso poderia ser resolvido diminuindo o intervalo entre as consultas, porém dependendo do número de notas fiscais pendentes, este método tornaria-se inviável em pouco tempo.

Para resolver esse problema, inverte-se a responsabilidade da notificação: O Fast Notas avisará você quando alguma ação ocorrer. Este aviso é realizado através de um `HTTP POST` que o Fast Notas faz em uma URL que você pode configurar na plataforma. Estes avisos são chamados de `webhooks`.

## Formato e método de envio

  Todas as requisições geradas a partir de webhooks são efetuadas com o método POST, com o conteúdo no corpo (body) da requisição no formato JSON, incluindo os seguintes headers:


  HTTP Header | Descrição
  -------------- | --------------
  **Content-Type** | *application/json; charset=UTF-8*
  **User-Agent** | *Fast-Notas-Hookshot/1.0*


  A plataforma espera que sua aplicação responda com o código HTTP 2XX (200, 201, etc) em no máximo 20 segundos. Códigos de redirecionamento (3XX) não serão seguidos e serão considerados como falha.

## Retentativas

  A plataforma Fast Notas irá efetuar 15 retentativas de envio caso seu sistema esteja fora do ar ou responda com um código HTTP diferente de 2xx. As retentativas são enviadas em intervalos progressivos durante aproximadamente 48 horas. Depois desse período a notificação é descartada.

## Conteúdo da requisição

  Como mencionado acima, o conteúdo da requisição estará contido em seu no corpo (body), no formato JSON.

  O conteúdo do atributo `data` irá depender do tipo de evento enviado e respeitará o mesmo formato da API REST.

  ```json
    {
      "event": {
        "type": "document_processing",
        "created_at": "2017-01-19T00:58:20.835Z",
        "data": {
          "document": {
            ...
          }
        }
      }
    }
  ```

## Eventos

  Evento | type | data
  -------------- | -------------- | --------------
  Documento em processamento | document_processing | document
  Documento aguardando retorno externo | document_waiting | document
  Documento emitido/arquivado com sucesso | document_success | document
  Documento cancelado | document_canceled | document
  Documento com erro | document_error | document
  Documento rejeitado na emissão/arquivamento | document_rejected | document
  Operação em processamento | operation_processing| operation
  Operação aguardando retorno externo | operation_waiting| operation
  Operação efetuada com sucesso | operation_success| operation
  Operação com erro | operation_error| operation
  Operação rejeitada | operation_rejected| operation
  Arquivo disponível | asset_avaliable| asset