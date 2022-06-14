## Translations

Mautic uses INI files for translations.

HelloWorldBundle/<br />
- - - Translations/<br />
- - - - - - en_US/<br />
- - - - - - - - - messages.ini

<aside class="notice">
All plugins should include strings for the United States English locale (en_US) as it is the default for the system. 
</aside>

The directory structure for translations should be `Translations/locale/domain.ini`.
 
 
### Domains

Language strings can be organized into domains. Each domain should be its own file in the plugin's language locale folder(s). The plugin can use any domain it wants but Mautic makes consistent use of three domains:

Domain | Description
-------|------------
messages | Default domain for the translator service when no domain is specified
flashes | Domain for [flash messages](#flash-messages)
validators | Domain for [form validation](#validation) messages

### INI files

> Sample INI files

```
; plugins/HelloWorldBundle/Translations/en_US/messages.ini

plugin.helloworld.contact_us="Contact Us"
plugin.helloworld.goodbye="Goodbye and have a good day!"
plugin.helloworld.greeting="Hello %name%!"
plugin.helloworld.index="Hello World"
plugin.helloworld.manage_worlds="Manage Worlds"
plugin.helloworld.number_of_planets="{0}0 planets|{1}1 planet|]1,Inf[%planets% planets"
plugin.helloworld.world="World"
plugin.helloworld.worlds="%world% Description"
```

```
; plugins/HelloWorldBundle/Translations/en_US/flashes.ini

plugin.helloworld.notice.thank_you="Thank you %name% for your interest! We will be in contact soon." 
plugin.helloworld.notice.planet_demoted="%planet% has been demoted to a dwarf planet." 
plugin.helloworld.error.planet_demotion_failed="%planet% could not be demoted because the scientists say so."
```

General guidelines for the translation keys:

1. Segment the key using a period
2. Use underscores to separate words
3. Must be unique
4. Be short yet descriptive
5. Use all lowercase letters and numbers (no punctuation in the key other than period or underscore)

Guidelines for translation strings:

1. Wrap placeholders with %%
2. Use a single key for duplicate translation strings.
3. Use &quot; for double quotes
4. HTML is allowed

### Using the translator
Refer to the [translator service](#translator) to learn how to use translations in the code.

### Using the translator in your javascript
If your bundle implements custom javascript where translations are
required, you can get them by the `Mautic.translate(key, params)` method.

Create a `javascript.ini` in the same directory as the `messages.ini` as
described above. Any translation strings added to that file will be
available when translating in javascript.

For example, if your `javascript.ini` file contained the following
translation strings:

```ini
mautic.core.dynamic_content="Dynamic Content"
mautic.core.dynamic_content.new="Dynamic Content %number%"
```

You can request those translation strings in your javascript by
passing the key to the `Mautic.translate()` function.

```js
Mautic.translate("mautic.core.dynamic_content");
// outputs "Dynamic Content"
```

String interpolation for messages with variables works with js
translations just as you'd expect.

```js
Mautic.translate("mautic.core.dynamic_content.new", {number: 4});
// outputs "Dynamic Content 4"
```
