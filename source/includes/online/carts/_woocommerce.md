
<script type="text/javascript">
$(document).ready(function () {
		
	bamboraGitHub.getLatestReleaseInfo("https://api.github.com/repos/bambora/checkout-woocommerce/releases/latest").then(function(release){
	
		$("#link").attr("href", release.downloadLink);
		$(".info").text(release.info);
	
	});
});

</script>

# WooCommerce

Bambora makes it easy for you as an online merchant using WooCommerce, to accept payments in your webshop by following this simple guide. To accept payments this guide assumes that you have a running WordPress site with WooCommerce installed.


## Install the Checkout Plugin for WooCommerce

### Step 1: Download the plugin
Download the latest WooCommerce module by right clicking the <a href="https://github.com/ePay/woocommerce/releases/latest" id="link">Download the latest Checkout module for WooCommerce</a> link and click "Save as..."'


### Step 2: Log into WordPress
Go to your WordPress administration page and log in. Example url: http://www.yourshop.com/wp-admin

### Step 3: Install the plugin
In the left menu click **Plugins** -> **Add new**.
<br/>
Click the **Upload plugin** button to open the **Add Plugins** dialog.
<br/>
Click **Choose File** and browse to the folder where you saved the file from step 1. Select the file and click **Open**.
<br/>
Click **Install Now**
<br/>
Click **Activate Plugin** 


### Step 4: Configure the Checkout Plugin
In the left menu click **WooCommerce** -> **Settings**.
<br/>
Click the tab **Checkout** and select **Bambora**
<br/>
Enter and adjust the settings which are described in the next section.
<br/>
Click **Save Changes** when done and you are ready to use the Bambora Checkout


## Checkout settings

### Title:
The name of the payment option. This is the name your customers will see at checkout. Example “Pay with Bambora Checkout”.

### Description:
Include a short description of the payment method. Your customers will see this description at checkout.

### Merchant number:
The merchant number you received from Bambora. You can find your merchant number in the [Bambora Merchant administration](https://merchant.bambora.com/) via the menu Settings -> Merchant numbers.



<br/><br/>
**[Click](https://github.com/bambora/dev.bambora.com/blob/master/source/includes/online/carts/_woocommerce.md) to edit this section.**


