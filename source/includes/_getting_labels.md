# Getting Labels

> [ GET /label_url ]

```shell
  curl 'https://sendle.com/api/orders/f5233746-71d4-4b05-bf63-56f4abaed5f6/labels/a4.pdf' -u sendleAPI:42RRTjYz5Z4hZrm8XY3t4Vxt -JL -o label.pdf
```

Using our [order](#creating-orders), we can download the label by using cURL set to save the target and follow redirects. 

The label URL will redirect you to a private PDF, do not cache this redirect URL as the access permissions expire in 1 minute.

Always use the `label_url` exposed on the order and follow the redirect to the PDF. If you are using cURL you can use the `-O` option to save the label with the remote file name, or `-o <filename>` to specify a filename locally.

This option is only valid once an order has been booked with a courier.

![Label PDF](images/label_pdf.png)

_Shipping Label taken displayed in the browser_

<aside class='success'>If you desire to build a method to book an order AND get the order label, because of the short delay between booking an order and booking with the courier, you will want to investigate options like <strong>long-polling</strong> or setting up a <strong>websocket</strong> to check for labels until they're generated and added to the order.</aside>
