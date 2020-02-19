---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript

toc_footers:
  - <a href='https://emjpm.fabrique.social.gouv.fr/application/token-request'>Obtenez des accès de production à l'api ici</a>

includes:
  - errors

search: true
---

# Introduction

Bienvenue dans la documentation de l'api Emjpm à destination des logitiels métier, vous trouverez ici des guides et des documentations vous permetant de commencer aussi rapidement que possible.

# Demande d'accès à l'api

Pour utiliser API Emjpm en production (https://api-emjpm.fabrique.social.gouv.fr), vous devez obtenir un client_id et un client_token de production. Pour ce faire, veuillez remplir une demande d'autorisation sur notre [page dédié](https://emjpm.fabrique.social.gouv.fr/application/token-request)

# Environnement de test

Vous trouverez ci-dessous de quoi exécuter des requêtes HTTP sur l'environnement API emjpm de test (https://test-api-emjpm.fabrique.social.gouv.fr). Lors du développement de votre solution logicielle, nous vous recommandons d'utiliser cet environnement.

L'environnement de test est fonctionnellement identique à l'environnement de production.

Le client_id et le client_token à utiliser sont des client_id et des client_token de test.
Les données retournées sont des données de test.

### Token de test
Voici la liste des tokens d'API de tests.

| client_id  | client_token  |
|---|---|
| 1  | test  |
| 2  | test  |
| 3  | test  |

# Application de test

Afin de faciliter les tests nous avons mis à disposition une application de test à cet [url](https://emjpm-editor-demo.netlify.com/)

vous pourrez y trouve un formulaire ou vous pourrez renseigner vos identifiants de test ainsi que d'autre information pour que vous puissiez effectuer des test sans avoir besoin de coder

le code source de l'application de test est trouvable ici sur [github](https://github.com/SocialGouv/emjpm-editor-app) si vous en avez besoin.

### Compte de test

afin de vous connecter à des comptes de test voici des identifiants de test 

| email  | mot de passe  |
|---|---|
| individuel-1302@justice.fr  | emjpm2019  |
| service-131@justice.fr  | emjpm2019  |



# Comment passer de l'environnement de test à l'environnement de production
Lors de votre passage en production :

remplacez l'URL de test-api-emjpm.fabrique.social.gouv.fr à https://api-emjpm.fabrique.social.gouv.fr
remplacez votre client_id et votre client_token de test par ceux obtenues suite à votre demande d'autorisation

# Authentication d'un utilisateur

> pour authoriser votre application à accèder à un compte utilisateur veuillez rediriger sur l'url emjpm construite de la façon suivante:

```javascript
// url de redirection de test
const emjpmAuthTestUrl = `https://test-api-emjpm.fabrique.social.gouv.fr/application/authorization?client_id=${votre client_id de test}&client_token=${votre client_token de test}&redirect_url=${url de redirection vers votre application}`;

// exemple avec des informations de test
const finalUrl = "https://test-api-emjpm.fabrique.social.gouv.fr/application/authorization?client_id=1&client_token=abcd&redirect_url=http://exemple.com"

// url de redirection de production
const emjpmAuthTestUrl = `https://api-emjpm.fabrique.social.gouv.fr/application/authorization?client_id=${votre client_id de prod}&client_token=${votre client_token de prod}&redirect_url=${url de redirection vers votre application}`;

// exemple avec des informations de prod
const finalUrl = "https://api-emjpm.fabrique.social.gouv.fr/application/authorization?client_id=1&client_token=abcd&redirect_url=http://exemple.com"
```
> Soyez sur de remplacer les informations d'exemple avec les votres

> Une fois la redirection vers votre application faite vous receverez un token utilisateur sous la forme suivante

```js

const exampleUrl = "https://emjpm-editor-demo.netlify.com/?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tLyIsInVpZCI6InJhdTRLZm9WdmVpQ1R4bUZvQTBIbEJ6dDZnSjRoMFVYNVBnUHN1R2tEdDJjMEF4dnE1RENsVmZ0RFh0NWF1U0x1bmlBb3lpWUlQOXdRWTI2OVlaVTVRNVlyTFpTMDFpTjNKZlVveUxKTGhLQUJ1Z0NXY3FGQnduS1FFaDk0RlBPIiwidXNlcklkIjoxMzAyLCJlZGl0b3JJZCI6IjEiLCJlZGl0b3JUb2tlbiI6Imc1dmc0bXV1NDZzIiwiaWF0IjoxNTgyMTA2MTk4LCJzdWIiOiJyYXU0S2ZvVnZlaUNUeG1Gb0EwSGxCenQ2Z0o0aDBVWDVQZ1BzdUdrRHQyYzBBeHZxNURDbFZmdERYdDVhdVNMdW5pQW95aVlJUDl3UVkyNjlZWlU1UTVZckxaUzAxaU4zSmZVb3lMSkxoS0FCdWdDV2NxRkJ3bktRRWg5NEZQTyJ9.kOfoNKyBXPqkPzATRxtkbFGpJp38q57HlTbNOAzx_Gsjs1lYQUj3yNNXyS3VEB6bVbd7YEJ1DYS1fpXdSUauBFjKawOPvZ0St1vdDlkVhsHyCsiKE_8LtcgQ-rIVqWhgsuBh_YE-ybxq5YamGutcWtvcNBVhb526C1sjJry0bghM7FeK9WsQ2T70W3s4MIzjks9txDw1q55I86VJXK72xsqmjQnjufNukze9EqPmO0iIxTFRX9uZ4vaA0HO7xW1fcsXduyd3Qy1SkoUjdP0hJ94wxPb2HFApZUpWwIPuOqm4bmuopl1mANx0ncIXKizzq05-9q4ynfyra-E3iSaKqw"

// soit le token suivant 
eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tIiwidWlkIjoiRFRDWDhmNlBDOHljcmxvVTBmbDhWcUdGdWpzSXllVVhrTDZ4THBITXNHSXJJTmhEeXBVSnF5UnRPSEZzWlpwSmZ4VENLVFh0OEY2MTJraFFvclljTjhLUkg3SlBsbVdkWGpnMUZ0NHBQaG9GR1BoWjhqY3kyRldmYWNVazNkNmUiLCJ1c2VySWQiOjEzMDIsImVkaXRvcklkIjoiMSIsImVkaXRvclRva2VuIjoiZzV2ZzRtdXU0NnMiLCJpYXQiOjE1ODIxMDYwOTQsInN1YiI6IkRUQ1g4ZjZQQzh5Y3Jsb1UwZmw4VnFHRnVqc0l5ZVVYa0w2eExwSE1zR0lySU5oRHlwVUpxeVJ0T0hGc1pacEpmeFRDS1RYdDhGNjEya2hRb3JZY044S1JIN0pQbG1XZFhqZzFGdDRwUGhvRkdQaFo4amN5MkZXZmFjVWszZDZlIn0.HHcDnAYgL6gKhjFxSE1xy9sgf1OoNS2-E5EWnphwhDYhsE0nTM73XLjY_Tz1UsFcWSZPDwOGpsv-IfXwFdJZq0fZmhRW7atWQoMdBtB-djWF373XUP_pDK4whX014tLF9oJPxeX_xpDXT0-tue_HlOmUHzBx7LGhWUC_OlZ3PKqSLtJdvhvc0fbesJVo4TpGoCb4xYvIbsQtTI8yOIso9aUdbdv9azLoQQcjN0IYgn1PCEX3kI1tqRgTYNFQRrGIMqHNckF76PlRsJa7MJFhHlxogEqEgKUyvH85LODuyNEv6a8cx5qKUuz-jEHh3zEGbv9qqVwQ879O23GPMeHE4w
```



Emjpm utilise un système d'oauth pour identifier les utilisateurs donnent accès à leur compte aux logitiels métiers, pour se faire il suffit de faire une redirection depuis votre application jusqu'à la page d'authorisation utilisateur, la page à besoin de 3 paramètres

* `client_id` : votre client_id
* `client_token`: votre client_token
* `redirect_url`: l'url de redirection vers votre application

une fois l'authorisation accepté par l'utilisateur, nous le redirigerons vers votre application en donnant en paramamètre le token de l'utilisateur qui vous est lié.

ce token vous permettra par la suite de passer des requetes sur l'api Emjpm relative à cet utilisateur et votre application.

Si l'utilisateur révoque les droits d'accès à votre logitiel métier dans son compte Emjpm, alors vous n'aurez plus accès à ses informations.

### Redirection

exemple 

`https://test-api-emjpm.fabrique.social.gouv.fr/application/authorization?client_id=1&client_token=abcd&redirect_url=http://exemple.com`

# Mesures

## Get mesures

```javascript
const token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tIiwidWlkIjoiRFRDWDhmNlBDOHljcmxvVTBmbDhWcUdGdWpzSXllVVhrTDZ4THBITXNHSXJJTmhEeXBVSnF5UnRPSEZzWlpwSmZ4VENLVFh0OEY2MTJraFFvclljTjhLUkg3SlBsbVdkWGpnMUZ0NHBQaG9GR1BoWjhqY3kyRldmYWNVazNkNmUiLCJ1c2VySWQiOjEzMDIsImVkaXRvcklkIjoiMSIsImVkaXRvclRva2VuIjoiZzV2ZzRtdXU0NnMiLCJpYXQiOjE1ODIxMDYwOTQsInN1YiI6IkRUQ1g4ZjZQQzh5Y3Jsb1UwZmw4VnFHRnVqc0l5ZVVYa0w2eExwSE1zR0lySU5oRHlwVUpxeVJ0T0hGc1pacEpmeFRDS1RYdDhGNjEya2hRb3JZY044S1JIN0pQbG1XZFhqZzFGdDRwUGhvRkdQaFo4amN5MkZXZmFjVWszZDZlIn0.HHcDnAYgL6gKhjFxSE1xy9sgf1OoNS2-E5EWnphwhDYhsE0nTM73XLjY_Tz1UsFcWSZPDwOGpsv-IfXwFdJZq0fZmhRW7atWQoMdBtB-djWF373XUP_pDK4whX014tLF9oJPxeX_xpDXT0-tue_HlOmUHzBx7LGhWUC_OlZ3PKqSLtJdvhvc0fbesJVo4TpGoCb4xYvIbsQtTI8yOIso9aUdbdv9azLoQQcjN0IYgn1PCEX3kI1tqRgTYNFQRrGIMqHNckF76PlRsJa7MJFhHlxogEqEgKUyvH85LODuyNEv6a8cx5qKUuz-jEHh3zEGbv9qqVwQ879O23GPMeHE4w"
const emjpmApiMesuresUrl = "https://test-api-v25-21-0-emjpm.dev.fabrique.social.gouv.fr/api/v2/editors/mesures?status=Mesure en cours"

const response = await fetch(emjpmApiMesuresUrl, {
  headers: {
    Authorization: `Bearer ${token}`
  }
});
```

> La requete ci dessus retourne un body contenant le JSON structuré comme ceci:

```json
{
   "mesures":[
      {
         "id":87243,
         "code_postal":null,
         "ville":"Paris",
         "etablissement":null,
         "mandataire_id":877,
         "created_at":"2019-10-21T09:57:36.723Z",
         "annee":"2000",
         "type":"Tutelle aux biens et à la personne",
         "date_ouverture":"2019-01-08T00:00:00.000Z",
         "residence":"En établissement",
         "civilite":"H",
         "status":"Mesure en cours",
         "extinction":null,
         "etablissement_id":null,
         "ti_id":null,
         "numero_dossier":null,
         "cabinet":null,
         "reason_extinction":null,
         "numero_rg":null,
         "department_id":71,
         "antenne_id":null,
         "service_id":null,
         "is_urgent":false,
         "judgment_date":null,
         "latitude":null,
         "longitude":null
      }
   ]
}
```

This endpoint retrieves all kittens.

### HTTP Request

url de test
`GET https://test-api-v25-21-0-emjpm.dev.fabrique.social.gouv.fr/api/v2/editors/mesures`

url de production
`GET https://api-v25-21-0-emjpm.dev.fabrique.social.gouv.fr/api/v2/editors/mesures`

### Query Parameters

Parameter | Default | valeurs | obligatoire
--------- | ------- | ----------- | -----------
status | false | "Mesure en cours", "Mesure en attente" | oui

<aside class="success">
Attention — Une requete sur cet API ne peut être fait que grace au token d'authorisation utilisateur
</aside>

