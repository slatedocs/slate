# FAQs

## What happens if users connect to their donation?

In the response of the `POST /donations` request a `connectUrl` attribute is returned. This allows a user to connect to the injected meals with its ShareTheMeal user (new or existing). When this connection happens, we link the `providerUserId` you send as part of the request payload to the particular ShareTheMeal user.

When the same user (i.e. with the same `providerUserId`) triggers another meal injection, we assign the donation to its user profile on ShareTheMeal directly, so the user doesn't need to click the connect URL received for his second donation to be claimed.

_We've added an additional response parameter for this: "isShareTheMealUser" which is `true` in case the user connected to a previous donation - and is `false` for first time injections for a particular providerUserId (or if previous injections of that providerUserId haven't been connected yet)._

<aside class="warning">
When using a sandbox access key (starting with “test”), “isShareTheMealUser” will always be false.
</aside>

## Can we receive different image formats or videos?

Short videos for ThankYou messages, in addition to a still image, can be provided in the future for some campaigns. Depending on the nature of the campaign, we won’t have videos available each time and depending on the technical capabilities of the user’s device and bandwidth costs at the user, a partner implementation should always allow to fall back to the default still image.

Different technical formats (e.g. webp, jpeg, …) of the ThankYou still image and different sizes or compression levels can be requested based on the request parameters (see Images API).

Videos for different campaigns are not returned yet in the GET /campaigns response. We can potentially include the short looping videos like the ones being shown in the ShareTheMeal app “home cards”. It’s currently a fixed format .mp4 H.264 encoded loopable video of approximately 1-2 MB in size.
