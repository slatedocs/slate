# Courses

## Get All Courses

```shell
curl "https://www.codeschool.com/api/v1/courses.json"
  -H "Authorization: OAuth poopoopoo"
```

> The above command returns JSON structured like this:

```json
[
  {
    "position": 31,
    "title": "Anatomy of Backbone.js",
    "path_id": 2,
    "hero_background_color": "E1D2B0",
    "large_badge_url": "https://d1ffx7ull4987f.cloudfront.net/images/courses/large_badge/11/anatomy-of-backbone-js-9856061c43aad32b00081bcc3bad4c19.png",
    "state": "available",
    "id": 11,
    "short_description": "Build sophisticated applications with Backbone.js.",
    "levels": [
    {
      "videos_count": 1,
      "title": "Introduction",
      "course_id": 11,
      "id": 15,
      "badge_image_url": "https://d1ffx7ull4987f.cloudfront.net/images/achievements/large_badge/95/level-1-on-anatomy-of-backbone-js-36ec7d2d22da9f5931ac1f209bea8b8a.png",
      "videos": [
      {
        "position": 1,
        "files": [
        {
          "url": "http://projector.codeschool.com/videos/e0d993a1.mp4?profile=720p&site=codeschool&sso=xVGAugGRYFL0EZTImUx0pNqQqbhtOdU1f7lnuZHwbwaASb032yePCbn9EgxqGIiBQ6bSd-aP-6PJRANUvpFQBOLvpf1XdIzNEpOJLaFH67oSRrPc3Dck641n_F1OKq-x",
          "type": "video/mp4",
          "quality": "hd"
        },
        {
          "url": "http://projector.codeschool.com/videos/e0d993a1.mp4?profile=480p&site=codeschool&sso=xVGAugGRYFL0EZTImUx0pNqQqbhtOdU1f7lnuZHwbwaASb032yePCbn9EgxqGIiBQ6bSd-aP-6PJRANUvpFQBOLvpf1XdIzNEpOJLaFH67oSRrPc3Dck641n_F1OKq-x",
          "type": "video/mp4",
          "quality": null
        },
        {
          "url": "http://projector.codeschool.com/videos/e0d993a1.webm?profile=WebM&site=codeschool&sso=xVGAugGRYFL0EZTImUx0pNqQqbhtOdU1f7lnuZHwbwaASb032yePCbn9EgxqGIiBQ6bSd-aP-6PJRANUvpFQBOLvpf1XdIzNEpOJLaFH67oSRrPc3Dck641n_F1OKq-x",
          "type": "video/webm",
          "quality": null
        }
        ],
        "name": null,
        "embed_id": "e0d993a1"
      }
      ],
      "description": "Learn the very basic of Models and Views."
    },
    {
      "videos_count": 1,
      "title": "Models",
      "course_id": 11,
      "id": 16,
      "badge_image_url": "https://d1ffx7ull4987f.cloudfront.net/images/achievements/large_badge/96/level-2-on-anatomy-of-backbone-js-f604b8c7b406b55d8605d5089ab0db58.png",
      "videos": [
      {
        "position": 1,
        "files": [
        {
          "url": "http://projector.codeschool.com/videos/ba76ca21.mp4?profile=720p&site=codeschool&sso=hHe97nkEgaSfjzTljNJDMVtZSitUE_L3gPKJEFlf9bNvkw56i3aG_0TcCh1pw0hMcxJLZ4I1YM3wdlWdcAzTza-ei8INB7gpgQrJ7nUiQ2vFqBC74FARO2EuHudjTnv3",
          "type": "video/mp4",
          "quality": "hd"
        },
        {
          "url": "http://projector.codeschool.com/videos/ba76ca21.mp4?profile=480p&site=codeschool&sso=hHe97nkEgaSfjzTljNJDMVtZSitUE_L3gPKJEFlf9bNvkw56i3aG_0TcCh1pw0hMcxJLZ4I1YM3wdlWdcAzTza-ei8INB7gpgQrJ7nUiQ2vFqBC74FARO2EuHudjTnv3",
          "type": "video/mp4",
          "quality": null
        },
        {
          "url": "http://projector.codeschool.com/videos/ba76ca21.webm?profile=WebM&site=codeschool&sso=hHe97nkEgaSfjzTljNJDMVtZSitUE_L3gPKJEFlf9bNvkw56i3aG_0TcCh1pw0hMcxJLZ4I1YM3wdlWdcAzTza-ei8INB7gpgQrJ7nUiQ2vFqBC74FARO2EuHudjTnv3",
          "type": "video/webm",
          "quality": null
        }
        ],
        "name": null,
        "embed_id": "ba76ca21"
      }
      ],
      "description": "More on Models, such as syncing to/from the server."
    },
    {
      "videos_count": 1,
      "title": "Views",
      "course_id": 11,
      "id": 17,
      "badge_image_url": "https://d1ffx7ull4987f.cloudfront.net/images/achievements/large_badge/97/level-3-on-anatomy-of-backbone-js-09ab6edbd467f21de5c3ceb782af3584.png",
      "videos": [
      {
        "position": 1,
        "files": [
        {
          "url": "http://projector.codeschool.com/videos/cdf7ef9b.mp4?profile=720p&site=codeschool&sso=4_ta7q-qzOvy30yflImOvVaQ4PmTKalaRPHdq1sNv6vzQe3RC0ZMAAWaWXZltK_3uqn6XZS1BEZE7s1gbL39txsjXSt1cna-f5f21FQNYi-1a-5YThUQwTcv-PEmGJgB",
          "type": "video/mp4",
          "quality": "hd"
        },
        {
          "url": "http://projector.codeschool.com/videos/cdf7ef9b.mp4?profile=480p&site=codeschool&sso=4_ta7q-qzOvy30yflImOvVaQ4PmTKalaRPHdq1sNv6vzQe3RC0ZMAAWaWXZltK_3uqn6XZS1BEZE7s1gbL39txsjXSt1cna-f5f21FQNYi-1a-5YThUQwTcv-PEmGJgB",
          "type": "video/mp4",
          "quality": null
        },
        {
          "url": "http://projector.codeschool.com/videos/cdf7ef9b.webm?profile=WebM&site=codeschool&sso=4_ta7q-qzOvy30yflImOvVaQ4PmTKalaRPHdq1sNv6vzQe3RC0ZMAAWaWXZltK_3uqn6XZS1BEZE7s1gbL39txsjXSt1cna-f5f21FQNYi-1a-5YThUQwTcv-PEmGJgB",
          "type": "video/webm",
          "quality": null
        }
        ],
        "name": null,
        "embed_id": "cdf7ef9b"
      }
      ],
      "description": "View events, templates, and customization."
    },
    {
      "videos_count": 1,
      "title": "Models & Views",
      "course_id": 11,
      "id": 18,
      "badge_image_url": "https://d1ffx7ull4987f.cloudfront.net/images/achievements/large_badge/98/level-4-on-anatomy-of-backbone-js-b0439992b1fb8eacb8dab41169f2e6c5.png",
      "videos": [
      {
        "position": 1,
        "files": [
        {
          "url": "http://projector.codeschool.com/videos/703569c4.mp4?profile=720p&site=codeschool&sso=QXGQroR_ahAWpE69F1rH1ByI8oSxZ-XKQFPX8YB22arF1suUkGTIYeeXzbTOZ17-NoEAjEJAr5p9XgBpCPGaBQEuc7Z7-F5pUCvyhteQRsC8-JXUS5r0eVYBQ7AN5sAr",
          "type": "video/mp4",
          "quality": "hd"
        },
        {
          "url": "http://projector.codeschool.com/videos/703569c4.mp4?profile=480p&site=codeschool&sso=QXGQroR_ahAWpE69F1rH1ByI8oSxZ-XKQFPX8YB22arF1suUkGTIYeeXzbTOZ17-NoEAjEJAr5p9XgBpCPGaBQEuc7Z7-F5pUCvyhteQRsC8-JXUS5r0eVYBQ7AN5sAr",
          "type": "video/mp4",
          "quality": null
        },
        {
          "url": "http://projector.codeschool.com/videos/703569c4.webm?profile=WebM&site=codeschool&sso=QXGQroR_ahAWpE69F1rH1ByI8oSxZ-XKQFPX8YB22arF1suUkGTIYeeXzbTOZ17-NoEAjEJAr5p9XgBpCPGaBQEuc7Z7-F5pUCvyhteQRsC8-JXUS5r0eVYBQ7AN5sAr",
          "type": "video/webm",
          "quality": null
        }
        ],
        "name": null,
        "embed_id": "703569c4"
      }
      ],
      "description": "More on how Models and Views work together with event binding."
    },
    {
      "videos_count": 1,
      "title": "Collections",
      "course_id": 11,
      "id": 19,
      "badge_image_url": "https://d1ffx7ull4987f.cloudfront.net/images/achievements/large_badge/99/level-5-on-anatomy-of-backbone-js-b4322a933a6ca04bf0203b140e2754fb.png",
      "videos": [
      {
        "position": 1,
        "files": [
        {
          "url": "http://projector.codeschool.com/videos/391e7ac7.mp4?profile=720p&site=codeschool&sso=_7tbYbUDWy-kiGramkPtRkpUocHl_BZVa-_5gsq8zAFDORWMdqbhusntKCwBaVjy97zYZ09HTrLGCd2GaW5AaSROQe1YYhZVrGlpqETujAfm7RDCEGEvyDW8WHleC0kk",
          "type": "video/mp4",
          "quality": "hd"
        },
        {
          "url": "http://projector.codeschool.com/videos/391e7ac7.mp4?profile=480p&site=codeschool&sso=_7tbYbUDWy-kiGramkPtRkpUocHl_BZVa-_5gsq8zAFDORWMdqbhusntKCwBaVjy97zYZ09HTrLGCd2GaW5AaSROQe1YYhZVrGlpqETujAfm7RDCEGEvyDW8WHleC0kk",
          "type": "video/mp4",
          "quality": null
        },
        {
          "url": "http://projector.codeschool.com/videos/391e7ac7.webm?profile=WebM&site=codeschool&sso=_7tbYbUDWy-kiGramkPtRkpUocHl_BZVa-_5gsq8zAFDORWMdqbhusntKCwBaVjy97zYZ09HTrLGCd2GaW5AaSROQe1YYhZVrGlpqETujAfm7RDCEGEvyDW8WHleC0kk",
          "type": "video/webm",
          "quality": null
        }
        ],
        "name": null,
        "embed_id": "391e7ac7"
      }
      ],
      "description": "Working with a set of models with Backbone Collections."
    },
    {
      "videos_count": 1,
      "title": "Collection Views",
      "course_id": 11,
      "id": 20,
      "badge_image_url": "https://d1ffx7ull4987f.cloudfront.net/images/achievements/large_badge/100/level-6-on-anatomy-of-backbone-js-1b739602227cd9332cfaacbf9a7ea05d.png",
      "videos": [
      {
        "position": 1,
        "files": [
        {
          "url": "http://projector.codeschool.com/videos/cefc91d4.mp4?profile=720p&site=codeschool&sso=6JAVaiSOrvDwmc6aNiN1nAAaaV06NI1g_EKVioy2cYoeZG-mgowNIC1a3c0zHLO1xuA37DAkpiFL0o4ziFIkezJrdYofmRajRj0UGcgK9a3dWiyWfAUv-ifAMwHLbyRB",
          "type": "video/mp4",
          "quality": "hd"
        },
        {
          "url": "http://projector.codeschool.com/videos/cefc91d4.mp4?profile=480p&site=codeschool&sso=6JAVaiSOrvDwmc6aNiN1nAAaaV06NI1g_EKVioy2cYoeZG-mgowNIC1a3c0zHLO1xuA37DAkpiFL0o4ziFIkezJrdYofmRajRj0UGcgK9a3dWiyWfAUv-ifAMwHLbyRB",
          "type": "video/mp4",
          "quality": null
        },
        {
          "url": "http://projector.codeschool.com/videos/cefc91d4.webm?profile=WebM&site=codeschool&sso=6JAVaiSOrvDwmc6aNiN1nAAaaV06NI1g_EKVioy2cYoeZG-mgowNIC1a3c0zHLO1xuA37DAkpiFL0o4ziFIkezJrdYofmRajRj0UGcgK9a3dWiyWfAUv-ifAMwHLbyRB",
          "type": "video/webm",
          "quality": null
        }
        ],
        "name": null,
        "embed_id": "cefc91d4"
      }
      ],
      "description": "Displaying a Collection with a Collection View."
    },
    {
      "videos_count": 1,
      "title": "Router & History",
      "course_id": 11,
      "id": 21,
      "badge_image_url": null,
      "videos": [
      {
        "position": 1,
        "files": [
        {
          "url": "http://projector.codeschool.com/videos/eb4ad630.mp4?profile=720p&site=codeschool&sso=VWCp3uSkPoHmjdD_ngyXyuPLWn06qSWFvz7DNjBN7RNQ39THhxRvm2tMYdtB_yH9qc5YvpDeIgzJdZyW09SHfsKVbwslaZiTUufTPjlRcPjCdN7yopwG8l0zDDZJedrO",
          "type": "video/mp4",
          "quality": "hd"
        },
        {
          "url": "http://projector.codeschool.com/videos/eb4ad630.mp4?profile=480p&site=codeschool&sso=VWCp3uSkPoHmjdD_ngyXyuPLWn06qSWFvz7DNjBN7RNQ39THhxRvm2tMYdtB_yH9qc5YvpDeIgzJdZyW09SHfsKVbwslaZiTUufTPjlRcPjCdN7yopwG8l0zDDZJedrO",
          "type": "video/mp4",
          "quality": null
        },
        {
          "url": "http://projector.codeschool.com/videos/eb4ad630.webm?profile=WebM&site=codeschool&sso=VWCp3uSkPoHmjdD_ngyXyuPLWn06qSWFvz7DNjBN7RNQ39THhxRvm2tMYdtB_yH9qc5YvpDeIgzJdZyW09SHfsKVbwslaZiTUufTPjlRcPjCdN7yopwG8l0zDDZJedrO",
          "type": "video/webm",
          "quality": null
        }
        ],
        "name": null,
        "embed_id": "eb4ad630"
      }
      ],
      "description": "Supporting pushState history and multiple URLs."
    }
    ],
    "credits": "- **Eric Allam, Gregg Pollack** *Professors*\r\n- **Justin Mezzell** *Designers*\r\n- **Nick Walsh** *Front-end Development*\r\n- **Eric Allam, Adam Fortuna, Dray Lacy** *Challenge Implementation*\r\n- **Less Films** *Video Production*",
    "long_description": "Learn Backbone.js and start building sophisticated and structured web apps. Try out Backbone’s JavaScript library with a RESTful JSON interface.",
    "small_badge_url": "https://d1ffx7ull4987f.cloudfront.net/images/courses/small_badge/11/anatomy-of-backbone-js-b960cb594b7a9d5f854d00c10f2dbb47.png",
    "hero_theme": "light",
    "videos_count": 7
  },
  { ... },
  { ... }
]
```

This endpoint retrieves all Courses.

### HTTP Request

`GET https://www.codeschool.com/api/v1/courses`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
fake_release | false | If set to true, the result will include a fake release from yesterday and bust the cache. This is useful to test your interface for the event of a course release.
