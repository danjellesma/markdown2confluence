[![](https://images.microbadger.com/badges/image/danjellz/markdown2confluence.svg)](http://microbadger.com/#/images/danjellz/markdown2confluence "Get your own image badge on microbadger.com") [![GitHub issues](https://img.shields.io/github/issues/danjellesma/docker-markdown2confluence.svg)](https://github.com/danjellesma/docker-markdown2confluence/issues) [![GitHub stars](https://img.shields.io/github/stars/danjellesma/docker-markdown2confluence.svg)](https://github.com/danjellesma/docker-markdown2confluence/stargazers) [![GitHub forks](https://img.shields.io/github/forks/danjellesma/docker-markdown2confluence.svg)](https://github.com/danjellesma/docker-markdown2confluence/network) [![CircleCI](https://circleci.com/gh/danjellesma/markdown2confluence/tree/master.svg?style=svg)](https://circleci.com/gh/danjellesma/markdown2confluence/tree/master) [![](https://images.microbadger.com/badges/version/danjellz/markdown2confluence.svg)](http://microbadger.com/#/images/danjellz/markdown2confluence "Get your own version badge on microbadger.com")

# Markdown2Confluence

Run a Docker image to easily convert Markdown files to Atlassian Confluence markup language without the need to install Ruby, Gems, etc. I've personally found this to generate better Confluence markup vs the built in importer.

## Basic Functionality

To see basic functionality, run without arguments:

``` bash
docker run -it --rm danjellz/markdown2confluence
```


Output:

``` ruby
h1. Markdown2Confluence

h2. test.md

HORRARY, It&#39;s working!

[https://hub.docker.com/r/danjellz/markdown2confluence/]

This is the built in test for danjellz/markdown2confluence, calling a file that you mounted on the Docker container.

* What list?
* THIS LIST!

{{monospace text}}

{code:bash}
echo "Hello!"
{code}

This is some Ruby code.

{code:ruby}
User.first.update(admin: true)

# Variables and expressions.
a = 10
b = 3 * a + 2
printf("%d %d\n", a, b);

# Type is dynamic.
b = "A string"
c = 'Another String'
print b + " and " + c + "\n"
{code}

h2. This is a nice heading

What a nice heading
```


#### Mounting & Parsing Your Markdown

To use a file in your current `$(PWD)`, mount the volume and specify the file name:

``` bash
docker run -it --rm -v $(PWD):/markdown danjellz/markdown2confluence my-markdown-file.md
```

## Tips

#### Alias
Creating an alias in your `~/.bashrc` or `~/.zshrc` files can make this command much shorter. Example:

``` bash
alias md2con="docker run -it --rm -v `PWD`:/markdown danjellz/markdown2confluence"
```

Allowing you to run the following to parse a Markdown file in your current directory

``` bash
md2con some-markdown-file.md
```

#### Copy to clipboard

If on OSX, you can pipe the output to PBCopy to automatically copy the Confluence markup to your clipboard
``` bash
docker run -it --rm -v $(PWD):/markdown danjellz/markdown2confluence my-markdown-file.md | pbcopy
```

#### Source:

Uses the NPM package found here:
https://www.npmjs.com/package/markdown2confluence
