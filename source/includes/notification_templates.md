# Notification templates

  Utilize este método para cadastrar o tipo de notification template.

  Através do endpoint `/notification_templates` é possível exibir, criar e deletar tipos de notification templates.


##Objeto `notification templates`
  Parâmetro |  Descrição
  -------------- | --------------
  **notification_template_entity** <br> Hash | *Representação da entidade [document_schema](#document-schemas)*
  **notification_type**  <br> String | *tipo da notificação.* <br> **Tipos:** `email`
  **trigger**  <br> String | *Tipo de notificação* <br> **Tipos:** `document_success` ou `document_canceled`

## Criando uma notification template

  > POST https://api.fastnotas.com/v1/notification_templates

  ```shell
    curl -X POST  https://api.fastnotas.com/v1/notification_templates/ \
      -u 'YOUR_API_KEY:' \
      -H 'Content-Type: application/json; charset=utf-8' \
     -d '{
           "notification_template_entity_id": "b7658863-988b-4e44-9632-a93a282dd41a",
           "notification_type":"email",
           "trigger":"document_success",
    }'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id":"73831b4e-7c90-465a-bfa5-5114da66bb60",
      "notification_template_entity_id": "b7658863-988b-4e44-9632-a93a282dd41a",
      "notification_type": "email",
      "trigger": "document_success"
    }
  ```




  <br> <br> <br>

  Parâmetro |  Descrição
 -------------- | --------------
  **notification_template_entity_id**  <br> <p> obrigatório </p> | *Id do esquema de documento*
  **notification_type**  <br> String | *tipo da notificação.* <br> **Tipos:** `email`
  **trigger**  <br> String | *Tipo de notificação* <br> **Tipos:** `document_success` ou `document_canceled`

  <br> <br> <br> <br> <br>

##Retornando uma notification template

  > GET https://api.fastnotas.com/v1/notification_templates/{NOTIFICATION_TEMPLATE_ID}

  ```shell
    curl -X GET https://api.fastnotas.com/v1/notification_templates/{NOTIFICATION_TEMPLATE_ID} \
    -u 'YOUR_API_KEY:'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id":"73831b4e-7c90-465a-bfa5-5114da66bb60",
      "document_schema_id": "b7658863-988b-4e44-9632-a93a282dd41a",
      "notification_type": "email",
      "trigger": "document_success"
    }
  ```

  Retorna os dados da notification template solicitada.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id da notification template criada*


<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
<br> <br> <br> <br> <br> <br> <br> <br>


## Inativando uma notification template

Inativa uma notification template.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id da notification template que será inativada*

  > DELETE https://api.fastnotas.com/v1/notification_templates/{NOTIFICATION_TEMPLATE_ID}

  ```shell
    curl -X DELETE https://api.fastnotas.com/v1/notification_templates/{NOTIFICATION_TEMPLATE_ID} \
    -u 'YOUR_API_KEY:'
  ```
