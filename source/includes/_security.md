# Security
We take the security, integrity, availability of our services, and the privacy of our users seriously. We appreciate all security concerns brought forth and are constantly striving to keep on top of the latest threats. Being proactive rather than reactive to emerging security issues is a fundamental belief at Delta Exchange. Every day new security issues and attack vectors are created. Delta Exchange strives to keep abreast of the latest state-of-the-art security developments by working with independent security researchers. We appreciate the community's efforts in creating a more secure world.


## Targets In scope
- https://*.delta.exchange

Any domain/property of Delta Exchange Network not listed in the targets section is out of scope. This includes any/all subdomains not listed above.

## How to access
- You will access the Delta Exchange service using test accounts and unauthenticated guests.
- Please create a Delta Exchange test account on your own using your test email address. Your email must contain keyword 'test' for example *test*@gmail.com. 
- All emails will go to the email address associated with your account. You will need to activate your account by confirming receipt of the activation email.
- NOTE: Once a vulnerability is found please file a submission immediately. Our security team will investigate and assess the impact.

## Reward range
<b>Focus Areas</b>

- User Data / User information Leaks
- Injection attacks (Server/Client side)
- RCE(Remote Code Execution)
- Authentication bypass/validation (Client/Server side)
- Privilege escalation (Vertical/Horizontal)
 

| Technical  | Severity  | Reward |
|---|---|---|
| P1  | Critical  | Decided by internal team, can be from ($10-$1000)  |
| P2  | Severe  | Decided by internal team, can be from ($10-$1000)  |
| P3  | Moderate  |  $10 - $100 |

## Rules of engagement
We are interested in hearing about security issues in Production/Dev Delta Exchange environments. 
There are some things we explicitly ask you not to do

- Do not run automated scans without checking with us first. They are often very noisy.(If running any automated testing tools, be sure to keep well under 75-100 requests per second - otherwise you're likely to get locked out.)
- Do not test the physical security of Delta Exchange offices, employees, equipment, etc.
- Do not run Full fledged exploits which can cause application crashes and affect integrity of our active services. (If you believe you have a exploit that need serious fixes please email us, and we will provide you with said instance for said service.)
- Do not test using social engineering techniques (phishing, vishing, etc.)
- Do not test against any type of customer account without explicit permission from our side.
- Do not access, Destroy or otherwise negatively impact any residential or business customers, or customer data in any way. 
- Do not perform DoS or DDoS attacks (Application level, Network Level DOS / DDOS / port flooding attacks are strictly not appreciated as this can cause delay in delivery of our services to our users we suggest you to not to use such methodologies).
- Do not engage In any way attack our end users, or in the trade of stolen user credentials.
- Interacting with real customers or real customer accounts is forbidden.

## Rules of reporting
We take our Internal process and workflow seriously, We have a dedicated security team working and testing round the clock, so we would like you to send your reports to only security@delta.exchange and follow below said rules or not following will void you from our bug bounty benefits, Also we would like you to encrypt emails sent to us with a PGP key provided below if the Vulnerability is Severe or Critical.

- We recommend you to use emails which contain test as a keyword in the email address for example *test*@gmail.com.
- For testing and reporting so that we can identify your activity on our environments, also whitelist for IDS/FDS blocks)
- Do not CC or tag other staff while reporting.
- Do not callout on social media or make blog posts to report or without reporting (this can lead to legal actions to be taken against you.)
- Do not discuss this with any, but only Delta Exchange technical staff.
- Do not send us external-links/executable/scripts in report if possible attach a text file or pdf. Without zipp'ing or rar'ing it.
- Screenshots are accepted if only in PNG and JIF formats for internal security reasons.
- POC Videos are accepted if only in MP4,AVI, WEBM, MOV formats for internal security reasons.
- Any or All reports must only reach security@delta.exchange.


## Recommended Reporting format
<b>Summary</b>

Help us get an idea of what this vulnerability is about.

(eg. "hey i have found a xss on your server")

<b>Target</b>

Select the vulnerable target Domain name / Subdomain name

(eg. "so and so on https://example.delta.exchange")

<b>Vulnerability details</b>

What is the Bug/Vulnerability. And URL / Location of vulnerability .

(eg. because of unfiltered characters the url [/search.php?q=<here>] path /search.php on q parameter)

<b>Description of Technical severity</b>

Help us understand the bug/vulnerability technical details
Describe the vulnerability and its impact.

(eg. client side executes the javascript which is rendering through /search.php?q=somescript)

<b>Recreation</b>

Provide a proof of concept or replication steps.

(eg. steps to be used by our team in order to recreate the attack scenario)

<b>Additional information</b>

Provide us with Request and Response dump / trace dump / HTTP request 

<b>Attachments (recommended)</b>

Attach proof-of-concept scripts, screenshots, screen recordings, etc.
     
## Ineligible issues
These issues Will be closed as out of scope hence not rewardable.

- Theoretical vulnerabilities without actual proof of concept
- Open redirects (through headers and parameters) / Lack of security speed bump when leaving the site.
- Internal IP address / version disclosure.
- Email verification deficiencies, expiration of password reset links, and password complexity policies
- Invalid or missing SPF (Sender Policy Framework) records (incomplete or missing SPF/DKIM/DMARC)
- Click jacking/UI redressing with minimal security impact
- Text/code injection without any impact.
- Email or mobile enumeration (E.g. the ability to identify emails via password reset)
- Information disclosure with minimal security impact (E.g. stack traces, path disclosure, directory listings, logs)
- Internally known issues, duplicate issues, or issues which have already been made public
- Rate limiting issues / Tab-nabbing
- Non url Selfless / HTMLi 
- Known CVE without proper testing.
- Vulnerabilities only exploitable on out-of-date browsers or platforms
- CSRF issues that don't impact the integrity of an account (e.g. log in or out, contact forms and other publicly accessible forms)
- Vulnerabilities related to auto-fill web forms
- Use of known vulnerable libraries without actual proof of concept
- Lack of security flags in cookies
- Issues related to unsafe SSL/TLS cipher suites or protocol version
- Session expiry / Cookie issues / Content spoofing
- Cache-control related issues
- Missing security headers that do not lead to direct exploitation
- CSRF with negligible security impact (E.g. adding to favorites, adding to cart, subscribing to a non-critical feature)
- Vulnerabilities that require root/jailbreak
- Vulnerabilities that require physical access to a user's device
- Issues that have no security impact (E.g. Failure to load a web page)
- Phishing (E.g. HTTP Basic Authentication Phishing)
- Any activity (like DoS/DDoS) that disrupts our services
- Installation Path Permissions
- Reports from automated tools or scans
  
Not following any one of the above rule will disqualify you from our bug bounty program.

If any doubts related to your submissions or creative dialogue please feel free to email saurabh.goyal@delta.exchange or venkatesh.sharma@delta.exchange.
