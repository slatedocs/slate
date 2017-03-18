# Schema

This is the reference for the keyword **schema**. Also covered are the
definitions and uses of Inkling types, including type constraints.  These are used in schema declarations.

### What is it?

In Inkling a **schema** describes a named record and its contained fields. Each field in a schema has a name and a type. A field may also have a type constraint that constrains the values that the datum described by this field will take.

### Why do I use it?

Schemas describe the structure of data in Inkling  streams, such as the
predefined `input` and `output` streams. In addition, many Inkling statements (for
example `concept` and `curriculum`) use schema references to describe the data that flows in and out of the construct.

### How do I use it?

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

Select the Inkling tab to show a sample schema declaration and an example of its use.
Note that a schema reference can be anonymous. That means a list of name, type
pairs can appear where a schema name could appear.
‍
## Schema Rules

* Inkling statements can reference schemas by name. Above, `MyConcept` uses `MySchema` as its `predicts` schema.
* Statements can use anonymous schemas. That means that a list of fields appears where a schema name could appear. Above, after `follows`, the predefined stream `input` has an anonymous schema with one field. This is useful in cases where you will only need that information once. In general, anywhere a schema name can appear, an anonymous schema can appear.
* The set of types supported with schema fields consists of the set of Inkling
* primitive types and the set of Inkling structured types. These sets are
* specified in the [Inkling Types][3] section.
* A schema field that has a primitive type can also have a type constraint that
* constrains the set of potential values for that field. Examples and syntax of
* type constraints are included in this chapter.

## Schema Declaration Syntax

```plaintext
schemaStatement ::=
  schema <schemaName>
    fieldDeclarationList
  end

fieldDeclarationList ::=
   fieldDeclaration 
   [',' fieldDeclaration  ]*

fieldDeclaration  ::=  
  scalarDeclaration   
  | 
  structureDeclaration 

scalarDeclaration  ::=   
  concreteType rangeExpression?  
    <name> [ '[' arraySizeLiteral ']' ]* 

structureDeclaration ::= 
  structure_type structure_init 
    <name> [ '[' arraySizeLiteral ']' ]*

structure_type ::= 
  Luminance | Matrix

structure_init:= 
  '(' 
      luminance_init 
   | 
      matrix_init 
  ')'

luminance_init ::=  
  integerLiteral ',' integerLiteral 

matrix_init ::= 
  '(' concreteType 
      [ ',' concretetype ]* 
   ')' 

scalarDeclaration ::=
  primitiveType typeConstraint?
    <name> [ '[' arraySizeLiteral ']' ]*
```

Select the Syntax tab to view the schema declaration syntax.

In the syntax you will see references to Inkling primitive types and structure types
(Luminance, Matrix). These are discussed in in the Inkling Types section. 

‍
## Schema Reference Syntax

```plaintext
schemaReference ::=
  '(' <name> ')'                  # named reference
  | 
  '(' <fieldDeclarationList> ')'  # anonymous reference
```

Select the Syntax tab to view the schema reference syntax.

A named schema is referenced by its name. An anonymous schema is referenced by its list of fields.

## Schema Example

```inkling
schema MNIST_training_data_schema
  UInt8 label,
  Luminance(28, 28) image
end
```

Select the Inkling tab to show a schema that has a field with a primitive type and a field with a structured type.

#inkling_types
## Inkling Types

###### Primitive Types

```plaintext
primitiveType ::=
  Double | Float64 | Float32 | Int8 | Int16 | Int32 |
  Int64 | UInt8 | UInt16 | UInt32  | UInt64 | Bool | String
```

Select the Syntax tab to show the Inkling set of primitive types which are used in schema declarations. The
integer suffix indicates the size in bits of the type. Integer types beginning
with 'U' are unsigned. 

###### Structured Types

```plaintext
structure_type ::= 
  Luminance | Matrix
```

Inkling currently supports the types Matrix and Luminance. (This list will be
expanded.)

See the schema declaration syntax for the complete syntax of structure declaration.

‍
###### Constrained Types

```inkling
  # Example: Range expression

  schema Schema1
    Int8 {0:3:10} field   # start:step:stop (all are numeric literals)
  end
 
 # Curly braces delineate the range expression.
 # The values in this range are: (0, 3, 6, 9).
 # Note that the specification of 10 as the stop does not mean
 # 10 must be in the range (because it is a limit, not 
 # necessarily an endpoint).
```

Constrained types are supported in schemas and also in [lessons][1]. They are constrained by means of a special type of expression called a range expression.

A range expression has the effect of constraining the values of the type to values defined by the range expression. In a schema this constrains the values in the field. In lessons this constrains the values of the placeholder being configured. In both cases the syntax is the same.

Select the Inkling tab to see an example of a constrained type in a schema definition. 

### Constrained Type Syntax

```plaintext
constrainedType ::=
primitiveType
'{'
  start ':' [ step':']? stop      # A 'colon range'. Specifies 'step' 
  |
  start '.' '.' stop ':' numSteps # A 'dot range'. Specifies 'numsteps'.
'}'
```

Select the Syntax tab to view the constrained type syntax.

Note that start, stop, step, numSteps are all numeric literals.

‍

###### Range Expression Rules

There are three forms of range expressions which Inkling supports. 
Select the Inkling tab to see an example of each type.

```inkling
# Example: Value list range expression
schema Schema2
  UInt8  {0,1,2,3,4}   num, # a set of UInt8 values
  String {"a", "bc"}   cat  # a set of Strings
end
```

* **Value list range expression**

A value list range expression is simply a list of values.
These range expressions specify sets of values in 
which each value is explicitly listed.

```inkling
# Example: Range expression, colon range type
schema Schema3
  Int64  { 0:5:100 }   x,   # start:step:stop, step= 5,0..100
  Int64  { 0:100 }     y    # start:stop, step= 1, 0..100
end
```

* **Colon range expression**

Colon range expressions specify values for the start, 
the step, and the stop. 

* If the step value is missing, 1 is the default. 
* Step can be  a floating point number.
* The step size can be negative only if stop < start.

```inkling
# Example: Range expression, dot range type
schema Schema4
  Int64  { 0..100:25 } z,   # start:stop, numsteps=25
  Float32 { 0..2:5}    a    # yields (0, .5., 1.0, 1.5, 2.0)
end
```

* **Dot range expression**

Dot range expressions specify values for start, stop, and number of steps. 

* The number of steps (numSteps) must be a positive integer.

* **Numeric Range Expression Start Point**

The start point of a numeric range is inclusive (it is included in the values of the range) and fixed. 
The range start point is exact (to the maximum extent possible if the range expression type is floating point). 

* **Numeric Range Expression End Point**

```inkling
 # Valid and Invalid Range Expressions.

 Int64  { 0:4:1 }  field1,  # INVALID. step size > range.
 Int64  { 0..1:4 } field2,  # INVALID. Values are floating point not integer.
 Float32{-1..1:10 } field3, # VALID.   Negative bounds allowed.
 Int8 {0:-4:-100} field4,   # VALID.   stop  < start is valid if step is negative.
 UInt32 {-10:10}  field4    # INVALID. Unsigned integer range contains signed values.
```

The end point specified in the range expression may or may not be included in the values of the range. 
The range end is a limit. That means that if applying the step results in landing exactly on the end point, then the end point is part of the range. Otherwise the highest value landed on that is less than the end point is the final value in the range.

Select the Inkling tab to view some examples of valid and invalid ranges.

‍

[1]: #lesson
[3]: #inkling_types
