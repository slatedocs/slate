## Appending Data

Appending data to an existing Dataset is not much different from uploading the initial data; both use a "Batch" resource which represents the process of importing the data from the source into the dataset. Once you have created a Source for your data, POST its URL to datasets/{id}/batches/ to start the import process. That process may take some time, depending on the size of the dataset. The returned Location is the URI of the new Batch; GET the batches catalog and look up the Batch URI in the catalog's index and inspect its status attribute until it moves from "analyzing" to "appended". User interfaces may choose here to show a progress meter or some other widget.

During the "analyzing" stage, the Crunch system imports the data into a temporary table, and matches its variables with any existing variables. During the "importing" stage, the new rows will move to the target Dataset, and once "appended", the new rows will be included in all queries against that Dataset.

### Adding a subsequent Source

Once you have created a Dataset, you can upload new files and append rows to the same Dataset as often as you like. If the structure of each file is the same as that of the first uploaded file, Crunch should automatically pass your new rows through exactly the same process as the old rows. If there are any derived variables in your Dataset, new data will be derived in the new rows following the same rules as the old data. You can follow the progress as above via the batch's status attribute.

Let's look at an example: you had uploaded an initial CSV of 3 columns, A, B and C. Then:

 * The Crunch system automatically converted column A from the few strings that were found in it to a Categorical type.
 * You derived a new column D that consisted of B * C.

Then you decide to upload another CSV of new rows. What will happen?

When you POST to create the second Batch, the service will: 1) match up the new A with the old A and cast the new strings to existing categories by name, and 2) fill column D for you with B * C for each new row.

However, from time to time, the new source has significant differences: a new variable, a renamed variable, and other changes. When you attach the first Source to a Dataset, there is nothing with which to conflict. But a subsequent POST to batches/ may result in a conflict if the new source cannot be confidently reconciled with the existing data. Even though you get a 201 Created response for the new batch resource, it will have a status of "conflict".

### Reporting and Resolving Conflicts

When you attach a Source to an existing Dataset, the system attempts to match up the new data with the old. If the source's schema can be automatically aligned with the target Dataset, the new rows from the Batch are appended. When things go wrong, however, the Batch can be inspected to see what conflicted with the target (or vice-versa, in some cases!).

GET the new Batch:

```http
    GET /api/datasets/{dataset_id}/batches/{batch_id}/ HTTP/1.1
    ...
    --------
    200 OK
    Content-Type: application/shoji
    
    {
        "element": "shoji:entity",
        ...
        "body": {
            ...,
            "conflicts": {
              "cdbd11/": {
                "metadata": {...}
                "conflicts": [{
                  "message": "Categories do not match",
                  "resolution": "Union of categories will be used."
                }]
              }
            }
        }
    }
```

If any variable conflicts, it will possess one or more "conflicts" members. For example, if the new variable "cdbd11" had extra categories or was missing some categories compared to the existing variable "cdbd11", the Batch resource would contain the above message and resolution. Variables which have no conflicts will still report their metadata but have `"conflicts": []`.

The Crunch system will have done its best to resolve such conflicts for you. When it cannot, each Conflict object will likely only contain a "message" member. If it has resolved the conflict, it will add a "resolution" member.

### Streaming rows

Existing datasets are best sent to Crunch as a single Source, or a handful of subsequent Sources if gathered monthly or on some other schedule. Sometimes however you want to "stream" data to Crunch as it is being gathered, even one row at a time, rather than in a single post-processing phase. You do *not* want to make each row its own batch (it's simply not worth the overhead). Instead, you should make a Stream and send rows to it, then periodically create a Source and Batch from it.

#### Send rows to a stream

To send one or more rows to a dataset stream, simply POST one or more lines of line-delimited json to the dataset's `stream` endpoint:

```json
{"var_id_1": 1, "var_id_2": "a"}
```

The variable ids must correspond to existing variables in the dataset, and the data must match the target variable types, so that we can process the row as quickly as possible. We want no casting or other guesswork slowing us down here. Among other things, this means that categorical values must be represented as Crunch's assigned category ids, not names or numeric values.

Note that this format allows you to send more than one row at a time if you prefer. For example, your data collection system may already post-process row data in, say, 5 minute increments. The more rows you can send together, the less overhead spent processing each one and the more you can send in a given time.

As when creating a new source, don't worry about sending values for derived variables; Crunch will fill these out for you for each row using the data you send.

#### Append the new rows to the dataset

The above added new rows to the Stream resource so that you can be confident that your data is completely safe with Crunch. To append those rows to the dataset requires another step. You could stream rows and then, once they are all assembled, append them all as a single Source to the dataset. However, if you're streaming rows at intervals it's likely you want to append them to the dataset at intervals, too. But doing so one row at a time is usually counter-productive; it slows the rate at which you can send rows, balloons metadata, and interrupts users who are analyzing the data.

Instead, you control how often you want the streamed rows to be appended to the dataset. POST to `datasets/{id}/batches/` and provide the "stream" member containing any extra metadata the new Source should possess:

```json
{
    "stream": {
        "name": "My streamed rows",
        "description": "Yet Another batch from the stream",
        "type": "ldsjon"
    }
}
```
