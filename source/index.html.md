---
title: Reference Emjpm API

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript

toc_footers:
  - <a href='https://emjpm.fabrique.social.gouv.fr/application/token-request'>Obtenez des accès de production à l'api ici</a>

includes:
  - errors

search: true
---

# Introduction

Bienvenue dans la documentation de l'API eMJPM à destination des logiciels métiers, vous trouverez ici des guides et des documentations vous permettant de commencer aussi rapidement que possible.

L'API eMJPM est organisée en REST, elle retourne des réponses encodées en JSON,
et utilise des verbes, des codes de réponses, et des méchanismes d'authentification HTTP standard.

### Environnements

**Test**  [https://api-apitest-emjpm.dev.fabrique.social.gouv.fr](https://api-apitest-emjpm.dev.fabrique.social.gouv.fr)

**Production** [https://api-emjpm.fabrique.social.gouv.fr](https://api-emjpm.fabrique.social.gouv.fr)

Lors du développement de votre solution logicielle, nous vous recommandons d'utiliser l'environnement de test

[https://api-apitest-emjpm.dev.fabrique.social.gouv.fr](https://api-apitest-emjpm.dev.fabrique.social.gouv.fr)

remplacez votre editor_id et votre editor_token de test par ceux obtenues suite à votre demande d'autorisation

L'environnement de test est fonctionnellement identique à l'environnement de production.

### Application de test

Afin de faciliter les tests, une application exemple est mis à disposition

[https://emjpm-editor-demo.netlify.com](https://emjpm-editor-demo.netlify.com)

(Source [https://github.com/SocialGouv/emjpm-editor-app](https://github.com/SocialGouv/emjpm-editor-app))

L'application implémente une demande de token configurable via l'interface,
et des appels à l'API `/mesures` avec autorisation, vous permettant de tester
des identifiants et des retours d'API rapidement sans code.

### Comptes / Tokens de test

Des comptes et tokens de test sont mis à disposition,
[https://api-apitest-emjpm.dev.fabrique.social.gouv.fr](https://api-apitest-emjpm.dev.fabrique.social.gouv.fr),

List des comptes utilisateur :

| email  | mot de passe  |
|---|---|
| individuel-1302@justice.fr  | emjpm2019  |
| service-131@justice.fr  | emjpm2019  |

Liste des tokens d'API :

| editor_id  | editor_token  |
|---|---|
| 1  | test  |
| 2  | test  |
| 3  | test  |

# Authentification

> pour authoriser votre application à accèder à un compte utilisateur veuillez rediriger sur l'url emjpm construite de la façon suivante:

```javascript
// url de redirection de test
const emjpmAuthTestUrl = `https://api-apitest-emjpm.dev.fabrique.social.gouv.fr/application/authorization?editor_id=${votre editor_id de test}&editor_token=${votre editor_token de test}&redirect_url=${url de redirection vers votre application}`;

// exemple avec des informations de test
const finalUrl = "https://api-apitest-emjpm.dev.fabrique.social.gouv.fr/application/authorization?editor_id=1&editor_token=abcd&redirect_url=http://exemple.com"

// url de redirection de production
const emjpmAuthTestUrl = `https://api-emjpm.fabrique.social.gouv.fr/application/authorization?editor_id=${votre editor_id de prod}&editor_token=${votre editor_token de prod}&redirect_url=${url de redirection vers votre application}`;

// exemple avec des informations de prod
const finalUrl = "https://api-emjpm.fabrique.social.gouv.fr/application/authorization?editor_id=1&editor_token=abcd&redirect_url=http://exemple.com"
```
> Soyez sur de remplacer les informations d'exemple avec les votres

> Une fois la redirection vers votre application faite vous receverez un token utilisateur sous la forme suivante

```js

const exampleUrl = "https://emjpm-editor-demo.netlify.com/?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tLyIsInVpZCI6InJhdTRLZm9WdmVpQ1R4bUZvQTBIbEJ6dDZnSjRoMFVYNVBnUHN1R2tEdDJjMEF4dnE1RENsVmZ0RFh0NWF1U0x1bmlBb3lpWUlQOXdRWTI2OVlaVTVRNVlyTFpTMDFpTjNKZlVveUxKTGhLQUJ1Z0NXY3FGQnduS1FFaDk0RlBPIiwidXNlcklkIjoxMzAyLCJlZGl0b3JJZCI6IjEiLCJlZGl0b3JUb2tlbiI6Imc1dmc0bXV1NDZzIiwiaWF0IjoxNTgyMTA2MTk4LCJzdWIiOiJyYXU0S2ZvVnZlaUNUeG1Gb0EwSGxCenQ2Z0o0aDBVWDVQZ1BzdUdrRHQyYzBBeHZxNURDbFZmdERYdDVhdVNMdW5pQW95aVlJUDl3UVkyNjlZWlU1UTVZckxaUzAxaU4zSmZVb3lMSkxoS0FCdWdDV2NxRkJ3bktRRWg5NEZQTyJ9.kOfoNKyBXPqkPzATRxtkbFGpJp38q57HlTbNOAzx_Gsjs1lYQUj3yNNXyS3VEB6bVbd7YEJ1DYS1fpXdSUauBFjKawOPvZ0St1vdDlkVhsHyCsiKE_8LtcgQ-rIVqWhgsuBh_YE-ybxq5YamGutcWtvcNBVhb526C1sjJry0bghM7FeK9WsQ2T70W3s4MIzjks9txDw1q55I86VJXK72xsqmjQnjufNukze9EqPmO0iIxTFRX9uZ4vaA0HO7xW1fcsXduyd3Qy1SkoUjdP0hJ94wxPb2HFApZUpWwIPuOqm4bmuopl1mANx0ncIXKizzq05-9q4ynfyra-E3iSaKqw"

// soit le token suivant
eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tIiwidWlkIjoiRFRDWDhmNlBDOHljcmxvVTBmbDhWcUdGdWpzSXllVVhrTDZ4THBITXNHSXJJTmhEeXBVSnF5UnRPSEZzWlpwSmZ4VENLVFh0OEY2MTJraFFvclljTjhLUkg3SlBsbVdkWGpnMUZ0NHBQaG9GR1BoWjhqY3kyRldmYWNVazNkNmUiLCJ1c2VySWQiOjEzMDIsImVkaXRvcklkIjoiMSIsImVkaXRvclRva2VuIjoiZzV2ZzRtdXU0NnMiLCJpYXQiOjE1ODIxMDYwOTQsInN1YiI6IkRUQ1g4ZjZQQzh5Y3Jsb1UwZmw4VnFHRnVqc0l5ZVVYa0w2eExwSE1zR0lySU5oRHlwVUpxeVJ0T0hGc1pacEpmeFRDS1RYdDhGNjEya2hRb3JZY044S1JIN0pQbG1XZFhqZzFGdDRwUGhvRkdQaFo4amN5MkZXZmFjVWszZDZlIn0.HHcDnAYgL6gKhjFxSE1xy9sgf1OoNS2-E5EWnphwhDYhsE0nTM73XLjY_Tz1UsFcWSZPDwOGpsv-IfXwFdJZq0fZmhRW7atWQoMdBtB-djWF373XUP_pDK4whX014tLF9oJPxeX_xpDXT0-tue_HlOmUHzBx7LGhWUC_OlZ3PKqSLtJdvhvc0fbesJVo4TpGoCb4xYvIbsQtTI8yOIso9aUdbdv9azLoQQcjN0IYgn1PCEX3kI1tqRgTYNFQRrGIMqHNckF76PlRsJa7MJFhHlxogEqEgKUyvH85LODuyNEv6a8cx5qKUuz-jEHh3zEGbv9qqVwQ879O23GPMeHE4w
```

L'API eMJPM utilise des tokens pour authentifier les requêtes via le méchanisme HTTP Bearer.

Pour utiliser l'API eMJPM en production (https://api-emjpm.fabrique.social.gouv.fr), vous devez obtenir un editor_id et un editor_token de production. Pour ce faire, veuillez remplir une demande d'autorisation sur notre [page dédié](https://emjpm.fabrique.social.gouv.fr/application/token-request).

### Etapes

eMJPM utilise un système d'oauth pour identifier les utilisateurs donnant accès à leur compte aux logiciels métiers.
Pour se faire il suffit de faire une redirection depuis votre application jusqu'à la page d'authorisation utilisateur, la page à besoin de 3 paramètres

* `editor_id` : votre editor_id
* `editor_token`: votre editor_token
* `redirect_url`: l'url de redirection vers votre application

une fois l'autorisation accepté par l'utilisateur, nous le redirigerons vers votre application en donnant en paramamètre le token de l'utilisateur qui vous est lié.

ce token vous permettra par la suite de passer des requetes sur l'api Emjpm relative à cet utilisateur et votre application.

L'utilisateur peut révoquer l'accès d'un logiciel métier à son compte eMJPM.

### Redirection

exemple

`https://api-apitest-emjpm.dev.fabrique.social.gouv.fr/application/authorization?editor_id=1&editor_token=abcd&redirect_url=http://exemple.com`

# Mesures

## L'objet mesure

> L'objet mesure

```javascript
{
  annee: "1983",
  antenne_id: null,
  civilite: "H",
  code_postal: "75015",
  ville: "paris",
  latitude: "45.8383",
  longitude: "1.01181",
  date_ouverture: "2020-02-20",
  department_id: "75",
  numero_dossier: "123123123",
  numero_rg: "RGXXXX123",
  residence: "En établissement",
  ti_id: global.ti.id,
  type: "Curatelle renforcée aux biens et à la personne"
  status: "Mesure en cours"
}
```

### Attributs

**id** `number`

ID de la mesure.

**annee** `number`

Année de naissance de la personne.

**civilite** `string`

Civilité de la personne, les valeurs possibles sont "H" et "F".

**code_postal** `string`

Code postal de la personne.

**ville** `string`

Ville de la personne.

**latitude** `float`

Latitude de la personne.

**longitude** `float`

Longitude de la personne.

**date_ouverture** `date`

Date d'ouverture de la mesure.

**department_id** `number`

ID du département de la mesure.

**numero_dossier** `string`

Numéro de dossier de la mesure.

**numero_rg** `string`

Numéro RG de la mesure.

**residence** `string`

Résidence de la personne.

**ti_id** `number`

ID du tribunal de la mesure.

**status** `string`

Status de la mesure, les valeurs possibles sont "Eteindre mesure" et "Mesure en cours".

**antenne_id** `number`

ID de l'antenne du service.

## Lister toutes les mesures

> GET /api/v2/editors/mesures

```javascript
const token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tIiwidWlkIjoiRFRDWDhmNlBDOHljcmxvVTBmbDhWcUdGdWpzSXllVVhrTDZ4THBITXNHSXJJTmhEeXBVSnF5UnRPSEZzWlpwSmZ4VENLVFh0OEY2MTJraFFvclljTjhLUkg3SlBsbVdkWGpnMUZ0NHBQaG9GR1BoWjhqY3kyRldmYWNVazNkNmUiLCJ1c2VySWQiOjEzMDIsImVkaXRvcklkIjoiMSIsImVkaXRvclRva2VuIjoiZzV2ZzRtdXU0NnMiLCJpYXQiOjE1ODIxMDYwOTQsInN1YiI6IkRUQ1g4ZjZQQzh5Y3Jsb1UwZmw4VnFHRnVqc0l5ZVVYa0w2eExwSE1zR0lySU5oRHlwVUpxeVJ0T0hGc1pacEpmeFRDS1RYdDhGNjEya2hRb3JZY044S1JIN0pQbG1XZFhqZzFGdDRwUGhvRkdQaFo4amN5MkZXZmFjVWszZDZlIn0.HHcDnAYgL6gKhjFxSE1xy9sgf1OoNS2-E5EWnphwhDYhsE0nTM73XLjY_Tz1UsFcWSZPDwOGpsv-IfXwFdJZq0fZmhRW7atWQoMdBtB-djWF373XUP_pDK4whX014tLF9oJPxeX_xpDXT0-tue_HlOmUHzBx7LGhWUC_OlZ3PKqSLtJdvhvc0fbesJVo4TpGoCb4xYvIbsQtTI8yOIso9aUdbdv9azLoQQcjN0IYgn1PCEX3kI1tqRgTYNFQRrGIMqHNckF76PlRsJa7MJFhHlxogEqEgKUyvH85LODuyNEv6a8cx5qKUuz-jEHh3zEGbv9qqVwQ879O23GPMeHE4w"
const emjpmApiMesuresUrl = "https://test-api-v25-21-0-emjpm.dev.fabrique.social.gouv.fr/api/v2/editors/mesures?status=Mesure en cours"

const response = await fetch(emjpmApiMesuresUrl, {
  headers: {
    Authorization: `Bearer ${token}`
  }
});
```

> RESPONSE

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

Retourne la liste de toutes les mesures associées à l'utilisateur.
Les mesures retournées sont triées, avec la mesure la plus récente apparaissant en premier.

### Paramètres

**status** (optionnel)

Retourne uniquement les mesures ayant ce status. Les valeurs possibles sont "Mesure en cours", "Mesure en attente".

### Retours

## Récupérer une mesure

> GET /api/v2/editors/mesures/:id

```javascript
const token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tIiwidWlkIjoiRFRDWDhmNlBDOHljcmxvVTBmbDhWcUdGdWpzSXllVVhrTDZ4THBITXNHSXJJTmhEeXBVSnF5UnRPSEZzWlpwSmZ4VENLVFh0OEY2MTJraFFvclljTjhLUkg3SlBsbVdkWGpnMUZ0NHBQaG9GR1BoWjhqY3kyRldmYWNVazNkNmUiLCJ1c2VySWQiOjEzMDIsImVkaXRvcklkIjoiMSIsImVkaXRvclRva2VuIjoiZzV2ZzRtdXU0NnMiLCJpYXQiOjE1ODIxMDYwOTQsInN1YiI6IkRUQ1g4ZjZQQzh5Y3Jsb1UwZmw4VnFHRnVqc0l5ZVVYa0w2eExwSE1zR0lySU5oRHlwVUpxeVJ0T0hGc1pacEpmeFRDS1RYdDhGNjEya2hRb3JZY044S1JIN0pQbG1XZFhqZzFGdDRwUGhvRkdQaFo4amN5MkZXZmFjVWszZDZlIn0.HHcDnAYgL6gKhjFxSE1xy9sgf1OoNS2-E5EWnphwhDYhsE0nTM73XLjY_Tz1UsFcWSZPDwOGpsv-IfXwFdJZq0fZmhRW7atWQoMdBtB-djWF373XUP_pDK4whX014tLF9oJPxeX_xpDXT0-tue_HlOmUHzBx7LGhWUC_OlZ3PKqSLtJdvhvc0fbesJVo4TpGoCb4xYvIbsQtTI8yOIso9aUdbdv9azLoQQcjN0IYgn1PCEX3kI1tqRgTYNFQRrGIMqHNckF76PlRsJa7MJFhHlxogEqEgKUyvH85LODuyNEv6a8cx5qKUuz-jEHh3zEGbv9qqVwQ879O23GPMeHE4w"
const emjpmApiMesuresUrl = "https://test-api-v25-21-0-emjpm.dev.fabrique.social.gouv.fr/api/v2/editors/mesures/1"

const response = await fetch(emjpmApiMesuresUrl, {
  headers: {
    Authorization: `Bearer ${token}`
  }
});
```

> REPONSE

```json
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
```

Récupère la mesure associée à l'ID passé.

### Retours

Retourne l'objet [mesure](/?javascript#l-39-objet-mesure).
Si la mesure n'existe pas, une [erreur](/?javascript#errors) est retournée.

## Créer une mesure

> POST /api/v2/editors/mesures

```javascript
const token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tIiwidWlkIjoiRFRDWDhmNlBDOHljcmxvVTBmbDhWcUdGdWpzSXllVVhrTDZ4THBITXNHSXJJTmhEeXBVSnF5UnRPSEZzWlpwSmZ4VENLVFh0OEY2MTJraFFvclljTjhLUkg3SlBsbVdkWGpnMUZ0NHBQaG9GR1BoWjhqY3kyRldmYWNVazNkNmUiLCJ1c2VySWQiOjEzMDIsImVkaXRvcklkIjoiMSIsImVkaXRvclRva2VuIjoiZzV2ZzRtdXU0NnMiLCJpYXQiOjE1ODIxMDYwOTQsInN1YiI6IkRUQ1g4ZjZQQzh5Y3Jsb1UwZmw4VnFHRnVqc0l5ZVVYa0w2eExwSE1zR0lySU5oRHlwVUpxeVJ0T0hGc1pacEpmeFRDS1RYdDhGNjEya2hRb3JZY044S1JIN0pQbG1XZFhqZzFGdDRwUGhvRkdQaFo4amN5MkZXZmFjVWszZDZlIn0.HHcDnAYgL6gKhjFxSE1xy9sgf1OoNS2-E5EWnphwhDYhsE0nTM73XLjY_Tz1UsFcWSZPDwOGpsv-IfXwFdJZq0fZmhRW7atWQoMdBtB-djWF373XUP_pDK4whX014tLF9oJPxeX_xpDXT0-tue_HlOmUHzBx7LGhWUC_OlZ3PKqSLtJdvhvc0fbesJVo4TpGoCb4xYvIbsQtTI8yOIso9aUdbdv9azLoQQcjN0IYgn1PCEX3kI1tqRgTYNFQRrGIMqHNckF76PlRsJa7MJFhHlxogEqEgKUyvH85LODuyNEv6a8cx5qKUuz-jEHh3zEGbv9qqVwQ879O23GPMeHE4w"
const emjpmApiMesuresUrl = "https://test-api-v25-21-0-emjpm.dev.fabrique.social.gouv.fr/api/v2/editors/mesures en cours"

const response = await fetch(emjpmApiMesuresUrl, {
  method: "post",
  headers: {
    Authorization: `Bearer ${token}`
  }
});
```

> REPONSE

```json
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
```

Créer une mesure avec les paramètres passés.
Tous les paramètres sont obligatoires sauf indiqué par `(optionnel)`.

### Paramètres

**annee** `number`

Année de naissance de la personne.

**civilite** `string`

Civilité de la personne, les valeurs possibles sont "H" et "F".

**code_postal** `string`

Code postal de la personne.

**ville** `string`

Ville de la personne.

**latitude** `float`

Latitude de la personne.

**longitude** `float`

Longitude de la personne.

**date_ouverture** `date`

Date d'ouverture de la mesure.

**department_id** `number`

ID du département de la mesure.

**numero_dossier** `string`

Numéro de dossier de la mesure.

**numero_rg** `string`

Numéro RG de la mesure.

**residence** `string`

Résidence de la personne.

**ti_id** `number`

ID du tribunal de la mesure.

**status** `string`

Status de la mesure, les valeurs possibles sont "Eteindre mesure" et "Mesure en cours".

**antenne_id** `number` `optionnel`

ID de l'antenne du service.

### Retours

Retourne l'objet [mesure](/?javascript#l-39-objet-mesure).
Si la mesure n'existe pas, une [erreur](/?javascript#errors) est retournée.

## Modifier une mesure

> PUT /api/v2/editors/mesures/:id

```javascript
const token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tIiwidWlkIjoiRFRDWDhmNlBDOHljcmxvVTBmbDhWcUdGdWpzSXllVVhrTDZ4THBITXNHSXJJTmhEeXBVSnF5UnRPSEZzWlpwSmZ4VENLVFh0OEY2MTJraFFvclljTjhLUkg3SlBsbVdkWGpnMUZ0NHBQaG9GR1BoWjhqY3kyRldmYWNVazNkNmUiLCJ1c2VySWQiOjEzMDIsImVkaXRvcklkIjoiMSIsImVkaXRvclRva2VuIjoiZzV2ZzRtdXU0NnMiLCJpYXQiOjE1ODIxMDYwOTQsInN1YiI6IkRUQ1g4ZjZQQzh5Y3Jsb1UwZmw4VnFHRnVqc0l5ZVVYa0w2eExwSE1zR0lySU5oRHlwVUpxeVJ0T0hGc1pacEpmeFRDS1RYdDhGNjEya2hRb3JZY044S1JIN0pQbG1XZFhqZzFGdDRwUGhvRkdQaFo4amN5MkZXZmFjVWszZDZlIn0.HHcDnAYgL6gKhjFxSE1xy9sgf1OoNS2-E5EWnphwhDYhsE0nTM73XLjY_Tz1UsFcWSZPDwOGpsv-IfXwFdJZq0fZmhRW7atWQoMdBtB-djWF373XUP_pDK4whX014tLF9oJPxeX_xpDXT0-tue_HlOmUHzBx7LGhWUC_OlZ3PKqSLtJdvhvc0fbesJVo4TpGoCb4xYvIbsQtTI8yOIso9aUdbdv9azLoQQcjN0IYgn1PCEX3kI1tqRgTYNFQRrGIMqHNckF76PlRsJa7MJFhHlxogEqEgKUyvH85LODuyNEv6a8cx5qKUuz-jEHh3zEGbv9qqVwQ879O23GPMeHE4w"
const emjpmApiMesuresUrl = "https://test-api-v25-21-0-emjpm.dev.fabrique.social.gouv.fr/api/v2/editors/mesures/1"

const response = await fetch(emjpmApiMesuresUrl, {
  method: "put",
  headers: {
    Authorization: `Bearer ${token}`
  }
});
```

> REPONSE

```json
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
```

Modifie la mesure avec les paramètres passés.
Tous les paramètres non passées resteront inchangés.
Cette requête accepte quasiment les mêmes paramètres que pour la création d'une mesure.

### Paramètres

**annee** `number`

Année de naissance de la personne.

**civilite** `string`

Civilité de la personne, les valeurs possibles sont "H" et "F".

**code_postal** `string`

Code postal de la personne.

**ville** `string`

Ville de la personne.

**latitude** `float`

Latitude de la personne.

**longitude** `float`

Longitude de la personne.

**date_ouverture** `date`

Date d'ouverture de la mesure.

**department_id** `number`

ID du département de la mesure.

**numero_dossier** `string`

Numéro de dossier de la mesure.

**numero_rg** `string`

Numéro RG de la mesure.

**residence** `string`

Résidence de la personne.

**ti_id** `number`

ID du tribunal de la mesure.

**status** `string`

Status de la mesure, les valeurs possibles sont "Eteindre mesure" et "Mesure en cours".

**antenne_id** `number`

ID de l'antenne du service.

### Retours

Retourne l'objet [mesure](/?javascript#l-39-objet-mesure).
Si la mesure n'existe pas, une [erreur](/?javascript#errors) est retournée.

## Supprimer une mesure

> DELETE /api/v2/editors/mesures/:id

```javascript
const token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tIiwidWlkIjoiRFRDWDhmNlBDOHljcmxvVTBmbDhWcUdGdWpzSXllVVhrTDZ4THBITXNHSXJJTmhEeXBVSnF5UnRPSEZzWlpwSmZ4VENLVFh0OEY2MTJraFFvclljTjhLUkg3SlBsbVdkWGpnMUZ0NHBQaG9GR1BoWjhqY3kyRldmYWNVazNkNmUiLCJ1c2VySWQiOjEzMDIsImVkaXRvcklkIjoiMSIsImVkaXRvclRva2VuIjoiZzV2ZzRtdXU0NnMiLCJpYXQiOjE1ODIxMDYwOTQsInN1YiI6IkRUQ1g4ZjZQQzh5Y3Jsb1UwZmw4VnFHRnVqc0l5ZVVYa0w2eExwSE1zR0lySU5oRHlwVUpxeVJ0T0hGc1pacEpmeFRDS1RYdDhGNjEya2hRb3JZY044S1JIN0pQbG1XZFhqZzFGdDRwUGhvRkdQaFo4amN5MkZXZmFjVWszZDZlIn0.HHcDnAYgL6gKhjFxSE1xy9sgf1OoNS2-E5EWnphwhDYhsE0nTM73XLjY_Tz1UsFcWSZPDwOGpsv-IfXwFdJZq0fZmhRW7atWQoMdBtB-djWF373XUP_pDK4whX014tLF9oJPxeX_xpDXT0-tue_HlOmUHzBx7LGhWUC_OlZ3PKqSLtJdvhvc0fbesJVo4TpGoCb4xYvIbsQtTI8yOIso9aUdbdv9azLoQQcjN0IYgn1PCEX3kI1tqRgTYNFQRrGIMqHNckF76PlRsJa7MJFhHlxogEqEgKUyvH85LODuyNEv6a8cx5qKUuz-jEHh3zEGbv9qqVwQ879O23GPMeHE4w"
const emjpmApiMesuresUrl = "https://test-api-v25-21-0-emjpm.dev.fabrique.social.gouv.fr/api/v2/editors/mesures/1"

const response = await fetch(emjpmApiMesuresUrl, {
  method: "delete",
  headers: {
    Authorization: `Bearer ${token}`
  }
});
```

> REPONSE

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

Supprime la mesure associé à l'ID passé.

### Retours

Retourne l'objet [mesure](/?javascript#l-39-objet-mesure) supprimé.
Si la mesure n'existe pas, une [erreur](/?javascript#errors) est retournée.
