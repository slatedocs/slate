---
title: Sportmaster Documentation

toc_footers:
  - <a href='https://github.com/lord/slate/wiki/Markdown-Syntax'>Updating docs? Read this!</a>
  - <a href='https://adapt.dk'>Powered by Adapt A/S</a>

includes:
  - sportmaster-fe
  - sportmaster-suite-docker

language_tabs:
  - shell

search: true
---

# Introduction

Welcome to the Sportmaster Documentation.

The documentation covers the overall infrastructure and details of the individual components in the realm of Sportmaster.

# Sportmaster 2.0
Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.

Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus.

Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.

# Rendering layer (web app)
Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.

Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.

# Service layer 2.0
## Branching strategy
+ PR's: Make pull requests against release branch.
+ Deploy to test: Merge release branch into test.
+ Deploy to prod: Merge release into prod and create new version tag.

# Service layer 1.0

## Architecture and process models

### System Architecture
[<img src="images/diagram-icon.jpg" width="25" height="25" />](https://github.com/adaptdk/sportmaster_service/wiki/images/SM-servicelayer.png)

### Application integration
### Import of node snippet
When the servicelayer receives an update from the Sportmaster PIM, a queue item is added. When the queue item is processed it sends a snippet of a node to the applications via REST. The code handling the adding of node snippets and the REST service, is in sl_client.  
Which fields to save on the node snippet is defined in sl_client_node_snippet_mapping_fields(). This should/will be moved to the servicelayer at one point.

### View product
On node load the application ask the servicelayer for the rest of the node via SLRestClient(). Node metadata such as body is loaded in at this point, as well as prices.

###  Calculate cart

### Get stock / update stock

### Caching
The prices retrieved from the servicelayer as cached both statically and in normal cache. It is important that both memcache and entitycache is enabled on the application to not poll the servicelayer unnecessarily.

### Flow chart
[<img src="images/diagram-icon.jpg" width="25" height="25" />](https://github.com/adaptdk/sportmaster_service/wiki/images/application_flow.png)

# Sportmaster hub (Content hub, commerce order handling)
Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.

Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.

# Rezet store
[Rezet store wiki (will be a part of this documentation in the future)](https://github.com/adaptdk/rezet-profile/wiki)

# Sportmaster 1.0
[Sportmaster 1.0 wiki (will be a part of this documentation in the future)](https://github.com/adaptdk/sportmaster/wiki)

