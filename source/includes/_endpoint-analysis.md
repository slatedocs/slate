## Saving analyses

```json
{
    "query": {
        "dimensions" : [],
        "measures": {}
    },
    "query_environment": {
        "filter": [
            {"filter": "<url>"},
            {"function": "expression", "args": [], "name": "(Optional)"}
        ],
        "weight": "url"
    },
    "display_settings": {
        "decimalPlaces": {
            "value": 0
        },
        "percentageDirection": {
            "value": "colPct"
        },
        "vizType": {
            "value": "table"
        },
        "countsOrPercents": {
            "value": "percent"
        },
        "uiView": {
        	"value": "expanded"
	    }
    }
}
```

> Analysis queries are described in detail in the [feature guide](#multidimensional-analysis). [Filters](#filters) may contain a mix of stored filters or expressions. Expressions may contain an optional `name` which may be used to label results.


An analysis -- a table or graph with some specific combination of variables defining measures, rows, columns, and tabs; settings such as percentage direction and decimal places -- can be saved to a _deck_ which can then be exported, or the analysis can be reloaded in whole in the application or even exported as a standalone embeddable result.

An analysis is defined by a _query_, _query environment_, and _display settings_. To save an analysis, `POST` these to a deck (each user of each dataset has their own "main deck").

Display settings can be anything a client may need to reproduce the view of the data returned from the query. The settings the Crunch web client uses are shown here, but other clients are free to store other attributes as they see fit. Display settings should be objects with a `value` member.