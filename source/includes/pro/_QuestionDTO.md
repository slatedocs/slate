## QuestionDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | уникальный идентификатор
text | string | 1..1 | текст вопроса
answers | [AnswerDTO](#answerdto) | 1..1 | ответы на вопрос
canHide | bool | 0..1 | возможность свернуть вопрос