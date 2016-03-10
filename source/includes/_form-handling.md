# Handling Form Submissions

Netlify comes with built-in form handling. Just add a **netlify** attribute to your form tag and you can start receiving submissions.

It's a good idea to set a **name** attribute on the form so you can easily identify which form incoming submissions are coming from.

You can point the **action** attribute on the form to one of your html pages to show a custom thank-you message on successful form submission.

Here's an example:

``` html
<form name="contact" action="thank-you" netlify>
  <p>
    <label>Your Name:</label>
    <input type="text" name="name">
  </p>
  <p>
    <label>Your Email</label>
    <input type="email" name="email">
  </p>
  <p>
    <label>Message</label>
    <textarea name="message"></textarea>
  </p>
  <p>
    <button>Send</button>
  </p>
</form>
```

## Receiving Submissions

The simplest way to receive form submissions is to use  the notification tab in
the site admin UI to set up an email or Slack notification for your form.

All form submissions can also be accessed via our API.

Netlify also integrates with [Zapier](https://zapier.com/app/dashboard) so you can
setup triggers that sends your form submissions to any of the 500+ applications in
their catalog.

Use this link to get access to the netlify Zapier app:
[Netlify on Zapier](https://zapier.com/developer/invite/27442/6c1b6a3bbcf86c07c0a0f7dfe2d0327c/?utm_source=Netlify+and+BitBalloon&utm_campaign=7897bcd976-Netlify_Newsletter_8_Zapier&utm_medium=email&utm_term=0_200b533eb5-7897bcd976-)

## Spam Filtering

By default we run a spam filter when a form is submitted and if a form submission gets flagged as spam we will show the user a captcha before storing the submission.

As an alternative to this you can use a **honeypot** field to trick spam bots.

To take advantage of this, just add a `netlify-honeypot` attribute to your form with the name of your hidden field. Then make sure that field is present in the form, but hidden via CSS or JavaScript.

Here's a simple example:

``` html
<form name="contact" netlify netlify-honeypot="bot-field">
  <p><label>Email: <input name="email"></label></p>
  <p class="hidden"><label>Bot field: <input name="bot-field"></label></p>
  <p><label>Message: <textarea name="message"></textarea></label></p>
  <p><button>Send</button></p>
</form>
```

Now if someone enters any value in the `bot-field`, netlify will quietly discard the form submission.

## Ajax Form Submissions

You can submit forms over Ajax as well, just use the `action` attribute of the form as the target for the Ajax request.

Note that we add a hidden field to the form called **form-name** with the **name** attribute of the form. Make sure to include this in your Ajax request.

Here's a simple jQuery example:

``` js
$("#my-form").submit(function(e) {
  e.preventDefault();

  var $form = $(this);
  $.post($form.attr("action"), $form.serialize()).then(function() {
    alert("Thank you!");
  });
});
```
