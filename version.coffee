fs = require 'fs'
path = require 'path'
crypto = require 'crypto'

jade = require 'jade'

CACHE = {}


get_content = (filename)->
  fs.readFileSync filename, encoding:'utf-8'

get_hash = (filename)->
  shasum =  crypto.createHash 'md5'
  if fs.existsSync filename
    buf = fs.readFileSync filename
  else
    buf = filename
  shasum.update buf.toString()
  shasum.digest 'hex'


hash_url = (url)->
  # remove queryString & hash
  url = url.split('#')[0] if url.indexOf('#') isnt -1
  url = url.split('?')[0] if url.indexOf('?') isnt -1
  abspath = url
  abspath = '.' + abspath if abspath[0] is '/'
  if CACHE[url]
    return CACHE[url]
  sha = get_hash abspath
  sha = sha[...5]
  CACHE[url] = [url, '?v=', sha].join('')

buildCss = ->
  target = path.join __dirname, 'build/build.css'
  re = /url\(['"]?([^'"\)]+)['"]?\)/igm
  content = get_content(target)
  ret = content.replace re, (word, args..., source)->
    url = args[0]
    word.replace url, hash_url url
  fs.writeFileSync target, ret
  console.log '\tbuild:', target
  ret

buildTpl = ->
  tpl = path.join __dirname, 'example.jade'
  target = path.join __dirname, 'example.html'
  re = /<(link|script)[^>]*?(src|href)=['"]([^'"]+)['"]/igm
  content = jade.compile(get_content(tpl), pretty:true)()
  ret = content.replace re, (word, args..., source)->
    url = args[2]
    word.replace url, hash_url url
  #console.log ret
  fs.writeFileSync target, ret
  console.log '\tbuild:', target
  ret


init = ->
  buildCss()
  buildTpl()


init()