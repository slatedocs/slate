# Example Use Cases

TODO - fill in this section

## Get Compute Node Details

## Changing BIOS Settings
TODO:

Changing settings and understanding SettingsResults
Reading BIOS Defaults example
Updating the Administrator BIOS password example
Enabling BIOS UEFI Secure Boot example
Reverting BIOS UEFI settings to default example
Example iSCSI Software Initiator configuration

## Changing Boot Settings
TODO:

UEFI boot structured name string
UEFI boot structured name string examples
Change UEFI boot order example
BIOS administrator password considerations
Example reset all BIOS and boot order settings to factory defaults


## Reset a Server

## Apply an iLO License

## Mount iLO Virtual Media

## Configure iSCSI Boot

TODO:  Add Samer's example of iSCSI configuration

## Download Active Health System Data

Active Health System (AHS) data may be accessed by first discoverying the resource of type `HpiLOActiveHealthSystem`.  This is typically at `https://{iLO}/redfish/v1/managers/{item}/activehealthsystem`.  Refer to the section on Iterating Collections for details on how to navigate the data model.

1.  Iterate the Managers collection at `https://{iLO}/redfish/v1/managers/`.  For traditional iLO-based server architectures there is a single manager representing iLO 4 itself.

2.  Find the `Link` property refering to the `HpiLOActiveHealthSystem` and follow that link.

3.  GET the `HpiLOActiveHealthSystem` resource and look for the URI indicated by `Links.AHSLocation.extref`.

4.  Perform a GET to this URI with the following query parameters to define the download time range and embed customer case information:

* `from`:  the starting date of the download range (in YYYY-MM-DD format)
* `to`:    the ending date of the download range (in YYYY-MM-DD format)
* `case_no`:  case identification string
* `co_name`:  company or organization name
* `contact`:  contact name
* `email`:  contact email address
* `phone`:  contact phone number

> e.g. `GET /ahsdata/HP_8CW4340017_20340417.ahs?from=2016-02-16&&to=2016-02-19&&case_no=90125&&co_name=HPE&&contact_name=John Smith&&email=dummy-email-address@hpe.com&&phone=555-555-5555`

If successful, the response is an HTTP 200 level status code and a binary download which can be saved to a file.


