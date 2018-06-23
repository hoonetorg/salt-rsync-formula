# -*- coding: utf-8 -*-
# vim: ft=sls

include:
  - rsync.install
  - rsync.config
  - rsync.service

extend:
  rsync_config__conffile:
    file:
      - require:
        - pkg: rsync_install__pkg
  rsync_config__defaultsfile:
    file:
      - require:
        - pkg: rsync_install__pkg
  rsync_service__service:
    service:
      - watch:
        - file: rsync_config__conffile
        - file: rsync_config__defaultsfile
      - require:
        - pkg: rsync_install__pkg

