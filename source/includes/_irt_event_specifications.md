## IRT Event Specifications

Each event specification contains two mandatory fields:

"ident" - unique identifier for the event

"label" - short description of the event, to be displayed to the user

### Example

{<br/>
   "ident": "battery.charged",<br/>
   "label": "Battery Charged",<br/>
}

The value entered by the user would be submitted to the send_event endpoint like this:

{<br/>
    "event": "battery.charged"<br/>
}


