# Entity Attributes
As discussed in the previous section, entity attributes are the equivalent of "columns" in a spreadsheet.
An entity attribute can be specific to a given list (spreadsheet), in which case it will only ever show up
as a column whenever that list is being viewed. However, an entity attribute can also be global, in which
case it will show up on all lists which allows Affinity to minimize data entry.

Let us consider two examples:

1. We have a list called "Top Referrers". We add an entity attribute (column) called "Number of Referrals" on this list
and make it list-specific. In this case, the "Number of Referrals" column will only be visible whenever you're viewing the "Top Referrers" list. The column will also be visible to any team member you decide to share the list with.

2. We have many lists, "Top Referrers", "Friends in Media", "BD Leads", and say we have some overlap amongst those lists.
Say we want to track where all the people in these 3 lists live, so we add a column called "Location". It only makes sense to make this colum global - in which case it will be shared across the three lists. Hence, if person A is a top referrer and the live in San Francisco, CA, that information will automatically appear when you are looking at the Friends in Media list as well.

By default, Affinity provides all teams with many global entity attributes: Location, Job Titles and Industries for People and Stage, Industry, Location etc. for Organizations.

## The entity attribute resource
Each entity attribute object has a unique `id`. It also has a `name`, which determines the name of the entity attribute,
and `allows_multiple`, which determines whether multiple values can be added to a single cell for that entity attribute.

Affinity is extremely flexible and customizable, and a lot of that power comes from our ability to support many different
value types of entity attributes. An entity attribute can be of type number (a column like "Number of Referrals" would be that type) to of type Location (the default "Location" column has that type).

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

We currently don't support updating, deleting, and creating entity attributes. We only support reading them, so that you can create appropriate entity values.

All the global entity attributes are returned either _______ or _______, and the list-specific entity attributes are returned by ________.


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
