## Datasets
Datasets are the primary containers of statistical data in Crunch. Datasets contain a collection of [variables](#variables), with which analyses can be composed, saved, and exported. These analyses may include filters, which users can define and persist. Users can also share datasets with each other.

Datasets are comprised of one or more batches of data uploaded to Crunch, and additional batches can be appended to datasets. Similarly, variables from other datasets can be joined onto a dataset.

As with other objects in Crunch, references to the set of [dataset entities](#dataset-entity) are exposed in a catalog. This catalog can be organized and ordered.

### Catalog

```http
GET /datasets/ HTTP/1.1
```

```r
```

```python
```
#### GET
`GET /datasets/`

When authenticated, GET returns 200 status with a Shoji Catalog of datasets to which the authenticated user has access. Catalog tuples contain the following keys:

```http
POST /datasets/ HTTP/1.1
```
```r
```

```python
```

#### POST
`POST /datasets/`

POST a JSON object to create a new Dataset; a 201 indicates success, and the returned Location header refers to the new Dataset resource.

The body must contain a "name", and additional parameters "description" and "archived" are allowed. You can also include a Crunch Table in a "table" key, as discussed in the Feature Guide. Sending any other attribute will return a 400 response.

```http
PATCH /datasets/ HTTP/1.1
```

#### PATCH
`PATCH /datasets/`

Use PATCH to edit the "name", "description", or "archived" state of one or more datasets. A successful request returns a 204 response. The attributes changed will be seen by all users with access to this dataset; i.e., names, descriptions, and archived state are not merely attributes of your view of the data but of the datasets themselves.

Authorization is required: you must have "edit" privileges on the dataset(s) being modified, as shown in the "permissions" object in the catalog tuples. If you try to PATCH and are not authorized, you will receive a 403 response and no changes will be made. 

The tuple attributes other than "name", "description", and "archived" cannot be modified here by PATCH. Attempting to modify other attributes, or including new attributes, will return a 400 response. Changing permissions is accomplished by PATCH on the permissions catalog, and changing the owner is a PATCH on the dataset entity. The "owner_display_name" is modifiable, assuming authorization, by PATCH on the associated user entity. Dataset "id" is immutable.

When PATCHing, you may include only the keys in each tuple that are being modified, or you may send the complete tuple. As long as the keys that cannot be modified via PATCH here are not modified, the request will succeed.

Note that, unlike other Shoji Catalog resources, you cannot PATCH to add new datasets, nor can you PATCH a null tuple to delete them. Attempting either will return a 400 response. Creating datasets is allowed only by POST to the catalog, while deleting datasets is accomplished via a DELETE on the dataset entity.


### Entity

#### GET

#### PATCH

#### DELETE

#### Entity attributes