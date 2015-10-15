# Getting Labels

> [ GET /label_url ]

```
  curl 'https://sendle.com/api/orders'f5233746-71d4-4b05-bf63-56f4abaed5f6/labels/a4.pdf' -u sendleAPI:42RRTjYz5Z4hZrm8XY3t4Vxt
```

> 200 Response:

```
  <html>
    <body>
      You are being <a href="https://sendle-labels.s3.amazonaws.com/cropped-1D0000030929.pdf?X-Amz-Expires=60&amp;X-Amz-Date=20151014T225737Z&amp;X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIAIWXY45BSRIDQDVUA/20151014/us-east-1/s3/aws4_request&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=29de86aebf55bc2a77d224993dff251a0e3834f68f99e2d38fa7bb4884766753">redirected</a>.
    </body>
  </html>
```

Using our [order](#creating-orders), we can grab the label by curling the label url **or** view the url in the browser adding our `sendle_id` and `api_key` as parameters.

`https://sendle.com/api/orders/f5233746-71d4-4b05-bf63-56f4abaed5f6/labels/a4.pdf?sendle_id=sendleAPI&api_key=42RRTjYz5Z4hZrm8XY3t4Vxt`

This option is only valid once an order has been booked with a courier.

<aside class='notice'>If you desire to build a method to book an order AND get the order label, because of the short delay between booking an order and booking with the courier, you will want to investigate options like long-polling or websockets to check for labels until they're generated.</aside>