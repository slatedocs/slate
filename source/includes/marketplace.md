# Marketplace

Mautic 4 comes with a Marketplace directly in the Mautic administration user interface and command line interface as well.

## Marketplace under the hood

The Marketplace use [Packagist](https://packagist.org) and [Composer](https://getcomposer.org) v2 under the hood. Packagist API is used to list the Mautic plugins and find the plugin details. Composer v2 is used to install and update the plugins. Composer will take care of the dependencies of your plugin and also compatibility with different Mautic, PHP and other dependecies versions.

## How to list a plugin in the Mautic Marketplace

Specify some information in the [composer.json](https://getcomposer.org/doc/04-schema.md) file.

Here is an example composer.json file:
```json
{
  "name": "example-vendor/plugin-example",
  "description": "Example Plugin",
  "type": "mautic-plugin",
  "version": "1.0",
  "keywords": ["mautic","plugin","integration"],
  "extra": {
    "install-directory-name": "ExampleBundle"
  },
  "require": {
    "php": ">=7.4.0 <8.1",
    "ext-zip": "^1.15",
    "mautic/core-lib": "^4.0"
  }
}
```

In addition to the information you already have in the composer.json for your plugin add:
- `type` must have value `mautic-plugin`. The Marketplace is filtering PHP packages by this tag. It is required to show up in the Marketplace.
- `extra.install-directory-name` specifies the directory name for the bundle. Correct directory name is important for PSR4 autoloading. It must be the same as in the namespace in your PHP classes.
- `require.php` be sure to specify the PHP version range that you test the plugin against. Ideally it should be the same as the Mautic's [supported PHP versions](https://www.mautic.org/download/requirements). Do not allow users to install the plugin on versions that are not supported.
- `require.ext-*` if your plugin require some PHP extension, please list them in the require section too. No one knows on what servers your plugin will run on.
- `require.mautic/core-lib` it's important to specify which Mautic versions your plugin supports. Include only the versions you or your community have tested and confirmed the plugin works with.

When the composer.json is ready, follow the [Publishing Packages](https://packagist.org) section directly in Packagist.

## Best Practices

1. The Marketplace links to the GitHub repository. Make sure you have all the information your users need in the README.md file.
2. The GitHub repository should have issues enabled, so that your users are able to report issues and search for solutions. There is direct link to GitHub issues in the Marketplace.
3. Use GitHub releases. Tag every new version.
4. Write down changelog to all the GitHub releases. Again, the Marketplace links to all of them. Keep your users informed about what has changed in each version.
5. Write automatic unit and functional tests and run them automatically with a CI like [GitHub Actions](https://github.com/features/actions). Your users will appreciate the effort you put into stability.
6. Take an advantage of releasing alpha and beta versions when working on big changes. Example beta version: `1.2.0-beta`.
7. Use [semantic versioning](https://semver.org) starting with 1.0. Do not tie your plugin version with Mautic's version. Require section in composer.json specifies which Mautic versions your Plugin supports.
