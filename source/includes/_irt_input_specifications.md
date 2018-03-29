## IRT Input Specifications

Each input specification contains three mandatory fields:

"ident" - unique identifier for the input value

"label" - short description of the input value, to be displayed to the user

"data_type" - the input value's type. Currently, the following are supported:

"int"
"float"
"string"
"datetime"
"selection"

Each definition may also contain an optional validation rules field:

"validation_rules"

---
### "int" Data Type

Indicates that the required value must be an integer

#### Validation Rules

The following validation rules may be specified for integers:

* "min" : `<min-value>`
* "max" : `<max-value>`
* "step" : `<step-value>`
* "options" : `[<int1>, <int2>....]` (i.e. the submitted value must be one of the values in the list)

#### Example

{<br/>
   "ident": "voltage",<br/>
   "label": "Battery Voltage",<br/>
   "data_type": "int",<br/>
   "validation_rules": {"min": 3, "max": 7}<br/>
}

The value entered by the user would be submitted to the send_inputs endpoint like this:


{<br/>
    "voltage": 4<br/>
}




---
### "float" Data Type

Indicates that the required value must be a floating point number

#### Validation Rules

The following validation rules may be specified for floats:

* "min" : `<min-value>`
* "max" : `<max-value>`
* "step" : `<step-value>`
* "options" : `[<float1>, <float2>....]` (i.e. the submitted value must be one of the values in the list)

#### Example

{<br/>
   "ident": "voltage",<br/>
   "label": "Battery Voltage",<br/>
   "data_type": "float",<br/>
   "validation_rules": {"min": 3.5, "max": 7.5}<br/>
}

The value entered by the user would be submitted to the send_inputs endpoint like this:

{<br/>
    "voltage": 4.8<br/>
}


---
### "string" Data Type

Indicates that the required value must be a string

#### Validation Rules

The following validation rules may be specified for strings:

* "minlength" : `<min-length-value>`
* "maxlength" : `<max-length-value>`
* "options" : [`<option1>`, `<option2>`....] (i.e. the submitted value must be one of the values in the list)

#### Example

{<br/>
   "ident": "serial",<br/>
   "label": "Serial Number",<br/>
   "data_type": "string",<br/>
   "validation_rules": {"minlength": 10, "maxlength": 15}<br/>
}

The value entered by the user would be submitted to the send_inputs endpoint like this:

{<br/>
    "serial": "MC0211-999002-1"<br/>
}


---
### "datetime" Data Type

Indicates that the required value must be a date/time string

#### Validation Rules

There are no validation rules for date/times. The acceptable formats are `%H:%M:%S`, `%Y-%m-%d` and `%Y-%m-%dT%H:%M:%SZ`

#### Example

{<br/>
   "ident": "refurb_date",<br/>
   "label": "Refurbishment Date",<br/>
   "data_type": "datetime"<br/>
}

The value entered by the user would be submitted to the send_inputs endpoint like this:

{<br/>
    "refurb_date": "2018-03-30"<br/>
}


---
### "selection" Data Type

Indicates that the required value must be selected from a list. This data type is specified by 2 further fields:

"selection_type": Either "single" (indicating that the user can only select one value from the list) or "multi" (indicating that multiple values can be selected). 

"options": An array of dictionary objects. Each dictionary object has 2 members:

* "value" - the value to be submitted if this option is selected
* "label" - short description of this value, to be displayed to the user

#### Validation Rules

There are no validation rules for selection data types.

#### Example

##### Selection type "single"

{<br/>
   "ident": "replacement_part_type",<br/>
   "label": "Choose one of these replacement PCB's",<br/>
   "data_type": "selection",<br/>
   "selection_type": "single",<br/>
   "options": [<br/>
        {<br/>
            "label": "BBOXX Home 2 PCB (Tiger 7)",<br/>
            "value": 61<br/>
        },<br/>
        {<br/>
            "label": "BBOXX Home 2 PCB (Tiger 2)",<br/>
            "value": 44<br/>
        },<br/>
        {<br/>
            "label": "BBOXX Home 2 PCB (Tiger 6)",<br/>
            "value": 48<br/>
        }<br/>
    ]<br/>
}

The value selected by the user would be submitted to the send_inputs endpoint like this:

{<br/>
    "replacement_part_type": 44<br/>
}

##### Selection type "multi"

{<br/>
   "ident": "u'internal_inspection_result",<br/>
   "label": "Internal Inspection Result",<br/>
   "data_type": "selection",<br/>
   "selection_type": "multi",<br/>
   "options": [<br/>
        {<br/>
            "label": "Home 2 Button Cap",<br/>
            "value": 69<br/>
        },<br/>
        {<br/>
            "label": "Light Pipes",<br/>
            "value": 12<br/>
        },<br/>
        {<br/>
            "label": "Battery PCB Cable",<br/>
            "value": 15<br/>
        },<br/>
        {<br/>
            "label": "BBOXX Home 2 (Tiger) Battery Cable",<br/>
            "value": 62<br/>
        }<br/>
    ]<br/>
}<br/>

The value(s) selected by the user would be submitted to the send_inputs endpoint like this:

{<br/>
    "internal_inspection_result": [12, 62]<br/>
}

