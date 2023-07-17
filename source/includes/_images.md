# Images API

Image URLs returned through the ShareTheMeal Partner APIs by default contain URLs to uncompressed master images. Especially when used within another app (e.g. to display a campaign image or a beneficiary ThankYou story), you would rather want to fetch an image, scaled and compressed to your needs.

The following parameters can be appended to the image URL:

```
?fm={imageFormat}
```

> You can convert images to a different format, jpg, png or webp are supported. If no parameter is specified, you will receive your image in its original format.

```
?fm=jpg&q={JPEGquality}
```

> You can define the quality of JPEG images retrieved.

```
?w={widthInPixels}&h={heightInPixels}
```

> Choose a custom width and height for the image.

```
?w=128&h=128&fit={resizingBehaviorType}
```

> By default, images are resized to fit inside the bounding box given by w and h while retaining their aspect ratio. Using the fit parameter, you can change this behavior.

> The possible values are:

> **pad**: Same as the default resizing, but adds padding so that the generated image has the specified dimensions.

> **crop**: Crop a part of the original image to match the specified size.

> **fill**: Crop the image to the specified dimensions, if the original image is smaller than these dimensions, then the image will be upscaled.

> **thumb**: When used in association with the f parameter below, creates a thumbnail from the image based on a focus area.

> **scale**: Scale the image regardless of the original aspect ratio.