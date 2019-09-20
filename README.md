Getting Started with Slate
------------------------------

### Prerequisites

You're going to need:

 - **Linux or macOS** — Windows may work, but is unsupported.
 - **Ruby, version 2.3.1 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

1. Fork this repository on GitHub.
2. Clone *your forked repository* (not our original one) to your hard drive with `git clone https://github.com/YOURUSERNAME/slate.git`
3. `cd slate`
4. Initialize and start Slate. You can either do this locally, or with Vagrant:

```shell
# either run this to run locally
bundle install
bundle exec middleman server

# OR run this to run with vagrant
vagrant up
```

You can now see the docs at http://localhost:4567. Whoa! That was fast!

Now that Slate is all set up on your machine, you'll probably want to learn more about [editing Slate markdown](https://github.com/lord/slate/wiki/Markdown-Syntax), or [how to publish your docs](https://github.com/lord/slate/wiki/Deploying-Slate).

If you'd prefer to use Docker, instructions are available [in the wiki](https://github.com/lord/slate/wiki/Docker).

###Example Documentation

Below is an example of a documented API.
Items in `{}` need to be replaced. E.g `{Title} = Records an investment tranche and triggers a transfer of funds to the Investment Manager`

<a name="{anchor}"></a>
## {Title}
```http
POST {url} HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

  {request body}

HTTP/1.1 200 OK
Content-Type: application/json

  {response body}
```
#### Description
{Description}

#### Request
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**{attribute}**  <br>*required*|{description}|string|

#### Response
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**{attribute}**|{description}|string|