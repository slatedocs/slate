
[Source](http://docs.bons.ai/inkling-guide-pages/55-import "Permalink to (5.5) import - Bons.ai")

# (5.5) import - Bons.ai

Reference for the keyword **import**. Also, describes the keywords:** from**

Note: Currently, the only function you can import is **split**.

### What is it?

**import** (the keyword) describes the usage and location of functions that are part of external libraries.

### Why do I use it?

**import** is used to specify the location and usage external libraries. You specify libraries that you want to use in conjunction with your Inkling code.

### How do I use it?

Typical import statements:

> from _libraryName_ import _importName1
_import _importName2_

###### Examples

> from utils import split
>
> datastore MNIST_data(MNIST_training_data_schema)
copy mnist-training.csv into MNIST_data with format='csv'
>
> # prepare the data with imported function split
training_data, test_data = split(MNIST_data, 0.8, shuffle=True)

  
