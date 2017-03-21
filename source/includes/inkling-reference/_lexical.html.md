# Lexical Structure

Reference for the lexical structure of the Inkling language.

### What is it?

The lexical structure of Inkling includes these lexical elements:

* `comment`: specifies comment format.
* `keyword`: the keyword set consists of the words that Inkling reserves for its own use.
* `identifier`: user defined names in Inkling. For example, concept names.
* `literal`: Inkling supports numeric and string literals.
* `operator`: Inkling supports operators such as math operators and grouping operators.


## Comments

* An Inkling comment begins after the character **#** and extends to the end of the line.

```inkling
  # this is a comment
```

## Keywords

Here is the set of keywords in the Inkling language. These words are reserved
for use by Inkling and cannot be used as names in your program. 

**Keywords Table**


               |                |                |                |                
-------------- | -------------- | -------------- | -------------- | -------------- 
action | as | Bool | Byte | concept
configure | constrain | copy | curriculum | data
datastore | Double | easy | end | expect
false | feeds | Float32 | Float64 | follows
format | from | generator | hard | import
in | Int16 | Int32 | Int64 | Int8
into | is | lesson | let | Luminance
Matrix | maximize | medium | minimize | objective
predicts | schema | select | send | simulator
state | stream | String | test | train
true | UInt16 | UInt32 | UInt64 | UInt8
unit | until | using | validate | where
with | yield


## Identifiers

An Inkling identifier (user defined name) must begin with an underscore or
letter, followed by any combination of alphanumeric characters and underscore.

## Literals

Inkling supports numeric literals (floating point and integer) as well as string
literals. 

* **String Literals**

String literals are enclosed in double quotes. 

* **Integer Literals**

Integer literals are a string of digits with an optional sign and no decimal
point.

* **Floating Point Literals**

Floating point literals can be Float32 or Float64 (double). Select the Inkling
tab to see some floating point literals: 

```inkling
 12.0, .5        # Float32 floating point literal
 1e7, 9e0        # Float64 (double) floating point literal
 13.0f7, .3f+2   # Float32 floating point literal
```

## Operators

The operator category includes mathematical, relational, and logical operators as well as
paired grouping operators like `{` and `}`. 

**Operators Table**


            |             |            |            |            |            |           
----------- | ----------- | ---------- | ---------- | ---------- | ---------- | ---------- 
<= | < | == | => | = | >= | > 
- | , | : | != | / | .. | .
( | ) | [ | ] | { | } | ** | *
+ | and | not | or 
