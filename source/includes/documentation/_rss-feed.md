## RSS Feed

The stories RSS feed can be used to syndicate stories out from the CMS

### End point
* `/stories.rss` -> end point for RSS feed
* This end point generates RSS feed for last four hours

### Supported parameters
1. Parameter to fetch stories with different time durations
   * `/stories.rss?time-period=last-24-hours` -> Fetches RSS feed with stories from last 24 hours
   * `/stories.rss?time-period=last-7-days` -> Fetches RSS feed with stories from last 7 days
   * `/stories.rss?time-period=last-1-month` -> Fetches RSS feed with stories from last 1 month

2. Parameter to fetch stories by section slug
   * **section slug** can be obtained from `api/v1/config`
   * `/stories.rss?section=section-slug` -> Ex: `/stories.rss?section=sponsored-content` This end point
     fetches stories from _Sponsored Content_ section.

3. Parameter to fetch stories by section id(Preferable way to fetch stories by section)
   * **section id** can be obtained from `api/v1/config`
   * `/stories.rss?section-id=id` -> Ex: `/stories.rss?section-id=2809` This end point
     fetches stories from _Sponsored Content_ section.

4. Parameter to skip syndicated stories
   * `/stories.rss?skip=value` -> This removes syndicated stories from a particular source; Example `/stories.rss?skip=bloomberg` on bloombergquint skips stories syndicated from bloomberg
   * `/stories.rss?skip=all` -> This all value as parameter removes all syndicated stories
   * This parameter supports comma separated values; Example `/stories.rss?skip=bloomberg,thequint` -> This filters out stories syndicated from bloomberg, thequint on bloomberg quint

5. Parameter to fetch stories from a sorter
   * `/stories.rss?story-group=story-group` -> This fetches stories by sorter.
   * The **story group** for any sorter can be obtained from `api/v1/config`
   * This doesn't have the time limit of 4 hours. This just pulls the stories from a sorter.

6. Parameters to fetch stories by excluding stories from particular section(s).
   * `/stories.rss?exclude-section-ids=section-ids` -> This fetches stories by excluding stories from section-id(s) lister; Example: `/stories.rss?exclude-section-ids=2435` this fetches stories and filters out stories(if there are any) with section id 2435.
   * **section-ids** can be obtained from `/api/v1/config`
   * this parameter supports multiple sections ids as comma separated values. This helps filtering out stories based on multiple sections
