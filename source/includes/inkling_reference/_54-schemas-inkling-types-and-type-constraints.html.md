## Schemas, Inkling Types, and Type Constraints

Reference for the keyword **schema**. Also definitions and discussion of Inkling types and type constraints (which are both used in schema declarations).

### What is it?

**schema** (the keyword) describes a named record and its contained fields. Each field in a schema has a name and a type. A field may also have a type constraint that constrains the values that the datum described by this field will take.

### Why do I use it?

Schemas describe the structure of data in Inkling  streams, such as the predefined input and output streams. In addition many inkling statements (for example **concept** and **curriculum**) use schema references to describe the data that flows in and out of the construct.

### How do I use it?

A sample schema declaration and use:

```inkling
schema MySchema                   # declare
   UInt8  field1,
   UInt32 field2
end

concept MyConcept
  is classifier
    predicts (MySchema)           # use
    follows input(UInt64 i)       # anonymous
    feeds output
end
```
‍
###### -Schema Rules

* Inkling statements can reference schemas by name. Above, _MyConcept_ uses _MySchema_ as its **predicts** schema.
* Statements can use anonymous schemas. That means that a list of fields appears where a schema name could appear. Above, after **follows**, the predefined stream input has an anonymous schema with one field. This is useful in cases where you will only need that information once. In general, anywhere a schema name can appear, an anonymous schema can appear.
* The set of types supported with schema fields consists of the set of Inkling primitive types and the set of Inkling structured types. These sets are listed below.
* A schema field that has a primitive type can also have a type constraint that constrains the set of potential values for that field. Examples and syntax of type constraints are given below.

### Schema Declaration Syntax

> schemaStmt :=

```c
schema <name>
    fieldDclnList
end
```

> fieldDclnList      :=

```c
fieldDcln [',' fieldDcln  ]*
```

> fieldDcln          :=

```c
scalarDcln                          |
  structureDcln // see structured types
```

> scalarDcln         :=

```c
  primitiveType
  typeConstraint?
  <name>
  [ '[' arraySizeLiteral ']' ]*
```
‍
### schema reference syntax

A named schema is referenced by its name. An anonymous schema is referenced by its list of fields.

>  schemaRef :=

```c
    '(' <name> ')'   // named schema ref
  |
    '(' <fieldDclnList>  ')'  // anonymous schema ref
```

###### -Inkling Primitive Types

Inkling has a set of primitive types which are used in schema declarations. The integer suffix indicates the size in bits of the type.

> primitiveType :=

```c
Double | Float64 | Float32 | Int8 | Int16 | Int32 |
Int64 | UInt8 | UInt16 | UInt32  | UInt64 | Bool | String
```

###### -Inkling Structured types

Inkling supports the types Matrix and Luminance (more to come).

> structureDcln      :=

```c
  ( Luminance | Matrix )
    structureInit
    <name>
```


> structureInit      :=

```c
'('

  luminanceInit | matrixInit

')'
```

> luminanceInit      :=

```c
integerLiteral  ',' integerLiteral

 matrixInit         :=
 '(' concreteType
  [ ',' concretetype ]*
 ')'

',' integerLiteral [ ',' integerLiteral]*
```

### Schema Example

This example shows a schema that has a field with a primitive type and a field with a structured type.

```inkling
schema MNIST_training_data_schema
   UInt8 label,
   Luminance(28, 28) image
end
```
‍
###### -Constrained Type

Constrained types are supported in schemas and also in [lessons][1]. They are constrained by means of a special type of expression called a range expression.

A range expression has the effect of constraining the values of the type to values defined by the range expression. In a schema this constrains the values in the field. In lessons this constrains the values of the placeholder being configured. In both cases the syntax is the same.

> Here are some examples of this syntax in a schema definition. Curly braces delineate the range expression.

```inkling
schema MyOutput
    UInt8  {0,1,2,3,4}   label,    # a list of UInt8 values
    String {"a", "bc"}   category, # a list of Strings
    Int64  { 0:5:100 }   x,        # start:step:stop, step= 5,0..100     Int64  { 0:100 }     y,        # start:stop, step= 1, 0..100         Int64  { 0..100:25 } z,        # start:stop, numsteps=25, step= 4, 0..100
    Float32 { 0..2:5}    a         # gives (0, .5., 1.0, 1.5, 2.0)
end
```
‍

###### -constrained type syntax

> constrainedType :=

```c
numericType
  '{'
    start ':' [ step':']? stop // 1:2:10.   Called a 'colon range'. Specifies 'step' (default=1).
    |
    start '.' '.' stop ':' numSteps //   1..10:5  Called a 'dot range'. Specifies 'numsteps'.

  '}'
```

> numericType :=

```c
Double | Float64 | Float32 | Int8 | Int16 | Int32 |  Int64 | UInt8 | UInt16 | UInt32  | UInt64
```

###### -constrained type rules

###  For numeric ranges:

* For colon range, step can be  a floating point number.
* For colon range, the step size can be negative only if stop < start.
* For dot range, number of steps (numSteps) is a positive integer.

### Schema Examples:

* **Int64  { 0:4:1 }** is invalid. The step size is larger than the range.
* **Int64  { 0..1:4 }** is invalid. Values generated are floating point not integer.
* **Float32{-1..1:10 }** is valid. Negative bounds allowed.
* **Int8 {0:-4:-100}** is valid. stop  < start is valid if and only if step is negative.
* **UInt32 {-10:10}** is invalid. Unsigned integer range contains signed values.

For numeric ranges the start point is inclusive (it is included in the values of the range) and fixed. The end point may or may not be included in the values of the range. If you land on it exactly it is in the range. If you don't land on it exactly it is not in the range.

For example:

> Int8 { 0:3:10} gives you (0, 3, 6, 9).

Note that the specification of 10 as the stop is not an error (because it is a limit, not necessarily an endpoint).

The range stop must be reachable from the range start by applying the step. (The range must be bounded.) The step is optional. If it is not specified the default value is 1. The step can be negative.

The range start is exact (to the maximum extent possible if the range expression type is floating point). The range end is a limit. That means that if applying the step results in landing exactly on the end point, then the end point is part of the range. Otherwise the highest value landed on that is less than the end point is the final value in the range.

‍

[1]: https://bonsai.quip.com/WzFXANdJfJvl
