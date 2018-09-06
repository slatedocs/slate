
# Basic layout example

In this section, you're going to learn how to code a basic email template using MJML.

Here is the final render we want to end with:

<p align="center">
  <a href="http://mjml.io/try-it-live/templates/hello-world"><img width="350px" src="https://cloud.githubusercontent.com/assets/6558790/12779864/d9c20556-ca6a-11e5-9007-d40ac89c5088.png" alt="sexy"></a>
</p>

<p align="center">
  <a href="/try-it-live/templates/basic"><img width="100px" src="https://mjml.io/assets/img/svg/TRYITLIVE.svg" alt="try it live" /></a>
</p>

Looks cool, right?

## Sections

``` html
<mjml>
  <mj-body>

    <!-- Company Header -->
    <mj-section background-color="#f0f0f0"></mj-section>

    <!-- Image Header -->
    <mj-section background-color="#f0f0f0"></mj-section>

    <!-- Introduction Text -->
    <mj-section background-color="#fafafa"></mj-section>

    <!-- 2 columns section -->
    <mj-section background-color="white"></mj-section>

    <!-- Icons -->
    <mj-section background-color="#fbfbfb"></mj-section>

    <!-- Social icons -->
    <mj-section background-color="#f0f0f0"></mj-section>

  </mj-body>
</mjml>
```
First, we will implement the skeleton which are the sections. Here, our email is going to be divided into 6 sections.

## Company Header

``` html

<!-- Company Header -->
<mj-section background-color="#f0f0f0">
  <mj-column>
    <mj-text  font-style="italic"
              font-size="20px"
              color="#626262">
      My Company
    </mj-text>
  </mj-column>
</mj-section>

```
The first section of the email consists in a centered banner, containing only the company name. The following markup is the MJML representation of the layout we want to obtain.

<aside class="notice">
Remember everything has to be contained in one column.
</aside>
The text padding represents the inner space around the content within the `mj-text` element.

## Image Header

``` html

<!-- Image Header -->
  <mj-section background-url="http://1.bp.blogspot.com/-TPrfhxbYpDY/Uh3Refzk02I/AAAAAAAALw8/5sUJ0UUGYuw/s1600/New+York+in+The+1960's+-+70's+(2).jpg"
              background-size="cover"
              background-repeat="no-repeat">

    <mj-column width="600">

		  <mj-text  align="center"
                color="#fff"
                font-size="40px"
                font-family="Helvetica Neue">Slogan here</mj-text>

      <mj-button background-color="#F63A4D"
                 href="#">
      	Promotion
      </mj-button>

    </mj-column>

  </mj-section>

```
Next comes a section with a background image and a block of text (representing the company slogan) and a button pointing to a page listing all the company promotions.

To add the image header, you will have to replace the section's background-color by a background-url.
Similarly to the first header, you will have to center the text both vertically and horizontally.
The padding remains the same.
The button `href` sets the button location.
In order to have the background rendered full-width in the column, set the column width to 600px with `width="600"`.

## Introduction Text

``` html

<!-- Intro text -->
  <mj-section background-color="#fafafa">
    	<mj-column width="400">

          <mj-text font-style="italic"
                   font-size="20px"
                   font-family="Helvetica Neue"
                   color="#626262">My Awesome Text</mj-text>

      		<mj-text color="#525252">
          		Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum enim eget magna efficitur, eu semper augue semper. Aliquam erat volutpat. Cras id dui lectus. Vestibulum sed finibus lectus, sit amet suscipit nibh. Proin nec commodo purus. Sed eget nulla elit. Nulla aliquet mollis faucibus.
          </mj-text>

        	<mj-button background-color="#F45E43"
                     href="#">Learn more</mj-button>

    </mj-column>
  </mj-section>

```

The introduction text will consist of a title, a main text and a button.
The title is a regular `mj-text` that can be customized.

## 2 Columns Section

``` html

<!-- Side image -->
<mj-section background-color="white">

  <!-- Left image -->
  <mj-column>
    <mj-image width="200"
              src="https://designspell.files.wordpress.com/2012/01/sciolino-paris-bw.jpg" />
  </mj-column>

  <!-- right paragraph -->
  <mj-column>
    <mj-text font-style="italic"
             font-size="20px"
             font-family="Helvetica Neue"
             color="#626262">
        Find amazing places
      </mj-text>

      <mj-text color="#525252">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum enim eget magna efficitur, eu semper augue semper. Aliquam erat volutpat. Cras id dui lectus. Vestibulum sed finibus lectus.</mj-text>

  </mj-column>
</mj-section>

```

This sections is made up of 2 columns. One containing an image, the other one containing a text.
For the image part, note that when a tag does not have any child, you can use the XML self-closing tag syntax:
`<mj-image />`

For the text part, you are going to need two `<mj-text>`s like above. One with a title format, and the other one as a regular text.

## Icons

``` html
<!-- Icons -->
<mj-section background-color="#fbfbfb">
  <mj-column>
    <mj-image width="100" src="http://191n.mj.am/img/191n/3s/x0l.png" />
  </mj-column>
  <mj-column>
    <mj-image width="100" src="http://191n.mj.am/img/191n/3s/x01.png" />
  </mj-column>
  <mj-column>
    <mj-image width="100" src="http://191n.mj.am/img/191n/3s/x0s.png" />
  </mj-column>
</mj-section>
```
This section is a 3-columns-based section. Please notice you can make the padding vary to change the space around the images.


## Social Icons

``` html

<mj-section background-color="#e7e7e7">
  <mj-column>
    <mj-social>
      <mj-social-element name="facebook" />
    </mj-social>
  </mj-column>
</mj-section>

```
The MJML standard components library comes with a `mj-social` component. By default, every social network is enabled. To disable some of them, just use their names as an attribute with a `false` value. Here, we're going to use `facebook` only.
