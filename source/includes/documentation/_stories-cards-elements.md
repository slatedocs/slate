## Stories- Cards and Elements

Quintype provides a structured CMS system.
A story is comprised of cards, and cards contain story elements.

### Cards

Cardification is a new paradigm targetted towards mobile-first consumption of news. Short and concise chunked blocks of content tend to have much higher engagement. Quintype stories are split into multiple cards. Frontend applications can choose to represent these cards visually, allowing users to interact with these cards directly.

Any API request for stories contain the cards that comprise the story in the *"cards"* field (as an array). These cards comprise the body of the story.

###  Story Elements

Story elements are the smallest logical unit in the Quintype platform. Each story element represents a single paragraph of text, image, video, or other unit of content. Story elements form a card. Quintype also tracks these story elements and derives analytics reports based on user engagement on stories containing specific elements.

For eg: A story on tennis containing more photo story elements might get higher engagement.

The story elements can be found in the *"story-elements"* field of individual cards.

#### Story Element Types

Each story element has a *"type"*, and optionally a *"subtype"*. There are currently five major types of story elements, which all front end applications must support. They are as follows:

* text - a paragraph of text
* image - an image
* youtube-video - a video on youtube
* soundcloud-audio - a piece of audio on soundcloud
* title - a title for a card (listicle)
* jsembed - arbitrary, unsafe HTML
* composite - an element depending on other story elements

#### Story Element Subtypes

Story elements may also have a *"subtype"* field, which gives hints on rendering for clients that know how to render the subtype. For example, a *jsembed* element may have the *twitter* subtype. Looking at the metadata, you will find the *tweet-id* of the particular tweet. Clients may choose to render this element as a *jsembed*, or as a native twitter element (and provide optimizations such as ensuring that the twitter SDK is only loaded once).

### Story Types

Story type are predefined templates which can be used to write articles of various domains ranging from photo blogs, listicles, video stories, blogs etc. Story types give a definite structure and a "starting point" to authors when they start writing a story. They also help in predictive analytics. Data can be derived and studied based on audience engagement on various story types for different domains, for example, a photo story on wildlife may get higher engagement than a text story.

A story type may give subtle hints to the behaviour of the story. For example, a *live-blog* may choose to auto update every 30seconds.