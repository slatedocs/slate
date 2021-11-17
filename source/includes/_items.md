# Items

There aren't specific endpoints to manage items. Items are always associated to an invoice or ticket and should be manipulated through it.

## Attributes

Attr. name |  Constraints
---------- |  -----------
id         | Read only
concept |
unitary_amount |
quantity |
kind | Must be `current` or `assets` (\*) for items associated to expenses.  Must be `current` or `reimbursement` (\*\*) for items associated to income.  Default is `current`
vat_percent                | Percentage. Between 0 and 100
retention_percent          | Percentage. Between 0 and 100
discount_percent           | Percentage. Between 0 and 100
deductible_vat_percent     | Percentage. Between 0 and 100
deductible_expense_percent | Percentage. Between 0 and 100
description                | String. Item description 
vat_amount                 | Read only
retention_amount           | Read only
discount_amount            | Read only
decuctible_vat_amount      | Read only
total_amount               | Read only

\* Items with kind `assets`:

\** Items with kind `reimbursement`:
