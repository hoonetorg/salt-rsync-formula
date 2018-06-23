# vim: sts=2 ts=2 sw=2 et ai
{% from "rsync/map.jinja" import rsync with context %}

{% for cron, cron_data in rsync.cron.items()|sort %}
rsync_cron__{{cron}}:
  cron.present:
    - identifier: '{{cron}}'
    - user: '{{cron_data.user|default('root')}}'
    - name: '{{cron_data.command}}'
    - minute: '{{ cron_data.minute|default('*') }}'
    - hour: '{{ cron_data.hour|default('*') }}'
    - daymonth: '{{ cron_data.daymonth|default('*') }}'
    - month: '{{ cron_data.month|default('*') }}'
    - dayweek: '{{ cron_data.dayweek|default('*') }}'
{% endfor %}
