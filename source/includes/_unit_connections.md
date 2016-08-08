## Units connecting to the System

A Unit will connect to the system in 3 ways. 

* `POST` request to /rm_data
* `GET` request to /rc_data
* `POST` request to /rc_data

###RM_DATA

The `/rm_data` endpoint handles telemetry data (voltage, current, temperature and others). 

The unit will only ever `POST` to this endpoint, this is the unit uploading its stored metric data to the influx database. 
The unit will attempt to `POST` metric data once every four hours. If the `POST` is successful the uploaded data is no longer stored on the unit. If the `POST` fails then the unit will continue to store its data until a successful `POST` is made. 

###RC_DATA

The `/rc_data` endpoint handles all other unit information (location, software, enable_status, tamper_status etc.). 

A unit will `GET` from rc_data in order to download new settings and statuses. A unit will `POST` to rc_data to inform the system of its current status, software, location etc...

The unit will always perform a `POST` immediately followed by a `GET` once every 4 hours. 

### `POST`
The unit sends its current status up to the system which then updates the status of the unit. This request causes the change from pending_enabled to enabled etc. This request will also inform the system of the current firmware on the unit. 

### `GET`
The unit receives any instructions from the system which could include instructions to update the software, change the power settings (capacity limit) or enabled_status. 

##Pending Changes
In order for any change made in the system to take effect on the unit the unit must first make the `GET` connection listed above. 
Since these connections happen once every four hours (or more if signal is bad)  there can be a significant time delay between setting the change via the API or web interface and that change coming into effect on the unit. 

To reflect this most changes will be listed in the system as `pending` immediately after they are set and remain pending until the unit makes a connection. 

Units can be forced to connect early by using the `WakeUp-SMS` feature. See those docs for more details. 
