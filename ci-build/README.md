# Deploy to pages with CI

With CI build you can easily create and build your repository documentation without cloning/forking/including slate repository.

## Getting started (TRAVIS CI and GITHUB)

To use this deployment method you will need an account on [Travis CI](https://travis-ci.org/) (100% free for open source projects)

1. On your `master` branch create a folder named `docs`

2. Create a branch called `gh-pages` (if not present)

3. If you don't have CI in your project just copy `.travis.yml` file in your repository root. If you already have CI in your project, you will have to adjust your `.travis.yml`

4. Add your repository to Travis CI - [Tutorial](https://docs.travis-ci.com/user/tutorial/)

5. Generate and set your GITHUB_TOKEN - [Create a token](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line) - [Set Env var](https://docs.travis-ci.com/user/environment-variables/)

6. Now you are ready to create your pages in the `docs/` folder as you would do in a standard slate fork

7. Push changes and see them live when the CI build is finished! (don't forget to enable pages for your project)


### Notes
 - This solution is designed to work only with Github and Travis CI, no other CI platform is supported. You can always use the `.travis.yml` as the base idea for your own platform
 - The push on `gh-pages` branch deletes everything on that branch and leaves only the files built from slate


## Example Folder Structure

Master struture

```
> a_dir/
> docs/
    - index.html.md 
> .travis.yml
> README.MD
```

Everything in `docs/` will be used to override the standard `source/` files.