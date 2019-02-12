# Users

<div class="postman-run-button"
data-postman-action="collection/import"
data-postman-var-1="01861e468223de53ba7a"></div>
<script type="text/javascript">
  (function (p,o,s,t,m,a,n) {
    !p[s] && (p[s] = function () { (p[t] || (p[t] = [])).push(arguments); });
    !o.getElementById(s+t) && o.getElementsByTagName("head")[0].appendChild((
      (n = o.createElement("script")),
      (n.id = s+t), (n.async = 1), (n.src = m), n
    ));
  }(window, document, "_pm", "PostmanRunObject", "https://run.pstmn.io/button.js"));
</script>
<style>
  .postman-run-button {
    position: relative;
    left: 30px;
  }
</style>
<p/>

Within TSheets, the _User_ (aka "employee") refers to anyone on your account, including yourself, your employees, managers, administrators, and vendors.  Time can be tracked against any user.  The API provides methods to Create, Read, and Update users and their permissions.  Set the `active` property _false_ to archive a user.

