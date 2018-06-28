
# Getting Started
This is a responsive email

<p align="center">
  <img width="300px" src="https://cloud.githubusercontent.com/assets/6558790/12751054/322b2c8c-c9bb-11e5-98b9-942f6ea4d585.png" alt="layout">
</p>

Like a regular HTML template, we can split this one into different parts to fit in a grid.

The body of your email, represented by the `mj-body` tag contains the entire content of your document:

<p align="center">
  <img width="300px" src="https://cloud.githubusercontent.com/assets/6558790/12751043/1fd499c4-c9bb-11e5-828f-e0e6e18180b8.png" alt="body">
</p>

From here, you can first define your sections:

<p align="center">
  <img width="300px" src="https://cloud.githubusercontent.com/assets/6558790/12751042/1fd191b6-c9bb-11e5-9450-cc15acec72b4.png" alt="sections">
</p>

Inside any section, there should be columns (even if you need only one column). Columns are what makes MJML responsive.

<p align="center">
  <img width="300px" src="https://cloud.githubusercontent.com/assets/6558790/12751041/1fd112d6-c9bb-11e5-97e7-d9c93c743c4d.png" alt="columns">
</p>

Below, you'll find some basic rules of MJML to keep in mind for later. We'll remind them when useful but better start learning them early on.

## Column sizing

### Auto sizing

The default behavior of the MJML translation engine is to divide the section space (600px by default, but it can be changed with the `width` attribute on `mj-body`) in as many columns as you declare.

<aside class="warning">
  Any mj-element included in a column will have a width equivalent to 100% of this column's width.
</aside>

Let's take the following layout to illustrate this:
```html
<mjml>
  <mj-body>
    <mj-section>
      <mj-column>
        <!-- First column content -->
      </mj-column>
      <mj-column>
        <!-- Second column content -->
      </mj-column>
    </mj-section>
  </mj-body>
</mjml>
```

Since the first section defines only 2 columns, the engine will translate that in a layout where each column takes 50% of the total space (300px each). If we add a third one, it goes down to 33%, and with a fourth one to 25%.

### Manual sizing
You can also manually set the size of your columns, in pixels or percentage, by using the `width` attribute on `mj-column`.

Let's take the following layout to illustrate this:
```html
<mjml>
  <mj-body>
    <mj-section>
      <mj-column width="200px">
        <!-- First column content -->
      </mj-column>
      <mj-column width="400px">
        <!-- Second column content -->
      </mj-column>
    </mj-section>
  </mj-body>
</mjml>
```

## Nesting

```html
<mjml>
  <mj-body>
    <mj-section>
      <mj-column>
        <!-- Column content -->
      </mj-column>
    </mj-section>
  </mj-body>
</mjml>
```