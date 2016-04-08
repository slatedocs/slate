# Dialogs
Dialogs can be used to ask the user for confirmation or input a value. Use them instead of `window.alert`, `window.confirm`, `window.prompt`.

**Unlike `window.alert`, Front dialogs are asynchronous and expect a callback.**

## Alert

```javascript
Front.alert({
    title: 'Title of the alert',
    message: 'Body of the alert.',
    okTitle: 'Label of the OK button (optional)'
}, function () {
    console.log('User clicked OK.');
});
```

The `Front.alert()` method displays an alert dialog with the optional specified content and an OK button.

## Confirm

```javascript
Front.confirm({
    title: 'Title of the confirm dialog',
    message: 'Body of the dialog.',
    okTitle: 'Label of the OK button (optional)',
    cancelTitle: 'Label of the OK button (optional)'
}, function (confirmed) {
    console.log('User confirmed?', confirmed);
});
```

The `Front.confirm()` method displays a modal dialog with an optional message and two buttons, OK and Cancel.

The callback will received a `confirmed` boolean, indicating whether the user clicked OK or Cancel.

## Prompt

```javascript
Front.prompt({
    title: 'Title of the confirm dialog',
    message: 'Body of the dialog.',
    okTitle: 'Label of the OK button (optional)',
    cancelTitle: 'Label of the OK button (optional)'
}, function (val) {
    console.log('User entered:', val);
});
```

The `Front.prompt()` method displays a dialog with an optional message prompting the user to input some text.

The callback will receive a `val` with the text entered by the user (or `null` if the user canceled).

## Prompt Date

```javascript
var position = {
    left: event.screenX - window.screenX,
    top: event.screenY - window.screenY,
};

Front.promptDate({
    position: position,
    val: defaultDate,
    before: forceSelectionBefore,
    after: forceSelectionAfter
}, function (date) {
    console.log('User selected:', date);
}));
```

The `Front.promptDate()` method displays a dialog to select a date. It will pass the callback a JavaScript Date (or false if the user canceled):

## Item List

```javascript
Front.fuzzylist({
    items: [
        {title: 'Options 1'},
        {title: 'Options 2'},
        {title: 'Options 3'}
    ]
}, function (item) {
    if (item)
        console.log('User selected', item.title);
    else
        console.log('User canceled');
});
```

The `Front.fuzzylist()` method displays a list of elements with a search field (for quick selection).

You can pass extra parameters in addition of `title`. They will still be in the item when the callback is called.

## Copy to Clipboard

```javascript
Front.copyToClipboard('payload');
```

This method will copy a string to the user's clipboard.
