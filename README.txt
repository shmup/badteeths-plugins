badteeth's plugins for mushclient

----
Current dev workflow is like:

1) Run `make build` to generate my plugins.xml
2) Use an alias separate from plugins to reload, seen below

----
Paste this into aliases for convenience sake:

  <aliases>
    <alias
     match="hc-reload"
     enabled="y"
     group="dev"
     send_to="12"
     sequence="100"
    >
    <send>ReloadPlugin("HorseClock")</send>
    </alias>
  </aliases>

----
TODO

[x] - build a minimal plugin (make build)
[x] - support alias/triggers
[ ] - add timer example
[ ] - move plugin pertinent bits into single file
[ ] - tests?


