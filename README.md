# docker-sculpin

[Sculpin](https://sculpin.io/) is a static site generator written in PHP.
This is a [docker](https://www.docker.io) image that eases setup.

## About sculpin

> *From [the official homepage](https://sculpin.io/):*

Sculpin is a static site generator written in PHP.
It converts Markdown files, Twig templates or standard HTML into a static HTML site that can be easily deployed.

Why Sculpin?

* PHP static site generator. Fast and easy to get started.
  If your language of choice is PHP, you'll feel right at home if you need to extend Sculpin.

* Embedded Composer. Forget about managing library versions manually!
  Sculpin embeds Composer to keep your source control focused and projects consistent.

* Twig templates. Twig is a full-featured modern template engine.
  It's simple to learn and it is extendable, documented, concise and flexible.

* Symfony's HTTP Kernel. Sculpin is built on it.
  This lets you use Symfony Bundles to extend Sculpin for any advanced functionality you need without extending Sculpin directly.

## Install

This docker image is available as a [trusted build on the docker index](https://index.docker.io/u/clue/sculpin/),
so using it is as simple as running:

```bash
$ docker run clue/sculpin
```

Running this command for the first time will download the image automatically.
Further runs will be immediate, as the image will be cached locally.

To further ease running, it's recommended to set up a much shorter `alias`
so that you can easily execute it as just `sculpin`:

```bash
$ alias sculpin='docker run -it --rm -p 8000:8000 -v `pwd`:/data -u `id -u` clue/sculpin'
```

This will create a temporary alias. In order to make it persist reboots,
you can append this exact line to your `~/.bashrc` (or similar) like this:

```bash
$ alias sculpin >> ~/.bashrc
```

While this might seem complicated at first, it's actually a rather common setup following docker's conventions:

* `-it` will run an interactive session that can be terminated with CTRL+C
* `--rm` will run a temporary session that will make sure to remove the container on exit
* `-p 8000:8000` will expose sculpin's built-in webserver on your system
* `-v $(pwd):/data` will mount your current directory into the working directory inside the container
* `-u $(id -u)` will make sure that all files will be created with the same access rights as on your system
* `clue/sculpin` the name of this docker image

## Usage

Once [installed](#install), running sculpin is as simple as if it was installed manually.

You can invoke it like this:

```bash
$ sculpin list
```

### Getting started

If you're new to sculpin, you should probably jump straight to their [getting started guide](https://sculpin.io/getstarted/):

```bash
$ git clone https://github.com/sculpin/sculpin-blog-skeleton.git myblog
$ cd myblog
```

### Run sculpin

> From the [official getting started guide](https://sculpin.io/getstarted/)

```bash
$ sculpin generate --watch --server
```

The watch flag tells Sculpin to watch the files for changes, and when changed to re-generate the site automatically.
`server` launches PHP's web server which lets you see your work in progress from http://localhost:8000.
After having run this command, a new directory, `output_dev`, will appear in your project, folder.
