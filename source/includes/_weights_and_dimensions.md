# Weights and Dimensions

> A satchel

```json
{
  "kilogram_weight":"0.4",
  "cubic_metre_volume":"0.001"
}
```

> A shoebox

```json
{
  "kilogram_weight":"1.0",
  "cubic_metre_volume":"0.01"
}
```
> A Carry-on

```json
{
  "kilogram_weight":"5.2",
  "cubic_metre_volume":"0.05"
}
```
> Note that the kilogram_weight (5.2) has bumped the parcel to the carry-on size despite the relatively small cubic_metre_volume.

![Sendle Sizes](sizes.png)

<aside class="notice">On the Dashboard, select a size or use the
<strong><a href="#size-calculator">size
calculator.</a></strong></aside>

### Sendle uses five standard sizes for parcel delivery:

| Size | Weight – Kg (Max) | Volume – m<sup>3</sup> (Max) |
|------|:--------:|:------------:|
**[Satchel](#satchel-specifics)** | 0.5kg | 0.002 |
**Shoebox** | 2kg | 0.008 |
**Briefcase** | 5kg | 0.02 |
**Carry-on** | 10kg | 0.04 |
**Luggage** | 25kg | 0.1 |

Sendle uses weight (**kilogram weight**) and volume (**cubic metre volume**) together to determine the size of your parcel.

Sendle will choose the parcel size that can accommodate the weight and volume of your request. If either unit is over, Sendle will select the next size for your parcel.

- `kilogram_weight`	(**required**) must be a decimal value greater than 0 and less than or equal to the category/max weight allowed (25kg max).

- `cubic_metre_volume` (_optional_) must be a decimal value above zero and less than one. To get value, multiply length x width x depth of parcel in metres.

## Satchel Specifics

> Satchels cannot have delivery_instructions

```json
{
  "receiver": {
    "delivery_instructions": "Give directly to Clark."
  }
}
```

> Returns error message:

```json
{
  "messages":{
    "receiver":[
      "No delivery instructions are allowed when booking at satchel rates - all satchels are 'Authority to Leave'"
    ]
  },
  "error":"unprocessable_entity",
  "error_description":"The data you supplied is invalid. Error messages are in the messages section. Please fix those fields and try again."
}
```

### Requirements:

- Satchels must be packaged in an A4 satchel-pack.

- Order's `delivery_instructions` must be blank.

- `kilogram_weight` is less than or equal to 0.5

- `cubic_metre_voume` is less than or equal to 0.002.

## Size Calculator

![Size Calculator](size_calc.gif)

If you are ever unsure about your parcel size, the **Dashboard Size Calculator** will convert your parcel's length, width, and height measurements together with the weight to display the litre volume and select the correct parcel size.

<aside class="warning">The Sendle API does not use length, width, or depth values.<br>Only use <strong><code>kilogram_weight</code></strong> and <strong><code>cubic_metre_volume</code></strong> for api requests.</aside>
