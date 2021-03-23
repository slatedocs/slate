### Integration Authentication
The integrations bundle provides factories and helpers to create Guzzle Client classes for common authentication protocols. 

#### Registering the Integration for Authentication
If the integration requires the user to authenticate through the web (OAuth2 three legged), the integration needs to tag a service with `mautic.auth_integration` to handle the authentication process (redirecting to login, request the access token, etc). This service will need to implement `\Mautic\IntegrationsBundle\Integration\Interfaces\AuthenticationInterface`.

```php
<?php
return [
    // ...
    'services' => [
        // ...
        'integrations' => [
            // ...
            'helloworld.integration.authentication' => [
                'class' => \MauticPlugin\HelloWorldBundle\Integration\Support\AuthSupport::class,
                'tags'  => [
                    'mautic.auth_integration',
                ],
            ],
            // ...
        ],
        // ...
    ],
    // ...
];
```

The `AuthSupport` class must implement `\Mautic\IntegrationsBundle\Integration\Interfaces\AuthenticationInterface`.

```php
<?php
namespace MauticPlugin\HelloWorldBundle\Integration\Support;

use MauticPlugin\HelloWorldBundle\Connection\Client;
use MauticPlugin\HelloWorldBundle\Integration\HelloWorldIntegration;
use MauticPlugin\IntegrationsBundle\Integration\ConfigurationTrait;
use MauticPlugin\IntegrationsBundle\Integration\Interfaces\AuthenticationInterface;
use Symfony\Component\HttpFoundation\Request;

class AuthSupport implements AuthenticationInterface
{
    use ConfigurationTrait;

    /**
     * @var Client
     */
    private $client;

    public function __construct(Client $client)
    {
        $this->client = $client;
    }

    public function getName(): string
    {
        return HelloWorldIntegration::NAME;
    }

    public function getDisplayName(): string
    {
        return 'Hello World';
    }

    /**
     * Returns true if the integration has already been authorized with the 3rd party service.
     *
     * @return bool
     */
    public function isAuthenticated(): bool
    {
        $apiKeys = $this->getIntegrationConfiguration()->getApiKeys();

        return !empty($apiKeys['access_token']) && !empty($apiKeys['refresh_token']);
    }

    /**
     * Authenticate and obtain the access token
     *
     * @param Request $request
     *
     * @return string
     */
    public function authenticateIntegration(Request $request): string
    {
        $code = $request->query->get('code');

        $this->client->authenticate($code);

        return 'Success!';
    }
}
```

#### Authentication Providers
The integrations bundle comes with a number of popular authentication protocols available to use as Guzzle clients. New ones can be created by implementing `\Mautic\IntegrationsBundle\Auth\Provider\AuthProviderInterface.`

**The examples below use anonymous classes. Of course, use OOP with services and factories to generate credential, configuration, and client classes.** The best way to get configuration values such as username, password, consumer key, consumer secret, etc is by using the `mautic.integrations.helper` (`\Mautic\IntegrationsBundle\Helper\IntegrationsHelper`) service in order to leverage the configuration stored in the `Integration` entity's api keys. 

```php
<?php
use MauticPlugin\HelloWorldBundle\Integration\HelloWorldIntegration;
use MauticPlugin\IntegrationsBundle\Helper\IntegrationsHelper;

/** @var $integrationsHelper IntegrationsHelper */
$integration = $integrationsHelper->getIntegration(HelloWorldIntegration::NAME);

$configuration = $integration->getIntegrationConfiguration();
$apiKeys       = $configuration->getApiKeys();

$username = $apiKeys['username'] ?? null;
$password = $apiKeys['password'] ?? null;

//...
```

##### Api Key
Use the `mautic.integrations.auth_provider.api_key` service (`\Mautic\IntegrationsBundle\Auth\Provider\ApiKey\HttpFactory`) to obtain a `GuzzleHttp\ClientInterface` that uses an API key for all requests. Out of the box, the factory supports a parameter API key or a header API key.

###### Parameter Based API Key

To use the parameter based API key, create a credentials class that implements `\Mautic\IntegrationsBundle\Auth\Provider\ApiKey\Credentials\ParameterCredentialsInterface`. 

```php
<?php
use MauticPlugin\HelloWorldBundle\Integration\HelloWorldIntegration;
use MauticPlugin\IntegrationsBundle\Auth\Provider\ApiKey\Credentials\ParameterCredentialsInterface;
use MauticPlugin\IntegrationsBundle\Auth\Provider\ApiKey\HttpFactory;
use MauticPlugin\IntegrationsBundle\Helper\IntegrationsHelper;

/** @var $integrationsHelper IntegrationsHelper */
$integration = $integrationsHelper->getIntegration(HelloWorldIntegration::NAME);

$apiKeys = $integration->getIntegrationConfiguration()->getApiKeys();

$credentials = new class($apiKeys['api_key']) implements ParameterCredentialsInterface {
    private $key;

    public function __construct(string $key)
    {
        $this->key = $key;
    }

    public function getKeyName(): string
    {
        return 'apikey';
    }

    public function getApiKey(): string
    {
        return $this->key;
    }
};

/** @var $factory HttpFactory */
$client   = $factory->getClient($credentials);
$response = $client->get('https://api-url.com/fetch');
```

###### Header Based API Key
```php
<?php
use MauticPlugin\HelloWorldBundle\Integration\HelloWorldIntegration;
use MauticPlugin\IntegrationsBundle\Auth\Provider\ApiKey\Credentials\HeaderCredentialsInterface;
use MauticPlugin\IntegrationsBundle\Auth\Provider\ApiKey\HttpFactory;
use MauticPlugin\IntegrationsBundle\Helper\IntegrationsHelper;

/** @var $integrationsHelper IntegrationsHelper */
$integration = $integrationsHelper->getIntegration(HelloWorldIntegration::NAME);

$apiKeys = $integration->getIntegrationConfiguration()->getApiKeys();

$credentials = new class($apiKeys['api_key']) implements HeaderCredentialsInterface {
    private $key;

    public function __construct(string $key)
    {
        $this->key = $key;
    }

    public function getKeyName(): string
    {
        return 'X-API-KEY';
    }

    public function getApiKey(): string
    {
        return $this->key;
    }
};

/** @var $factory HttpFactory */
$client   = $factory->getClient($credentials);
$response = $client->get('https://api-url.com/fetch');
```

##### Basic Auth
Use the `mautic.integrations.auth_provider.basic_auth` service (`\Mautic\IntegrationsBundle\Auth\Provider\BasicAuth\HttpFactory`) to obtain a `GuzzleHttp\ClientInterface` that uses basic auth for all requests.

```php
<?php
use MauticPlugin\HelloWorldBundle\Integration\HelloWorldIntegration;
use MauticPlugin\IntegrationsBundle\Helper\IntegrationsHelper;
use MauticPlugin\IntegrationsBundle\Auth\Provider\BasicAuth\HttpFactory;
use MauticPlugin\IntegrationsBundle\Auth\Provider\BasicAuth\CredentialsInterface;

/** @var $integrationsHelper IntegrationsHelper */
$integration = $integrationsHelper->getIntegration(HelloWorldIntegration::NAME);

$configuration = $integration->getIntegrationConfiguration();
$apiKeys       = $configuration->getApiKeys();

$credentials = new class($apiKeys['username'], $apiKeys['password']) implements CredentialsInterface {
    private $username;
    private $password;

    public function __construct(string $username, string $password)
    {
        $this->username = $username;
        $this->password = $password;
    }

    public function getUsername(): string
    {
        return $this->username;
    }

    public function getPassword(): string
    {
        return $this->password;
    }
};

/** @var $factory HttpFactory */
$client   = $factory->getClient($credentials);
$response = $client->get('https://api-url.com/fetch');
```

##### OAuth1a
###### OAuth1a Three Legged 

This has not been implemented yet.

###### OAuth1a Two Legged
OAuth1A two legged does not require a user to login as would three legged. 

```php
<?php
use MauticPlugin\HelloWorldBundle\Integration\HelloWorldIntegration;
use MauticPlugin\IntegrationsBundle\Helper\IntegrationsHelper;
use MauticPlugin\IntegrationsBundle\Auth\Provider\OAuth1aTwoLegged\HttpFactory;
use MauticPlugin\IntegrationsBundle\Auth\Provider\OAuth1aTwoLegged\CredentialsInterface;

/** @var $integrationsHelper IntegrationsHelper */
$integration = $integrationsHelper->getIntegration(HelloWorldIntegration::NAME);

$configuration = $integration->getIntegrationConfiguration();
$apiKeys       = $configuration->getApiKeys();

$credentials = new class(
    'https://api-url.com/oauth/token', 
    $apiKeys['consumer_key'], 
    $apiKeys['consumer_secret']
) implements CredentialsInterface {
    private $authUrl;
    private $consumerKey;
    private $consumerSecret;

    public function __construct(string $authUrl, string $consumerKey, string $consumerSecret)
    {
        $this->authUrl        = $authUrl;
        $this->consumerKey    = $consumerKey;
        $this->consumerSecret = $consumerSecret;
    }

    public function getAuthUrl(): string
    {
        return $this->authUrl;
    }

    public function getConsumerKey(): ?string
    {
        return $this->consumerKey;
    }

    public function getConsumerSecret(): ?string
    {
        return $this->consumerSecret;
    }

    /**
     * Not used in this example. Tsk tsk for breaking the interface segregation principle
     *
     * @return string|null
     */
    public function getToken(): ?string
    {
        return null;
    }

    /**
     * Not used in this example. Tsk tsk for breaking the interface segregation principle
     *
     * @return string|null
     */
    public function getTokenSecret(): ?string
    {
        return null;
    }
};

/** @var $factory HttpFactory */
$client   = $factory->getClient($credentials);
$response = $client->get('https://api-url.com/fetch');
```
##### OAuth2
Use the OAuth2 factory according to the grant type required. `\Mautic\IntegrationsBundle\Auth\Provider\Oauth2ThreeLegged\HttpFactory` supports `code` and `refresh_token` grant types. `\Mautic\IntegrationsBundle\Auth\Provider\Oauth2TwoLegged\HttpFactory` supports `client_credentials` and `password`.

The OAuth2 factories leverages [https://github.com/kamermans/guzzle-oauth2-subscriber] as a middleware.

###### Client Configuration
Both OAuth2 factories leverage `\Mautic\IntegrationsBundle\Auth\Provider\AuthConfigInterface` object to configure things such as configuring the signer (basic auth, post form data, custom), token factory, token persistence, and token signer (bearer auth, basic auth, query string, custom). Use the appropriate interfaces as required for the use case (see the interfaces in `plugins/IntegrationsBundle/Auth/Support/Oauth2/ConfigAccess`). 

See [https://github.com/kamermans/guzzle-oauth2-subscriber] for additional details on configuring the credentials and token signers or creating custom token persistence and factories. 

###### Integration Token Persistence
For most use cases, a token persistence service to fetch and store the access tokens generated by using refresh tokens, etc will be required. The integrations bundle provides one that natively uses the `\Mautic\PluginBundle\Entity\Integration` entity's api keys. Anything stored through the service is automatically encrypted. 

Use the `mautic.integrations.auth_provider.token_persistence_factory` service (`\Mautic\IntegrationsBundle\Auth\Support\Oauth2\Token\TokenPersistenceFactory`) to generate a `TokenFactoryInterface` to be returned by the `\Mautic\IntegrationsBundle\Auth\Support\Oauth2\ConfigAccess\ConfigTokenFactoryInterface` interface. 
 
```php
<?php
use kamermans\OAuth2\Persistence\TokenPersistenceInterface;
use MauticPlugin\HelloWorldBundle\Integration\HelloWorldIntegration;
use MauticPlugin\IntegrationsBundle\Auth\Support\Oauth2\ConfigAccess\ConfigTokenPersistenceInterface;
use MauticPlugin\IntegrationsBundle\Auth\Support\Oauth2\Token\TokenPersistenceFactory;
use MauticPlugin\IntegrationsBundle\Helper\IntegrationsHelper;

/** @var $integrationsHelper IntegrationsHelper */
$integration = $integrationsHelper->getIntegration(HelloWorldIntegration::NAME);

/** @var $tokenPersistenceFactory TokenPersistenceFactory */
$tokenPersistence = $tokenPersistenceFactory->create($integration);

$config = new class($tokenPersistence) implements ConfigTokenPersistenceInterface {
    private $tokenPersistence;

    public function __construct(TokenPersistenceInterface$tokenPersistence)
    {
        $this->tokenPersistence = $tokenPersistence;
    }

    public function getTokenPersistence(): TokenPersistenceInterface
    {
        return $this->tokenPersistence;
    }
};
```

The token persistence service will automatically manage `access_token`, `refresh_token`, and `expires_at` from the authentication process which are stored in the `Integration` entity's api keys array.

###### Token Factory
In some cases, the 3rd party service may return additional values that are not traditionally part of the oauth2 spec and these values are required for further communication with the api service. In this case, the integration bundle's `\Mautic\IntegrationsBundle\Auth\Support\Oauth2\Token\IntegrationTokenFactory` can be used to capture those extra values and store them in the `Integration` entity's api keys array. 

The `IntegrationTokenFactory` can then be returned in a `\Mautic\IntegrationsBundle\Auth\Support\Oauth2\ConfigAccess\ConfigTokenFactoryInterface` when configuring the `Client`. 

```php
<?php
use MauticPlugin\IntegrationsBundle\Auth\Support\Oauth2\ConfigAccess\ConfigTokenFactoryInterface;
use MauticPlugin\IntegrationsBundle\Auth\Support\Oauth2\Token\IntegrationTokenFactory;
use MauticPlugin\IntegrationsBundle\Auth\Support\Oauth2\Token\TokenFactoryInterface;

$tokenFactory = new IntegrationTokenFactory(['something_extra']);

$config = new class($tokenFactory) implements ConfigTokenFactoryInterface {
    private $tokenFactory;

    public function __construct(TokenFactoryInterface $tokenFactory)
    {
        $this->tokenFactory = $tokenFactory;
    }

    public function getTokenFactory(): TokenFactoryInterface
    {
        return $this->tokenFactory;
    }
};
```

##### OAuth2 Two Legged

###### Password Grant
Below is an example of the password grant for a service that uses a scope (optional interface). The use of the token persistence is assuming the access token is valid for a period of time (i.e. an hour). 

```php
<?php
use kamermans\OAuth2\Persistence\TokenPersistenceInterface;
use MauticPlugin\HelloWorldBundle\Integration\HelloWorldIntegration;
use MauticPlugin\IntegrationsBundle\Auth\Provider\Oauth2TwoLegged\Credentials\PasswordCredentialsGrantInterface;
use MauticPlugin\IntegrationsBundle\Auth\Provider\Oauth2TwoLegged\Credentials\ScopeInterface;
use MauticPlugin\IntegrationsBundle\Auth\Provider\Oauth2TwoLegged\HttpFactory;
use MauticPlugin\IntegrationsBundle\Auth\Support\Oauth2\ConfigAccess\ConfigTokenPersistenceInterface;
use MauticPlugin\IntegrationsBundle\Helper\IntegrationsHelper;

/** @var $integrationsHelper IntegrationsHelper */
$integration = $integrationsHelper->getIntegration(HelloWorldIntegration::NAME);

$configuration = $integration->getIntegrationConfiguration();
$apiKeys       = $configuration->getApiKeys();

$credentials = new class(
    'https://api-url.com/oauth/token',
    'scope1,scope2',
    $apiKeys['client_id'],
    $apiKeys['client_secret'],
    $apiKeys['username'],
    $apiKeys['password']
) implements PasswordCredentialsGrantInterface, ScopeInterface {
    private $authorizeUrl;
    private $scope;
    private $clientId;
    private $clientSecret;
    private $username;
    private $password;

    public function getAuthorizationUrl(): string
    {
        return $this->authorizeUrl;
    }

    public function getClientId(): ?string
    {
        return $this->clientId;
    }

    public function getClientSecret(): ?string
    {
        return $this->clientSecret;
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function getUsername(): ?string
    {
        return $this->username;
    }

    public function getScope(): ?string
    {
        return $this->scope;
    }
};

/** @var $tokenPersistenceFactory TokenPersistenceFactory */
$tokenPersistence = $tokenPersistenceFactory->create($integration);
$config           = new class($tokenPersistence) implements ConfigTokenPersistenceInterface {
    private $tokenPersistence;

    public function __construct(TokenPersistenceInterface$tokenPersistence)
    {
        $this->tokenPersistence = $tokenPersistence;
    }

    public function getTokenPersistence(): TokenPersistenceInterface
    {
        return $this->tokenPersistence;
    }
};

/** @var $factory HttpFactory */
$client   = $factory->getClient($credentials, $config);
$response = $client->get('https://api-url.com/fetch');
```

###### Client Credentials Grant
Below is an example of the client credentials grant for a service that uses a scope (optional interface). The use of the token persistence is assuming the access token is valid for a period of time (i.e. an hour). 

```php
<?php
use kamermans\OAuth2\Persistence\TokenPersistenceInterface;
use MauticPlugin\HelloWorldBundle\Integration\HelloWorldIntegration;
use MauticPlugin\IntegrationsBundle\Auth\Provider\Oauth2TwoLegged\Credentials\ClientCredentialsGrantInterface;
use MauticPlugin\IntegrationsBundle\Auth\Provider\Oauth2TwoLegged\Credentials\ScopeInterface;
use MauticPlugin\IntegrationsBundle\Auth\Provider\Oauth2TwoLegged\HttpFactory;
use MauticPlugin\IntegrationsBundle\Auth\Support\Oauth2\ConfigAccess\ConfigTokenPersistenceInterface;
use MauticPlugin\IntegrationsBundle\Helper\IntegrationsHelper;

/** @var $integrationsHelper IntegrationsHelper */
$integration = $integrationsHelper->getIntegration(HelloWorldIntegration::NAME);

$configuration = $integration->getIntegrationConfiguration();
$apiKeys       = $configuration->getApiKeys();

$credentials = new class(
    'https://api-url.com/oauth/token',
    'scope1,scope2',
    $apiKeys['client_id'],
    $apiKeys['client_secret']
) implements ClientCredentialsGrantInterface, ScopeInterface {
    private $authorizeUrl;
    private $scope;
    private $clientId;
    private $clientSecret;

    public function getAuthorizationUrl(): string
    {
        return $this->authorizeUrl;
    }

    public function getClientId(): ?string
    {
        return $this->clientId;
    }

    public function getClientSecret(): ?string
    {
        return $this->clientSecret;
    }
    
    public function getScope(): ?string
    {
        return $this->scope;
    }
};

/** @var $tokenPersistenceFactory TokenPersistenceFactory */
$tokenPersistence = $tokenPersistenceFactory->create($integration);
$config           = new class($tokenPersistence) implements ConfigTokenPersistenceInterface {
    private $tokenPersistence;

    public function __construct(TokenPersistenceInterface$tokenPersistence)
    {
        $this->tokenPersistence = $tokenPersistence;
    }

    public function getTokenPersistence(): TokenPersistenceInterface
    {
        return $this->tokenPersistence;
    }
};

/** @var $factory HttpFactory */
$client   = $factory->getClient($credentials, $config);
$response = $client->get('https://api-url.com/fetch');
```

##### OAuth2 Three Legged
Three legged OAuth2 with the code grant is the most complex to implement because it involves redirecting the user to the 3rd party service to authenticate then sent back to Mautic to initiate the access token process using a code returned in the request. 

The first step is to register the integration as a [`\Mautic\IntegrationsBundle\Integration\Interfaces\AuthenticationInterface`](#registering-the-integration-for-authentication). The `authenticateIntegration()` method will be used to initiate the access token process using the `code` returned in the request after the user logs into the 3rd party service. The integrations bundle provides a route that can be used as the redirect or callback URIs through the named route `mautic_integration_public_callback` that requires a `integration` parameter. This redirect URI can be displayed in the UI by using [`ConfigFormCallbackInterface`](https://github.com/mautic/plugin-integrations/wiki/2.-Integration-Configuration#mauticpluginintegrationsbundleintegrationinterfacesconfigformcallbackinterface). This route will find the integration by name from the `AuthIntegrationsHelper` then execute its `authenticateIntegration()`. 

```php
<?php
namespace MauticPlugin\HelloWorldBundle\Integration\Support;

use GuzzleHttp\ClientInterface;
use MauticPlugin\IntegrationsBundle\Integration\Interfaces\AuthenticationInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class AuthSupport implements AuthenticationInterface {
    /**
     * @var ClientInterface
     */
    private $client;
    
    // ...
    
    public function authenticateIntegration(Request $request): Response
    {
        $code = $request->query->get('code');

        $this->client->authenticate($code);

        return new Response('OK!');
    }
}
```

The trick here is that the `Client`'s `authenticate` method will configure a `ClientInterface` then make a call to any valid API url (*this is required*). By making a call, the middleware will initiate the access token process and store it in the `Integration` entity's api keys through the [`TokenPersistenceFactory`](#integration-token-persistence). The URL is recommended to be something simple like a version check or fetching info for the authenticated user.

Here is an example of a client, assuming that the user has already logged in and the code is in the request.

```php
<?php
use kamermans\OAuth2\Persistence\TokenPersistenceInterface;
use MauticPlugin\HelloWorldBundle\Integration\HelloWorldIntegration;
use MauticPlugin\IntegrationsBundle\Auth\Provider\Oauth2ThreeLegged\Credentials\CodeInterface;
use MauticPlugin\IntegrationsBundle\Auth\Provider\Oauth2ThreeLegged\Credentials\CredentialsInterface;
use MauticPlugin\IntegrationsBundle\Auth\Provider\Oauth2ThreeLegged\Credentials\RedirectUriInterface;
use MauticPlugin\IntegrationsBundle\Auth\Provider\Oauth2TwoLegged\Credentials\ScopeInterface;
use MauticPlugin\IntegrationsBundle\Auth\Provider\Oauth2TwoLegged\HttpFactory;
use MauticPlugin\IntegrationsBundle\Auth\Support\Oauth2\ConfigAccess\ConfigTokenPersistenceInterface;
use MauticPlugin\IntegrationsBundle\Helper\IntegrationsHelper;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Router;

/** @var $integrationsHelper IntegrationsHelper */
$integration = $integrationsHelper->getIntegration(HelloWorldIntegration::NAME);

/** @var Router $router */
$redirectUrl = $router->generate('mautic_integration_public_callback', ['integration' => HelloWorldIntegration::NAME]);

$configuration = $integration->getIntegrationConfiguration();
$apiKeys       = $configuration->getApiKeys();

/** @var Request $request */
$code = $request->get('code');

$credentials = new class(
    'https://api-url.com/oauth/authorize',
    'https://api-url.com/oauth/token',
    $redirectUrl,
    'scope1,scope2',
    $apiKeys['client_id'],
    $apiKeys['client_secret'],
    $code
) implements CredentialsInterface, RedirectUriInterface, ScopeInterface, CodeInterface {
    private $authorizeUrl;
    private $tokenUrl;
    private $redirectUrl;
    private $scope;
    private $clientId;
    private $clientSecret;
    private $code;

    public function __construct(string $authorizeUrl, string $tokenUrl, string $redirectUrl, string $scope, string $clientId, string $clientSecret, ?string $code)
    {
        $this->authorizeUrl = $authorizeUrl;
        $this->tokenUrl     = $tokenUrl;
        $this->redirectUrl  = $redirectUrl;
        $this->scope        = $scope;
        $this->clientId     = $clientId;
        $this->clientSecret = $clientSecret;
        $this->code         = $code;
    }

    public function getAuthorizationUrl(): string
    {
        return $this->authorizeUrl;
    }

    public function getTokenUrl(): string
    {
        return $this->tokenUrl;
    }

    public function getRedirectUri(): string
    {
        return $this->redirectUrl;
    }

    public function getClientId(): ?string
    {
        return $this->clientId;
    }

    public function getClientSecret(): ?string
    {
        return $this->clientSecret;
    }

    public function getScope(): ?string
    {
        return $this->scope;
    }
    
    public function getCode(): ?string
    {
        return $this->code;
    }
};

/** @var $tokenPersistenceFactory TokenPersistenceFactory */
$tokenPersistence = $tokenPersistenceFactory->create($integration);
$config           = new class($tokenPersistence) implements ConfigTokenPersistenceInterface {
    private $tokenPersistence;

    public function __construct(TokenPersistenceInterface$tokenPersistence)
    {
        $this->tokenPersistence = $tokenPersistence;
    }

    public function getTokenPersistence(): TokenPersistenceInterface
    {
        return $this->tokenPersistence;
    }
};

/** @var $factory HttpFactory */
$client   = $factory->getClient($credentials, $config);
$response = $client->get('https://api-url.com/fetch');
```
