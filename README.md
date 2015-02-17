Pallycon Docs 요약
=================

## MD 파일
- `source/ko`와 `source/en` 두 폴더를 생성해서 각 언어로 작성한 MD파일을 넣었습니다.
- "docs.pallycon.com/ko"로 접속하면 `ko/index.md`에 해당하는 컨텐츠를 읽습니다.
- index.md의 `includes:` 영역에서는 이 언어로 된 가이드문서들을 차례대로 명시합니다.
- index.md의 `toc-fotters:` 영역에서는 추가할 링크들을 명시합니다.
- index.md의 `search:` 값을 `true`로 설정하면, 검색기능이 추가됩니다. (영단어에 대한 검색만 가능하고, 검색결과가 신통치는 않습니다. `lunr.js`의 기능을 사용합니다.)
- 코드블럭(\```)은 오른쪽 영역에 나타납니다.
- 강조가 필요할 때는 aside 태그를 활용합니다. notice, success, warning이 가능합니다.  
관련 가이드 : https://github.com/tripit/slate/wiki/Markdown-Syntax#notes-and-warnings

## 설정 파일
- `config.rb`는 프로젝트 전체에 대한 설정파일입니다. 디렉토리 경로나 마크다운 옵션 등을 지정할 수 있습니다.
- `layouts/layout.erb`는 보여질 페이지의 레이아웃을 [middleman](https://middlemanapp.com/)의 문법으로 정의합니다.

## 커스터마이징 이력
- 한글 url 포함
 - `source/javascripts/lib/jquery.tocify.js` 440번째 줄 주석처리
 - `lib/redcarpet_header_fix.rb` 3번째 줄에 정규식 추가 `gsub(/[^a-zA-Z0-9가-힣\-_]/, '')`

- TOC 헤더 조정
 - `source/javascripts/app/toc.js` 10번째 줄에 h3 추가 : **h3까지 TOC에 노출**
 - `source/stylesheets/screen.css.scss` 192번째 줄부터 : 최초 display 여부, 레벨별 들여쓰기 추가
 - 관련 가이드 : https://github.com/tripit/slate/wiki/Deeper-Nesting





Slate
========

[![Build Status](https://travis-ci.org/tripit/slate.svg?branch=master)](https://travis-ci.org/tripit/slate) [![Dependency Status](https://gemnasium.com/tripit/slate.png)](https://gemnasium.com/tripit/slate)

Slate helps you create beautiful API documentation. Think of it as an intelligent, responsive documentation template for your API.

<img src="https://dl.dropboxusercontent.com/u/95847291/github%20images/slate/slate_screenshot_new.png" width=700 alt="Screenshot of Example Documentation created with Slate">

*The example above was created with Slate. Check it out at [tripit.github.io/slate](http://tripit.github.io/slate).*

Features
------------

* **Clean, intuitive design** — with Slate, the description of your API is on the left side of your documentation, and all the code examples are on the right side. Inspired by [Stripe's](https://stripe.com/docs/api) and [Paypal's](https://developer.paypal.com/webapps/developer/docs/api/) API docs. Slate is responsive, so it looks great on tablets, phones, and even print.

* **Everything on a single page** — gone are the days where your users had to search through a million pages to find what they wanted. Slate puts the entire documentation on a single page. We haven't sacrificed linkability, though. As you scroll, your browser's hash will update to the nearest header, so linking to a particular point in the documentation is still natural and easy.

* **Slate is just Markdown** — when you write docs with Slate, you're just writing Markdown, which makes it simple to edit and understand. Everything is written in Markdown — even the code samples are just Markdown code blocks!

* **Write code samples in multiple languages** — if your API has bindings in multiple programming languages, you easily put in tabs to switch between them. In your document, you'll distinguish different languages by specifying the language name at the top of each code block, just like with Github Flavored Markdown!

* **Out-of-the-box syntax highlighting** for [almost 60 languages](http://rouge.jayferd.us/demo), no configuration required.

* **Automatic, smoothly scrolling table of contents** on the far left of the page. As you scroll, it displays your current position in the document. It's fast, too. We're using Slate at TripIt to build documentation for our new API, where our table of contents has over 180 entries. We've made sure that the performance remains excellent, even for larger documents.

* **Let your users update your documentation for you** — by default, your Slate-generated documentation is hosted in a public Github repository. Not only does this mean you get free hosting for your docs with Github Pages, but it also makes it's simple for other developers to make pull requests to your docs if they find typos or other problems. Of course, if you don't want to, you're welcome to not use Github and host your docs elsewhere!

Getting starting with Slate is super easy! Simply fork this repository, and then follow the instructions below. Or, if you'd like to check out what Slate is capable of, take a look at the [sample docs](http://tripit.github.io/slate).

<!--As an example, you can check out the [TripIt API docs](http://tripit.github.io/api), which we create with Slate. You can also view the source of the [markdown file used to generate it](http://github.com/tripit/api/blob/master/source/index.md).-->

Getting Started with Slate
------------------------------

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 1.9.3 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

 1. Fork this repository on Github.
 2. Clone *your forked repository* (not our original one) to your hard drive with `git clone https://github.com/YOURUSERNAME/slate.git`
 3. `cd slate`
 4. Install all dependencies: `bundle install`
 5. Start the test server: `bundle exec middleman server`

You can now see the docs at <http://localhost:4567>. Whoa! That was fast!

Now that Slate is all set up your machine, you'll probably want to learn more about [editing Slate markdown](https://github.com/tripit/slate/wiki/Markdown-Syntax), or [how to publish your docs](https://github.com/tripit/slate/wiki/Deploying-Slate).

Examples of Slate in the Wild
---------------------------------

* [Travis-CI's API docs](http://docs.travis-ci.com/api/)
* [Mozilla's localForage docs](http://mozilla.github.io/localForage/)
* [Mozilla Recroom](http://mozilla.github.io/recroom/)
* [ChaiOne Gameplan API docs](http://chaione.github.io/gameplanb2b/#introduction)
* [Drcaban's Build a Quine tutorial](http://drcabana.github.io/build-a-quine/#introduction)
* [PricePlow API docs](https://www.priceplow.com/api/documentation)
* [Emerging Threats API docs](http://apidocs.emergingthreats.net/)
* [Appium docs](http://appium.io/slate/en/master)
* [Golazon Developer](http://developer.golazon.com)
* [Dwolla API docs](https://docs.dwolla.com/)
* [RozpisyZapasu API docs](http://www.rozpisyzapasu.cz/dev/api/)
* [Codestar Framework Docs](http://codestarframework.com/documentation/)

(Feel free to add your site to this list in a pull request!)

Need Help? Found a bug?
--------------------

Just [submit a issue](https://github.com/tripit/slate/issues) to the Slate Github if you need any help. And, of course, feel free to submit pull requests with bug fixes or changes.


Contributors
--------------------

Slate was built by [Robert Lord](http://lord.io) while at [TripIt](http://tripit.com).

Thanks to the following people who have submitted major pull requests:

- [@chrissrogers](https://github.com/chrissrogers)
- [@bootstraponline](https://github.com/bootstraponline)

Also, thanks to [Sauce Labs](http://saucelabs.com) for helping sponsor the project.

Special Thanks
--------------------
- [Middleman](https://github.com/middleman/middleman)
- [jquery.tocify.js](https://github.com/gfranko/jquery.tocify.js)
- [middleman-syntax](https://github.com/middleman/middleman-syntax)
- [middleman-gh-pages](https://github.com/neo/middleman-gh-pages)
- [Font Awesome](http://fortawesome.github.io/Font-Awesome/)
