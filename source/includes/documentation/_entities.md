## Entities

Entity provide structured information which is relevant to a publisher. An entity can be referred in relevant stories.

The representation of linked entities on the front end is contextual to the purpose for which it is referred in stories.
Example of entity is a person (referred to as ‘entity type’) which has the structure such as name, avatar, email address, social handle, bio, company associated with it.

Entity types can only be created by the Quintype team, based on a publisher's requirement.
Entity type can contain text, numerics, image, or another entity.

Publishers can add values (referred to as entities) to the entity type by using the ‘Entity Manager’ and these values can be referred to in stories. The Entity manager can also be used to modify existing entities.

There are three endpoints to access entities:

### 1. Getting all the entities

Use the [GET ENTITIES API](/swagger#/entity/get_api_v1_entities) to get all the entities created.

### 2. Getting particular entity details.

Use the [GET ENTITY API](/swagger#/entity/get_api_v1_entities__id_) with the entity-id.

### 3. Getting the nested entities linked to an entity

Use the [GET ENTITY API](/swagger#/entity/get_api_v1_entities__id___subentity__) with the root entity-id followed by the nested-entity key.
