# Style Editor

## Introducing Style Editor

Style Editor allows users to customize the look and feel of their Bigcommerce store, without the need to know HTML/CSS. Using a simple WYSIWYG interface, users can edit colors and fonts, then see the changes simultaneously in a live preview.

Style Editor uses LESS as a CSS preprocessor, allowing it to take advantage of variables and other functions to ensure design consistency.

## What is LESS?

LESS is a CSS preprocessor that allows theme designers to use advanced functions and programming principles in their CSS. A javascript compiler runs over the LESS files and converts them into usable CSS that can be included in themes.

For more information on examples, techniques, and how to install LESS, go to [lesscss.org](http://lesscss.org/)

## Integrating a theme with the Style Editor

The Style Editor uses a specific group of files to build its User Interface, and to compile and generate the stylesheet. Bigcommerce’s developer theme, Blueprint, already contains these out of the box. The files are stored in the Styles/less directory.

The files the Style Editor depends on are:

*   `style-editor-variables.less`
*   `internal-variables.less`
*   `init.less`
*   `theme.less`

### style-editor-variables.less

Style Editor uses this file to generate its User Interface. Here, you can enter variables for colours, fonts and numbers that will help the merchant customize the design of the theme. You can separate these variables out into sections with headings to help categorise the variables in a logical manner. No actual CSS is written in this file.

There are some syntax patterns involved that Style Editor will understand to help you customise the UI. Special syntax:

`@color-your-text-here` — This is the naming convention for a color variable. The style editor will generate this as a color picker, with the value of the variable set as the color picker’s default hexadecimal color value.

e.g.

`
@color-header-background: #FFFFFF;
`

This will generate a color picker with the label “Header Background”, set to #FFFFFF (white) by default.

`@font-your-text-here` — This is the naming convention for a font variable. The style editor will generate this as a dropdown, preloaded with your theme’s predefined fonts. The variable’s value will be preselected.

e.g.

```
@font-page-text: "Open Sans",Helvetica,Arial,sans-serif;
```

This will generate a dropdown with the label “Page Text”, and with the “Open Sans” font preselected. The dropdown’s other options will be the predefined list of fonts you’ve provided.

`@font-declaration` — This variable will store all the default fonts (and their fallbacks) for the style editor. It will use these fonts in the font dropdown mentioned in the above point.

e.g.

```
@font-declaration: '{ "Lato":["Lato", "Arial", "sans-serif"], "Freckle Face":["Freckle Face", "cursive"]}';
```

This will populate all font dropdowns with the fonts “Lato” and “Freckle Face”, and if one of them is selected, the fonts for that variable will be set to the values in the corresponding array of fonts, e.g. “Lato” will set the fonts to “Lato”, Arial, sans-serif.

To use these fonts in the Style Editor, they must be included in the style editor variables file through an import. For the above example, I’ve included the styles from google fonts like so:

```
@import url(//fonts.googleapis.com/css?family=Lato|Freckle+Face);
```

`@color-declaration` — This variable will store all the default colors for the style editor. It will list these colours in the color picker’s palette after all the color picker’s defaults.

e.g.

```
@color-declaration: '["#FF7700, #9966CC" ]';
```

This will add a shade of orange and a shade of purple to the end of the list of colors selectable in the color picker.

`//! @section: your text here` — You can group variables into sections with headings using this syntax to help your users read and understand your variables more easily.

e.g.

`//! @section: Header`  
`@color-header-background: #FFF;`  
`//! @endsection`  of

This will create a section in the left navigation with the title “Header”, which will house the “Header Background” variable.

More information on syntax, and examples, can be found in the comments of the style-editor-variables.less file found in Blueprint.

### internal-variables.less

This file is for you to store the variables that you may need to use, but don’t want the Style editor to see. For example, you can use it to create a hierarchy within your LESS file, so that:

*   The user sets a value to @color-store-name;
*   in internal-variables.less, @main-accent: @color-store-name;
*   in init.less, we set a:hover {color: @main-accent};

In this example, the link hover color will be set to whatever the store name color is. We can add as many selectors as we want to this css statement, depending on our design.

This way, we can reuse the color that gets set to `@color-store-name` as the color for elements that we may not want to be edited in the Style Editor, but will now carry on the colour of the store name to create consistency within your design.

### init.less

This is where you initialize the use of the variables. This file contains all the CSS that will be compiled and generated into the theme.css file. For example, the @color-store-name can now be applied to the `#HeaderLogo h1` element by saying:

```
#HeaderLogo h1 {
color: @color-store-name
}
```

### theme.less

The file that ultimately gets compiled into theme.css. This just uses @import to include the other three LESS files for compilation. The Style Editor will read this file for instructions on how to compile your styles using LESS.

Compiling your LESS files

Once you have finished working on your .less files, **don’t forget to compile them!** If you are using command line, you should be doing something similar to:

```
lessc Styles/less/theme.less > Styles/theme.css
```

This will use the theme.less file to generate the theme.css file into the `Styles/` folder of your theme.

If you find that you have to make a change to theme.css, please don't forget to replicate this change in theme.less (but more preferably in `init.less`). Otherwise, every time you recompile the less files, this change will be overwritten.

LESS offers a variety of compilation methods, including applications for both Windows and Mac that you can use if you prefer not to use the command prompt/terminal.

## Testing Style Editor with your theme

If you'd like to add Style Editor support to your theme, you can enable the Style Editor on just your store. simply login to the control panel and place "/index.php?ToDo=viewTemplates&dev=enable" after "/admin".
(i.e. https://store-123abmy.mybigcommerce.com/admin/index.php?ToDo=viewTemplates&dev=enable)

This will enable [Developer Mode](https://developer.bigcommerce.com/themes/blueprint) for your store, which also enables Blueprint and other new features for theme developers. We recommend [using Blueprint](https://developer.bigcommerce.com/themes/blueprint) to create new themes.

### Enabling Style Editor in the Theme Store

Once you have fitted your theme, just let us know that it supports Style Editor when you submit it to the theme store.
