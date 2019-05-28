<p align="center">
  <img src="https://raw.githubusercontent.com/lord/img/master/logo-slate.png" alt="Slate: API Documentation Generator" width="226">
  <br>
  <a href="https://travis-ci.org/lord/slate"><img src="https://travis-ci.org/lord/slate.svg?branch=master" alt="Build Status"></a>
</p>

<p align="center">Slate helps you create beautiful, intelligent, responsive API documentation.</p>

<p align="center"><img src="https://raw.githubusercontent.com/lord/img/master/screenshot-slate.png" width=700 alt="Screenshot of Example Documentation created with Slate"></p>

<p align="center"><em>The example above was created with Slate. Check it out at <a href="https://lord.github.io/slate">lord.github.io/slate</a>.</em></p>

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

### Document the APIs

First, edit rest-service/app.js and add the following code at the end of the file:
```
function searchRoutes(stack, root, routes) {
	stack.forEach(item => {
		if(item.route){
			const path = `${(root || '/')}${item.route.path.substr(1)}`;
			const methods = Object.keys(item.route.methods).filter(m => ['get','post','put','delete'].includes(m));
			const params = path.split('/').filter(part => part.substr(0,1) === ':');
			methods.forEach(method => {
				let obj = { path, method, params };
				routes.push(obj);
			})
		} else if(item.name === 'router' && item.regexp && item.regexp.source){
			let subpath = item.regexp.source.substr(3).replace(/[?].*/g,'').replace(/\\/g,'').replace(/\/\//g,'/');
			searchRoutes(item.handle.stack, (root || '/') + subpath, routes);
		}
	});
}
let routes = [];
searchRoutes(app._router.stack, null, routes);
routes = routes.sort((a , b) => a.path.localeCompare(b.path));
let output = '';
let ln = "\n";
let lastRootEntry = '';
for (let route of routes) {
	let entry;
	let partsDirty = route.path.split('/').filter(p => !!p && p !== 'api');
	let parts = partsDirty.filter(p => p.trim().substr(0,1) !== ':');
	if (parts && parts.length >= 1) {
		if (partsDirty.length >= 2) {
			if (parts.length >= 2) {
				entry = `${beautifyMethod(route.method)} ${parts.slice(1).join('/')}`;
			} else {
				entry = `${beautifyMethod(route.method)} by ${route.params.map(p=>p.replace(':','')).join('/')}`;
			}
			output += `## ${entry}${ln}${ln}`;
			printMethod(route);
		} else {
			entry = parts[0];
			if (entry !== lastRootEntry) {
				output += `# ${entry}${ln}${ln}`;
			}
			if (route.method === 'get') {
				output += `## ${beautifyMethod(route.method)} ${entry}${ln}${ln}`;
			} else {
				output += `## ${beautifyMethod(route.method)} ${entry.replace(/ies$/g,'y').replace(/s$/g,'')}${ln}${ln}`;
			}
			printMethod(route);
			lastRootEntry = entry;
		}

	}
}
function beautifyMethod(method) {
	let map = {
		get: 'Get',
		post: 'Post',
		put: 'Put',
		delete: 'Delete'
	}
	return map[method];
}
function printMethod(route) {
	output += `\`${route.method.toUpperCase()}\` ${route.path}${ln}`;
	output +=`${ln}\`\`\`shell${ln}#shell command:${ln}`;
	output += `curl${route.method !== 'get' ? ' -X ' + route.method.toUpperCase() : ''} \\${ln}`;
	output += `http://localhost:8002${route.path}?q=xyz \\${ln}`;
	output += `-H 'Content-Type: application/json' \\${ln}`;
	output += `-H 'x-access-token: '"$TOKEN"`;
	const body = route.method === 'get' ? '' : ` \\${ln} -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'`;
	output += body;
	output += `${ln}\`\`\`${ln}`;
	output +=`${ln}> The above command returns JSON structured like this: ${ln}`;
	output +=`${ln}\`\`\`json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}${ln}\`\`\`${ln}`;
	output += `${ln}Authorization: No Auth / x-access-token${ln}`;
	if (route.params.length > 0) {
		output += `${ln}Path parameters | Description ${ln}`;
		output += `-------------- | ----------- ${ln}`;
		output += `${route.params.join(` | xxx${ln}`)} | xxx${ln}`;
	}
	output += `${ln}Request headers | Description ${ln}`;
	output += `-------------- | ----------- ${ln}`;
	output += `x-access-token | JWT auth access token${ln}`;
	if (['post', 'put', 'delete'].includes(route.method)) {
		output += `${ln}Request body param | Description ${ln}`;
		output += `-------------- | ----------- ${ln}`;
		output += `${route.params.join(` | xxx${ln}`)} | xxx${ln}`;
	}
	output += `${ln}Response body param | Description ${ln}`;
	output += `-------------- | ----------- ${ln}`;
	output += `xxx | yyy${ln}`;
	output += `${ln}`;
}
console.log(output);
```

Then, edit /source/index.html.md with the list of APIs printed on the console by the code above.

Lastly, run 
```
cd /path/to/rest-service-docs/
bundle exec middleman build --clean
```

The command above generates the static docs in the `dist` folder, in case you want to manually upload it somewhere.

The script `deploy.sh` will build the static docs and push them to the `gh-pages` branch. That branch may be used to publish a Gihub Page with the docs. That branch may also be included as a submodule inside `rest-service`, in a subfolder named `docs` (for instance):
```
cd /path/to/rest-service
git submodule add -b gh-pages git@github.com:lumahealthhq/rest-service-docs.git
git push
```

The `dist` folder should not be committed to the repository.

### Note on JavaScript Runtime

For those who don't have JavaScript runtime or are experiencing JavaScript runtime issues with ExecJS, it is recommended to add the [rubyracer gem](https://github.com/cowboyd/therubyracer) to your gemfile and run `bundle` again.

Companies Using Slate
---------------------------------

* [NASA](https://api.nasa.gov)
* [Sony](http://developers.cimediacloud.com)
* [Best Buy](https://bestbuyapis.github.io/api-documentation/)
* [Travis-CI](https://docs.travis-ci.com/api/)
* [Greenhouse](https://developers.greenhouse.io/harvest.html)
* [Woocommerce](http://woocommerce.github.io/woocommerce-rest-api-docs/)
* [Dwolla](https://docs.dwolla.com/)
* [Clearbit](https://clearbit.com/docs)
* [Coinbase](https://developers.coinbase.com/api)
* [Parrot Drones](http://developer.parrot.com/docs/bebop/)
* [Scale](https://docs.scaleapi.com/)

You can view more in [the list on the wiki](https://github.com/lord/slate/wiki/Slate-in-the-Wild).

Questions? Need Help? Found a bug?
--------------------

If you've got questions about setup, deploying, special feature implementation in your fork, or just want to chat with the developer, please feel free to [start a thread in our Spectrum community](https://spectrum.chat/slate)!

Found a bug with upstream Slate? Go ahead and [submit an issue](https://github.com/lord/slate/issues). And, of course, feel free to submit pull requests with bug fixes or changes to the `dev` branch.

Contributors
--------------------

Slate was built by [Robert Lord](https://lord.io) while interning at [TripIt](https://www.tripit.com/).

Thanks to the following people who have submitted major pull requests:

- [@chrissrogers](https://github.com/chrissrogers)
- [@bootstraponline](https://github.com/bootstraponline)
- [@realityking](https://github.com/realityking)
- [@cvkef](https://github.com/cvkef)

Also, thanks to [Sauce Labs](http://saucelabs.com) for sponsoring the development of the responsive styles.

Special Thanks
--------------------
- [Middleman](https://github.com/middleman/middleman)
- [jquery.tocify.js](https://github.com/gfranko/jquery.tocify.js)
- [middleman-syntax](https://github.com/middleman/middleman-syntax)
- [middleman-gh-pages](https://github.com/edgecase/middleman-gh-pages)
- [Font Awesome](http://fortawesome.github.io/Font-Awesome/)


Troubleshooting
--------------------

### `gem install` not responding

This may be because wget prioritizes ipv6, but repo requires IPv4.
Solution: edit /etc/gai.conf and add:
```
precedence 2a04:4e42::0/32 5
```

### Fix "can't find header files for ruby"

* Linux: sudo apt-get install ruby2.5-dev

### Fix "can't find gem bundler (>= 0.a)"

Open Gemfile.lock, check which version it was BUNDLED WITH (ex.: 1.15.4) and run:
* gem install bundler -v 1.15.4

