## managerNote object

### Basic Attributes

####id

A unique identifier for this managerNote.

####account

Identifier of the account to which this managerNote is assigned.

####workgroup

Workgroup identifier for this managerNote or null if no workgroup

####shift

Shift identifier for this managerNote or null if no shift

####score

Score (1-12) for this managerNote or null if no score

####admin_only

Boolean; indicates this managerNote is accessible only to site administrators

####type

managerNoteType identifier or null if no type

####activity_date

Date of activity in RFC 3339 full date format (e.g. "2009-01-01") or null if no activity_date

### Extended Attributes

####notes

Notes

####created

UTC time managerNote was created

####updated

UTC time managerNote was updated

Not all fields will be configured to be used for all organizations or set for all managerNotes.

