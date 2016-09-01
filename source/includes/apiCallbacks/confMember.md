## Conference Member Event
Bandwidth API sends this message to the application when a conference member has joined / left the conference or when it as muted or put on hold.

### Properties
| Property      | Description                                                                               |
|:--------------|:------------------------------------------------------------------------------------------|
| eventType     | The event type, value is `conference-member.`                                             |
| activeMembers | Number of active members in conference.                                                   |
| conferenceId  | The conference id associated with the event.                                              |
| callId        | The call id of the specific call of the member in conference.                             |
| memberId      | The unique member id of the member in the conference.                                     |
| memberUri     | The full URL of the member resource.                                                      |
| state         | Status of member in conference. Values are `active` or `completed`.                       |
| hold          | Members is on hold in conference and can not hear or speak. Values are `true` or `false`. |
| mute          | Members audio is muted in conference. Values are `true` or `false`.                       |
| time          | Date/time of event. Timestamp follows the ISO8601 format (UTC).                           |

```json
{
    "activeMembers": "integer",
    "callId": "string",
    "conferenceId": "string",
    "eventType": "string",
    "hold": "boolean",
    "memberId": "string",
    "memberUri": "string",
    "mute": "boolean",
    "state": "string",
    "time": "date"
}
```

#### Example: A member has joined the conference

```
POST http://[External server URL]
```

```json
{
    "activeMembers": 1,
    "callId": "{callId}",
    "conferenceId": "{conferenceId}",
    "eventType": "conference-member",
    "hold": false,
    "memberId": "{memberId}",
    "memberUri": "https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId}/members/{memberId}",
    "mute": false,
    "state": "active",
    "time": "2013-07-12T20:53:11.646Z"
}
```
#### Example: A member has left the conference

```
POST http://[External server URL]
```

```json
{
    "activeMembers": 1,
    "callId": "{callId}",
    "conferenceId": "{conferenceId}",
    "eventType": "conference-member",
    "hold": false,
    "memberId": "{memberId}",
    "memberUri": "https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId}/members/{memberId}",
    "mute": false,
    "state": "completed",
    "time": "2013-07-12T20:53:11.646Z"
}
```
#### Example: A member was muted

```
POST http://[External server URL]
```

```json
{
    "activeMembers": 1,
    "callId": "{callId}",
    "conferenceId": "{conferenceId}",
    "eventType": "conference-member",
    "hold": false,
    "memberId": "{memberId}",
    "memberUri": "https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId}/members/{memberId}",
    "mute": true,
    "state": "active",
    "time": "2013-07-12T20:53:11.646Z"
}
```
