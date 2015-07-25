Numbers
=======

There are four acceptable ways to pass numerical inputs to the Augur API:

- primitive JS numbers (e.g., `1010101`): ok for integers, but use strings for floating point numbers (see below)

- stringified numbers (e.g., `"1010101"`)

- hexadecimal strings (e.g., `"0xf69b5"`)

- BigNumbers (e.g., `new BigNumber("1010101")`)

Note that for primitive JS numbers, you will receive an error from the BigNumber library if your input contains more than 15 significant figures.

Floating-point (decimal) values should be passed to augur.js as strings (e.g., instead of `0.07`, use `"0.07"`), for reasons described in [enormous detail](http://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html) elsewhere.

**All numerical parameters passed to augur.js must be either base 10 (decimal) or base 16 (hexadecimal).** Do **not** use the base 2^64 representation that Augur uses internally for fixed-point numbers!  augur.js handles all fixed-point conversions for you.  Do **not** send the Loch Ness monster 3.50*2^64 CASH.  (Probably don't even give him 3.50, but that's a debate for another time.)
