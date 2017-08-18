# Notification templates

  Utilize este método para cadastrar o tipo de notification template.
  
  Templates de notificação são utilizadas para criar um modelo para notificações.

  Essa notificação é relacionada a uma gatilho (trigger) de uma entidade.

  Através do endpoint `/notification_templates` é possível exibir, criar e deletar `templates de notificações`.

##Notification type

  Este campo é utilizado para deterimar o tipo de notificação utilizada para o template registrado.
    
  **Tipos:** `email`

##Trigger

  Utilizado para deterimar com qual ação do Documento o template será utilizado 

 
   Tipos | Descrição
    -------------- | --------------
   `document_success` | [document_schema](#document-schemas) 
   `document_canceled` | [document_schema](#document-schemas)

##Objeto `notification templates`
  Parâmetro | Descrição
  -------------- | --------------
  **notification_template_entity** <br> Hash | *Representação da entidade [document_schema](#document-schemas)*
  **notification_type**  <br> String | *tipo da notificação(#notification-type).*
  **trigger**  <br> String | *quando a ação deve ser disparada (#notification-type).*

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
   **notification_template_entity** <br> Hash | *Representação da entidade [document_schema](#document-schemas)*
   **notification_type**  <br> String | *tipo da notificação(#notification-type).*
   **trigger**  <br> String | *quando a ação deve ser disparada (#notification-type).*
   
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

Inativa uma template de notificação.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id da notification template que será inativada*

  > DELETE https://api.fastnotas.com/v1/notification_templates/{NOTIFICATION_TEMPLATE_ID}

  ```shell
    curl -X DELETE https://api.fastnotas.com/v1/notification_templates/{NOTIFICATION_TEMPLATE_ID} \
    -u 'YOUR_API_KEY:'
  ```
