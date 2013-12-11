docker-scrapyd
==============

Dockerfile for building an image that runs scrapyd

Building
--------

```
$ docker build -t scrapyd .
```

Running
-------

```
$ docker run -p 6800 scrapyd
```

If you want to persist logs or scraped items export files, add a volume
to `/var/log/scrapyd` and `var/lib/scrapyd`:

```
$ docker run -p 6800 -v [hostpath]/lib:/var/lib/scrapyd -v [hostpath]/log:/var/log/scrapyd scrapyd
```

Replace [hostpath] with an absolute path to a directory in your host machine.
