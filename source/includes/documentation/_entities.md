## Entities

Entity is a new feature introduced in the editor to maintain structured information relevant for the publisher and refer them in relevant stories.

The representation of linked entities on the front end is contextual to the purpose for which it is referred in stories.
Example of entity will be Person (referred to as ‘entity type’) which will have the structure not limited to name, avatar, email address, social handle, bio, company associated to it.

Entity types can only be created by the technical team based on the requirement.
Entity type can contain text, numerics, image and another entity.

Publishers can create various values (referred to as entities) for the entity type using the ‘Entity Manager’ and these values can be referred to in stories.
Entity manager can also be used to modify existing entities.

There are three endpoints to access entities:

### 1. Getting all the entities

Use the [GET ENTITIES API](/swagger/#/entity/get_api_v1_entities) to get all the entities created.

### 2. Getting particular entity details.

Use the [GET ENTITY API](/swagger/#/entity/get_api_v1_entities__id_) with the entity-id.

### 3. Getting the nested entities linked to an entity

Use the [GET ENTITY API](/swagger/#/entity/get_api_v1_entities__id___subentity__) with the root entity-id followed by the nested-entity key.
