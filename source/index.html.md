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

**Test** [https://api-apitest-emjpm.dev.fabrique.social.gouv.fr](https://api-apitest-emjpm.dev.fabrique.social.gouv.fr)

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

| email                                 | mot de passe |
| ------------------------------------- | ------------ |
| admin: admin-45@justice.fr            | emjpm2019    |
| individuel: individuel-134@justice.fr | emjpm2019    |
| ti: ti-136@justice.fr                 | emjpm2019    |
| prepose: prepose-63@justice.fr        | emjpm2019    |
| direction: direction-823@justice.fr   | emjpm2019    |
| service: service-363@justice.fr       | emjpm2019    |

Liste des tokens d'API :

| editor_id | editor_token |
| --------- | ------------ |
| 1         | 53tes5gy1zk  |
| 2         | dlz65bkdzmi  |
| 3         | ds3a96tf9l   |

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
const exampleUrl =
  "https://emjpm-editor-demo.netlify.com/?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tLyIsInVpZCI6InJhdTRLZm9WdmVpQ1R4bUZvQTBIbEJ6dDZnSjRoMFVYNVBnUHN1R2tEdDJjMEF4dnE1RENsVmZ0RFh0NWF1U0x1bmlBb3lpWUlQOXdRWTI2OVlaVTVRNVlyTFpTMDFpTjNKZlVveUxKTGhLQUJ1Z0NXY3FGQnduS1FFaDk0RlBPIiwidXNlcklkIjoxMzAyLCJlZGl0b3JJZCI6IjEiLCJlZGl0b3JUb2tlbiI6Imc1dmc0bXV1NDZzIiwiaWF0IjoxNTgyMTA2MTk4LCJzdWIiOiJyYXU0S2ZvVnZlaUNUeG1Gb0EwSGxCenQ2Z0o0aDBVWDVQZ1BzdUdrRHQyYzBBeHZxNURDbFZmdERYdDVhdVNMdW5pQW95aVlJUDl3UVkyNjlZWlU1UTVZckxaUzAxaU4zSmZVb3lMSkxoS0FCdWdDV2NxRkJ3bktRRWg5NEZQTyJ9.kOfoNKyBXPqkPzATRxtkbFGpJp38q57HlTbNOAzx_Gsjs1lYQUj3yNNXyS3VEB6bVbd7YEJ1DYS1fpXdSUauBFjKawOPvZ0St1vdDlkVhsHyCsiKE_8LtcgQ-rIVqWhgsuBh_YE-ybxq5YamGutcWtvcNBVhb526C1sjJry0bghM7FeK9WsQ2T70W3s4MIzjks9txDw1q55I86VJXK72xsqmjQnjufNukze9EqPmO0iIxTFRX9uZ4vaA0HO7xW1fcsXduyd3Qy1SkoUjdP0hJ94wxPb2HFApZUpWwIPuOqm4bmuopl1mANx0ncIXKizzq05-9q4ynfyra-E3iSaKqw";

// soit le token suivant
eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9
  .eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tIiwidWlkIjoiRFRDWDhmNlBDOHljcmxvVTBmbDhWcUdGdWpzSXllVVhrTDZ4THBITXNHSXJJTmhEeXBVSnF5UnRPSEZzWlpwSmZ4VENLVFh0OEY2MTJraFFvclljTjhLUkg3SlBsbVdkWGpnMUZ0NHBQaG9GR1BoWjhqY3kyRldmYWNVazNkNmUiLCJ1c2VySWQiOjEzMDIsImVkaXRvcklkIjoiMSIsImVkaXRvclRva2VuIjoiZzV2ZzRtdXU0NnMiLCJpYXQiOjE1ODIxMDYwOTQsInN1YiI6IkRUQ1g4ZjZQQzh5Y3Jsb1UwZmw4VnFHRnVqc0l5ZVVYa0w2eExwSE1zR0lySU5oRHlwVUpxeVJ0T0hGc1pacEpmeFRDS1RYdDhGNjEya2hRb3JZY044S1JIN0pQbG1XZFhqZzFGdDRwUGhvRkdQaFo4amN5MkZXZmFjVWszZDZlIn0
  .HHcDnAYgL6gKhjFxSE1xy9sgf1OoNS2 -
  E5EWnphwhDYhsE0nTM73XLjY_Tz1UsFcWSZPDwOGpsv -
  IfXwFdJZq0fZmhRW7atWQoMdBtB -
  djWF373XUP_pDK4whX014tLF9oJPxeX_xpDXT0 -
  tue_HlOmUHzBx7LGhWUC_OlZ3PKqSLtJdvhvc0fbesJVo4TpGoCb4xYvIbsQtTI8yOIso9aUdbdv9azLoQQcjN0IYgn1PCEX3kI1tqRgTYNFQRrGIMqHNckF76PlRsJa7MJFhHlxogEqEgKUyvH85LODuyNEv6a8cx5qKUuz -
  jEHh3zEGbv9qqVwQ879O23GPMeHE4w;
```

L'API eMJPM utilise des tokens pour authentifier les requêtes via le méchanisme HTTP Bearer.

Pour utiliser l'API eMJPM en production (https://api-emjpm.fabrique.social.gouv.fr), vous devez obtenir un editor_id et un editor_token de production. Pour ce faire, veuillez remplir une demande d'autorisation sur notre [page dédié](https://emjpm.fabrique.social.gouv.fr/application/token-request).

### Etapes

eMJPM utilise un système d'oauth pour identifier les utilisateurs donnant accès à leur compte aux logiciels métiers.
Pour se faire il suffit de faire une redirection depuis votre application jusqu'à la page d'authorisation utilisateur, la page à besoin de 3 paramètres

- `editor_id` : votre editor_id
- `editor_token`: votre editor_token
- `redirect_url`: l'url de redirection vers votre application

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
    annee_naissance: "1989",
    antenne_id: null,
    cabinet: null,
    cause_sortie: "dessaisissement_famille",
    civilite: "monsieur",
    code_postal: "89000",
    date_fin_mesure: "2020-04-04T00:00:00.000Z",
    date_nomination: "2020-01-01T00:00:00.000Z",
    department_id: 90,
    etablissement: null,
    etablissement_id: null,
    judgment_date: null,
    latitude: 47.8022,
    longitude: 3.51709,
    lieu_vie: "domicile",
    mandataire_id: 501,
    ti_id: null,
    ville: "AUXERRE",
    date_premier_mesure: "2020-01-10T00:00:00.000Z",
    date_protection_en_cours: "2020-01-10T00:00:00.000Z",
    status: "en_cours",
    numero_dossier: "45656456",
    numero_rg: "RG234534534",
    pays: "FR",
    magistrat_id: null,
    id: 138671,
    ressources: [{
      id: 7
      mesure_id: 138671,
      annee: 2010,
      niveau_ressource: 300,
      prestations_sociales: "[\"PCH\",\"RSA\"]",
    }],
    etats: [{
      id: 70,
      mesure_id: 138671,
      date_changement_etat: "2020-01-08T00:00:00.000Z",
      nature_mesure: "curatelle_simple",
      lieu_vie: "domicile",
      code_postal: "89000",
      ville: "AUXERRE",
      pays: "FR",
      etablissement_siret: ""
    }]
}
```

### Attributs

**id** `number`

ID de la mesure.

**annee_naissance** `string`

Année de naissance de la personne.

**antenne_id** `string`

Dans le cas d'un service mandataire, identifiant unique emjpm de l'antenne'

**cabinet** `string`

Cabinet du tribunal ayant attribué la mesure de protection.

**champ_mesure** `string`

Champ de la mesure de protection, les valeurs possibles sont "protection_bien", "protection_personne", ou "protection_bien_personne".

**civilite** `string`

Civilité de la personne, les valeurs possibles sont "monsieur" et "madame".

**code_postal** `string`

Code postal de la personne.

**created_at** `timestamptz`

Date de création

**date_fin_mesure** `date`

Date de fin de la mesure de protection (yyyy-MM-dd)

**date_nomination** `date`

Date de jugement ou ordonnance de nomination (yyyy-MM-dd)

**date_premier_mesure** `date`

Date de la première mise sous protection juridique (yyyy-MM-dd)

**date_protection_en_cours** `date`

Date de la protection en cours (yyyy-MM-dd)

**department_id** `number`

ID du département

**is_urgent** `boolean`

**judgment_date** `date`

Date de jugement

**latitude** `number`

**lieu_vie** `string`

Lieu de vie du majeur protégé, les valeurs possibles sont "domicile", "etablissement", ou "etablissement_conservation_domicile".

**longitude** `number`

**magistrat_id** `number`

ID du magistrat

**mandataire_id** `number`

ID du mandataire

**nature_mesure** `string`

Nature de la mesure de protection, les valeurs possibles sont "curatelle_simple", "curatelle_renforcee", "tutelle", "sauvegarde_justice", "mesure_accompagnement_judiciaire", "subroge_curateur", "subroge_tuteur", "mandat_protection_future", ou "mesure_ad_hoc".

**numero_dossier** `string`

Numéro de dossier de la mesure.

**numero_rg** `string`

Numéro RG de la mesure.

**pays** `string`

Code pays (ISO 3166-1 alpha-2) du lieu de vie du majeur protégé

**resultat_revision** `string`

Résultat de la révision de la mesure de protection, les valeurs possibles sont "mainlevee", "reconduction", "aggravation", "allegement", "dessaisissement_famille", ou "dessaisissement_autre_mjpm".

**service_id** `number`

ID du service

**status** `string`

Status de la mesure, les valeurs possibles sont "en_attente", "en_cours", ou "eteinte".

**ti_id** `number`

ID du tribunal

**type_etablissement**

Type d'établissement, les valeurs possibles sont "etablissement_handicapes", "etablissement_personne_agee", "autre_etablissement_s_ms", "etablissement_hospitalier", ou "etablissement_psychiatrique".

**etats** `array`

Historique des états de la mesure

**ressources** `array`

Historique des mesures de protection

## Lister toutes les mesures

> GET /api/editors/mesures

```javascript
const token =
  "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tIiwidWlkIjoiRFRDWDhmNlBDOHljcmxvVTBmbDhWcUdGdWpzSXllVVhrTDZ4THBITXNHSXJJTmhEeXBVSnF5UnRPSEZzWlpwSmZ4VENLVFh0OEY2MTJraFFvclljTjhLUkg3SlBsbVdkWGpnMUZ0NHBQaG9GR1BoWjhqY3kyRldmYWNVazNkNmUiLCJ1c2VySWQiOjEzMDIsImVkaXRvcklkIjoiMSIsImVkaXRvclRva2VuIjoiZzV2ZzRtdXU0NnMiLCJpYXQiOjE1ODIxMDYwOTQsInN1YiI6IkRUQ1g4ZjZQQzh5Y3Jsb1UwZmw4VnFHRnVqc0l5ZVVYa0w2eExwSE1zR0lySU5oRHlwVUpxeVJ0T0hGc1pacEpmeFRDS1RYdDhGNjEya2hRb3JZY044S1JIN0pQbG1XZFhqZzFGdDRwUGhvRkdQaFo4amN5MkZXZmFjVWszZDZlIn0.HHcDnAYgL6gKhjFxSE1xy9sgf1OoNS2-E5EWnphwhDYhsE0nTM73XLjY_Tz1UsFcWSZPDwOGpsv-IfXwFdJZq0fZmhRW7atWQoMdBtB-djWF373XUP_pDK4whX014tLF9oJPxeX_xpDXT0-tue_HlOmUHzBx7LGhWUC_OlZ3PKqSLtJdvhvc0fbesJVo4TpGoCb4xYvIbsQtTI8yOIso9aUdbdv9azLoQQcjN0IYgn1PCEX3kI1tqRgTYNFQRrGIMqHNckF76PlRsJa7MJFhHlxogEqEgKUyvH85LODuyNEv6a8cx5qKUuz-jEHh3zEGbv9qqVwQ879O23GPMeHE4w";
const emjpmApiMesuresUrl =
  "https://test-api-v25-21-0-emjpm.dev.fabrique.social.gouv.fr/api/editors/mesures?status=en_cours";

const response = await fetch(emjpmApiMesuresUrl, {
  headers: {
    Authorization: `Bearer ${token}`,
  },
});
```

> RESPONSE

```json
{
  "mesures": [
    {
      "id": 138671,
      "code_postal": "89000",
      "ville": "AUXERRE",
      "etablissement": null,
      "mandataire_id": 501,
      "created_at": "2020-07-24T08:15:19.937Z",
      "annee_naissance": "1989",
      "date_nomination": "2019-12-31T23:00:00.000Z",
      "date_fin_mesure": "2020-04-03T22:00:00.000Z",
      "etablissement_id": null,
      "ti_id": null,
      "numero_dossier": "45656456",
      "cabinet": null,
      "numero_rg": "RG234534534",
      "department_id": 90,
      "antenne_id": null,
      "service_id": null,
      "is_urgent": false,
      "judgment_date": null,
      "latitude": 47.8022,
      "longitude": 3.51709,
      "pays": "FR",
      "magistrat_id": null,
      "lieu_vie": "domicile",
      "type_etablissement": null,
      "civilite": "monsieur",
      "cause_sortie": "dessaisissement_famille",
      "nature_mesure": null,
      "champ_mesure": null,
      "date_premier_mesure": "2020-01-09T23:00:00.000Z",
      "date_protection_en_cours": "2020-01-09T23:00:00.000Z",
      "status": "en_cours",
      "resultat_revision": null,
      "etats": [
        {
          "id": 70,
          "mesure_id": 138671,
          "date_changement_etat": "2020-01-07T23:00:00.000Z",
          "nature_mesure": "curatelle_simple",
          "champ_protection": null,
          "lieu_vie": "domicile",
          "code_postal": "89000",
          "ville": "AUXERRE",
          "pays": "FR",
          "type_etablissement": null,
          "etablissement_siret": ""
        }
      ],
      "ressources": [
        {
          "id": 2,
          "annee": 2020,
          "niveau_ressource": 1000,
          "prestations_sociales": "[\"AAH\"]",
          "mesure_id": 138671
        }
      ]
    }
  ]
}
```

Retourne la liste de toutes les mesures associées à l'utilisateur.
Les mesures retournées sont triées, avec la mesure la plus récente apparaissant en premier.

### Paramètres

**status** (optionnel)

Retourne uniquement les mesures ayant ce status. Les valeurs possibles sont "en_attente", "en_cours", ou "eteinte".

### Retours

## Récupérer une mesure

> GET /api/editors/mesures/:id

```javascript
const token =
  "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tIiwidWlkIjoiRFRDWDhmNlBDOHljcmxvVTBmbDhWcUdGdWpzSXllVVhrTDZ4THBITXNHSXJJTmhEeXBVSnF5UnRPSEZzWlpwSmZ4VENLVFh0OEY2MTJraFFvclljTjhLUkg3SlBsbVdkWGpnMUZ0NHBQaG9GR1BoWjhqY3kyRldmYWNVazNkNmUiLCJ1c2VySWQiOjEzMDIsImVkaXRvcklkIjoiMSIsImVkaXRvclRva2VuIjoiZzV2ZzRtdXU0NnMiLCJpYXQiOjE1ODIxMDYwOTQsInN1YiI6IkRUQ1g4ZjZQQzh5Y3Jsb1UwZmw4VnFHRnVqc0l5ZVVYa0w2eExwSE1zR0lySU5oRHlwVUpxeVJ0T0hGc1pacEpmeFRDS1RYdDhGNjEya2hRb3JZY044S1JIN0pQbG1XZFhqZzFGdDRwUGhvRkdQaFo4amN5MkZXZmFjVWszZDZlIn0.HHcDnAYgL6gKhjFxSE1xy9sgf1OoNS2-E5EWnphwhDYhsE0nTM73XLjY_Tz1UsFcWSZPDwOGpsv-IfXwFdJZq0fZmhRW7atWQoMdBtB-djWF373XUP_pDK4whX014tLF9oJPxeX_xpDXT0-tue_HlOmUHzBx7LGhWUC_OlZ3PKqSLtJdvhvc0fbesJVo4TpGoCb4xYvIbsQtTI8yOIso9aUdbdv9azLoQQcjN0IYgn1PCEX3kI1tqRgTYNFQRrGIMqHNckF76PlRsJa7MJFhHlxogEqEgKUyvH85LODuyNEv6a8cx5qKUuz-jEHh3zEGbv9qqVwQ879O23GPMeHE4w";
const emjpmApiMesuresUrl =
  "https://test-api-v25-21-0-emjpm.dev.fabrique.social.gouv.fr/api/editors/mesures/1";

const response = await fetch(emjpmApiMesuresUrl, {
  headers: {
    Authorization: `Bearer ${token}`,
  },
});
```

> REPONSE

```json
{
  "id": 138671,
  "code_postal": "89000",
  "ville": "AUXERRE",
  "etablissement": null,
  "mandataire_id": 501,
  "created_at": "2020-07-24T08:15:19.937Z",
  "annee_naissance": "1989",
  "date_nomination": "2019-12-31T23:00:00.000Z",
  "date_fin_mesure": "2020-04-03T22:00:00.000Z",
  "etablissement_id": null,
  "ti_id": null,
  "numero_dossier": "45656456",
  "cabinet": null,
  "numero_rg": "RG234534534",
  "department_id": 90,
  "antenne_id": null,
  "service_id": null,
  "is_urgent": false,
  "judgment_date": null,
  "latitude": 47.8022,
  "longitude": 3.51709,
  "pays": "FR",
  "magistrat_id": null,
  "lieu_vie": "domicile",
  "type_etablissement": null,
  "civilite": "monsieur",
  "cause_sortie": "dessaisissement_famille",
  "nature_mesure": null,
  "champ_mesure": null,
  "date_premier_mesure": "2020-01-09T23:00:00.000Z",
  "date_protection_en_cours": "2020-01-09T23:00:00.000Z",
  "status": "en_cours",
  "resultat_revision": null,
  "etats": [
    {
      "id": 70,
      "mesure_id": 138671,
      "date_changement_etat": "2020-01-07T23:00:00.000Z",
      "nature_mesure": "curatelle_simple",
      "champ_protection": null,
      "lieu_vie": "domicile",
      "code_postal": "89000",
      "ville": "AUXERRE",
      "pays": "FR",
      "type_etablissement": null,
      "etablissement_siret": ""
    }
  ],
  "ressources": [
    {
      "id": 2,
      "annee": 2020,
      "niveau_ressource": 1000,
      "prestations_sociales": "[\"AAH\"]",
      "mesure_id": 138671
    }
  ]
}
```

Récupère la mesure associée à l'ID passé.

### Retours

Retourne l'objet [mesure](/?javascript#l-39-objet-mesure).
Si la mesure n'existe pas, une [erreur](/?javascript#errors) est retournée.

## Créer une mesure

> POST /api/editors/mesures

```javascript
const token =
  "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tIiwidWlkIjoiRFRDWDhmNlBDOHljcmxvVTBmbDhWcUdGdWpzSXllVVhrTDZ4THBITXNHSXJJTmhEeXBVSnF5UnRPSEZzWlpwSmZ4VENLVFh0OEY2MTJraFFvclljTjhLUkg3SlBsbVdkWGpnMUZ0NHBQaG9GR1BoWjhqY3kyRldmYWNVazNkNmUiLCJ1c2VySWQiOjEzMDIsImVkaXRvcklkIjoiMSIsImVkaXRvclRva2VuIjoiZzV2ZzRtdXU0NnMiLCJpYXQiOjE1ODIxMDYwOTQsInN1YiI6IkRUQ1g4ZjZQQzh5Y3Jsb1UwZmw4VnFHRnVqc0l5ZVVYa0w2eExwSE1zR0lySU5oRHlwVUpxeVJ0T0hGc1pacEpmeFRDS1RYdDhGNjEya2hRb3JZY044S1JIN0pQbG1XZFhqZzFGdDRwUGhvRkdQaFo4amN5MkZXZmFjVWszZDZlIn0.HHcDnAYgL6gKhjFxSE1xy9sgf1OoNS2-E5EWnphwhDYhsE0nTM73XLjY_Tz1UsFcWSZPDwOGpsv-IfXwFdJZq0fZmhRW7atWQoMdBtB-djWF373XUP_pDK4whX014tLF9oJPxeX_xpDXT0-tue_HlOmUHzBx7LGhWUC_OlZ3PKqSLtJdvhvc0fbesJVo4TpGoCb4xYvIbsQtTI8yOIso9aUdbdv9azLoQQcjN0IYgn1PCEX3kI1tqRgTYNFQRrGIMqHNckF76PlRsJa7MJFhHlxogEqEgKUyvH85LODuyNEv6a8cx5qKUuz-jEHh3zEGbv9qqVwQ879O23GPMeHE4w";
const emjpmApiMesuresUrl =
  "https://test-api-v25-21-0-emjpm.dev.fabrique.social.gouv.fr/api/editors/mesures en cours";

const response = await fetch(emjpmApiMesuresUrl, {
  method: "post",
  headers: {
    Authorization: `Bearer ${token}`,
  },
});
```

> REPONSE

```json
{
  "id": 138671,
  "code_postal": "89000",
  "ville": "AUXERRE",
  "etablissement": null,
  "mandataire_id": 501,
  "created_at": "2020-07-24T08:15:19.937Z",
  "annee_naissance": "1989",
  "date_nomination": "2019-12-31T23:00:00.000Z",
  "date_fin_mesure": "2020-04-03T22:00:00.000Z",
  "etablissement_id": null,
  "ti_id": null,
  "numero_dossier": "45656456",
  "cabinet": null,
  "numero_rg": "RG234534534",
  "department_id": 90,
  "antenne_id": null,
  "service_id": null,
  "is_urgent": false,
  "judgment_date": null,
  "latitude": 47.8022,
  "longitude": 3.51709,
  "pays": "FR",
  "magistrat_id": null,
  "lieu_vie": "domicile",
  "type_etablissement": null,
  "civilite": "monsieur",
  "cause_sortie": "dessaisissement_famille",
  "nature_mesure": null,
  "champ_mesure": null,
  "date_premier_mesure": "2020-01-09T23:00:00.000Z",
  "date_protection_en_cours": "2020-01-09T23:00:00.000Z",
  "status": "en_cours",
  "resultat_revision": null,
  "etats": [
    {
      "id": 70,
      "mesure_id": 138671,
      "date_changement_etat": "2020-01-07T23:00:00.000Z",
      "nature_mesure": "curatelle_simple",
      "champ_protection": null,
      "lieu_vie": "domicile",
      "code_postal": "89000",
      "ville": "AUXERRE",
      "pays": "FR",
      "type_etablissement": null,
      "etablissement_siret": ""
    }
  ],
  "ressources": [
    {
      "id": 2,
      "annee": 2020,
      "niveau_ressource": 1000,
      "prestations_sociales": "[\"AAH\"]",
      "mesure_id": 138671
    }
  ]
}
```

Créer une mesure avec les paramètres passés.
Tous les paramètres sont obligatoires sauf indiqué par `(optionnel)`.

### Paramètres

**annee_naissance** `number`

Année de naissance de la personne.

**antenne_id** `number` `optionnel`

ID de l'antenne du service.

**cause_sortie** `string`

Causes de sortie de la mesure de protection, les valeurs possibles sont "mainlevee", "deces", "caducite", "dessaisissement_famille", ou "dessaisissement_autre_mjpm".

**civilite** `string`

Civilité de la personne, les valeurs possibles sont "H" et "F".

**date_fin_mesure** `date`

**date_nomination** `date`

**date_premier_mesure** `date`

**date_protection_en_cours** `date`

**numero_dossier** `string`

Numéro de dossier de la mesure.

**numero_rg** `string`

Numéro RG de la mesure.

**tribunal_siret** `string`

Siret du tribunal ayant attribué la mesure de protection.

**tribunal_cabinet** `string` `optionnel`

Cabinet du tribunal ayant attribué la mesure de protection.

**etats** `array`

Historique des état d'une mesure de protection. Comprend les champs suivants:

- date_changement_etat: `string` `unique` Date de changement d'état de la protection (exemple: 2020-02-01)
- nature_mesure: `string` Nature de la mesure de protection, les valeurs possibles sont "curatelle_simple", "curatelle_renforcee", "tutelle", "sauvegarde_justice", "mesure_accompagnement_judiciaire", "subroge_curateur", "subroge_tuteur", "mandat_protection_future", ou "mesure_ad_hoc".
- champ_mesure: `string` Champ de la mesure de protection, les valeurs possibles sont "protection_bien", "protection_personne", ou "protection_bien_personne".

**ressources** `array`

Historique des mesures de protection. Comprend les champs suivants:

- annee `number` `optionnel`
- niveau_ressource: `number`
- prestations_sociales: `array` Liste des prestations sociales perçues, les valeurs possibles sont "AAH", "PCH", "ASI", "RSA", "ALS", "APL", "ASPA", ou "APA".

### Retours

Retourne l'objet [mesure](/?javascript#l-39-objet-mesure).
Si la mesure n'existe pas, une [erreur](/?javascript#errors) est retournée.

## Modifier une mesure

> PUT /api/editors/mesures/:id

```javascript
const token =
  "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tIiwidWlkIjoiRFRDWDhmNlBDOHljcmxvVTBmbDhWcUdGdWpzSXllVVhrTDZ4THBITXNHSXJJTmhEeXBVSnF5UnRPSEZzWlpwSmZ4VENLVFh0OEY2MTJraFFvclljTjhLUkg3SlBsbVdkWGpnMUZ0NHBQaG9GR1BoWjhqY3kyRldmYWNVazNkNmUiLCJ1c2VySWQiOjEzMDIsImVkaXRvcklkIjoiMSIsImVkaXRvclRva2VuIjoiZzV2ZzRtdXU0NnMiLCJpYXQiOjE1ODIxMDYwOTQsInN1YiI6IkRUQ1g4ZjZQQzh5Y3Jsb1UwZmw4VnFHRnVqc0l5ZVVYa0w2eExwSE1zR0lySU5oRHlwVUpxeVJ0T0hGc1pacEpmeFRDS1RYdDhGNjEya2hRb3JZY044S1JIN0pQbG1XZFhqZzFGdDRwUGhvRkdQaFo4amN5MkZXZmFjVWszZDZlIn0.HHcDnAYgL6gKhjFxSE1xy9sgf1OoNS2-E5EWnphwhDYhsE0nTM73XLjY_Tz1UsFcWSZPDwOGpsv-IfXwFdJZq0fZmhRW7atWQoMdBtB-djWF373XUP_pDK4whX014tLF9oJPxeX_xpDXT0-tue_HlOmUHzBx7LGhWUC_OlZ3PKqSLtJdvhvc0fbesJVo4TpGoCb4xYvIbsQtTI8yOIso9aUdbdv9azLoQQcjN0IYgn1PCEX3kI1tqRgTYNFQRrGIMqHNckF76PlRsJa7MJFhHlxogEqEgKUyvH85LODuyNEv6a8cx5qKUuz-jEHh3zEGbv9qqVwQ879O23GPMeHE4w";
const emjpmApiMesuresUrl =
  "https://test-api-v25-21-0-emjpm.dev.fabrique.social.gouv.fr/api/editors/mesures/1";

const response = await fetch(emjpmApiMesuresUrl, {
  method: "put",
  headers: {
    Authorization: `Bearer ${token}`,
  },
});
```

> REPONSE

```json
{
  "id": 138671,
  "code_postal": "89000",
  "ville": "AUXERRE",
  "etablissement": null,
  "mandataire_id": 501,
  "created_at": "2020-07-24T08:15:19.937Z",
  "annee_naissance": "1989",
  "date_nomination": "2019-12-31T23:00:00.000Z",
  "date_fin_mesure": "2020-04-03T22:00:00.000Z",
  "etablissement_id": null,
  "ti_id": null,
  "numero_dossier": "45656456",
  "cabinet": null,
  "numero_rg": "RG234534534",
  "department_id": 90,
  "antenne_id": null,
  "service_id": null,
  "is_urgent": false,
  "judgment_date": null,
  "latitude": 47.8022,
  "longitude": 3.51709,
  "pays": "FR",
  "magistrat_id": null,
  "lieu_vie": "domicile",
  "type_etablissement": null,
  "civilite": "monsieur",
  "cause_sortie": "dessaisissement_famille",
  "nature_mesure": null,
  "champ_mesure": null,
  "date_premier_mesure": "2020-01-09T23:00:00.000Z",
  "date_protection_en_cours": "2020-01-09T23:00:00.000Z",
  "status": "en_cours",
  "resultat_revision": null,
  "etats": [
    {
      "id": 70,
      "mesure_id": 138671,
      "date_changement_etat": "2020-01-07T23:00:00.000Z",
      "nature_mesure": "curatelle_simple",
      "champ_protection": null,
      "lieu_vie": "domicile",
      "code_postal": "89000",
      "ville": "AUXERRE",
      "pays": "FR",
      "type_etablissement": null,
      "etablissement_siret": ""
    }
  ],
  "ressources": [
    {
      "id": 2,
      "annee": 2020,
      "niveau_ressource": 1000,
      "prestations_sociales": "[\"AAH\"]",
      "mesure_id": 138671
    }
  ]
}
```

Modifie la mesure avec les paramètres passés.
Tous les paramètres non passées resteront inchangés.
Cette requête accepte quasiment les mêmes paramètres que pour la création d'une mesure.

### Paramètres

**annee_naissance** `number`

Année de naissance de la personne.

**antenne_id** `number` `optionnel`

ID de l'antenne du service.

**cause_sortie** `string`

Causes de sortie de la mesure de protection, les valeurs possibles sont "mainlevee", "deces", "caducite", "dessaisissement_famille", ou "dessaisissement_autre_mjpm".

**civilite** `string`

Civilité de la personne, les valeurs possibles sont "H" et "F".

**date_fin_mesure** `date`

**date_nomination** `date`

**date_premier_mesure** `date`

**date_protection_en_cours** `date`

**numero_dossier** `string`

Numéro de dossier de la mesure.

**numero_rg** `string`

Numéro RG de la mesure.

**tribunal_siret** `string`

Siret du tribunal ayant attribué la mesure de protection.

**tribunal_cabinet** `string` `optionnel`

Cabinet du tribunal ayant attribué la mesure de protection.

**etats** `array`

Historique des état d'une mesure de protection. Comprend les champs suivants:

- date_changement_etat: `string` `unique` Date de changement d'état de la protection (exemple: 2020-02-01)
- nature_mesure: `string` Nature de la mesure de protection, les valeurs possibles sont "curatelle_simple", "curatelle_renforcee", "tutelle", "sauvegarde_justice", "mesure_accompagnement_judiciaire", "subroge_curateur", "subroge_tuteur", "mandat_protection_future", ou "mesure_ad_hoc".
- champ_mesure: `string` Champ de la mesure de protection, les valeurs possibles sont "protection_bien", "protection_personne", ou "protection_bien_personne".

**ressources** `array`

Historique des mesures de protection. Comprend les champs suivants:

- annee `number` `optionnel`
- niveau_ressource: `number`
- prestations_sociales: `array` Liste des prestations sociales perçues, les valeurs possibles sont "AAH", "PCH", "ASI", "RSA", "ALS", "APL", "ASPA", ou "APA".

### Retours

Retourne l'objet [mesure](/?javascript#l-39-objet-mesure).
Si la mesure n'existe pas, une [erreur](/?javascript#errors) est retournée.

## Supprimer une mesure

> DELETE /api/editors/mesures/:id

```javascript
const token =
  "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tIiwidWlkIjoiRFRDWDhmNlBDOHljcmxvVTBmbDhWcUdGdWpzSXllVVhrTDZ4THBITXNHSXJJTmhEeXBVSnF5UnRPSEZzWlpwSmZ4VENLVFh0OEY2MTJraFFvclljTjhLUkg3SlBsbVdkWGpnMUZ0NHBQaG9GR1BoWjhqY3kyRldmYWNVazNkNmUiLCJ1c2VySWQiOjEzMDIsImVkaXRvcklkIjoiMSIsImVkaXRvclRva2VuIjoiZzV2ZzRtdXU0NnMiLCJpYXQiOjE1ODIxMDYwOTQsInN1YiI6IkRUQ1g4ZjZQQzh5Y3Jsb1UwZmw4VnFHRnVqc0l5ZVVYa0w2eExwSE1zR0lySU5oRHlwVUpxeVJ0T0hGc1pacEpmeFRDS1RYdDhGNjEya2hRb3JZY044S1JIN0pQbG1XZFhqZzFGdDRwUGhvRkdQaFo4amN5MkZXZmFjVWszZDZlIn0.HHcDnAYgL6gKhjFxSE1xy9sgf1OoNS2-E5EWnphwhDYhsE0nTM73XLjY_Tz1UsFcWSZPDwOGpsv-IfXwFdJZq0fZmhRW7atWQoMdBtB-djWF373XUP_pDK4whX014tLF9oJPxeX_xpDXT0-tue_HlOmUHzBx7LGhWUC_OlZ3PKqSLtJdvhvc0fbesJVo4TpGoCb4xYvIbsQtTI8yOIso9aUdbdv9azLoQQcjN0IYgn1PCEX3kI1tqRgTYNFQRrGIMqHNckF76PlRsJa7MJFhHlxogEqEgKUyvH85LODuyNEv6a8cx5qKUuz-jEHh3zEGbv9qqVwQ879O23GPMeHE4w";
const emjpmApiMesuresUrl =
  "https://test-api-v25-21-0-emjpm.dev.fabrique.social.gouv.fr/api/editors/mesures/1";

const response = await fetch(emjpmApiMesuresUrl, {
  method: "delete",
  headers: {
    Authorization: `Bearer ${token}`,
  },
});
```

> REPONSE

```json
{
  "affected_rows": 1
}
```

Supprime la mesure associé à l'ID passé.

### Retours

Retourne le nombre de mesures [mesure](/?javascript#l-39-objet-mesure) supprimées.
Si la mesure n'existe pas, une [erreur](/?javascript#errors) est retournée.

## Supprimer toutes les mesure

> DELETE /api/editors/mesures

```javascript
const token =
  "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwczovL2VtanBtLWVkaXRvci1kZW1vLm5ldGxpZnkuY29tIiwidWlkIjoiRFRDWDhmNlBDOHljcmxvVTBmbDhWcUdGdWpzSXllVVhrTDZ4THBITXNHSXJJTmhEeXBVSnF5UnRPSEZzWlpwSmZ4VENLVFh0OEY2MTJraFFvclljTjhLUkg3SlBsbVdkWGpnMUZ0NHBQaG9GR1BoWjhqY3kyRldmYWNVazNkNmUiLCJ1c2VySWQiOjEzMDIsImVkaXRvcklkIjoiMSIsImVkaXRvclRva2VuIjoiZzV2ZzRtdXU0NnMiLCJpYXQiOjE1ODIxMDYwOTQsInN1YiI6IkRUQ1g4ZjZQQzh5Y3Jsb1UwZmw4VnFHRnVqc0l5ZVVYa0w2eExwSE1zR0lySU5oRHlwVUpxeVJ0T0hGc1pacEpmeFRDS1RYdDhGNjEya2hRb3JZY044S1JIN0pQbG1XZFhqZzFGdDRwUGhvRkdQaFo4amN5MkZXZmFjVWszZDZlIn0.HHcDnAYgL6gKhjFxSE1xy9sgf1OoNS2-E5EWnphwhDYhsE0nTM73XLjY_Tz1UsFcWSZPDwOGpsv-IfXwFdJZq0fZmhRW7atWQoMdBtB-djWF373XUP_pDK4whX014tLF9oJPxeX_xpDXT0-tue_HlOmUHzBx7LGhWUC_OlZ3PKqSLtJdvhvc0fbesJVo4TpGoCb4xYvIbsQtTI8yOIso9aUdbdv9azLoQQcjN0IYgn1PCEX3kI1tqRgTYNFQRrGIMqHNckF76PlRsJa7MJFhHlxogEqEgKUyvH85LODuyNEv6a8cx5qKUuz-jEHh3zEGbv9qqVwQ879O23GPMeHE4w";
const emjpmApiMesuresUrl =
  "https://test-api-v25-21-0-emjpm.dev.fabrique.social.gouv.fr/api/editors/mesures";

const response = await fetch(emjpmApiMesuresUrl, {
  method: "delete",
  headers: {
    Authorization: `Bearer ${token}`,
  },
});
```

> REPONSE

```json
{
  "affected_rows": 10
}
```

Supprime toutes les mesures de l'utilisateur

### Retours

Retourne le nombre de mesures [mesure](/?javascript#l-39-objet-mesure) supprimées.

# Antennes (service)

## Lister toutes les antennes

> GET /api/editors/service-antennes

```javascript
const token =
  "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwOi8vbG9jYWxob3N0OjMwMDEiLCJ1aWQiOiJYRTFIdUc2Z2dEN2NJQmFsYnNsZTJWQndFR29GUmVHeTVEanZwUG4xeWZwSmFrU1VJNFpCZDR3d1lDU250NDBSNGZrRWxCc2dOTlJzZUVaYmpEVEgwa3dBY2NFZ2hUem9Mc3hyMEZEM1NuaGNOWHlKV1VyUE0xMm5lcEx1RTBqVCIsInVzZXJJZCI6NTI2LCJlZGl0b3JJZCI6IjIiLCJlZGl0b3JUb2tlbiI6Imw0YWJicGdrOWlyIiwiaWF0IjoxNTk3ODM0NDAwLCJzdWIiOiJYRTFIdUc2Z2dEN2NJQmFsYnNsZTJWQndFR29GUmVHeTVEanZwUG4xeWZwSmFrU1VJNFpCZDR3d1lDU250NDBSNGZrRWxCc2dOTlJzZUVaYmpEVEgwa3dBY2NFZ2hUem9Mc3hyMEZEM1NuaGNOWHlKV1VyUE0xMm5lcEx1RTBqVCJ9.Risb6k_jlZ9C8uVbIBFj8wbCGhQ3p_I8xlYeFLYoc_Ts0NACumgJIH32lN-rO1BxW0NNlVIhuNGwbWm0jbA-MpQhToh0bcq0An2rXtMeSNSbcyFLD-KNQpjhXbJq87W6sJMEZ7rt2YxgJUyCa-9l6wED1FrAKntDOsKZCxFJ7tBDTsmIsNmJVTpURP28wBTUbOaqkBrhQ4rNYQp34dUeQ49QqArjZIwlAmBR9EJQnQLunIKGtsvLnLfLB7Nz_MqCRWOsLkWdcsrrwIQMS3-VsBMJ36bT5i707c0VeSaKf_AtBP-sRUiX_rIFhPdRUXbEcSYAAnvCq_VkhJMjCN1m_Q";
const emjpmApiMesuresUrl =
  "https://test-api-v25-21-0-emjpm.dev.fabrique.social.gouv.fr/api/editors/service-antennes";

const response = await fetch(emjpmApiMesuresUrl, {
  headers: {
    Authorization: `Bearer ${token}`,
  },
});
```

> RESPONSE

```json
[
  {
    "id": 175,
    "nom": "OULLINS",
    "adresse": "12 RUE JACQUARD",
    "code_postal": "69600",
    "ville": "OULLINS"
  },
  {
    "id": 176,
    "nom": "RILLIEUX",
    "adresse": "1 RUE GABRIEL LADEVEZE",
    "code_postal": "69140",
    "ville": "RILLIEUX-LA-PAPE"
  },
  {
    "id": 174,
    "nom": "GRIGNY",
    "adresse": "10 RUE ROBESPIERRE",
    "code_postal": "69520",
    "ville": "GRIGNY"
  }
]
```

Retourne la liste de toutes les antennes associées à votre service.
