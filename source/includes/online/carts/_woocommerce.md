
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


## Install the Checkout plugin for WooCommerce

### Step 1: Download the plugin
1. Download the latest WooCommerce module by right clicking the <a href="https://github.com/ePay/woocommerce/releases/latest" id="link">Download the latest Checkout module for WooCommerce</a> link and click "Save as..."'


### Step 2: Log into WordPress
1. Go to your WordPress administration page and log in. Example url: http://www.yourshop.com/wp-admin

### Step 3: Install the plugin
1. In the left menu click **Plugins** -> **Add new**.

2. Click the **Upload plugin** button to open the **Add Plugins** dialog.

3. Click **Choose File** and browse to the folder where you saved the file from step 1. Select the file and click **Open**.

4. Click **Install Now**

5. Click **Activate Plugin** 


### Step 4: Configure the plugin
1. In the left menu click **WooCommerce** -> **Settings**.

2. Click the tab **Checkout** and select **Bambora**

3. Enter and adjust the settings which are described in the **Checkout settings** section.

4. Click **Save Changes** when done and you are ready to use the Bambora Checkout


## Create an API user
To connect to Bambora your system must authenticate itself on your behalf. Using your Merchant number, Access token and Secret token allows Bambora to identify your system and grant it access to the Bambora Checkout.

1. Go to the <a href="https://merchant.bambora.com" target="_blank">Bambora Backoffice</a> and login

2. Select the Merchant number (test or production merchant number), in the top right corner, you want to create an API user for.

3. Click **Settings** -> **<a href="https://merchant.bambora.com/apiusers" target="_blank">API users</a>** in the left menu

4. Click **Create API user**

5. Enter an e-mail address and a description

6. Click **Create API user**

7. The system will now display your **Access token** and **Secret token**.
<br/>
**IMPORTANT!** Take note of the **Secret token** as it will only be displayed once.



## Checkout settings
### Title
The name of the payment option. This is the name your customers will see at checkout. Example “Pay with Bambora Checkout”.

### Description
Include a short description of the payment method. Your customers will see this description at checkout.

### Merchant number
The merchant number you received from Bambora. You can find your merchant number in the <a href="https://merchant.bambora.com" target="_blank">Bambora Backoffice</a> via the menu **Settings** -> **<a href="https://merchant.bambora.com/merchantnumbers" target="_blank">Merchant numbers</a>**.
<br/>
Merchant numbers starting with a **T** are for testing and numbers starting with a **P** are for live (Production) use.

### Access token
The Access token is the username of an API user. Enter the Access token for your API user, found in the <a href="https://merchant.bambora.com" target="_blank">Bambora Backoffice</a> via the menu **Settings** -> **<a href="https://merchant.bambora.com/apiusers" target="_blank">API users</a>**. If you don’t have an API user, create one and take note of the Access token.

### Secret token
The Secret token is the password of an API user. This token is automatically generated when an API user is created and only displayed once at that time. Therefore you should take note of the Secret token when creating an API user. If you have lost the Secret token you will have to create a new API user in the <a href="https://merchant.bambora.com" target="_blank">Bambora Backoffice</a> via the menu **Settings** -> **<a href="https://merchant.bambora.com/apiusers" target="_blank">API users</a>** -> **Create API user**.

### Window ID
Choose the payment window ID to use. Use this to set up different texts and logos for foreign customers. View your payment windows in the <a href="https://merchant.bambora.com" target="_blank">Bambora Backoffice</a> via the menu **Settings** -> **<a href="https://merchant.bambora.com/paymentwindows" target="_blank">Payment windows</a>**. 

### Display window as
Choose how to display the payment window. Either as an **overlay** on top of your website or in **full screen**.

### Instant capture
Enable instant capture to capture the payment immediately. You may only use instant capture if your customers receive their products immediately, like digital goods as E-books and the like.



<br/><br/>
**[Click](https://github.com/bambora/dev.bambora.com/blob/master/source/includes/online/carts/_woocommerce.md) to edit this section.**


