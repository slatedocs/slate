# Entity Attributes
As discussed in the previous section, entity attributes as a data model represent the 
"columns" in a spreadsheet. An entity attribute can be specific to a given list, or it 
can be global. List-specific entity attributes appear as a column whenever that 
list is being viewed while global entity attributes are displayed on all lists.

Let us consider two examples:

1. Assume you have a list called "Top Referrers", and a new list-specific entity 
attribute (column) called "Number of Referrals" is added to this list. In this case, 
the "Number of Referrals" column will only be visible on the "Top Referrers" list. 

2. Now assume you have three lists of people, "Top Referrers", "Friends in Media", 
"BD Leads", and a person X exists on all three lists. If you want to track where all the 
people in these 3 lists live, you might an entity attribute called "Location". 
It makes sense to make this entity attribute global - in which case it will be shared 
across all three lists. Hence, if person X is a top referrer and lives in San 
Francisco, CA, that information will automatically appear on the "Friends in Media" 
list as well.

By default, Affinity provides all teams with a few default global entity attributes: 
For people, the global entity attributes include Location, Job Titles, and Industries.
For organizations, the global entity attributes include Stage, Industry, Location, and 
more.

## The entity attribute resource
Each entity attribute object has a unique `id`. It also has a `name`, which determines the name of the entity attribute,
and `allows_multiple`, which determines whether multiple values can be added to a single cell for that entity attribute.

Affinity is extremely flexible and customizable, and a lot of that power comes from our ability to support many different
value types for entity attributes. Numbers, dates, and locations are all examples of value types, and you can search, 
sort, or filter all of them.

Attribute | Type | Description
--------- | ------- | -----------
id | integer | The unique identifier of the entity attribute object.
name | string | The name of the entity attribute.
allows_multiple | boolean | This determines whether multiple values can be added to a single cell for the entity attribute.
dropdown_options | object[] | Affinity supports pre-entered dropdown options for entity attributes of the "Ranked Dropdown" value_type. The array is empty unless there are valid dropdown options for the entity attribute of the "Ranked Dropdown" value type.  
value_type | integer | This field describes what values can be associated with the entity attribute. This can be one of many values, as described in the table below.

### Entity Attribute Value Types

All the Types listed below can be referred through looking at the Affinity web app as well.

**Note:**

The API currently only supports fetching entity attribute data for entity value creation. 
It does not support updating, deleting, or creating entity attributes. Modifying or 
creating an entity attribute must be done through the web product.

For accessing person global entity attributes, see the [Person Entity Attributes](#get-global-entity-attributes) endpoint.
For accessing company global entity attributes, see the [Company Entity Attributes](#get-global-entity-attributes33) endpoint.
For accessing list specific entity attributes on a list, see the [Specific List](#get-a-specific-list) endpoint.


Value | Type | Description
--------- | ------- | -----------
0 | Person | This type enables you to add person objects as a value. Eg: External Source, Owner, Friends
1 | Organization | This type enables you to add organization objects as a value. Eg: Place of work, Co-Investors
2 | Dropdown | This type allows you to add a text option into a single cell. This is best used when you want to store information that is unique to a person or organization. Eg: Interests, Stage, Industry
3 | Number | This type enables you to add number as a value. Eg: Deal Size, Check Size, Revenue
4 | Date | This type enables you to add date as a value. Eg: Date of Event, Birthday
5 | Location | This type enables you to add a smart Google Maps location as a value. Eg: Address
6 | Text | This type enables you to add a long text block as a value. Eg: Summary
7 | Ranked Dropdown | This type allows you to add values in a particular order as well as assign colors to them. This is the equivalent of a pick list. Eg: Status, Priority, Ranking
