## Retrieve Payroll by Jobcode Report

Retrieves a payroll report, broken down by jobcode, with filters to narrow down the results.

Overtime (and double time) are allocated based on the jobcode they are working on at the time the thresholds are crossed. In other words, by order of occurrence. 

As an example, assume that an employee works 60 hours against 3 different job codes, following this schedule: 25 hours against jobcode A, then 25 hours against jobcode B, then 10 hours against jobcode C. The report would allocate the time as follows:

| Jobcode | Hours | Regular | Overtime |
| :-----: | :---: | :-----: | :------: |
| A | 25 | 25 | 0 |
| B | 25 | 15 | 10 |
| C | 10 | 0 | 10 |

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/reports/payroll_by_jobcode</api>

