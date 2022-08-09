Redmine Lightbox
==================

This plugin lets you preview image (JPG, GIF, PNG, BMP) and PDF attachments in a lightbox.

This is a fork of paginagmbh's [redmine_lightbox](https://github.com/paginagmbh/redmine_lightbox2) plugin.

This fork for fix redmine 5.0 init error.


Installation and Setup
----------------------

* Clone or [download](https://github.com/nomadli/redmine_lightbox/releases) this repo into your **redmine_root/plugins/** folder
```
$ git clone git@github.com:nomadli/redmine_lightbox.git
```
* put code in folder `redmine/plugins/redmine_lightbox`
```
push redmine_root_path
  bundle install --without development test
  rake redmine:plugins:migrate RAILS_ENV=production
  touch x/redmine/tmp/restart.txt
pop
```

License
-------

*redmine_lightbox* plugin is developed under the [MIT License](LICENSE).
