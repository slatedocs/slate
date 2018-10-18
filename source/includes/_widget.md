# Widget

## Implementation guide

```shell
```

> Add scripts:

```js
<script defer async src="https://learn.filtered.com/hubfs/<magpie_library>.js" type="text/javascript"></script>
<script defer async onload="mpInIt()" src="https://learn.filtered.com/hubfs/<magpie_widget_library>.js" type="text/javascript"></script>
```

> Initialise magpie-widget:

```js
<script>
    // function gets called when script has loaded
  function mpInIt() {
    // Pass configurations to magpie-widget
    Magpie.widget.config({
      theme: {...},
      selector: 'app-magpie-widget',
      jwt: {
        token: '...',
        apiKey: '...',
      }
    });
    // Save instance into const
    const lib = Magpie.widget.new();
    // Render instance
    lib.render();

    return lib;
  }

  // capability to update jwt token
  const mp = mpInIt();
  mp.updateJwt({
    token: '...',
    apiKey: '...',
  });

  // Other methods available
  // mp.unmount()
  // mp.render()
</script>
```
