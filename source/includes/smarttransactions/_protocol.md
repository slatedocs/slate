# Protocol

>Request:

```json
{ "0" : { "city" : null,
      "sic" : null,
      "text" : "Starbucks"
    },
  "1" : { "city" : null,
      "sic" : null,
      "text" : "McDonalds"
    },
  "2" : { "city" : null,
      "sic" : null,
      "text" : "empty"
    }
}
```

>Response:

```json
{ "0" : { "logoURL" : "http://res.cloudinary.com/instabank/image/upload/c_scale,w_64/v1402049419/ic_starbucks_pgbkrg.png",
      "name" : "Старбакс"
    },
  "1" : { "logoURL" : "http://res.cloudinary.com/instabank/image/upload/c_scale,w_64/v1402046396/ic_macdon_qgtebj.png",
      "name" : "Макдональдс"
    }
}
```