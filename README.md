# drone-luarocks

This is a [Drone](https://drone.io) plugin for uploading a Lua module as a self-contained package, called a rock, to [LuaRocks](https://luarocks.org).

**You have to clone the git and build the docker container manually. I'll upload it to Docker Hub in the next days**

## Docs

### Config

The following parameter are available to configure the plugin:

#### mandatory

* **rockspec** - full path of the `.rockspec` file
* **apikey** - the API key, which is needed for publishing the module at LuaRocks
    * it's highly recommnd to configure a [Secret](https://docs.drone.io/configure/secrets/) for this, to not expose it to the world

#### optional

* **lint** - runs `luarocks lint` before `luarocks upload` (**default:** `true`)
* **skippack** - skips packaging and only uploads the `.rockspec` file (**default:** `false`)
* **force** - the existing rock is overwritten, if the same version of the rock already exists (**default:** `false`)

## Examples

```yml
kind: pipeline
type: docker
name: default

steps:
- name: upload
  image: imo/drone-luarocks:0.1
  settings:
    rockspec: test_module-0.1-0.rockspec
    apikey:
      from_secret: lr_api_key
  when:
    event:
      include:
        - tag
      exclude:
        - pull_request
```

## Drone Version

* **>1.0** - works
* **0.8** - not tested
