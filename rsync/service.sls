# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "rsync/map.jinja" import rsync with context %}

rsync_service__service:
  service.{{ rsync.service.state }}:
    - name: {{ rsync.service.name }}
{% if rsync.service.state in [ 'running', 'dead' ] %}
    - enable: {{ rsync.service.enable }}
{% endif %}

