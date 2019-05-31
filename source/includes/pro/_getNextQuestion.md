## getNextQuestion

Запрос на получение следующего вопроса по цепочке. Принимает идентификатор предыдущего вопроса и код ответа на предыдущий вопрос, выдает следующий вопрос, результат операции и сообщение.

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | 
previousQuestionId | string | 1..1 | 
previousQuestionAnswerCode | string  | 1..1 | 
**Response:** | | |
question | [QuestionDTO](#questiondto) | 1..1 | 
result | string | 1..1 | результат операции {OK, ERROR} 
message | string | 1..1 | 
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
ReloginRequiredException | string | 0..1 | ???
