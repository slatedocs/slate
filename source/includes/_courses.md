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
    "id": 18,
    "path_id": 1,
    "state": "available",
    "title": "Rails for Zombies Redux",
    "position": 46,
    "short_description": "Learn Ruby on Rails, an open-source framework.",
    "long_description": "Learn Ruby on Rails, an open-source framework for the Ruby programming language. Rails for Zombies will teach you all the Rails basics with a zombie flair.",
    "videos_count": 8,
    "level_ids": [
      44,
      45,
      46,
      47,
      48
    ],
    "levels": [{
      "id": 44,
      "course_id": 18,
      "title": "Deep in the Crud",
      "description": "How we work with a database in Rails by using Create, Read, Update, and Destroy (CRUD).",
      "badge_image_url": "https://d1ffx7ull4987f.cloudfront.net/images/achievements/large_badge/134/level-1-on-rails-for-zombies-redux-2ba020b1379910903e2f8724a8199404.png",
      "videos_count": 1,
      "projector_videos": [
        {
          "embed_id": "aa93fd80",
          "accessible": true,
          "name": null,
          "position": 1,
          "files": [
            {
              "url": "http://projector.codeschool.com/videos/aa93fd80.mp4?profile=720p&site=codeschool&sso=TC0o8AIEhqUMnMk_BYpub84yvzrSEOPfh2RwtMyqQXySZck4h7Pe5JX8dDEqi9zdSmzHj7YJZF5ao-VMiCXieG2VNiSE-aD9dbE3dCeuSOd6LX2ykVcSmSgG5HVW3pBN",
              "quality": "hd",
              "type": "video/mp4"
            },
            {
              "url": "http://projector.codeschool.com/videos/aa93fd80.mp4?profile=480p&site=codeschool&sso=TC0o8AIEhqUMnMk_BYpub84yvzrSEOPfh2RwtMyqQXySZck4h7Pe5JX8dDEqi9zdSmzHj7YJZF5ao-VMiCXieG2VNiSE-aD9dbE3dCeuSOd6LX2ykVcSmSgG5HVW3pBN",
              "quality": null,
              "type": "video/mp4"
            },
            {
              "url": "http://projector.codeschool.com/videos/aa93fd80.webm?profile=WebM&site=codeschool&sso=TC0o8AIEhqUMnMk_BYpub84yvzrSEOPfh2RwtMyqQXySZck4h7Pe5JX8dDEqi9zdSmzHj7YJZF5ao-VMiCXieG2VNiSE-aD9dbE3dCeuSOd6LX2ykVcSmSgG5HVW3pBN",
              "quality": null,
              "type": "video/webm"
            }
          ]
        }
      ]
      },
      { ... },
      { ... },
      { ... },
      { ....}
    ],
    "has_level_videos": true,
    "credits": "- **Gregg Pollack** *Professors*\r\n- **Eric Allam, Nathaniel Bibler, Jacob Swanner** *Content Contributors*\r\n- **Justin Mezzell** *Designers*\r\n- **Drew Barontini, Nick Walsh** *Front-end Development*\r\n- **Eric Allam, Thomas Meeks** *Challenge Implementation*\r\n- **Less Films** *Video Production*",
    "assets": {
      "hero": {
        "small": "https://d1ffx7ull4987f.cloudfront.net/images/courses/hero_thumb/18/rails-for-zombies-redux-133ebe5308469dbf7fc55c3208fc1510.jpg",
        "large": "https://d1ffx7ull4987f.cloudfront.net/images/courses/hero/18/rails-for-zombies-redux-b2bb101849f45c5d75456d6e472b0074.jpg",
        "theme": "dark",
        "background_color": "010201"
      },
      "badge": {
        "small": "https://d1ffx7ull4987f.cloudfront.net/images/achievements/small_badge/133/completed-rails-for-zombies-redux-b38672b90d56f64b757add36ea7cb850.png",
        "large": "https://d1ffx7ull4987f.cloudfront.net/images/achievements/large_badge/133/completed-rails-for-zombies-redux-0f73c361c3d5070ca2fa7951e65cbf39.png"
      }
    }
  }
]
```

This endpoint retrieves all Courses.

### HTTP Request

`GET https://www.codeschool.com/api/v1/courses`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
fake_release | false | If set to true, the result will include a fake release from yesterday and bust the cache. This is useful to test your interface for the event of a course release.
