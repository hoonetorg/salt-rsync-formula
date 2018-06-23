# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "rsync/map.jinja" import rsync with context %}

rsync_install__pkg:
  pkg.installed:
    - pkgs: {{ rsync.pkgs }}
