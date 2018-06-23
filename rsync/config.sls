# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "rsync/map.jinja" import rsync with context %}

rsync_config__conffile:
  file.managed:
    - name: {{ rsync.conffile }}
    - source: salt://rsync/files/configtempl.jinja
    - template: jinja
    - context:
      confdict: {{rsync.config|json}}
    - mode: 644
    - user: root
    - group: root


rsync_config__defaultsfile:
  file.managed:
    - name: {{rsync.sysconfdir}}/{{ rsync.defaultsfile }}
    - source: salt://rsync/files/configtempl.jinja
    - template: jinja
    - context:
      confdict: {{rsync.defaults|json}}
    - mode: 644
    - user: root
    - group: root


