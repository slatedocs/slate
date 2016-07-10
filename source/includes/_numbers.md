Numbers
=======

There are three acceptable ways to pass numerical inputs to the Augur API:

- primitive JS numbers (e.g., `1010101`): ok for integers, but use strings for floating point numbers (see below)

- stringified numbers (e.g., `"1010101"`)

- hexadecimal strings (e.g., `"0xf69b5"`)

Floating-point (decimal) values should be passed to augur.js as strings (e.g., instead of `0.07`, use `"0.07"`), for reasons described in [enormous detail](http://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html) elsewhere.

<aside class="notice"><b>All numerical parameters passed to augur.js must be either base 10 (decimal) or base 16 (hexadecimal).</b> Do <b>not</b> use the base 10<sup>18</sup> fixed-point representation that Augur uses internally for decimals!  augur.js handles all fixed-point conversions for you.  Do <b>not</b> send the Loch Ness monster 3.50 &times; 10<sup>18</sup> CASH.  (Probably don't even give him 3.50, but that's a debate for another time.)</aside>
