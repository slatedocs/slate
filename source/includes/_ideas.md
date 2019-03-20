# Ideas APIs

## List Comments

Returns a list of all comments based on a given parameter.

```APIs
GET https://dev.zoomsymbols.com/api/ideas/listComments
```

> Parameters

```
id/query/parent/commentId: list_base
```

> Response

```json
{
  result: "awaiting..."
}
```

## Add Comment

Adds a comment.

```APIs
POST https://dev.zoomsymbols.com/api/ideas/addComment
```

> Parameters

```json
{
	"id": comment_id,
	"comment": "message"
}
```

> Response

```json
{
    "result": [
        {
            "add_user_comment": "..."
        }
    ]
}
```

## 
