component-static
---
example for single-page webapp

    ├── component.json      #define package
    ├── example.html
    ├── readme.md
    └── source
        ├── index.css       #main css
        ├── index.js        #main js
        ├── handler.js      #handler with history.pushState
        ├── tpl.js
        └── tpl
            ├── builder.js  #build ./*.jade > ../tpl.js
            ├── 404.jade
            ├── base.jade
            └── login.jade


install
---
    npm install component -g

    #1.build from source
    npm install jade
    git clone https://github.com/yanyaoer/component-static {{ static_path }}
    cd {{ static_path }}

    #2.get static_file only
    component install yanyaoer/component-static

    component install
    component build



example
---
    cd {{ static_path }}
    python -m SimpleHTTPServer 9001
    open -a http://0.0.0.0:9001/example.html


automate
---
    # add to .vimrc
    let $static_path = {{ static_path }}
    function! Static_build()
        if expand('%:e') == 'jade' 
            execute '!cd '.$static_path.'source/tpl/; node builder.js'
        endif
        execute '!cd '.$static_path.'; component build'
    endfunction
    au bufwritepost * if expand('%:p') =~ expand($static_path) | silent call Static_build() | endif

or write script with [visionmedia-watch](https://github.com/visionmedia/watch)


reference
---
[**component**](https://github.com/component/component)

[**backbone**](http://backbonejs.org) [github](http://github.com/jashkenas/backbone)

[**backbone.marionette**](http://marionettejs.com/) [github](https://github.com/marionettejs/backbone.marionette) [doc](https://github.com/marionettejs/backbone.marionette/tree/master/docs) [pattern](https://github.com/anthonybrown/advanced-backbone-patterns-and-techniques/tree/master/22-marionette)

[**zepto**](http://zeptojs.com)

[**jade**](http://jade-lang.com/)
