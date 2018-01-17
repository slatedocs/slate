## profileConfiguration object

profileConfiguration objects have the following attributes:

####id

####profile_option

integer identifying the system profile item for which this is the configuration; such profile items may be used at most once per profile type

####profile_type

####page

####label

####type

####read_authorization

####write_authorization

####constraint_list

Only used for some types; format varies by type

####form_name

Internally used string unique to each profile_option

### profileConfiguration.list

<script>tryit('profileConfiguration.list')</script> 

Returns information about profile configuration. Uses select criteria.

Parameters:

####select

An object specifying selection criteria for this request. The available criteria include:

####profile_type

The profileType identifier for which to return profile configuration

####profile_option

The profile option for which to return configurations

####page

The page within the profile_type for which to return configurations

####form_name

A form_name string or array of such strings for which to return configurations

The response results `profile_configuration` attribute will be an array of profileConfiguration objects.

