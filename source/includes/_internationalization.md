## Internationalization

```python
    url = "https://smartapi.bboxx.co.uk/v1/repairs/000000000000/current_state"
    headers = {'Content-Type': 'application/json', 'Accept-Language': 'fr', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    print r.json()
    >>> {
            "status": "success",
            "message": "Repair found",
            "data": {
                "description": "Le gabarit de test indique que cette unité a une carte de circuit imprimé défectueuse. Remplacer le PCB. Cliquez sur le bouton ci-dessous lorsque cela a été fait",
                "events": [],
                "ident": "replace_pcb",
                "inputs": [
                    {
                        "data_type": "selection",
                        "ident": "replacement_part_type",
                        "label": "Choisissez l'un de ces PCB de remplacement",
                        "options": [
                            {
                                "label": "BBOXX Home 2 PCB (Tiger 7)",
                                "value": 61
                            },
                            {
                                "label": "BBOXX Home 2 PCB (Tiger 2)",
                                "value": 44
                            },
                            {
                                "label": "BBOXX Home 2 PCB (Tiger 6)",
                                "value": 48
                            }
                        ],
                        "selection_type": "single"}],
                "name": "Remplacer le PCB"
            },
    }
```

Some parts of SMART Solar now support multiple languages. The API client can specify its preferred language using the [Accept-Language request HTTP header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Language). Currently the only languages supported are English (language code 'en') and French (language code 'fr').

The default language is English, used when the Accept-Language header is omitted. The example on the right demonstrates the use of the Accept-Language header when French is the desired response language:

