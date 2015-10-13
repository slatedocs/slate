---
title: LaunchPad API Reference

language_tabs:
  - ruby

toc_footers:

includes:

search: true
---

<h1 id="sso">
  LaunchPad
  <img src="/images/launchpad_landscape.png" alt="" height="50">
</h1>


To learn more about LaunchPad capabilities we offer to integration partners, please select one of the documents below. If you wish to become a single sign-on partner with us, please let us know at [api@faria.co](mailto:api@faria.co).

# LaunchPad Primer

You can integrate your product with the Faria LaunchPad Portal so users only need to sign in once. This document discusses capabilities currently in development and ways to start integrating them, so your product is ready on day one.

## Overview

There are two parts of client-facing capabilities you might be interested about — Forward Authentication and Identity Launchpad.

**Forward Authentication** allows an user with a master Faria ID to sign into the Faria SSO Portal and have the session forwarded onwards to other applications. For example, an user with Faria ID only needs to sign in once and can then access their ManageBac or OpenApply account without signing in separately.

**Identity Launchpad** is a separate feature that embeds a series of quick-access shortcuts in your application. Think of this as a series of quick-dial button. Your application can request the Faria LaunchPad Portal to provide you with a series of identities the current user holds elsewhere. If the user is signed into the Faria LaunchPad Portal, they can initiate Forward Authentication to other applications without leaving your application.

## Conceptual Model and Terminology

The following section discusses data models used internally by, and/or exposed externally from the Faria LaunchPad Portal.
<p>
<img src= '/images/sso-domain-model.png'>
</p>

* **Credential:** With a canonical master e-mail address this represents the Master Identity, which is linked to a Person at all times. Using the Master Identity, an user can sign into the Faria LaunchPad Portal directly, and place forward authentication requests against all linked Client Applications using Identities available to their linked Person.

* **Person:** Represents a discrete person managed by the Faria LaunchPad Portal. Ideally, each natural person is only represented once.

* **Identity:** Stores a personally identifiable value that can be recognized by the Identity Provider. Conventionally this is a value that makes sense only to the client application. It must be unique among identities provided by the same Identity Provider. It is not supposed to hold passwords or authentication tokens.

* **Identity Provider:** An intermediate provider, either Internal or External, that is able to present, manage and verify Identities. It is further enhanced with the Identity Provider Origin, which is currently linked to a Client Application, or in the future linked to other providers like Google or Azure Active Directory.

* **Client Application:** An internal application that supports Forward Authentication via Faria LaunchPad Portal. In addition, Client Applications can acts as origins of Identity Providers.

* **Client Application Token:** Represents access tokens that Client Applications must use to access Faria LaunchPad Portal.

* **Organization:** An optional model representing groups in a human or computer society, for example a School or Corporation. Each Identity is optionally linked with an Organization, because a Person may participate in activities on behalf of different Organizations using different Identities.

* **Organization Group:** Used to represent conglomerates or school groups.

* **Authentication Session:** Stores authentication requests placed by Faria LaunchPad Portal on behalf of People for a given Identity. Note that a Person may not ‘own’ the Identity but still elect to request authentication, so the Authentication Session is separately linked to the Requesting Person and the Intended Identity. It is for each participating client application to decide whether to allow each authentication session.

## Forward Authentication

With **Forward Authentication** an user only needs to sign into the Faria LaunchPad Portal and their authentication session is forwarded onwards to other applications.

There are a few requirements:

1.  Your application must implement the [Forward Authentication API](/sso-forward-authentication-api).
2.  Your application must be registered with the Faria LaunchPad Portal as a Client Application; you must hold at least one active Client Application Token.
3.  You must have already published all identities from your application into the Faria LaunchPad Portal.
4.  To facilitate single sign-on for users who enjoy use of both Faria Systems applications and your applications, entity resolution must also have taken place within the Faria LaunchPad Portal.

A typical authentication session looks like this:

1.  **User** signs into the Faria LaunchPad Portal.
2.  **User** browses a series of eligible Identities they hold with different Identity Providers, including yours.
3.  **User** selects an Identity to authenticate as.
4.  **Faria LaunchPad Portal** generates a Forward Authentication Request and sends the unique identifier back to the User’s browser (HTTP 301).
5.  **User’s Browser** sends the unique identifier of the Forward Authentication Request to your application (using the Forward Authentication API).
6.  **Your Application** considers the request. At this point your application must take exactly one of these actions:

  * Ignore the Authentication Request and send the user somewhere else. The Authentication Request will time out automatically.
  * Accept the Authentication Request and let the user in.
  * Reject the Authentication Request and send the user back to the Faria LaunchPad Portal

For more information on Forward Authentication, please review our documentation on the [Forward Authentication API](/sso-forward-authentication-api) and our [Integration Notes](/sso-integration-notes).

# Client Application API

This document covers the LaunchPad Client Application API. To gain access to the LaunchPad API family and participate in LaunchPad, please contact us at [api@faria.co](mailto:api@faria.co).

## Overview

Integrating the Faria LaunchPad API family allows your application to inter-operate with other applications built for Faria LaunchPad, including but not limited to ManageBac, OpenApply and InterSIS. All applications that participate within the LaunchPad scheme are available to users possessing relevant credentials.

Your application will use the Client Application API primarily to:

1.  Retrieve Authentication Sessions and provide confirmations or denials.
2.  Retrieve all identities relevant to a given person, in order to render an in-app SSO Launchpad.
2.  Publish newly created or updated identities to the SSO Portal, in order to maintain data consistency.

Before continuing, please take time to review the [LaunchPad Primer](/sso-primer).

## Authentication

The LaunchPad Client Application API authenticates using HTTP tokens exclusively. Here is a sample request made to an development endpoint:

```
    $ curl http://ml.dev/api/v1/organizations \
        -H 'Authorization: Token token="d6b8d8500cb687c9283d9c78080705ec"'
```        

All other methods outlined in this document requires authentication.

## Interacting with Organizations

If your client application token is sufficiently authorized, you may be able to query some or all organizations currently participating in LaunchPad.

```
     GET /organizations
     GET /organizations/:id
```

You may assume that only organizations you can view and/or access will be returned in these calls, and that all organizations will be returned at once.

The Organization representation contains the following attributes:

*   `id`: internal identifier (can not be updated).
*   `subdomain`: the subdomain used on SSO portal.
*   `name`: the display name of the organization.

If your Client Application token is sufficiently authenticated, you may be able to update an existing Organization:

```
    PATCH /organizations/:id
```

or create a new Organization:

```
    POST /organizations # must provide name; subdomain must be unique if provided
```

Please see the Integration Notes for an example.

## Interacting with People and Identities

The following methods allows you to interact with people and identities.

### Create new Person entries

```
    POST /organizations/:id/people
```

```ruby
{
  "person":{
   "given_name": "Simon",
   "family_name": "Lin",
   "email": "simon@example.com",
   "avatar_url": "http://www.abc.com/image.jpg"
   "identities_attributes": [
     {
       "provider_id": "dfe45dba-02a7-47a1-b216-02836fe39c04",
       "organization_id": "17c9f976-cf95-48a5-b1c3-11e09c8321e1",
       "value": "Student-123123",
       "status": "loginable", "#loginable or active"
       "title": "Simon Lin",
       "description": "Student"
     },
     {
       "provider_id": "5643c01e-1e8d-4a2e-9af0-991763ad5375",
       "organization_id": "17c9f976-cf95-48a5-b1c3-11e09c8321e1",
       "value": "Student-12751e4c-c97f-4e09-a340-16e503989ee8",
       "status": "active",
       "title": "Simon Lin",
       "description": "Student"
     },
   ]
  }
  }
```

```
  POST /organizations/:organization_id/identities

```  

```ruby
{
 "identity": {
   "provider_id": "5643c01e-1e8d-4a2e-9af0-991763ad5375",
   "organization_id": "17c9f976-cf95-48a5-b1c3-11e09c8321e1",
   "person_id": "477ac262-780c-44bb-b6a0-ad1880e94c27",
   "value": "Staff-o1iu23",
   "status": "loginable",
   "title": "Barbara Hampton",
   "description": "DP Coordinator"
 }
}

```

If your client application token is sufficiently authenticated, you may be able to create Person entries within organizations you have formed or can control.

You may provide the following information:

*   `given_name`
*   `family_name`
*   `email`

None of the information listed above is mandatory, but creating duplicate Person entries within any organization is not recommended.

You may create identities separately, or together with the creation call by passing them under `identities_attributes`. Please see " POST /organizations/:organization_id/identities" or the Integration Notes for an example.

### Update Person entries

```
    PATCH /organizations/:organization_id/people/:person_id
```

You may pass the same payload you pass to `/organizations/:id/people` in order to update Person entries, but you can not delete identities this way.

### Delete Person entries

This feature is currently unavailable.

### Retrieve information relevant to a given person

```
    GET /organizations/:organization_id/people/:person_id
    GET /people/:person_id # if you have sufficient privileges
```

Returns a Person entity, which looks like:

```ruby
    {
        "email": "cortiz@linktype.com",
        "family_name": "Green",
        "given_name": "Theresa",
        "id": "5cf92397-e69c-4029-a4b7-3203360ba44f",
        "identities": [
            {
                "id": "9d50bce0-7e19-45df-9567-4a7465e710be",
                "provider": {
                    "id": "321984ea-e6fe-4746-acdf-b431135df3bb",
                    "origin": {
                        "endpoint": "managebac.com",
                        "id": "c0148089-25c4-47c9-8a6e-f031e00da07b",
                        "name": "ManageBac"
                    },
                    "type": "client_application"
                },
                "status": "loginable",
                "value": "16dc797aa9dabac9ec649dc07dddf210"
            }
        ]
    }
```

### Retrieve all identities relevant to a given person

    GET /people/:person_id/identities

Returns a list of all identities and their providers. You can use this information to render an in-app LaunchPad Springboard.

The response looks like:

```ruby
    [
        {
            "id": "439d8dc0-5dce-43ab-bef5-93f4df7ac21c",
            "provider": {
                "id": "f8f0aa9e-2bf6-473f-bec0-5d850a346600",
                "origin": {
                    "endpoint": "keyb.com",
                    "id": "0de62dbb-0930-4894-9828-199e08c15047",
                    "name": "Keybridge"
                },
                "type": "client_application"
            },
            "status": "loginable",
            "value": "Di7FcQ"
        },
        …
    ]
```


## Interacting with Authentication Sessions

You will be asked by the Faria LaunchPad Portal to evaluate Authentication Sessions thru the Forward Authentication API. As a Client Application, you can only approve and decline those linked to your own client application.

Each Authentication Session is linked to an Identity (requested identity) and a Person (requesting party). Only the Client Application owning the requested identity may respond to the authentication session.

#### Retrieve an Authentication Session

    GET /authentication_sessions/:session_id

You must have corresponding privileges. The Faria SSO Portal will return with the Authentication Session alongside the detailed representation of the requesting person. The response looks like:

```ruby
    {
        "data": null,
        "expires_at": null,
        "id": "78dab300-bb45-447d-8848-e4904acdc8b0",
        "identity": {
            "id": "97c775fc-a7da-451d-b2e5-f7067ea250c5",
            "provider": {
                "id": "c2efd8ee-9918-428f-b410-abd6457ae8db",
                "origin": {
                    "endpoint": "managebac.com",
                    "id": "dc9f0796-bd29-486e-bf93-f279ea59aad8",
                    "name": "ManageBac"
                },
                "type": "client_application"
            },
            "status": "loginable",
            "value": "Tv2FoeVkVLv"
        },
        "person": {
            "family_name": "Stone",
            "given_name": "Doris",
            "id": "ea2c03cb-762c-48c6-801f-3df640f537e2",
            "identities": [
                …
            ]
        },
        "processed_at": null,
        "requested_at": "2014-09-05T16:48:13.414Z",
        "status": "requested"
    }
```

In the future, the `data` field will carry end-user-specific information, like the original IP address where requests occurred.

#### Approve an Authentication Session

    POST /authentication_sessions/:session_id/approve

You should call this method once you have recognized the session and have approved of it, so relevant information is captured by the LaunchPad Portal for future auditing use. You may call this endpoint asynchronously, outside of a Forward Authentication session.

You can emit anything that is relevant to your application under `data`.

#### Decline an Authentication Session

    POST /authentication_sessions/:session_id/decline

You should call this method if something is wrong with the person’s claim. The LaunchPad Portal will be alerted of repeated authentication failures this way. You may call this endpoint asynchronously, outside of a Forward Authentication session.

You can emit anything that is relevant to your application under `data`.

## Requesting Authentication Sessions

You will need to implement this if you wish to build an Identity Launchpad within your application.

    POST /authentication_sessions
    
Besides a valid client application token in your signed request, the following information is required:

*   `requester_identity_id`: the identity reference of the requesting user.
*   `wanted_identity_id`: the identity reference of the desired authentication target.

There are a few preconditions:

1.  The identity referred by `requester_identity_id` (‘Requester Identity’) must be owned by the calling Client Application. In other words, you can only request authentication on behalf of one of your users.
2.  The identity referred by `wanted_identity_id` (‘Requested Identity’) will implicitly reference the target application, and it is up to the target Client Application to determine whether it will grant access. Conventionally, the target Client Application will only recognize identities associated with a person who also holds the Requester Identity.

Generally, you will send this request synchronously after your user has requested authentication from your in-app identity launchpad.

If your request is successfully recognized (but not yet processed), you will receive the representation of the newly created Authentication Session with "context.client_application_url", and you should then redirect the user. The target Client Application, which implements the Forward Authentication API, will handle everything from there.

```ruby
    {
        "context": {
            "client_application_url": "https://target.example.com/handle_forward_authentication?session_id=:session_id"
        },
        "data": null,
        "expires_at": null,
        "id": "78dab300-bb45-447d-8848-e4904acdc8b0",
        "identity": {
            //  …
        },
        "person": {
            "family_name": "Stone",
            "given_name": "Doris",
            "id": "ea2c03cb-762c-48c6-801f-3df640f537e2",
            "identities": [
                //  …
            ]
        },
        "processed_at": null,
        "requested_at": "2014-09-05T16:48:13.414Z",
        "status": "requested"
    }
```

# Forward Authentication API

This document covers an endpoint you must implement and make available to the Faria LaunchPad Portal in order to accept Forward Authentication requests.

## Handling Forward Authentication

You must accept requests to this endpoint:

    POST /handle_forward_authentication?session_id=:session_id

This request may be made by the user’s browser as a result of a redirection (GET) or an automated form submission (POST).

Upon receiving this request, the Client Application should call back to the LaunchPad Portal using the [Client Application API](/sso-client-application-api), and retrieve information relevant to the given Authentication Session.

You are expected to make your decision and then let the user in during the same request window.

# Integration Notes

This document outlines a few items to take care of on the technical side when you start integrating LaunchPad with us.

## Major Integration Steps

The following major steps must be taken.

1. **Faria:** Provision Client Application accounts and access tokens, one for each of your applications.
2. **Vendor:** Using the Client Application token, publish all identities to the Faria LaunchPad Portal.
3. **Faria:** Link the new identities against existing users, and create new users if necessary.
4. **Faria:** Provision Faria IDs for new users.
5. **Vendor:** Implement the Faria Forward Authentication protocol. (Alternatively, work with Faria Systems engineering to implement a substitute.)
6. **Vendor:** Using the same Client Application token, periodically update identities stored in the Faria LaunchPad Portal.

##Handling Custom Target Page
```ruby
#Request(source application)
#view:
 = link_to request_forward_authentication_path(target_page: 'identities/link/some_page')
```

```ruby
# Handle(target application)
In ForwardAuthenticationController#handle. 
params[:target_page] should be available with value being 'identities/link/some_page'
```
To handle custom target page an options hash with a :target_page key/value pair can be passed into `SSO::ForwardAuthenticationRequestService`.



## Technical Components To Be Completed

We will now discuss technical components must either be jointly implemented or implemented by you to facilitate successful introduction of LaunchPad inter-operation between our applications and yours.

### Synchronizing Your Identities with Faria LaunchPad Portal

Conventionally, each user of your application is identified by one or more unique identifiers (e.g. email or username) and authorized by one or more pieces of secret information (e.g. password, 2-factor tokens). Each of such tuple is considered one Identity in Faria LaunchPad parlance, and all of the public information (all of your unique identifiers) must be published from your application to our LaunchPad Portal and must be continuously maintained.

You can do so via the Client Application API.

### Accepting Forward Authentication Requests

Your applications must be able to process and respond to the Forward Authentication Requests sent by the Faria LaunchPad Portal. Please review our documentation on the [Forward Authentication API](/sso-forward-authentication-api).

Certain applications already implement such an interface in another way. However, such implementation usually does not provide the LaunchPad Portal with detailed information for each access attempt (when, where, whom, what).

You can also accomplish this via the Client Application API.

### Initiating Forward Authentication from Your Application

Specific code can be written to realize ‘Outgoing SSO’, allowing the Faria LaunchPad Portal to authenticate the given user with other applications on behalf of your application.

From an user interaction point of view, there are two variants of Forward Authentication from your application:

1.  User is redirected from your application back to the Faria LaunchPad Portal, then will continue from there on their free will.
2.  User is redirected from your application directly to the desired Client Application and signed in there.

The former is a simple matter of redirection while the latter is more convenient. In order to realise the latter, you must make use of the Client Application API to pull down a list of identities of the current Person. You can then build a LaunchPad Launchpad based on information provided by us.

## Sample Implementation

The following four code snippets cover Identity Provisioning (the first step as discussed under Synchronizing Your Identities with Faria LaunchPad Portal), Forward Authentication (as discussed under Accepting Forward Authentication Requests), caching, and sending Authentication Requests.

It is our hope that the following code snippets are helpful to you. Please feel free to contact us at [api@faria.co](mailto:api@faria.co) if there is anything else we can do.

### Provisioner

The Provisioner allows you to push identities from your application to Faria LaunchPad for the initial setup. Identities can be updated from your application using the Client Application API, or by the LaunchPad Portal after querying your application periodically.

```ruby
require 'active_support/all'
require 'forgery'
require 'httparty'

def section (title = nil, &block)
  puts
  answer = yield
  if title
    puts title
    puts
  end
  PP.pp answer if answer
  answer
end

section {
  context = { # The following three arbitrary strings are important for your integration
    client_application_token: '54e0476bac36ab5af88acecc1c8e9ff1',
    client_application_id: 'c0148089-25c4-47c9-8a6e-f031e00da07b',
    identity_provider_id: '321984ea-e6fe-4746-acdf-b431135df3bb'
  }
  
  client = SSO::HTTPClient.new(token: context[:client_application_token])
  
  section('Depending on your privileges, you may be able to see all organizations:') {
    client.organizations
  }
  
  section('Also dependent on your privileges, you may see all identity providers:') {
    client.identity_providers
  }
  
  organization = section('You can create new organizations:') {
    client.create_organization(name: SecureRandom.hex)
  }
  
  section('â€¦or search by a name component:') {
    client.organizations(organization['name'])
  }
  
  section('You can create people without providing identities:') {
    client.create_person(organization['id'], {
      # avatar_url: accepted if provided
      given_name: Forgery(:name).first_name,
      family_name: Forgery(:name).last_name,
      email: Forgery(:email).address
    })
  }
  
  person = section('â€¦or provide identities as you create them:') {
    client.create_person(organization['id'], {
      given_name: Forgery(:name).first_name,
      family_name: Forgery(:name).last_name,
      email: Forgery(:email).address,
      identities_attributes: [{
        provider_id: context[:identity_provider_id],
        organization_id: organization['id'],
        title: %w(engineer technician writer artist).sample.titleize,
        description: SecureRandom.hex,
        value: SecureRandom.hex,
        status: :loginable
      }]
    })
  }
  
  section('If you have the Person ID, you can retrieve all information linked to the object:') {
    client.person(organization['id'], person['id'])
  }
  
  nil
}

```

### Rails Routes

The following snippet demonstrates appropriate routing you must set up for your application in order to:

1.  Accept Forward Authentication requests from users wishing to enter your application via the LaunchPad Portal. 
2.  Accept Authentication Session requests from users currently using your application and wishing to enter other applications thru your in-app Identity Launchpad.

```ruby
SSO::Application.routes.draw do
  get 'handle_forward_authentication' => 'forward_authentication#handle', as: :handle_forward_authentication
  get 'obtain_forward_authentication' => 'forward_authentication#obtain', as: :request_forward_authentication
end
```

### Rails Controller

The following snippet demonstrates how Forward Authentication requests may be handled from your application, and shows a way to issue Authentication Session requests from your application to the LaunchPad Portal.

```ruby
class ForwardAuthenticationController < ApplicationController
  skip_before_filter :authenticate_user!, only: %i(handle)

  def handle
    service = Faria::SSO::ForwardAuthenticationResponseService.new(params[:session_id])
    if service.perform
      current_user = service.authenticated_object
      SSO::IdentityCachingService.new(current_user).store(service.authenticated_identity, service.available_identities)
      sign_in(:user, current_user)
      session.delete('user_return_to')
      flash.clear
      redirect_to after_sign_in_path_for(current_user) 
    else
      redirect_to request.referrer, error: 'Invalid credentials'
    end
  end
  
  def obtain
    current_identity, available_identities = SSO::IdentityCachingService.new(current_user).load
    service = SSO::ForwardAuthenticationRequestService.new(current_identity['id'], params[:identity_id])
    did_request = service.send(:perform!)
    if did_request
      redirect_to service.client_application_url
    else
      redirect_to request.referrer
    end
  end
end

```

### Forward Authentication Response Service

The following snippet contains a Service Object you can use to authenticate incoming LaunchPad Authentication Sessions. In this particular example, the following criteria are applied:

1.  The requested identity must exist within the application.
2.  The requesting party must own the identity.

(Further security measures may be carried out by the LaunchPad Portal directly.)

```ruby
class SSO::ForwardAuthenticationResponseService
  attr_reader :authenticated_object, :authentication_session_id, :authenticated_identity, :available_identities

  def initialize (authentication_session_id)
    raise 'authentication_session_id must be a String' unless authentication_session_id.is_a?(String)
    @authentication_session_id = authentication_session_id
  end

  def perform
    answer = begin
      perform!
    rescue => e
      false
    end
    
    answer.tap { |x|
      decision_type = x ? 'approve_session' : 'decline_session'
      SSO::TransactionResponseWorker.perform_async(authentication_session_id, decision_type, {})
    }
  end

private
  def perform!
    authentication_session = client.retrieve_session(authentication_session_id)
    requested_identity = authentication_session['identity']
    requested_user = object_for_identity_value(requested_identity['value'])
    requested_by_person = authentication_session['person']
    requested_own_identity = requested_by_person['identities'].include?(requested_identity)
    
    if requested_own_identity
      @authenticated_object = requested_user
      @authenticated_identity = requested_identity
      @available_identities = requested_by_person['identities']
      true
    else
      false
    end
  end

  def client
    @client = SSO::Client.new(ENV['SSO_TOKEN'], ENV['SSO_ENDPOINT'])
  end

  def object_for_identity_value (value)
    matches = value.match(/([a-zA-Z]+)-(\d+)/)
    role = matches[1]
    if matches
      if ((role.eql?("Staff")) && role.constantize)
        role.constantize.find(matches[2].to_i).try(:user)
      else
        nil
      end
    else
      nil
    end
  end
end

```

### Forward Authentication Request Service

The following snippet contains another Service Object you can use to create outgoing Authentication Session requests for the LaunchPad Portal. You may construct any kind of Authentication Session requests, but in general, the following criteria are applied:

1.  You must be requesting authentication on behalf of one of your users.
2.  The target identity must — according to the LaunchPad Portal — also belong to the same user.

```ruby
class SSO::ForwardAuthenticationRequestService
  attr_reader :authentication_session, :requester_identity_id, :wanted_identity_id, :client_application_url

  def initialize (requester_identity_id, wanted_identity_id)
    @requester_identity_id = requester_identity_id
    @wanted_identity_id = wanted_identity_id
  end

  def perform
    begin
      (perform!).present?
    rescue => e
      false
    end
  end

private
  def perform!
    @authentication_session = client.request_session(requester_identity_id, wanted_identity_id)
    @client_application_url = @authentication_session['context']['client_application_url']
  end

  def client
    unless defined?(@client)
      @client = SSO::Client.new(ENV['SSO_TOKEN'],ENV['SSO_ENDPOINT'])
    end
    @client
  end
end
```

### Transaction Response Worker

The following snippet demonstrates a way you can respond to authentication sessions asynchronously in order to ultimately log your approval or denial of an attempt to access your systems.

```ruby
class SSO::TransactionResponseWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 16, :backtrace => true
  
  def perform (session_id, decision_type, data)
    client = SSO::Client.new(ENV['SSO_TOKEN'], ENV['SSO_ENDPOINT'])
    case decision_type.to_s
    when 'approve_session'
      client.approve_session(session_id, data)
    when 'decline_session'
      client.approve_session(session_id, data)
    else
      raise 'Unable to comply with the provided decision type'
    end
  end
end
```

### Identity Caching Service

The following snippet demonstrates a way to store known LaunchPad identities of an user temporarily, so you can avoid querying the LaunchPad Portal every time you need to render an in-app Identity Launchpad.

```ruby
class SSO::IdentityCachingService
  attr_reader :object
  
  def initialize (object)
    @object = object
  end
  
  def store (*target)
    Rails.cache.write(cache_key, target.to_json)
  end
  
  def load
    JSON.parse(Rails.cache.fetch(cache_key))
  rescue
    nil
  end
  
  def cache_key
    "sso/#{object.class.to_s.downcase}/#{object.id}/identities"
  end
end

```

### API Client

The API Client allows your application to interact with the LaunchPad Portal properly.

```ruby
require 'httparty'
 
module SSO
  class Client
    include HTTParty
 
    format :json
 
    def initialize(token = nil, endpoint=nil)
      @token = token
      self.class.base_uri endpoint
    end
 
    def authenticate
      self.class.get('/organizations', :headers => default_headers)
    end
 
    def retrieve_session(session_id)
      self.class.get("/authentication_sessions/#{session_id}", :headers => default_headers)
    end
    
    def approve_session(session_id, data = {})
      self.class.post("/authentication_sessions/#{session_id}/approve", :body => { :data => data }, :headers => default_headers)
    end
 
    def decline_session(session_id, data = {})
      self.class.get("/authentication_sessions/#{session_id}/decline", :body => { :data => data }, :headers => default_headers)
    end
 
    def request_session (requester_identity_id, wanted_identity_id)
      self.class.post('/authentication_sessions', :body => { :requester_identity_id => requester_identity_id, :wanted_identity_id => wanted_identity_id }, :headers => default_headers)
    end
 
    def approve(session_id)
      self.class.post("/authentication_sessions/#{session_id}/approve", :headers => default_headers)
    end
 
    def decline
      self.class.post("/authentication_sessions/#{session_id}/decline", :headers => default_headers)    
    end
 
    def identity_providers
      self.class.get('/identity_providers', :headers => default_headers)
    end
    
    def create_organization (attributes)
      self.class.post('/organizations', :body => { :organization => attributes }, :headers => default_headers)
    end
    
    def update_organization (organization_id, attributes)
      self.class.post("/organizations/#{organization_id}", :body => { :organization => attributes }, :headers => default_headers)
    end
    
    def retrieve_organization (organization_id)
      self.class.get("/organizations/#{organization_id}", :headers => default_headers)
    end
    
    def ingest_person (organization_id, person_representation)
      self.class.post("/organizations/#{organization_id}/people", :body => { :person => person_representation }, :headers => default_headers)
    end
 
    def default_headers
      @header = {
        "Accept" => 'application/json',
        "Authorization" => "Token token=\"#{@token}\""
      }
    end
  end
end

```

