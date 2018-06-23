# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "rsync/map.jinja" import rsync with context %}

/tmp/rsync.yaml:
  file.managed:
    - contents: |
        {{rsync|yaml(False)|indent(8)}}
