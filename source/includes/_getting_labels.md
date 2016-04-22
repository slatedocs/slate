# Getting Labels
## `GET {label_url}`

> [ GET {label_url} ]

```shell
  curl "https://www.sendle.com/api/orders/f5233746-71d4-4b05-bf63-56f4abaed5f6/labels/a4.pdf"
  -u "sendleID:APIKey"
  -o "label.pdf"
  -L
```

> label data within order response

```json
  {
    "labels":[
      {
        "format":"pdf",
        "size":"a4",
        "url":"https://www.sendle.com/api/orders/f5233746-71d4-4b05-bf63-56f4abaed5f6/labels/a4.pdf"
      },
      {
        "format":"pdf",
        "size":"cropped",
        "url":"https://www.sendle.com/api/orders/f5233746-71d4-4b05-bf63-56f4abaed5f6/labels/cropped.pdf"
      }
    ]
  }
```

Sendle currently has two labels to choose from:

- A **cropped** label and
- An **A4-sized** sheet with a single label.

Both labels are formatted as PDFs. Labels are stored within the order hash as an array *(see example on right).* Each label is a hash with a `format`, `size`, and `url`.

Using our [order](#creating-orders) response, we can download the label by using cURL and our preferred label's `url`. The label url will redirect you to a private PDF, do not cache this redirect URL as the access permissions expire after 1 minute.

Because of the redirect, special handling is needed. Adding the `-L` flag will follow the redirect to the label from within Sendle. If you are using cURL you can add the `-O` *(Open)* option to save the label with the remote file name, or `-o <filename>` to specify a file name locally.

This option is only valid once an order has been booked with a courier.

![Label PDF](images/label_pdf.png)

_Example Shipping Label_

<aside class='success'>If you desire to build a method to book an order AND get the order label, because of the short delay between booking an order and booking with the courier, you will want to investigate options like <strong>long-polling</strong> to check for labels until they're generated and added to the order.</aside>
