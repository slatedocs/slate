## Story Groups

*story-group* is the most important parameter to the stories API. This parameter indicates which set of stories you'd like to fetch. Currently, the story group can be *top*, or *published*, or *stack-\{{id}}*, corresponding to top stories, stories in published order and stacks respectively.

Story groups that are backed by a sorter can be sorted by


### *top* stories

The 'top stories' group is an infinitely long list. This first manually picks sorted stories from the list, then continues with stories in published order (reverse chronological).

### *published* stories

The 'published stories' group returns stories in published order (reverse chronological), skipping the order from the sorters.

### stacks

The stack stories will only return stories in the sorter. As an exception, if a sorter for a (stack / section) combination is empty, it will fall back to the stories in (stack / "Home")

### Behavior of various story groups

Various story groups behave slightly differently. Each story group typically has a sorter, except for 'published'.

| *story-group* | *"Home"* | *section* |
| :-----------: | -------- | --------- |
| top | Stories as per sorter, then stories reverse chronologically | Stories as per sorter, then stories in that section reverse chronologically |
| stack-id | Stories as per sorter | If the sorter has stories, then it returns the sorted stories. If the sorter is empty, it will return stories for the same stack in the "Home" section |

