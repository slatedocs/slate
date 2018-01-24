## timezone object

timezone objects have the following minimal attributes:

####name

A unique displayable name used to identify this timezone. Currently, one of the following strings:

* "International Date Line West (GMT-12:00)"
* "Midway Island, Samoa (GMT-11:00)"
* "Hawaii (GMT-10:00)"
* "Alaska (GMT-09:00)"
* "Pacific Time (US/Can) (GMT-08:00)"
* "Arizona (GMT-07:00)"
* "Mountain Time (US/Can) (GMT-07:00)"
* "Chihuahua, La Paz, Mazatlan (GMT-07:00)"
* "Saskatchewan (GMT-06:00)"
* "Central Time (US/Can) (GMT-06:00)"
* "Guadalajara, Mexico City, Monterrey (GMT-06:00)"
* "Indiana (East) (GMT-05:00)"
* "Bogota, Lima, Quito (GMT-05:00)"
* "Eastern Time (US/Can) (GMT-05:00)"
* "Caracas, La Paz (GMT-04:30)"
* "Atlantic Time (Can) (GMT-04:00)"
* "Santiago (GMT-04:00)"
* "Newfoundland (GMT-03:30)"
* "Buenos Aires, Georgetown (GMT-03:00)"
* "Mid-Atlantic (GMT-02:00)"
* "Cape Verde Is. (GMT-01:00)"
* "Azores (GMT-01:00)"
* "Casablanca, Monrovia (GMT)"
* "Greenwich Mean Time : Dublin, Lisbon, London (GMT)"
* "Brussels, Copenhagen, Madrid, Paris (GMT+01:00)"
* "Belgrade, Bratislava, Budapest, Prague (GMT+01:00)"
* "Amsterdam, Berlin, Bern, Rome, Vienna (GMT+01:00)"
* "Sarajevo, Skopje, Warsaw, Zagreb (GMT+01:00)"
* "Harare, Pretoria (GMT+02:00)"
* "Cairo (GMT+02:00)"
* "Jerusalem (GMT+02:00)"
* "Athens, Beirut, Istanbul, Minsk (GMT+02:00)"
* "Bucharest (GMT+02:00)"
* "Helsinki, Kyiv, Riga, Sofia, Vilnius (GMT+02:00)"
* "Nairobi (GMT+03:00)"
* "Kuwait, Riyadh (GMT+03:00)"
* "Moscow, St. Petersburg, Volgograd (GMT+03:00)"
* "Baghdad (GMT+03:00)"
* "Tehran (GMT+03:30)"
* "Abu Dhabi, Muscat (GMT+04:00)"
* "Baku, Tbilisi, Yerevan (GMT+04:00)"
* "Kabul (GMT+04:30)"
* "Islamabad, Karachi, Tashkent (GMT+05:00)"
* "Chennai, Kolkata, Mumbai, New Delhi (GMT+05:30)"
* "Kathmandu (GMT+05:45)"
* "Astana, Dhaka (GMT+06:00)"
* "Almaty, Novosibirsk (GMT+06:00)"
* "Rangoon (GMT+06:30)"
* "Bangkok, Hanoi, Jakarta (GMT+07:00)"
* "Krasnoyarsk (GMT+07:00)"
* "Beijing, Chongqing, Hong Kong, Urumqi (GMT+08:00)"
* "Kuala Lumpur, Singapore (GMT+08:00)"
* "Taipei (GMT+08:00)"
* "Perth (GMT+08:00)"
* "Irkutsk, Ulaan Bataar (GMT+08:00)"
* "Seoul (GMT+09:00)"
* "Osaka, Sapporo, Tokyo (GMT+09:00)"
* "Yakutsk (GMT+09:00)"
* "Darwin (GMT+09:30)"
* "Adelaide (GMT+09:30)"
* "Brisbane (GMT+10:00)"
* "Guam, Port Moresby (GMT+10:00)"
* "Vladivostok (GMT+10:00)"
* "Hobart (GMT+10:00)"
* "Canberra, Melbourne, Sydney (GMT+10:00)"
* "Magadan, Solomon Is., New Caledonia (GMT+11:00)"
* "Fiji, Kamchatka, Marshall Is. (GMT+12:00)"
* "Auckland, Wellington (GMT+12:00)"
* "Nuku'alofa (GMT+13:00)"

####olson_timezone

The Olson timezone name for this timezone (e.g. *America/Los_Angeles*).

timezone objects have the following additional basic attributes:

####standard_offset

The offset from UTC when DST is not being observed (e.g. *-08:00*).

####abbreviations

The standard abbreviation(s) for this timezone (e.g. *PST/PDT*).

### timezone.get

<span class="tryit" id="timezone-get-tryit"></span>
Returns information about a timezone.

Parameters:

####name

Required. The unique display name of the timezone for which to return information.

The response results `timezone` attribute will be the selected timezone object.

### timezone.list

<span class="tryit" id="timezone-list-tryit"></span>
Returns information about timezones. Uses [pagination](#pagination).

Parameters: None

The response results `timezones` attribute will be an array of the current page of selected timezones. Each element of the array will be an timezone object containing basic timezone attributes.

