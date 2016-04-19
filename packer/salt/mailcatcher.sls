mailcatcher-stack:
  pkg.installed:
    - pkgs:
      - rubygems-integration
      - ruby2.0-dev
      - build-essential
      - supervisor

mailcatcher:
  gem.installed:
    - name: mailcatcher
  require:
    - pkg: mailcatcher-stack

## Usually, in master mode, you would ensure supervisor updates
## Here we don't care since its a packed VM that will update on boot time :

mailcatcher-daemon:
   file.managed:
     - name: /etc/supervisor/conf.d/mailcatcher.conf
     - source: salt://resources/superivsor-mailcatcher.conf
     - require:
       - gem: mailcatcher

