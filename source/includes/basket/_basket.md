Giosg BASKET
==========

Giosg BASKET is an additional product for Giosg Live. With basket you can monitor and analyze visitor's shopping carts in real time and generate different kinds of reports afterwards.


## How to setup basket tracking
Basket can be integrated to customer's online store with three different approaches:

- Use giosg [javascript API](#setup-using-javascript-api).
- Use giosg [Basket configuration interface and CSS selectors](#setup-using-css-selectors).
- Direct [backend integration](#setup-using-backend-integration) from giosg platform to customer's online store application.


## What method should I use?
Recommended way is to use giosg javascript API. This requires site owners to make changes to site code but the changes are trivial and can be easily placed next to the code that tracks e-commerce events to other analytics platforms. This way the developers of the site can decide what to track and can make sure that the data submitted to giosg is same as submitted to other analytics services.

Second favorable method is to use direct backend integration but as this requires usually more work it is not the best option.

Third and the least favored method is to use CSS selectors to collect basket data from sites existing html structure. This is usually fastest to setup and is very good option for quickly testing out the service but is also the most error prone. In the long run this method causes a lot more trouble than using javascript API.


### Why using CSS selectors is not recommended?
Using CSS selectors and existing site html is fast and easy but is not recommended because the integration may break very easily and data may not be correct when comparing to other systems. For example if the developers of the site which usually are not aware of this integration change the page layout or CSS classes basket integration will not work anymore.

Also when using site html there is cases when for example the price of discounted product is shown in different element or with different CSS classes or even with discount percent appended into same element. These kind of problems are almost impossible to debug and causes data to not be accurate.

When basket is integrated using method that involves some work from site developers they know what to take into account and know to update integration code when ever needed. This way the code to push shopping cart data to giosg is usually located near other analytics javascript calls and is easier to keep those in sync that the data is comparable.

<aside class="warning">
<strong>NOTE:</strong> Giosg will not support CSS selector usage and all will not help solving issues when the data is not correct!
</aside>


# Setup using javascript API

```javascript
// Wait for giosg to be ready
_giosg(function () {
  // On page: http://myshop.com/products/bunnies/
  // Add one product to cart and submit data to server
  var productList = [{
    name: 'Fluffy Bunny',
    price: '20.50',
    quantity: 1
  }];
  giosg.api.shoppingCart.submit(products).then(function () {
    console.log('Shopping cart data submitted!', products);
  });

  // On page: http://myshop.com/products/new/
  // Add new products and remove Fluffy Bunny
  products = [{
    name: 'Pink Bear',
    price: '100.50',
    quantity: 1
  }, {
    name: 'Brown Hamster',
    price: '5.50',
    quantity: 2
  }];
  giosg.api.shoppingCart.submit(products).then(function () {
    // Visitor has 3 product in cart. One Pink Bear and
    // two Brown Hamsters.
    console.log('Shopping cart data submitted!', products);
  });

  // On page: http://myshop.com/cart/
  // Visitor removed all products from cart so empty giosg cart also
  giosg.api.shoppingCart.clearCart().then(function () {
    console.log('Cart cleared!');
  });

  // On page: http://myshop.com/products/bears/
  // Add new product
  products = [{
    name: 'Pink Bear',
    price: '100.50',
    quantity: 1
  }];
  giosg.api.shoppingCart.submit(products).then(function () {
    // Visitor has 1 Pink Bear product in cart.
    console.log('Shopping cart data submitted!', products);
  });

  // On page: http://myshop.com/cart/success/
  // Mark cart as purchased
  giosg.api.shoppingCart.freeze().then(function () {
    // Visitor purchased one Pink Bear product.
    console.log('Shopping cart was successfully purchased!');
  });
});
```

Configuring basket tracking with javascript API is the recommended method.

You can submit cart data by passing `Array` of `Product`s to `giosg.api.shoppingCart.submit` method.

It is also possible to first call giosg api method `giosg.api.shoppingCart.addProduct` to add products to cart one by one and then submit them to server when all products are added by calling `giosg.api.shoppingCart.submit` without any arguments.
Usually calling `submit` directly with list of `Product` objects is better way to go but `addProduct` is provided as alternative.

Giosg automatically tracks the state of the cart on the server and removes products from cart that are not present on the latest data set that was submitted to server. This means that you don't need to manually keep track which products to remove and which products to add to cart.

When visitor navigates to success page or does some other action which causes cart to be purchased use `giosg.api.shoppingCart.freeze()` method to mark cart as purchased. This method doesn't need any parameters as the current cart contents should have been already submitted with `submit` method. If the cart data does not exists or freezing failed for some reason then this method will reject the promise.

See usage examples on the right side.

You can also read complete documentation about cart API and all of it's methods [here](/javascript_api.html).


## Adding products to cart one by one
To add products to cart one by one call `giosg.api.shoppingCart.addProduct` with `Product` object as parameter. Note that the products wont be submitted to server before you call `submit`.

Note that giosg will automatically remove products from cart if they are not present in the data when the `submit` is called. This means that if you first add one product using `addProduct`, then call `submit` and then add another product and call submit again, you will have only one product in cart. To keep products in cart you need to always add all of them using `addProduct` before calling submit.

If the products change before you call `submit` then it is possible to use `giosg.api.shoppingCart.deleteProducts()` to remove all products from the cart on client. This doesn't remove products from the cart on server if you have already used `submit` method to save cart data earlier.

```javascript
// Wait for giosg to be ready and add one product to cart
_giosg(function () {
  giosg.api.shoppingCart.addProduct({
    name: 'Fluffy Bunny',
    price: '20.50',
    quantity: 1
  });
  giosg.api.shoppingCart.submit().then(function () {
    console.log('Shopping cart data submitted!');
  });
});
```

## Removing products from cart

```javascript
_giosg(function () {
  // First add single product to cart
  var products = [{
    name: 'Fluffy Bunny',
    price: '20.50',
    quantity: 1
  }];
  giosg.api.shoppingCart.submit(products).then(function () {
    // Visitor has 1 product in cart, Fluffy Bunny.
    console.log('Shopping cart data submitted!', products);
  });

  products = [{
    name: 'Pink Bear',
    price: '100.50',
    quantity: 1
  }];
  giosg.api.shoppingCart.submit(products).then(function () {
    // Visitor has 1 product in cart, Pink Bear.
    // Fluffy Bunny was removed as it wasn't present in the
    // products array.
    console.log('Shopping cart data submitted!', products);
  });
});
```


Giosg automatically tracks the state of the cart on the server and removes products from cart that are not present on the latest data set that was submitted to server. So to remove products from cart you can just submit new set of products that still are on visitors cart. If the visitors cart is completely empty then you should use `giosg.api.shoppingCart.clearCart()` to remove all products from the cart.


## Emptying cart

```javascript
// Wait for giosg to be ready and remove all products from cart
_giosg(function () {
  giosg.api.shoppingCart.clearCart();
});
```

To remove all products from cart use `giosg.api.shoppingCart.clearCart()`. This removes all the products from the cart on the server.

# Supported fields on Product object
**Supported fields on `Product`**

Field   | Type   | Required? | Description
--------|--------|-----------|------------
`name` | string | **required** | Name of the product
`price` | string | **required** | Price of the product in decimal format, for example "10.50".
`quantity` | integer | **required** | Count of this kind of product in cart.
`description` | string | optional | Longer description of the product
`monthly_price` | string | optional | Monthly billable price of the product in decimal format, for example "9.90".
`monthly_quantity` | integer | optional | Monthly plan length (Deprecated: Use `monthly_plan_length` instead).
`monthly_plan_length` | integer | optional | Monthly plan length
`category` | string | optional | Category of the product
`product_number` | string | optional | Product number or code. For example "313" or "SKU-234"


# Setup using backend integration
This approach is the most robust and reliable but involves also much more work than other methods. If you want to use direct backend integration please contact giosg support for more details. You can reach giosg support by chatting at [giosg.com](http://www.giosg.com/) or by sending email to [support@giosg.com](mailto:support@giosg.com).


# Setup using CSS selectors
This approach is easiest and fastes but also the most error prone. Using CSS selectors is fast because it does not require any changes to the online store and uses sites existing html to provide the basket data. You can use this integration method if your online store has a clean and simple HTML structure. This method is however only recommended for testing giosg basket at is it not reliable.

**Configure CSS selectors:**

- Login to giosg console
- Open basket configuration page:
  - Go to following page: <a href="https://service.giosg.com/en/settings/#/live/basket" target="_blank">https://service.giosg.com/en/settings/#/live/basket</a> **or** click wrench icon
  on top nav and after that click rooms. On settings page click Basket from the left nav.
- Click the name of the room you want to configure basket to.
- Configure the selectors for your online store.
- Selector for product **name** and **price** are required, others are optional.
- **Don't forget** to add selector or URL for **payment success page**. This is the page where user is redirected after successful payment. When giosg detects that this URL is visited or the CSS selector matches, visitors shopping cart will be marked as purchased.


# Checklist for integration
- Check that all pages contain giosg javascript tag. It's quite common that customers forgot to add giosg tag to payment pages and purchases will not be logged.
- After you have done the setup
  - Check from browser's console that there is not any Javascript errors.
  - Check that cart information is shown correctly on giosg Live chat dialog.
  - Wait couple of days and compare that store's actual sale and giosg's reports match.


# Collected cart data does not match actual sales?
This can happen for number of reasons. Giosg cannot ensure that the data is always correct and matches with actual shop database or other analytics services. Neither can other analytics services ensure that.

This is due to fact that the data is transmitted from client (browser) which may block the request for number of reasons. Also it is possible that there is network errors or outages in which case giosg will retry until succeeded but success cannot be verified.

Most common reason however when data doesn't match is usually on basket configuration. Please check that the basket is configured correctly and carts are marked as purchased on success page.

Also make sure that the data submitted takes discounts and delivery fees into account if you are comparing it to report that also takes these factors into account.
