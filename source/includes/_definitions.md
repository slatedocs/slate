# Definitions

## Kudos

This is an object representing a Kudos message. 
You can send kudos messages with your API Key.
A Kudos message is sent from a user, to one or more users

```javascript
{
  "sender": {
    "kind": "email",
    "value": "sender@example.com"
  },
  "recipients": [
    {
      "kind": "email",
      "value": "receiver@example.com"
    }
  ],
  "message": {
    "body": "You did a good job"
  },
  "level": "good_job",
  "qualities": [
    {
      "kind": "name",
      "value": "Skillful"
    }
  ]
}
```
```shell
{
  "sender": {
    "kind": "email",
    "value": "sender@example.com"
  },
  "recipients": [
    {
      "kind": "email",
      "value": "receiver@example.com"
    }
  ],
  "message": {
    "body": "You did a good job"
  },
  "level": "good_job",
  "qualities": [
    {
      "kind": "name",
      "value": "Skillful"
    }
  ]
}
```

| Attribute | Description | Required | Type |
| ---------- | ----------- | -------- | ---- |
|sender| The person sending the Kudos message  |Yes|[user](#user)|
|recipients| One or more persons or groups receiving the Kudos message |Yes|\[[user](#user)\]|
|message| The contents of the Kudos message|Yes|[message](#message)|
|level|The level of Kudos given by the message. This enumeration should be one of thank_you, good_job, impressive, exceptional or award|Yes|enum|
|qualities|One or more values or characteristics|Yes|\[[quality](#quality)\]|
|badge_name|If the level of Kudos is award, specify the name of the badge to be attached|No|string|
|points|If the level of Kudos is award, specify a custom point value.  Leave points blank to use the points defined by the badge|No|integer|

## Message

Your message can be either simple, or more descriptive of the specific effort and subsequent outcomes.
At the moment, the message is a simple object with one attribute. In the future, 
this object will have additional attributes, like tags, links, cc's, badges, etc. 

```javascript
{
  "body": "You did a good job"
}
```
```shell
{
  "body": "You did a good job"
}
```

| Attributes | Description | Required | Type |
| ---------- | ----------- | -------- | ---- |
|body| The text of the Kudos message  |Yes|string|

## Quality
Qualities represent the values your organization is recognizing. These are the characteristics or 
skills for which your recipient(s) have demonstrated. 

```javascript
{
  "kind": "name",
  "value": "Skillful"
}
```
```shell
{
  "kind": "name",
  "value": "Skillful"
}
```

| Attributes | Description | Required | Type |
| ---------- | ----------- | -------- | ---- |
|kind| At the moment, this enumeration consists of one choice - name |Yes|enum|
|value| The name of the quality to be applied |Yes|string|

## User

```javascript
{
  "kind": "email",
  "value": "receiver@example.com"
}
 or 
{
  "kind": "group_name",
  "value": "Head Office"
}
```
```shell
{
  "kind": "email",
  "value": "receiver@example.com"
}
 or 
{
  "kind": "group_name",
  "value": "Head Office"
}
```
| Attributes | Description | Required | Type |
| ---------- | ----------- | -------- | ---- |
|kind| An enumeration of the type of user named. Your choices include: email, group_name |Yes|enum|
|value| This could be an email, or the name of a group, department or location |Yes|string|
