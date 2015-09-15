# Commands

Currently we have following commands for client application.

- Merge Record
- Query Application Info
- Query Entity Info
- Delete Identity
- Enable Synchronization
- Bulk Enabled Synchronization


## Merge Record
```ruby
#Merged Specified Identities
FariaMq::Command::MergeRecord.new(
    school, 
    model: 'student',
    winner_core_id: 'Student-1', 
    loser_core_id: 'Student-2'
  ).publish!
```

```ruby
#Using Local ID
FariaMq::Command::MergeRecord.new(school, model: 'student' winner_remote_id: '9182736', loser_remote_id: '2812746').publish!

```
Informs the broker to merge specified identities in an identity table. It requires arguments from the model, and the IDs to specify the winner and loser. You can use core ID or the remote ID(the local ID on your application).

## Query Application Info

```ruby
#Querry Application Information
q = FariaMq::Command::QueryApplicationInfo.new(school).query! 
q.success?
q.payload[:applications]

```

```ruby
#Returns
{
  "OA" => { subdomain: 'faria', actual_academic_year: 2015, mq_settings: { enabled: true, mode: "PCUD" } },
  "MB" => { subdomain: 'faria', actual_academic_year: 2014, mq_settings: { enabled: true, mode: "P" } }
}

```

Query Application Info queries information about each application for a specified school. For example, the subdomain of the school on Openapply, the actual academic year on ManageBac.etc. Additionally, the MQ settings have become part of the appication info, providing similar data of QueryMQMode stored with the key value of `:mq_settings`.


## Query Entity Info
```ruby
#Query information with specified core ID
q = FariaMq::Command::QueryEntityInfo.new(school, model: 'student', core_id: 'OA-Student-109').query!
q.success? # => true
q.payload[:mirrors]["MB"] #=> [ { core_id: 'xxxx', url: 'http://faria.managebac.com/user/9186' } ]

```
You can query the information with specified core ID.

The return values is a hash with properties:

- core_id: The core id of the entity on the source application(where the command send from)
- url: The url of the entity on the source application
- mirrors: A hash with mirror applications as key, each value contains an array of info of identitys on the application

```ruby
#A hash with with properties
{
  core_id: "OA-Student-109",
  url: "https://faria.openapply.com/admin/students/109",
  mirrors: {
    "MB" => [{ core_id: 'MB-User-9186', url: 'https://faria.managebac.com/user/9186' }],
    "IS" => [{ core_id: 'OA-Student-109', url: 'https://faria.intersis.com/students/5241'}],
    "OA  => []
  }
}

```

## Delete Identity

```ruby
#Delete Identities from identity table
FariaMq::Command::DeleteIdentity.new(school, core_id: 'Student-281').publish!

```
Informs the broker to delete specified identities in the identity table. It requires additional arguments for the core id of the identity you want to delete.

## Enable Synchronization

```ruby
#Informs broker to start synchronization
FariaMq::Command::EnableSynchronization.new(school, destination: 'SR', model: 'student', identifier: 'Student-281').query!

```
Informs the broker to start to synchronizing the specified identity from the source application to the target application.

It requires arguments:

- model: model of identity
- identifier: core id of the identity you want to sync

## Bulk Enabled Synchronization

```ruby
#Performs a bulk synchronization
FariaMq::Command::BulkEnableSynchronization.new(school, destination: 'SR', model: 'student', identifiers: ['Student-281', 'Student-282']).publish!

```
Informs the broker to bulk synchronize specified identities from the source application to target applications.

It requires arguments:

- model: model of identities
- identifiers: core id of the identities you want to sync