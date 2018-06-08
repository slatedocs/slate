# Filters

## Filters

```shell
# Where
curl "...?filter[where][type]=invoice"
# or
curl "...?filter[where][type][inq]=invoice"

# Include
curl "...?filter[include]=payments"
# or
curl "...?filter[include][tax]=taxRate"

# Fields
curl "...?filter[fields][type]=true"

# Limit
curl "...?filter[limit]=5"

# Order
curl "...?filter[order][date]=ASC"

# Skip
curl "...?filter[skip]=5"

# Deleted
curl "...?filter[deleted]=true"
```

```javascript
// Where
var queryParams = {
  filter: {
    where: {
      type: "invoice"
    }
  }
}
// or
var queryParams = {
  filter: {
    where: {
      type: {
        inq: [
          "invoice",
          "advance"
        ]
      }
    }
  }
}

// Include
var queryParams = {
  filter: {
    include: 'payments'
  }
}
// or
var queryParams = {
  filter: {
    include: {
      tax: 'taxRate'
    }
  }
}

// Fields
var queryParams = {
  filter: {
    fields: {
      type: true
    }
  }
}

// Limit
var queryParams = {
  filter: {
    limit: 5
  }
}

// Order
var queryParams = {
  filter: {
    order: {
      date: 'ASC'
    }
  }
}

// Skip
var queryParams = {
  filter: {
    skip: 5
  }
}

// Skip
var queryParams = {
  filter: {
    deleted: true
  }
}
```
Space Invoices API uses a filtering mechanism to control how data is queried.

|      |     |
| ---: | --- |
| where | Where query filter. _Accepts operators, see [Where operators](#where-operators) section for details._ |
| include | Used to include related models. |
| fields | Include or exclude certain fields. |
| limit | Limit amount of data returned. |
| order | Order results by property. |
| skip | Number of results to skip. |
| deleted | Also return deleted records. _Only available on models that implement soft delete._ |

## Where operators

Where operations work in a similar way as querying a database, there operations can be controleh with the following.

```shell
# Equal
curl "...?filter[where][type]=invoice"

# And / Or
curl "...?filter[where][<and|or>][0]=condition1&?filter[where][<and|or>]condition2"

# GT / GTE
curl "...?filter[where][date][<gt|get>]=2018-04-01T18:30:00.000Z"

# LT / LTE
curl "...?filter[where][date][<lt|lte>]=2018-04-01T18:30:00.000Z"

# Between
curl "...?filter[where][date][between][0]=2018-04-01T18:30:00.000Z&filter[where][date][between][1]=2018-04-01T18:30:00.000Z"

# INQ / NIN
curl "...?filter[where][type][<inq|nin>]=invoice&filter[where][type][<inq|nin>]=estimate"

# Near
curl "...?filter[where][coordinates][near]=153.536,-28.1"
# or
curl "...?filter[where][coordinates][near]=153.536,-28.1&filter[where][coordinates][maxDistance]=5&filter[where][coordinates][unit]=meters"

# NEQ
curl "...?filter[where][draft][neq]=false"

# LIKE / NLIKE / Options
curl "...?filter[where][number][like]=2018.*"
# or
curl "...?filter[where][number][like]=2018.*&filter[where][number][options]=i"

# Regexp
curl "...?filter[where][number][regexp]=^2018"
```
```javascript
// Equal
var queryParams = {
  filter: {
    where: {
      type: 'invoice'
    }
  }
}

// And | Or - Instead of and you can also use or
var queryParams = {
  filter: {
    where: {
      and: [{
          type: 'invoice'
        }, {
          draft: false
        }
      ]
    }
  }
}
// GT / GTE
var queryParams = {
  filter: {
    where: {
      date: {
        gt: '2018-04-01T18:30:00.000Z'
      }
    }
  }
}

// LT / LTE
var queryParams = {
  filter: {
    where: {
      date: {
        lt: '2018-04-01T18:30:00.000Z'
      }
    }
  }
}
// Between
var queryParams = {
  filter: {
    where: {
      date: {
        between: [
          '2017-04-01T18:30:00.000Z',
          '2018-04-01T18:30:00.000Z'
        ]
      }
    }
  }
}
// inq / nin
var queryParams = {
  filter: {
    where: {
      type: {
        inq: [
          "invoice",
          "estimate"
        ]
      }
    }
  }
}
// Near
var queryParams = {
  filter: {
    where: {
      coordinates: {
        near: '153.536,-28.1'
      }
    }
  }
}
//or
var queryParams = {
  filter: {
    where: {
      coordinates: {
        near: '153.536,-28.1',
        maxDistance: 5,
        units: 'meters'
      }
    }
  }
}
// NEQ
var queryParams = {
  filter: {
    where: {
      draft: {
        neq: false
      }
    }
  }
}
// LIKE | NLIKE / options
var queryParams = {
  filter: {
    where: {
      number: {
        like: '2018.*'
      }
    }
  }
}
// or
var queryParams = {
  filter: {
    where: {
      number: {
        like: '2018.*'
        options: i
      }
    }
  }
}
// regExp
var queryParams = {
  filter: {
    where: {
      number: {
        regexp: '2018.*'
      }
    }
  }
}
```
|      |     |
| ---: | --- |
| = | Equivalence. |
| and | Logical AND operator. |
| or | Logical OR operator. |
| gt, gte | Numerical greather than (>); greater than of equal (>=). Valid for numberical and date values. For Geopoint values, the units are in miles by default. |
| lt, lte | Numerical less than (<); less than or equal (<=). Valid only for numerical and date values. For Geopoint values, the units are in miles by default. |
| between | True if the value is between the two specified values: greater than or equal to first value and less than or equal to second value. |
| inq, nin | In / not in an array of values. |
| near | For geolocations, return the closest points, sorted in order of distance. Use with limit to return the n closest points. _`maxDistance` and `unit` can also be passed on same level as `near` to configure the search._ |
| neq | Not equal (!=). |
| like, nlike, options: i | LIKE / NOT LIKE operators for use with regular expressions with the case insensitive flag. |
| regexp | Regular expression. |
