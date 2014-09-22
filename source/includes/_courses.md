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
    "id": 1,
    "path_id": 1,
    "state": "available",
    "title": "Rails for Zombies Redux",
    "position": 1,
    "short_description": "Ruby on Rails is an open-source web framework that's optimized for programmer happiness and sustainable productivity.  Learning Rails for the first time should be fun, and Rails for Zombies allows you to get your feet wet and start learning how to build web applications.",
    "long_description": "Ruby on Rails is an open-source web framework that allows developers to quickly create maintainable web applications, while leveraging the power of the Ruby language.  In this course, Gregg Pollack from Envy Labs will walk you the basics of learning Ruby on Rails in five levels, each of which is followed by a series of code challenges where you get to start coding Rails immediately in the browser.",
    "videos_count": 8,
    "level_ids": [
      1,
      2,
      3,
      4,
      5
    ],
    "levels": [
      {
        "id": 1,
        "course_id": 1,
        "title": "Deep in the Crud",
        "description": "How we work with a database in Rails by using Create, Read, Update, and Destroy (CRUD).",
        "badge_image_url": null,
        "videos_count": 1,
        "projector_videos": [
          {
            "embed_id": "aa93fd80",
            "name": null,
            "position": 1,
            "files": [
              {
                "url": "http://projector.dev/videos/aa93fd80.mp4?profile=720p&site=codeschool&sso=NBS4mYxHZO1bSlh9zx8Lt8CClJy4MG5HpepvHAF_YRNMPXC_mjwUYMMk9x1X_zPS8pbrmvPTIy977OJJNecJ-aZof-yzEwb7V1OTLB2wLx8i9bdYFbG3W9gu5x4kRD61",
                "quality": "hd",
                "type": "video/mp4"
              },
              {
                "url": "http://projector.dev/videos/aa93fd80.mp4?profile=480p&site=codeschool&sso=NBS4mYxHZO1bSlh9zx8Lt8CClJy4MG5HpepvHAF_YRNMPXC_mjwUYMMk9x1X_zPS8pbrmvPTIy977OJJNecJ-aZof-yzEwb7V1OTLB2wLx8i9bdYFbG3W9gu5x4kRD61",
                "quality": null,
                "type": "video/mp4"
              },
              {
                "url": "http://projector.dev/videos/aa93fd80.webm?profile=WebM&site=codeschool&sso=NBS4mYxHZO1bSlh9zx8Lt8CClJy4MG5HpepvHAF_YRNMPXC_mjwUYMMk9x1X_zPS8pbrmvPTIy977OJJNecJ-aZof-yzEwb7V1OTLB2wLx8i9bdYFbG3W9gu5x4kRD61",
                "quality": null,
                "type": "video/webm"
              }
            ]
          }
        ],
      },
      { ... },
      { ... },
      { ... },
      { ... }
    ],
    "credits": "",
    "assets": {
      "hero": {
        "small": "https://www.codeschool.com/assets/fallback/default_course_hero_thumb.jpg",
        "large": "https://www.codeschool.com/assets/fallback/default_course_hero.jpg",
        "theme": "light",
        "background_color": "EFEFF1"
      },
      "background": {
        "large": "https://www.codeschool.com/assets/fallback/default_course_background.png"
      },
      "featured_banner": {
        "large": "https://www.codeschool.com/assets/fallback/default_featured_banner.png"
      },
      "video_placeholder": {
        "large": "https://www.codeschool.com/assets/fallback/default_video_placeholder.png"
      },
      "badge": {
        "small": "https://www.codeschool.com/assets/fallback/default_course_badge.png",
        "large": "https://www.codeschool.com/assets/fallback/default_course_badge_small.png"
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
