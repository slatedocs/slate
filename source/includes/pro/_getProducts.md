## getProducts

Получение информации о банковских продуктах, которыми пользуется пользователь с запрошенным идентификатором

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
**Response:** | | |
deposits | [DepositDTO](#DepositDTO) | 0..1 | массив объектов с информацией о депозитах
creditAccounts | [CreditAccountDTO](#creditaccountdto) | 0..1 | массив объектов с информацией о счетах кредитных карт
currentAccounts | [CurrentAccountDTO](#currentaccountdto) | 0..1 | массив объектов с информацией о текущих счетах
loans | [LoanDTO](#loandto) | 0..1 | массив объектов с информацией о кредитах
cardAccounts | [CardAccountDTO](#cardaccountdto) | 0..1 | массив объектов с информацией о карточных счетах
bonusPoints | [BonusPointsDTO](#bonuspointsdto) | 0..1 | массив объектов с информацией о бонусных счетах
card | [CardDTO](#carddto) | 0..1 | массив объектов с информацией о пластиковых картах
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
