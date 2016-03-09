## AccountService
This is the schema definition for the Account service. It represents the properties for this service and has links to the list of accounts.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/accountservice`

### Managing User Accounts with the Accounts Collection

**JSONPath**: `/Accounts/@odata.id`

The destination of this link is a collection of user accounts (see ManagerAccount).

* You may create a new user account by POSTing a new account description the the Accounts collection.  See ManagerAccount for details.
> e.g. `POST https://{iLO}/redfish/v1/accountservice/accounts/ with new account description`
* You may modify an existing user by PATCHing properties to the user account resource.  See ManagerAccount for details.
> e.g. `PATCH https://{iLO}/redfish/v1/accountservice/accounts/{item} with different properties`
* You may remove a user account by DELETEing the resources representing the user
> e.g. `DELETE https://{iLO}/redfish/v1/accountservice/accounts/{item}`

### AuthFailureDelayTimeSeconds

**JSONPath**: `/Oem/Hp/AuthFailureDelayTimeSeconds` (PATCHable integer)

The time in seconds to delay after AuthFailuresBeforeDelay+1 authentication attempts have failed.  Values of 2, 5, 10, and 30 seconds are valid.

> example PATCH: {"Oem": {"Hp": {"AuthFailureDelayTimeSeconds": &lt;integer-value&gt;}}}

### AuthFailureLoggingThreshold

**JSONPath**: `/Oem/Hp/AuthFailureLoggingThreshold` (PATCHable integer)

This property enables you to view and configure logging criteria for failed authentications. A failed login log entry is recorded after the configured number of attempts. 0 = feature disabled; 1-3 and 5 are allowable values.

> example PATCH: {"Oem": {"Hp": {"AuthFailureLoggingThreshold": &lt;integer-value&gt;}}}

### AuthFailuresBeforeDelay

**JSONPath**: `/Oem/Hp/AuthFailuresBeforeDelay` (PATCHable integer)

The number of failed authentication attempts allowed before authentication is delayed by AuthFailureDelayTimeSeconds. Values of  0, 1, 3, and 5 are valid, with 0 indicating delay after each authentication failure.

> example PATCH: {"Oem": {"Hp": {"AuthFailuresBeforeDelay": &lt;integer-value&gt;}}}

### MinPasswordLength

**JSONPath**: `/Oem/Hp/MinPasswordLength` (PATCHable integer)

This property specifies the minimum number of characters allowed when a user password is set or changed. It must be a value from 0 to 39.

> example PATCH: {"Oem": {"Hp": {"MinPasswordLength": &lt;integer-value&gt;}}}

## BaseNetworkAdapter

This represents a network adapter consisting of one or more physical ports.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/networkadapters/{item}`

### Firmware.Current.VersionString

**JSONPath**: `/Firmware/Current/VersionString` (read only string)

This string represents the version of the firmware image.

### PartNumber

**JSONPath**: `/PartNumber` (read only string)

The device part number.

### PhysicalPorts[array-item].FullDuplex

**JSONPath**: `/PhysicalPorts/(array index)/FullDuplex` (read only boolean)

Full-duplex data transmission means that data can be transmitted in both directions on a signal carrier at the same time.

### PhysicalPorts[array-item].IPv4Addresses[array-item].Address

**JSONPath**: `/PhysicalPorts/(array index)/IPv4Addresses/(array index)/Address` (read only string)

This is the IPv4 Address.

### PhysicalPorts[array-item].IPv6Addresses[array-item].Address

**JSONPath**: `/PhysicalPorts/(array index)/IPv6Addresses/(array index)/Address` (read only string)

This is the IPv6 Address.

### PhysicalPorts[array-item].MacAddress

**JSONPath**: `/PhysicalPorts/(array index)/MacAddress` (read only string)

The port MAC address.

### PhysicalPorts[array-item].Oem.Hp.BadReceives

**JSONPath**: `/PhysicalPorts/(array index)/Oem/Hp/BadReceives` (read only integer)

A count of frames that were received by the adapter but which had an error.  This counter is the sum of mib items cpqNicIfPhysAdapterAlignmentErrors, cpqNicIfPhysAdapterFCSErrors, cpqNicIfPhysAdapterFrameTooLongs, and cpqNicIfPhysAdapterInternalMacReceiveErrors. If this counter increments frequently, check the more detailed error statistics and take appropriate action.

### PhysicalPorts[array-item].Oem.Hp.BadTransmits

**JSONPath**: `/PhysicalPorts/(array index)/Oem/Hp/BadTransmits` (read only integer)

A count of frames that were not transmitted by the adapter because of an error.  This counter is the sum of MIB items cpqNicIfPhysAdapterDeferredTransmissions, cpqNicIfPhysAdapterLateCollisions, cpqNicIfPhysAdapterExcessiveCollisions, cpqNicIfPhysAdapterCarrierSenseErrors, and cpqNicIfPhysAdapterInternalMacTransmitErrors. If this counter increments frequently, check the more detailed error statistics and take appropriate action.

### PhysicalPorts[array-item].Oem.Hp.GoodReceives

**JSONPath**: `/PhysicalPorts/(array index)/Oem/Hp/GoodReceives` (read only integer)

A count of frames successfully received by the physical adapter.

### PhysicalPorts[array-item].Oem.Hp.GoodTransmits

**JSONPath**: `/PhysicalPorts/(array index)/Oem/Hp/GoodTransmits` (read only integer)

A count of frames successfully transmitted by the physical adapter.

### PhysicalPorts[array-item].Oem.Hp.StructuredName

**JSONPath**: `/PhysicalPorts/(array index)/Oem/Hp/StructuredName` (read only string)

PCI device structured name in UTF-8 format (e.g. 'NIC.LOM.1.1' - see PCIDevices in /rest/v1/Systems/x/PCIDevices - this comes from SMBIOS

### PhysicalPorts[array-item].Oem.Hp.Team

**JSONPath**: `/PhysicalPorts/(array index)/Oem/Hp/Team` (read only string)

If a port is configured for NIC teaming, the name of the configured link between the physical ports that form a logical network adapter. This value is displayed for system NICs only (embedded and stand-up).

### PhysicalPorts[array-item].SpeedMbps

**JSONPath**: `/PhysicalPorts/(array index)/SpeedMbps` (read only integer)

An estimate of the interface's current bandwidth in Megabits per second.  For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made, this object should contain the nominal bandwidth.

### PhysicalPorts[array-item].Status.Health

**JSONPath**: `/PhysicalPorts/(array index)/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### PhysicalPorts[array-item].Status.HealthRollUp

**JSONPath**: `/PhysicalPorts/(array index)/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### PhysicalPorts[array-item].Status.HealthRollup

**JSONPath**: `/PhysicalPorts/(array index)/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### PhysicalPorts[array-item].Status.State

**JSONPath**: `/PhysicalPorts/(array index)/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### PhysicalPorts[array-item].UEFIDevicePath

**JSONPath**: `/PhysicalPorts/(array index)/UEFIDevicePath` (read only string)

UEFIDevice Path for correlation purposes

### SerialNumber

**JSONPath**: `/SerialNumber` (read only string)

The device serial number.

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollup

**JSONPath**: `/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### StructuredName

**JSONPath**: `/StructuredName` (read only string)

PCI device structured name in UTF-8 format (e.g. 'NIC.LOM.1.1' - see PCIDevices in /rest/v1/Systems/x/PCIDevices - this comes from SMBIOS

### UEFIDevicePath

**JSONPath**: `/UEFIDevicePath` (read only string)

UEFIDevice Path for correlation purposes

## Chassis
Chassis resource(s) represent the properties for physical components for a system. This object represents racks, rack mount servers, blades, standalone, modular systems, enclosures, and all other containers. The non-CPU/device-centric parts of the schema are accessed either directly or indirectly through this resource.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/chassis/{item}`

Some properties in Chassis are only represented on blade servers:

* `Oem/Hp/PowerAlertMode/Activated`

* `Oem/Hp/PowerAlertMode/AlertPowerWatts`

* `Oem/Hp/BayNumber`

* `Oem/Hp/BaysConsumedHeight`

* `Oem/Hp/BaysConsumedWidth`

* `Oem/Hp/Location/GeographicLocation/RackName`

* `Oem/Hp/Location/LocationInRack/RackLdsPartNumber`

* `Oem/Hp/Location/LocationInRack/RackLdsProductDescription`

* `Oem/Hp/Location/LocationInRack/RackUHeight`

* `Oem/Hp/Location/LocationInRack/RackUUID`

* `Oem/Hp/Location/LocationInRack/TagVersion`

* `Oem/Hp/Location/LocationInRack/ULocation`

* `Oem/Hp/Location/LocationInRack/UPosition`

### AssetTag

**JSONPath**: `/AssetTag` (PATCHable string)

The chassis user-assigned asset tag.

> example PATCH: {"AssetTag": "&lt;string-value&gt;"}

### ChassisType

**JSONPath**: `/ChassisType` (read only enumeration)

This property indicates the physical form factor type of this resource.

**Defined values**:

* `Rack`

* `Blade`

* `Enclosure`

* `StandAlone`

* `RackMount`

* `Card`

* `Cartridge`

* `Row`

* `Pod`

* `Expansion`

* `Sidecar`

* `Zone`

* `Sled`

* `Shelf`

* `Other`

### IndicatorLED

**JSONPath**: `/IndicatorLED` (PATCHable enumeration)

The chassis indicator LED that is used to identify the chassis. The user can manipulate this LED.

> example PATCH: {"IndicatorLED": "Lit"}

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Unknown`

* `Lit`

* `Blinking`

* `Off`

### Manufacturer

**JSONPath**: `/Manufacturer` (read only string)

The chassis manufacturer.

### Model

**JSONPath**: `/Model` (read only string)

The chassis model number.

### BayNumber

**JSONPath**: `/Oem/Hp/BayNumber` (read only integer)

The position of the chassis inside an enclosure.

### BaysConsumedHeight

**JSONPath**: `/Oem/Hp/BaysConsumedHeight` (read only integer)

The number of enclosure bays this chassis consumes in height.

### BaysConsumedWidth

**JSONPath**: `/Oem/Hp/BaysConsumedWidth` (read only integer)

The number of enclosure bays this chassis consumes in width.

### Firmware.PlatformDefinitionTable.Current.VersionString

**JSONPath**: `/Oem/Hp/Firmware/PlatformDefinitionTable/Current/VersionString` (read only string)

The version of the Intelligent Platform Abstraction Data.

### Firmware.PowerManagementController.Current.VersionString

**JSONPath**: `/Oem/Hp/Firmware/PowerManagementController/Current/VersionString` (read only string)

The firmware version of the Power Monitor.

### Firmware.PowerManagementControllerBootloader.Current.Family

**JSONPath**: `/Oem/Hp/Firmware/PowerManagementControllerBootloader/Current/Family` (read only string)

The family type of the Power Monitor hardware.

### Firmware.PowerManagementControllerBootloader.Current.VersionString

**JSONPath**: `/Oem/Hp/Firmware/PowerManagementControllerBootloader/Current/VersionString` (read only string)

The firmware version of the Power Monitor boot loader.

### Firmware.SASProgrammableLogicDevice.Current.VersionString

**JSONPath**: `/Oem/Hp/Firmware/SASProgrammableLogicDevice/Current/VersionString` (read only string)

The firmware version of the SAS controller.

### Firmware.SPSFirmwareVersionData.Current.VersionString

**JSONPath**: `/Oem/Hp/Firmware/SPSFirmwareVersionData/Current/VersionString` (read only string)

The SPS FW Version number, aka ME FW Version, AAAA.BBBB.CCCC.DDDD.E

### Firmware.SystemProgrammableLogicDevice.Current.VersionString

**JSONPath**: `/Oem/Hp/Firmware/SystemProgrammableLogicDevice/Current/VersionString` (read only string)

The firmware version of the CPLD.

### Location.GeographicLocation.RackName

**JSONPath**: `/Oem/Hp/Location/GeographicLocation/RackName` (read only string)

The name of the chassis enclosure.

### Location.LocationInRack.RackLdsPartNumber

**JSONPath**: `/Oem/Hp/Location/LocationInRack/RackLdsPartNumber` (read only string)

The chassis rack part number.

### Location.LocationInRack.RackLdsProductDescription

**JSONPath**: `/Oem/Hp/Location/LocationInRack/RackLdsProductDescription` (read only string)

 The chassis rack product description.

### Location.LocationInRack.RackUHeight

**JSONPath**: `/Oem/Hp/Location/LocationInRack/RackUHeight` (read only integer)

The chassis rack U height.

### Location.LocationInRack.RackUUID

**JSONPath**: `/Oem/Hp/Location/LocationInRack/RackUUID` (read only string)

The chassis rack UUID.

### Location.LocationInRack.TagVersion

**JSONPath**: `/Oem/Hp/Location/LocationInRack/TagVersion` (read only integer)

The chassis rack tag version.

### Location.LocationInRack.ULocation

**JSONPath**: `/Oem/Hp/Location/LocationInRack/ULocation` (read only string)

The chassis rack U location.

### Location.LocationInRack.UPosition

**JSONPath**: `/Oem/Hp/Location/LocationInRack/UPosition` (read only integer)

The chassis U position in the rack.

### Location.LocationOfChassis.UUID

**JSONPath**: `/Oem/Hp/Location/LocationOfChassis/UUID` (read only string)

The chassis UUID provided by SMBIOS.

### PowerAlertMode.Activated

**JSONPath**: `/Oem/Hp/PowerAlertMode/Activated` (read only boolean)

The power alert mode activation state.

### PowerAlertMode.AlertPowerWatts

**JSONPath**: `/Oem/Hp/PowerAlertMode/AlertPowerWatts` (read only integer)

The power consumption of the system when operating in alert mode.

### PartNumber

**JSONPath**: `/PartNumber` (read only string)

The chassis part number.

### SKU

**JSONPath**: `/SKU` (read only string)

The chassis SKU.

### SerialNumber

**JSONPath**: `/SerialNumber` (read only string)

The chassis serial number.

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollup

**JSONPath**: `/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Version

**JSONPath**: `/Version` (read only string)

The chassis version.

## ComputerSystem
The schema definition of a computer system and its properties. A computer system represents a physical or virtual machine and the local resources, such as memory, CPU, and other devices that can be accessed from that machine.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}`

### AssetTag

**JSONPath**: `/AssetTag` (PATCHable string)

A user-definable tag that is used to track this system for inventory or other client purposes.

> example PATCH: {"AssetTag": "&lt;string-value&gt;"}

### BIOSPOSTCode

**JSONPath**: `/BIOSPOSTCode` (read only integer)

The BIOS Power on Self Test code from the last system boot.

### Bios.Current.VersionString

**JSONPath**: `/Bios/Current/VersionString` (read only string)

This string represents the version of the firmware image.

### BiosVersion

**JSONPath**: `/BiosVersion` (PATCHable string)

The version of the system BIOS or primary system firmware.

### Boot.BootSourceOverrideEnabled

**JSONPath**: `/Boot/BootSourceOverrideEnabled` (PATCHable enumeration)

BootSourceOverrideTarget must be specified before BootSourceOverrideEnabled can be used.

> example PATCH: {"Boot": {"BootSourceOverrideEnabled": "Once"}}

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Disabled`

* `Once`

* `Continuous`

### Boot.BootSourceOverrideTarget

**JSONPath**: `/Boot/BootSourceOverrideTarget` (PATCHable enumeration)

The current boot source to be used at next boot instead of the normal boot device, if BootSourceOverrideEnabled is not Disabled.

> example PATCH: {"Boot": {"BootSourceOverrideTarget": "Hdd"}}

**Defined values**:

* `null`:  the value is temporarily unavailable

* `None`

* `Pxe`

* `Floppy`

* `Cd`

* `Usb`

* `Hdd`

* `BiosSetup`

* `Utilities`

* `Diags`

* `UefiShell`

* `UefiTarget`

### Boot.UefiTargetBootSourceOverride

**JSONPath**: `/Boot/UefiTargetBootSourceOverride` (PATCHable string)

The UEFI device path of the device to boot from when BootSourceOverrideTarget is UefiTarget.

> example PATCH: {"Boot": {"UefiTargetBootSourceOverride": "&lt;string-value&gt;"}}

### HostCorrelation.HostFQDN

**JSONPath**: `/HostCorrelation/HostFQDN` (read only string)

### HostCorrelation.HostName

**JSONPath**: `/HostCorrelation/HostName` (read only string)

### HostName

**JSONPath**: `/HostName` (PATCHable string)

The DNS Host Name, without any domain information

### IndicatorLED

**JSONPath**: `/IndicatorLED` (PATCHable enumeration)

The state of the indicator LED.

> example PATCH: {"IndicatorLED": "Lit"}

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Unknown`

* `Lit`

* `Blinking`

* `Off`

### Manufacturer

**JSONPath**: `/Manufacturer` (read only string)

The manufacturer or OEM of this system.

### Memory.Status.Health

**JSONPath**: `/Memory/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Memory.Status.HealthRollUp

**JSONPath**: `/Memory/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Memory.Status.HealthRollup

**JSONPath**: `/Memory/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Memory.Status.State

**JSONPath**: `/Memory/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Memory.TotalSystemMemoryGB

**JSONPath**: `/Memory/TotalSystemMemoryGB` (read only integer)

The total amount of memory (GB) in the system.

### MemorySummary.Status.Health

**JSONPath**: `/MemorySummary/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### MemorySummary.Status.HealthRollUp

**JSONPath**: `/MemorySummary/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### MemorySummary.Status.HealthRollup

**JSONPath**: `/MemorySummary/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### MemorySummary.Status.State

**JSONPath**: `/MemorySummary/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### MemorySummary.TotalSystemMemoryGiB

**JSONPath**: `/MemorySummary/TotalSystemMemoryGiB` (read only integer)

This is the total amount of memory in the system measured in GiB.

### Model

**JSONPath**: `/Model` (read only string)

The model information that the manufacturer uses to refer to this system.

### Battery[array-item].Condition

**JSONPath**: `/Oem/Hp/Battery/(array index)/Condition` (read only string)

Condition of battery.

### Battery[array-item].ErrorCode

**JSONPath**: `/Oem/Hp/Battery/(array index)/ErrorCode` (read only integer)

Error Code of battery.

### Battery[array-item].FirmwareVersion

**JSONPath**: `/Oem/Hp/Battery/(array index)/FirmwareVersion` (read only string)

Firmware Version of battery.

### Battery[array-item].Index

**JSONPath**: `/Oem/Hp/Battery/(array index)/Index` (read only integer)

Index of battery.

### Battery[array-item].MaxCapWatts

**JSONPath**: `/Oem/Hp/Battery/(array index)/MaxCapWatts` (read only integer)

Maximum Capacity of battery in watts.

### Battery[array-item].Model

**JSONPath**: `/Oem/Hp/Battery/(array index)/Model` (read only string)

Model of battery.

### Battery[array-item].Present

**JSONPath**: `/Oem/Hp/Battery/(array index)/Present` (read only string)

Presence of battery.

### Battery[array-item].ProductName

**JSONPath**: `/Oem/Hp/Battery/(array index)/ProductName` (read only string)

Product Name of battery.

### Battery[array-item].SerialNumber

**JSONPath**: `/Oem/Hp/Battery/(array index)/SerialNumber` (read only string)

Serial Number of battery.

### Battery[array-item].Spare

**JSONPath**: `/Oem/Hp/Battery/(array index)/Spare` (read only string)

Spare of battery.

### Bios.Backup.BuildNumber

**JSONPath**: `/Oem/Hp/Bios/Backup/BuildNumber` (read only integer)

The build number of the firmware.

### Bios.Backup.BuildNumberString

**JSONPath**: `/Oem/Hp/Bios/Backup/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### Bios.Backup.Date

**JSONPath**: `/Oem/Hp/Bios/Backup/Date` (read only string)

The build date of the firmware.

### Bios.Backup.DebugBuild

**JSONPath**: `/Oem/Hp/Bios/Backup/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### Bios.Backup.Family

**JSONPath**: `/Oem/Hp/Bios/Backup/Family` (read only string)

The family of the firmware.

### Bios.Backup.MajorVersion

**JSONPath**: `/Oem/Hp/Bios/Backup/MajorVersion` (read only integer)

The major version of the firmware.

### Bios.Backup.MinorVersion

**JSONPath**: `/Oem/Hp/Bios/Backup/MinorVersion` (read only integer)

The minor version of the firmware.

### Bios.Backup.Time

**JSONPath**: `/Oem/Hp/Bios/Backup/Time` (read only string)

The build time of the firmware.

### Bios.Backup.VersionString

**JSONPath**: `/Oem/Hp/Bios/Backup/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### Bios.Bootblock.BuildNumber

**JSONPath**: `/Oem/Hp/Bios/Bootblock/BuildNumber` (read only integer)

The build number of the firmware.

### Bios.Bootblock.BuildNumberString

**JSONPath**: `/Oem/Hp/Bios/Bootblock/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### Bios.Bootblock.Date

**JSONPath**: `/Oem/Hp/Bios/Bootblock/Date` (read only string)

The build date of the firmware.

### Bios.Bootblock.DebugBuild

**JSONPath**: `/Oem/Hp/Bios/Bootblock/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### Bios.Bootblock.Family

**JSONPath**: `/Oem/Hp/Bios/Bootblock/Family` (read only string)

The family of the firmware.

### Bios.Bootblock.MajorVersion

**JSONPath**: `/Oem/Hp/Bios/Bootblock/MajorVersion` (read only integer)

The major version of the firmware.

### Bios.Bootblock.MinorVersion

**JSONPath**: `/Oem/Hp/Bios/Bootblock/MinorVersion` (read only integer)

The minor version of the firmware.

### Bios.Bootblock.Time

**JSONPath**: `/Oem/Hp/Bios/Bootblock/Time` (read only string)

The build time of the firmware.

### Bios.Bootblock.VersionString

**JSONPath**: `/Oem/Hp/Bios/Bootblock/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### Bios.Current.BuildNumber

**JSONPath**: `/Oem/Hp/Bios/Current/BuildNumber` (read only integer)

The build number of the firmware.

### Bios.Current.BuildNumberString

**JSONPath**: `/Oem/Hp/Bios/Current/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### Bios.Current.Date

**JSONPath**: `/Oem/Hp/Bios/Current/Date` (read only string)

The build date of the firmware.

### Bios.Current.DebugBuild

**JSONPath**: `/Oem/Hp/Bios/Current/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### Bios.Current.Family

**JSONPath**: `/Oem/Hp/Bios/Current/Family` (read only string)

The family of the firmware.

### Bios.Current.MajorVersion

**JSONPath**: `/Oem/Hp/Bios/Current/MajorVersion` (read only integer)

The major version of the firmware.

### Bios.Current.MinorVersion

**JSONPath**: `/Oem/Hp/Bios/Current/MinorVersion` (read only integer)

The minor version of the firmware.

### Bios.Current.Time

**JSONPath**: `/Oem/Hp/Bios/Current/Time` (read only string)

The build time of the firmware.

### Bios.Current.VersionString

**JSONPath**: `/Oem/Hp/Bios/Current/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### Bios.UefiClass

**JSONPath**: `/Oem/Hp/Bios/UefiClass` (read only integer)

The UEFI BIOS Class value defined in the UEFI specification.

### DeviceDiscoveryComplete.AMSDeviceDiscovery

**JSONPath**: `/Oem/Hp/DeviceDiscoveryComplete/AMSDeviceDiscovery` (read only enumeration)

This property indicates the current AMS Device Discovery Status.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Busy`

* `Complete`

* `NoAMS`

* `Initial`

### DeviceDiscoveryComplete.DeviceDiscovery

**JSONPath**: `/Oem/Hp/DeviceDiscoveryComplete/DeviceDiscovery` (read only enumeration)

This property indicates the current device discovery status of devices that are not Smart Array or AMS related.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Busy`

* `vAuxDeviceDiscoveryComplete`

* `vMainDeviceDiscoveryComplete`

* `DataIncomplete`

* `Initial`

### DeviceDiscoveryComplete.SmartArrayDiscovery

**JSONPath**: `/Oem/Hp/DeviceDiscoveryComplete/SmartArrayDiscovery` (read only enumeration)

This property indicates the current Smart Array Storage Device Discovery Status

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Busy`

* `PendingSoftwareRAID`

* `Complete`

* `Initial`

### EndOfPostDelaySeconds

**JSONPath**: `/Oem/Hp/EndOfPostDelaySeconds` (PATCHable integer)

Supported on UEFI based systems only. The number of seconds to delay before finalizing POST with the Mode action (e.g. delay before shutdown).

> example PATCH: {"Oem": {"Hp": {"EndOfPostDelaySeconds": &lt;integer-value&gt;}}}

### IntelligentProvisioningIndex

**JSONPath**: `/Oem/Hp/IntelligentProvisioningIndex` (read only integer)

 Index in the Firmware Version Table for Intelligent Provisioning.

### IntelligentProvisioningLocation

**JSONPath**: `/Oem/Hp/IntelligentProvisioningLocation` (read only string)

 Location string of Intelligent Provisioning in Firmware Version Table.

### IntelligentProvisioningVersion

**JSONPath**: `/Oem/Hp/IntelligentProvisioningVersion` (read only string)

 Intelligent Provisioning Version.

### PostMode

**JSONPath**: `/Oem/Hp/PostMode` (PATCHable enumeration)

Supported on UEFI based systems only. The manner in which the system will operate durring and at completion of POST.

> example PATCH: {"Oem": {"Hp": {"PostMode": "PostToShutdown"}}}

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Normal`

* `PostToShutdown`

* `PostToReboot`

### PostState

**JSONPath**: `/Oem/Hp/PostState` (read only enumeration)

The current state of system POST.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Unknown`

* `Reset`

* `PowerOff`

* `InPost`

* `InPostDiscoveryComplete`

* `FinishedPost`

### PowerAllocationLimit

**JSONPath**: `/Oem/Hp/PowerAllocationLimit` (read only integer)

The total amount of power allocated to the system.

### PowerAutoOn

**JSONPath**: `/Oem/Hp/PowerAutoOn` (PATCHable enumeration)

Auto Power-On mode defines what occurs when the AC power is applied to the system.

> example PATCH: {"Oem": {"Hp": {"PowerAutoOn": "PowerOn"}}}

**Defined values**:

* `RemainOff`

* `PowerOn`

* `Restore`

### PowerOnDelay

**JSONPath**: `/Oem/Hp/PowerOnDelay` (PATCHable enumeration)

The PowerAutoOn policy delay that can also be found in the HpBios::PowerOnDelay object.  Will be null if PowerAutoOn is set to RemainOff.

> example PATCH: {"Oem": {"Hp": {"PowerOnDelay": "30Sec"}}}

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Minimum`

* `15Sec`

* `30Sec`

* `45Sec`

* `60Sec`

* `RandomUpTo120Sec`

### PowerRegulatorMode

**JSONPath**: `/Oem/Hp/PowerRegulatorMode` (PATCHable enumeration)

HP Power Regulator mode.

> example PATCH: {"Oem": {"Hp": {"PowerRegulatorMode": "Max"}}}

**Defined values**:

* `OSControl`

* `Dynamic`

* `Max`

* `Min`

### ServerSignature

**JSONPath**: `/Oem/Hp/ServerSignature` (read only integer)

 The CRC32 of:  All Device Signatures combined together, Blade Slot Location in Enclosure, Enclosure UUID, and OneView Domain IP Address

### ServerSignatureStatus

**JSONPath**: `/Oem/Hp/ServerSignatureStatus` (read only enumeration)

The current state of Server Signature.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Initial`

* `Busy`

* `Invalid`

* `Complete`

### TrustedModules[array-item].FWVersion.Backup.BuildNumber

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Backup/BuildNumber` (read only integer)

The build number of the firmware.

### TrustedModules[array-item].FWVersion.Backup.BuildNumberString

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Backup/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### TrustedModules[array-item].FWVersion.Backup.Date

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Backup/Date` (read only string)

The build date of the firmware.

### TrustedModules[array-item].FWVersion.Backup.DebugBuild

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Backup/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### TrustedModules[array-item].FWVersion.Backup.Family

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Backup/Family` (read only string)

The family of the firmware.

### TrustedModules[array-item].FWVersion.Backup.MajorVersion

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Backup/MajorVersion` (read only integer)

The major version of the firmware.

### TrustedModules[array-item].FWVersion.Backup.MinorVersion

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Backup/MinorVersion` (read only integer)

The minor version of the firmware.

### TrustedModules[array-item].FWVersion.Backup.Time

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Backup/Time` (read only string)

The build time of the firmware.

### TrustedModules[array-item].FWVersion.Backup.VersionString

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Backup/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### TrustedModules[array-item].FWVersion.Bootblock.BuildNumber

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Bootblock/BuildNumber` (read only integer)

The build number of the firmware.

### TrustedModules[array-item].FWVersion.Bootblock.BuildNumberString

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Bootblock/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### TrustedModules[array-item].FWVersion.Bootblock.Date

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Bootblock/Date` (read only string)

The build date of the firmware.

### TrustedModules[array-item].FWVersion.Bootblock.DebugBuild

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Bootblock/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### TrustedModules[array-item].FWVersion.Bootblock.Family

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Bootblock/Family` (read only string)

The family of the firmware.

### TrustedModules[array-item].FWVersion.Bootblock.MajorVersion

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Bootblock/MajorVersion` (read only integer)

The major version of the firmware.

### TrustedModules[array-item].FWVersion.Bootblock.MinorVersion

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Bootblock/MinorVersion` (read only integer)

The minor version of the firmware.

### TrustedModules[array-item].FWVersion.Bootblock.Time

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Bootblock/Time` (read only string)

The build time of the firmware.

### TrustedModules[array-item].FWVersion.Bootblock.VersionString

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Bootblock/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### TrustedModules[array-item].FWVersion.Current.BuildNumber

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Current/BuildNumber` (read only integer)

The build number of the firmware.

### TrustedModules[array-item].FWVersion.Current.BuildNumberString

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Current/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### TrustedModules[array-item].FWVersion.Current.Date

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Current/Date` (read only string)

The build date of the firmware.

### TrustedModules[array-item].FWVersion.Current.DebugBuild

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Current/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### TrustedModules[array-item].FWVersion.Current.Family

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Current/Family` (read only string)

The family of the firmware.

### TrustedModules[array-item].FWVersion.Current.MajorVersion

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Current/MajorVersion` (read only integer)

The major version of the firmware.

### TrustedModules[array-item].FWVersion.Current.MinorVersion

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Current/MinorVersion` (read only integer)

The minor version of the firmware.

### TrustedModules[array-item].FWVersion.Current.Time

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Current/Time` (read only string)

The build time of the firmware.

### TrustedModules[array-item].FWVersion.Current.VersionString

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Current/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### TrustedModules[array-item].FWVersion.Pending.BuildNumber

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Pending/BuildNumber` (read only integer)

The build number of the firmware.

### TrustedModules[array-item].FWVersion.Pending.BuildNumberString

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Pending/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### TrustedModules[array-item].FWVersion.Pending.Date

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Pending/Date` (read only string)

The build date of the firmware.

### TrustedModules[array-item].FWVersion.Pending.DebugBuild

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Pending/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### TrustedModules[array-item].FWVersion.Pending.Family

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Pending/Family` (read only string)

The family of the firmware.

### TrustedModules[array-item].FWVersion.Pending.MajorVersion

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Pending/MajorVersion` (read only integer)

The major version of the firmware.

### TrustedModules[array-item].FWVersion.Pending.MinorVersion

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Pending/MinorVersion` (read only integer)

The minor version of the firmware.

### TrustedModules[array-item].FWVersion.Pending.Time

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Pending/Time` (read only string)

The build time of the firmware.

### TrustedModules[array-item].FWVersion.Pending.VersionString

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/Pending/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### TrustedModules[array-item].FWVersion.definitions.HpFWVersion.BuildNumber

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/definitions/HpFWVersion/BuildNumber` (read only integer)

The build number of the firmware.

### TrustedModules[array-item].FWVersion.definitions.HpFWVersion.BuildNumberString

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/definitions/HpFWVersion/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### TrustedModules[array-item].FWVersion.definitions.HpFWVersion.Date

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/definitions/HpFWVersion/Date` (read only string)

The build date of the firmware.

### TrustedModules[array-item].FWVersion.definitions.HpFWVersion.DebugBuild

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/definitions/HpFWVersion/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### TrustedModules[array-item].FWVersion.definitions.HpFWVersion.Family

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/definitions/HpFWVersion/Family` (read only string)

The family of the firmware.

### TrustedModules[array-item].FWVersion.definitions.HpFWVersion.MajorVersion

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/definitions/HpFWVersion/MajorVersion` (read only integer)

The major version of the firmware.

### TrustedModules[array-item].FWVersion.definitions.HpFWVersion.MinorVersion

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/definitions/HpFWVersion/MinorVersion` (read only integer)

The minor version of the firmware.

### TrustedModules[array-item].FWVersion.definitions.HpFWVersion.Time

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/definitions/HpFWVersion/Time` (read only string)

The build time of the firmware.

### TrustedModules[array-item].FWVersion.definitions.HpFWVersion.VersionString

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/FWVersion/definitions/HpFWVersion/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### TrustedModules[array-item].ModuleType

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/ModuleType` (read only enumeration)

This property indicates the type of TPM or TM.

**Defined values**:

* `Unspecified`

* `TPM1.2`

* `TPM2.0`

* `TM1.0`

* `Unknown`

### TrustedModules[array-item].Status

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/Status` (read only enumeration)

This property indicates the TPM or TM status.

**Defined values**:

* `NotPresent`

* `PresentEnabled`

* `PresentDisabled`

* `Unknown`

### VirtualProfile

**JSONPath**: `/Oem/Hp/VirtualProfile` (read only enumeration)

The current state of the systems virtual profile.  This profile is the one that, when the server is rebooted, will set the  Virtual properties.  Intent is to use this state to determine whether the server needs to be rebooted so these values are set.  Additional informaiton about the profile will be considered later.

**Defined values**:

* `Active`

* `Busy`

* `Inactive`

* `Unknown`

### VirtualUUID

**JSONPath**: `/Oem/Hp/VirtualUUID` (read only string)

Used in conjunction with the UUID (Logical) value.

### PartNumber

**JSONPath**: `/PartNumber` (read only string)

The manufacturer's system part number.

### Power

**JSONPath**: `/Power` (read only enumeration)

The current power state of the system.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `On`

* `Off`

* `Unknown`

* `Reset`

### PowerState

**JSONPath**: `/PowerState` (read only enumeration)

This is the current power state of the system

**Defined values**:

* `null`:  the value is temporarily unavailable

* `On`

* `Off`

* `Unknown`

* `Reset`

### ProcessorSummary.Count

**JSONPath**: `/ProcessorSummary/Count` (read only integer)

The number of processors in the system.

### ProcessorSummary.Model

**JSONPath**: `/ProcessorSummary/Model` (read only string)

The processor model for the primary or majority of processors in this system.

### ProcessorSummary.Status.Health

**JSONPath**: `/ProcessorSummary/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### ProcessorSummary.Status.HealthRollUp

**JSONPath**: `/ProcessorSummary/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### ProcessorSummary.Status.HealthRollup

**JSONPath**: `/ProcessorSummary/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### ProcessorSummary.Status.State

**JSONPath**: `/ProcessorSummary/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Processors.Count

**JSONPath**: `/Processors/Count` (read only integer)

The number of processors in the system.

### Processors.ProcessorFamily

**JSONPath**: `/Processors/ProcessorFamily` (read only string)

The processor family for the processors in the system.

### Processors.Status.Health

**JSONPath**: `/Processors/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Processors.Status.HealthRollUp

**JSONPath**: `/Processors/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Processors.Status.HealthRollup

**JSONPath**: `/Processors/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Processors.Status.State

**JSONPath**: `/Processors/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### SKU

**JSONPath**: `/SKU` (read only string)

SKU for this system.

### SerialNumber

**JSONPath**: `/SerialNumber` (read only string)

The system serial number.

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollup

**JSONPath**: `/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### SystemType

**JSONPath**: `/SystemType` (read only enumeration)

The type of computer system that this resource represents.

**Defined values**:

* `Physical`

* `Virtual`

* `OS`

* `PhysicallyPartitioned`

* `VirtuallyPartitioned`

### UUID

**JSONPath**: `/UUID` (read only string)

The universal unique identifier for this system.

### Version

**JSONPath**: `/Version` (read only string)

The manufacturer's system version.

### VirtualSerialNumber

**JSONPath**: `/VirtualSerialNumber` (read only string)

The system virtual serial number.

### POST Action "Reset"

Resets the computer system using one of the ResetType methods.

Parameters:

"**ResetType**" (string) with one of the following value(s):

* On
* ForceOff
* ForceRestart
* Nmi
* PushPowerButton

> example "Reset" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{
    "ResetType": "On"
}
```

### POST Action "PowerButton"

Simulates pressing the power button. The PushType parameter simulates a quick button press or a press and hold operation. 

Parameters:

"**PushType**" (string) with one of the following value(s):

* Press
* PressAndHold

> example "PowerButton" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{
    "PushType": "Press"
}
```

### POST Action "SystemReset"

Resets the computer system using a cold boot operation.

Parameters:

"**ResetType**" (string) with the value **"ColdBoot"**

> example "SystemReset" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{
    "ResetType": "ColdBoot"
}
```

## EthernetInterface
The schema definition of a simple Ethernet NIC resource.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/ethernetinterfaces/{item}`

### AutoNeg

**JSONPath**: `/AutoNeg` (PATCHable boolean)

This indicates if the speed and duplex is automatically configured by the NIC.

> example PATCH: {"AutoNeg": true}

### Autosense

**JSONPath**: `/Autosense` (PATCHable boolean)

The autosense speed/duplex enabled or disabled. Autosense can only be disabled if the SpeedMbps and FullDuplex values are specified. Autosense is only applicable and modifiable for a dedicated network port and cannot be modified for blade servers.

> example PATCH: {"Autosense": true}

### FQDN

**JSONPath**: `/FQDN` (read only string)

The complete, fully qualified domain name obtained by DNS for this NIC.

### FactoryMacAddress

**JSONPath**: `/FactoryMacAddress` (read only string)

The MAC address assigned to the NIC at the factory.

### FrameSize

**JSONPath**: `/FrameSize` (PATCHable integer)

The MAC frame size (bytes).

> example PATCH: {"FrameSize": &lt;integer-value&gt;}

### FullDuplex

**JSONPath**: `/FullDuplex` (PATCHable boolean)

The connection duplex status. If Autosense is enabled, this property cannot be modified. Autosense is only applicable and modifiable for a dedicated network port and cannot be modified for blade servers.

> example PATCH: {"FullDuplex": true}

### HostName

**JSONPath**: `/HostName` (read only string)

The DNS Host Name, without any domain information.

### IPv4Addresses[array-item].Address

**JSONPath**: `/IPv4Addresses/(array index)/Address` (PATCHable string)

The IPv4 Address.

> example PATCH: {"IPv4Addresses": [{"Address": "&lt;string-value&gt;"}|null, ...]}

### IPv4Addresses[array-item].AddressOrigin

**JSONPath**: `/IPv4Addresses/(array index)/AddressOrigin` (read only enumeration)

How the address was determined.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `DHCP`

* `Static`

### IPv4Addresses[array-item].Gateway

**JSONPath**: `/IPv4Addresses/(array index)/Gateway` (PATCHable string)

The IPv4 gateway for this address.

> example PATCH: {"IPv4Addresses": [{"Gateway": "&lt;string-value&gt;"}|null, ...]}

### IPv4Addresses[array-item].SubnetMask

**JSONPath**: `/IPv4Addresses/(array index)/SubnetMask` (PATCHable string)

The IPv4 Subnet mask.

> example PATCH: {"IPv4Addresses": [{"SubnetMask": "&lt;string-value&gt;"}|null, ...]}

### IPv6AddressPolicyTable[array-item].Label

**JSONPath**: `/IPv6AddressPolicyTable/(array index)/Label` (PATCHable integer)

The label value for this table entry, as defined in RFC3484 section 2.1.

> example PATCH: {"IPv6AddressPolicyTable": [{"Label": &lt;integer-value&gt;}|null, ...]}

### IPv6AddressPolicyTable[array-item].Precedence

**JSONPath**: `/IPv6AddressPolicyTable/(array index)/Precedence` (PATCHable integer)

The precedence value for this table entry as defined in RFC3484 section 2.1.

> example PATCH: {"IPv6AddressPolicyTable": [{"Precedence": &lt;integer-value&gt;}|null, ...]}

### IPv6AddressPolicyTable[array-item].Prefix

**JSONPath**: `/IPv6AddressPolicyTable/(array index)/Prefix` (PATCHable string)

The IPv6 Address Prefix for this table entry as defined in RFC3484 section 2.1.

> example PATCH: {"IPv6AddressPolicyTable": [{"Prefix": "&lt;string-value&gt;"}|null, ...]}

### IPv6Addresses[array-item].Address

**JSONPath**: `/IPv6Addresses/(array index)/Address` (read only string)

The IPv6 Address.

### IPv6Addresses[array-item].AddressOrigin

**JSONPath**: `/IPv6Addresses/(array index)/AddressOrigin` (read only enumeration)

How the address was determined.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `DHCP`

* `Static`

* `SLAAC`

### IPv6Addresses[array-item].AddressState

**JSONPath**: `/IPv6Addresses/(array index)/AddressState` (read only enumeration)

The current state of this address as defined in RFC 4862.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Preferred`

* `Deprecated`

* `Tentative`

* `Failed`

### IPv6Addresses[array-item].PrefixLength

**JSONPath**: `/IPv6Addresses/(array index)/PrefixLength` (read only integer)

The IPv6 Address Prefix Length.

### IPv6DefaultGateway

**JSONPath**: `/IPv6DefaultGateway` (read only string)

The IPv6 default gateway address that is currently in use on this interface.

### IPv6StaticAddresses[array-item].Address

**JSONPath**: `/IPv6StaticAddresses/(array index)/Address` (PATCHable string)

A valid IPv6 address.

> example PATCH: {"IPv6StaticAddresses": [{"Address": "&lt;string-value&gt;"}|null, ...]}

### IPv6StaticAddresses[array-item].PrefixLength

**JSONPath**: `/IPv6StaticAddresses/(array index)/PrefixLength` (PATCHable integer)

The Prefix Length of this IPv6 address.

> example PATCH: {"IPv6StaticAddresses": [{"PrefixLength": &lt;integer-value&gt;}|null, ...]}

### LinkTechnology

**JSONPath**: `/LinkTechnology` (read only enumeration)

The link technology, such as Ethernet, for this NIC.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Ethernet`

### MACAddress (Redfish-conformant MAC Address)

**JSONPath**: `/MACAddress` (read only string)

The effective current MAC address. If the assignable MAC address is not supported, this is a read-only alias of FactoryMacAddress.  This replaces `MacAddress` which was used prior to the release of the Redfish 1.0 specification.)

> example PATCH: {"MACAddress": "&lt;string-value&gt;"}

### MacAddress  (pre-Redfish conformant MAC Address)

**JSONPath**: `/MacAddress` (read only string)

The effective current MAC address. If the assignable MAC address is not supported, this is a read-only alias of FactoryMacAddress.  MacAddress was added to iLO 4 prior to the release of the Redfish 1.0 specification and is replaced by `MACAddress`.

> example PATCH: {"MacAddress": "&lt;string-value&gt;"}

<aside class="warning">
PowerShell treats JSON as case insensitive and cannot parse both MACAddress and MacAddress.  See the API Errata section for details and for workaround options.
</aside>

### MaxIPv6StaticAddresses

**JSONPath**: `/MaxIPv6StaticAddresses` (read only integer)

The maximum number of IPv6 static addresses that can be configured on this interface.

### ConfigurationSettings

**JSONPath**: `/Oem/Hp/ConfigurationSettings` (read only enumeration)

The state of the currently displayed configuration settings.

**Defined values**:

* `Current`

* `SomePendingReset`

### DHCPv4.Enabled

**JSONPath**: `/Oem/Hp/DHCPv4/Enabled` (PATCHable boolean)

Determines whether DHCPv4 is enabled.

> example PATCH: {"Oem": {"Hp": {"DHCPv4": {"Enabled": true}}}}

### DHCPv4.UseDNSServers

**JSONPath**: `/Oem/Hp/DHCPv4/UseDNSServers` (PATCHable boolean)

Determines whether to use DHCPv4-supplied DNS servers. Can only be enabled when DHCPv4 is also enabled; otherwise, this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv4": {"UseDNSServers": true}}}}

### DHCPv4.UseDomainName

**JSONPath**: `/Oem/Hp/DHCPv4/UseDomainName` (PATCHable boolean)

Determines whether to use a DHCPv4-supplied domain name. Can only be enabled when DHCPv4 is also enabled; otherwis,e this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv4": {"UseDomainName": true}}}}

### DHCPv4.UseGateway

**JSONPath**: `/Oem/Hp/DHCPv4/UseGateway` (PATCHable boolean)

Determines whether to use a DHCPv4-supplied gateway. Can only be enabled when DHCPv4 is also enabled; otherwise, this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv4": {"UseGateway": true}}}}

### DHCPv4.UseNTPServers

**JSONPath**: `/Oem/Hp/DHCPv4/UseNTPServers` (PATCHable boolean)

Determines whether to use DHCPv4-supplied NTP servers. Can only be enabled when DHCPv4 is also enabled; otherwise, this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv4": {"UseNTPServers": true}}}}

### DHCPv4.UseStaticRoutes

**JSONPath**: `/Oem/Hp/DHCPv4/UseStaticRoutes` (PATCHable boolean)

Determines whether to use DHCPv4-supplied static routes. Can only be enabled when DHCPv4 is also enabled; otherwise, this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv4": {"UseStaticRoutes": true}}}}

### DHCPv4.UseWINSServers

**JSONPath**: `/Oem/Hp/DHCPv4/UseWINSServers` (PATCHable boolean)

Determines whether to use DHCPv4-supplied WINS servers. Can only be enabled when DHCPv4 is also enabled; otherwise, this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv4": {"UseWINSServers": true}}}}

### DHCPv6.StatefulModeEnabled

**JSONPath**: `/Oem/Hp/DHCPv6/StatefulModeEnabled` (PATCHable boolean)

Determines whether DHCPv6 Stateful mode is enabled.

> example PATCH: {"Oem": {"Hp": {"DHCPv6": {"StatefulModeEnabled": true}}}}

### DHCPv6.StatelessModeEnabled

**JSONPath**: `/Oem/Hp/DHCPv6/StatelessModeEnabled` (PATCHable boolean)

Determines whether DHCPv6 Stateless mode is enabled.  Always enabled by default whenever DHCPv6 Stateful mode is also enabled.

> example PATCH: {"Oem": {"Hp": {"DHCPv6": {"StatelessModeEnabled": true}}}}

### DHCPv6.UseDNSServers

**JSONPath**: `/Oem/Hp/DHCPv6/UseDNSServers` (PATCHable boolean)

Determines whether to use DHCPv6-supplied DNS servers. Can only be enabled when DHCPv6 Stateless mode is also enabled; otherwise, this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv6": {"UseDNSServers": true}}}}

### DHCPv6.UseDomainName

**JSONPath**: `/Oem/Hp/DHCPv6/UseDomainName` (PATCHable boolean)

Determines whether to use a DHCPv6-supplied domain name. Can only be enabled when DHCPv6 Stateless mode is also enabled; otherwise, this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv6": {"UseDomainName": true}}}}

### DHCPv6.UseNTPServers

**JSONPath**: `/Oem/Hp/DHCPv6/UseNTPServers` (PATCHable boolean)

Determines whether to use DHCPv6-supplied NTP servers. Can only be enabled when DHCPv6 Stateless mode is also enabled; otherwise, this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv6": {"UseNTPServers": true}}}}

### DHCPv6.UseRapidCommit

**JSONPath**: `/Oem/Hp/DHCPv6/UseRapidCommit` (PATCHable boolean)

Determines whether to use DHCPv6 rapid commit mode. Can only be enabled when DHCPv6 Stateful mode is also enabled; otherwise, this property will be set to false and will be read-only. Do not enable in networks where more than one DHCPv6 server is configured to provide address assignments.

> example PATCH: {"Oem": {"Hp": {"DHCPv6": {"UseRapidCommit": true}}}}

### DomainName

**JSONPath**: `/Oem/Hp/DomainName` (PATCHable string)

Domain name of the network to which this management processor belongs. This property can only be modified when the management processor is not configured to use a DHCP supplied domain name; otherwise this property is read-only indicating the value is provided by DHCP.

> example PATCH: {"Oem": {"Hp": {"DomainName": "&lt;string-value&gt;"}}}

### HostName

**JSONPath**: `/Oem/Hp/HostName` (PATCHable string)

The management processor host name.

> example PATCH: {"Oem": {"Hp": {"HostName": "&lt;string-value&gt;"}}}

### IPv4.DDNSRegistration

**JSONPath**: `/Oem/Hp/IPv4/DDNSRegistration` (PATCHable boolean)

Determines whether DDNS registration is enabled.

> example PATCH: {"Oem": {"Hp": {"IPv4": {"DDNSRegistration": true}}}}

### IPv4.StaticRoutes[array-item].Destination

**JSONPath**: `/Oem/Hp/IPv4/StaticRoutes/(array index)/Destination` (PATCHable string)

An IPv4 static route destination. Only writeable when use of DHCPv4-supplied static routes is disabled; otherwise this property is read-only indicating the value is provided by DHCPv4.

> example PATCH: {"Oem": {"Hp": {"IPv4": {"StaticRoutes": [{"Destination": "&lt;string-value&gt;"}|null, ...]}}}}

### IPv4.StaticRoutes[array-item].Gateway

**JSONPath**: `/Oem/Hp/IPv4/StaticRoutes/(array index)/Gateway` (PATCHable string)

An IPv4 static route gateway. Only writeable when use of DHCPv4-supplied static routes is disabled; otherwise this property is read-only indicating the value is provided by DHCPv4.

> example PATCH: {"Oem": {"Hp": {"IPv4": {"StaticRoutes": [{"Gateway": "&lt;string-value&gt;"}|null, ...]}}}}

### IPv4.StaticRoutes[array-item].SubnetMask

**JSONPath**: `/Oem/Hp/IPv4/StaticRoutes/(array index)/SubnetMask` (PATCHable string)

An IPv4 static route subnet mask. Only writeable when use of DHCPv4-supplied static routes is disabled; otherwise this property is read-only indicating the value is provided by DHCPv4.

> example PATCH: {"Oem": {"Hp": {"IPv4": {"StaticRoutes": [{"SubnetMask": "&lt;string-value&gt;"}|null, ...]}}}}

### IPv4.WINSRegistration

**JSONPath**: `/Oem/Hp/IPv4/WINSRegistration` (PATCHable boolean)

Determines whether WINS registration is enabled.

> example PATCH: {"Oem": {"Hp": {"IPv4": {"WINSRegistration": true}}}}

### IPv6.DDNSRegistration

**JSONPath**: `/Oem/Hp/IPv6/DDNSRegistration` (PATCHable boolean)

Determines whether IPv6 DDNS registration is enabled.

> example PATCH: {"Oem": {"Hp": {"IPv6": {"DDNSRegistration": true}}}}

### IPv6.SLAACEnabled

**JSONPath**: `/Oem/Hp/IPv6/SLAACEnabled` (PATCHable boolean)

Determines whether StateLess Address Auto-Configuration is enabled.

> example PATCH: {"Oem": {"Hp": {"IPv6": {"SLAACEnabled": true}}}}

### IPv6.StaticDefaultGateway

**JSONPath**: `/Oem/Hp/IPv6/StaticDefaultGateway` (PATCHable string)

The IPv6 static default gateway entry.

> example PATCH: {"Oem": {"Hp": {"IPv6": {"StaticDefaultGateway": "&lt;string-value&gt;"}}}}

### IPv6.StaticRoutes[array-item].Destination

**JSONPath**: `/Oem/Hp/IPv6/StaticRoutes/(array index)/Destination` (PATCHable string)

The IPv6 static route destination address.

> example PATCH: {"Oem": {"Hp": {"IPv6": {"StaticRoutes": [{"Destination": "&lt;string-value&gt;"}|null, ...]}}}}

### IPv6.StaticRoutes[array-item].Gateway

**JSONPath**: `/Oem/Hp/IPv6/StaticRoutes/(array index)/Gateway` (PATCHable string)

The IPv6 static route gateway.

> example PATCH: {"Oem": {"Hp": {"IPv6": {"StaticRoutes": [{"Gateway": "&lt;string-value&gt;"}|null, ...]}}}}

### IPv6.StaticRoutes[array-item].PrefixLength

**JSONPath**: `/Oem/Hp/IPv6/StaticRoutes/(array index)/PrefixLength` (PATCHable integer)

The prefix length of the IPv6 static route destination address.

> example PATCH: {"Oem": {"Hp": {"IPv6": {"StaticRoutes": [{"PrefixLength": &lt;integer-value&gt;}|null, ...]}}}}

### IPv6.StaticRoutes[array-item].Status

**JSONPath**: `/Oem/Hp/IPv6/StaticRoutes/(array index)/Status` (read only enumeration)

Status of this static route entry.

**Defined values**:

* `Unknown`

* `Pending`

* `Active`

* `Failed`

### NICEnabled

**JSONPath**: `/Oem/Hp/NICEnabled` (PATCHable boolean)

Determines whether this NIC is enabled or disabled. Enabling one NIC will disable the others. If no NIC is enabled, this management processor is not accessible over the network.

> example PATCH: {"Oem": {"Hp": {"NICEnabled": true}}}

### NICSupportsIPv6

**JSONPath**: `/Oem/Hp/NICSupportsIPv6` (read only boolean)

Indicates whether or not this NIC can support the IPv6 protocol.

### PingGatewayOnStartup

**JSONPath**: `/Oem/Hp/PingGatewayOnStartup` (PATCHable boolean)

Determines whether to ping the IPv4 gateway on startup.

> example PATCH: {"Oem": {"Hp": {"PingGatewayOnStartup": true}}}

### SharedNetworkPortOptions.NIC

**JSONPath**: `/Oem/Hp/SharedNetworkPortOptions/NIC` (PATCHable enumeration)

Selects the system NIC that is to be shared with this management processor.

> example PATCH: {"Oem": {"Hp": {"SharedNetworkPortOptions": {"NIC": "FlexibleLOM"}}}}

**Defined values**:

* `LOM`

* `FlexibleLOM`

### SharedNetworkPortOptions.Port

**JSONPath**: `/Oem/Hp/SharedNetworkPortOptions/Port` (PATCHable integer)

The network adapter port number that is used for sharing. This feature is only applicable on systems and network adapters that support it.

> example PATCH: {"Oem": {"Hp": {"SharedNetworkPortOptions": {"Port": &lt;integer-value&gt;}}}}

### SupportsFlexibleLOM

**JSONPath**: `/Oem/Hp/SupportsFlexibleLOM` (read only boolean)

Indicates whether this system supports FlexibleLOM. Only applies to Shared Network Port.

### SupportsLOM

**JSONPath**: `/Oem/Hp/SupportsLOM` (read only boolean)

Indicates whether this system supports LOM. Only applies to Shared Network Port.

### VLANEnabled

**JSONPath**: `/Oem/Hp/VLANEnabled` (PATCHable boolean)

Determines whether VLAN is enabled. Only applies to Shared Network Port.

> example PATCH: {"Oem": {"Hp": {"VLANEnabled": true}}}

### VLANId

**JSONPath**: `/Oem/Hp/VLANId` (PATCHable integer)

The VLAN ID/tag. Only applies to Shared Network Port.

> example PATCH: {"Oem": {"Hp": {"VLANId": &lt;integer-value&gt;}}}

### PermanentMACAddress

**JSONPath**: `/PermanentMACAddress` (read only string)

This is the MAC address assigned to this NIC at the factory.

### SettingsResult.ETag

**JSONPath**: `/SettingsResult/ETag` (read only string)

The ETag of the resource to which the settings were applied, after the application.

### SettingsResult.Operation

**JSONPath**: `/SettingsResult/Operation` (read only enumeration)

Last operation detail.

**Defined values**:

* `SettingsApply`

### SettingsResult.Time

**JSONPath**: `/SettingsResult/Time` (read only string)

Indicates the time the settings were applied.

### SpeedMbps

**JSONPath**: `/SpeedMbps` (PATCHable integer)

The link speed of the Ethernet interface in megabits per second. If Autosense is enabled, this property cannot be modified. This property can only be modified on a dedicated network port. It cannot be modified for blade servers.

> example PATCH: {"SpeedMbps": &lt;integer-value&gt;}

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollup

**JSONPath**: `/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### UEFIDevicePath

**JSONPath**: `/UEFIDevicePath` (read only string)

The UEFI device path for this NIC.

### VLANEnable

**JSONPath**: `/VLANEnable` (read only boolean)

Indicates if VLANs are enabled. If this NIC supports more than one VLAN, this property will not be present and the client should look for VLANs collection in the link section of this resource.

### VLANId

**JSONPath**: `/VLANId` (read only integer)

The VLAN identifier for this NIC. The VLANId is only present when the VLANEnable is used and when the NIC supports only a single VLAN.

## EventService
This is the schema definition for the Event Service.  It represents the properties for the service itself and has links to the actual list of subscriptions.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/eventservice`

### DeliveryRetryAttempts

**JSONPath**: `/DeliveryRetryAttempts` (read only integer)

This is the number of attempts an event posting is retried before the subscription is terminated.

### DeliveryRetryIntervalInSeconds

**JSONPath**: `/DeliveryRetryIntervalInSeconds` (read only integer)

This represents the number of seconds between retry attempts for sending any given Event

### DeliveryRetryIntervalSeconds

**JSONPath**: `/DeliveryRetryIntervalSeconds` (read only integer)

This represents the number of seconds between retry attempts for sending any given Event

### RequestedMaxEventsToQueueDefault

**JSONPath**: `/Oem/Hp/RequestedMaxEventsToQueueDefault` (read only integer)

This represents the default number of events the service should queue.

### RetireOldEventInMinutesDefault

**JSONPath**: `/Oem/Hp/RetireOldEventInMinutesDefault` (read only integer)

This represents the default number of minutes until an event is expired.

### TTLCountDefault

**JSONPath**: `/Oem/Hp/TTLCountDefault` (read only integer)

The default number of TTLUnits until this listener destination subscription expires.  It may be renewed prior to expire to reset the Time to Live counter.  The value 999999 is reserved to mean a perpetual subscription.

### TTLUnitsDefault

**JSONPath**: `/Oem/Hp/TTLUnitsDefault` (read only enumeration)

The default time unit used to measure the subscription time of this listener destination.  This is the units for TTLCount and is used to express the subscription lifetime of the listener destination.

**Defined values**:

* `seconds`

* `minutes`

* `days`

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollup

**JSONPath**: `/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### SubscriptionRemovalAction

**JSONPath**: `/SubscriptionRemovalAction` (read only enumeration)

This property indicates what the service will do to an event subscription after the number of delivery retry attempts has been exhausted.

**Defined values**:

* `Remove`

* `Disable`

* `Ignore`

### SubscriptionRemovalTimeIntervalInMinutes

**JSONPath**: `/SubscriptionRemovalTimeIntervalInMinutes` (read only integer)

This is the minimum amount of time after the failed events that the service will wait before doing the SubscriptionRemovalAction.

### POST Action "SubmitTestEvent"

Causes iLO 4 to submit a test event to any subscribed event recievers. 

Parameters:

"**EventType**" (string) with one of the following value(s):

* StatusChange
* ResourceUpdated
* ResourceAdded
* ResourceRemoved
* Alert

"**EventID**" (string) - TODO - what makes sense here?

"**EventTimestamp**" (date-time)

"**Severity**" (string) with one of the following value(s):

* OK
* Warning
* Critical

"**Message**" (free form string)

"**MessageID**" (a message defined in a message registry)

"**MessageArgs**" (array of strings used to substitute into the MessageID tokens)

"**OriginOfCondition**" (the uri of the resource associated with this event) - TODO - what makes sense here?

> example "SubmitTestEvent" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{
    "EventType": "StatusChange", 
    "EventID": "<string>", 
    "EventTimestamp": "<date-time>", 
    "Severity": "OK", 
    "Message": "<string>", 
    "MessageID": "<string>", 
    "MessageArgs": "<string>", 
    "OriginOfCondition": "<string>"
}
```

## FwSwVersionInventory

The FwSwVersionInventory resource publishes an inventory of current firmware versions on a specific ComputerSystem.&nbsp; The list of firmware items will vary by server model and configuration, but some common items include:

* `SystemRomActive` - The currently active BIOS image
* `SystemRomBackup` - The backup BIOS image
* `SystemBMC` - The iLO 4 firmware version
* `(PCI-ID)` - PCI Devices are represented by PCI vendor/device/sub-vendor/sub-device ID (e.g. `14e416a2103c22fa` for the HPE FlexFabric 10Gb 2-port 536FLB Adapter)

The `Name` property contains the user-readable firmware item name.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/firmwareinventory`

### Current.{FirmwareItem}[array-item].0.AuthenticationRequired

**JSONPath**: `/Current/{FirmwareItem}/(array index)/0/AuthenticationRequired` (PATCHable boolean)

Determines if the item requires authentication to update.

### Current.{FirmwareItem}[array-item].0.ImageSizeBytes

**JSONPath**: `/Current/{FirmwareItem}/(array index)/0/ImageSizeBytes` (PATCHable integer)

The size of the item's firmware image in bytes.

### Current.{FirmwareItem}[array-item].0.InUse

**JSONPath**: `/Current/{FirmwareItem}/(array index)/0/InUse` (PATCHable boolean)

Determines if the item is in use.

### Current.{FirmwareItem}[array-item].0.Key

**JSONPath**: `/Current/{FirmwareItem}/(array index)/0/Key` (PATCHable string)

The family-specific key of the firmware item used for correlation to a component database.

### Current.{FirmwareItem}[array-item].0.Location

**JSONPath**: `/Current/{FirmwareItem}/(array index)/0/Location` (PATCHable string)

The location of the item.

### Current.{FirmwareItem}[array-item].0.ResetRequired

**JSONPath**: `/Current/{FirmwareItem}/(array index)/0/ResetRequired` (PATCHable boolean)

An update of this item requires a device reset to become active.

### Current.{FirmwareItem}[array-item].0.UEFIDevicePaths

**JSONPath**: `/Current/{FirmwareItem}/(array index)/0/UEFIDevicePaths` (PATCHable array)

The UEFI Device Path of the item.

### Current.{FirmwareItem}[array-item].0.UEFIImage

**JSONPath**: `/Current/{FirmwareItem}/(array index)/0/UEFIImage` (PATCHable boolean)

Determines if the item uses a UEFI firmware image.

### Current.{FirmwareItem}[array-item].0.Updateable

**JSONPath**: `/Current/{FirmwareItem}/(array index)/0/Updateable` (PATCHable boolean)

Determines if the item is updatable.

### Current.{FirmwareItem}[array-item].0.Version

**JSONPath**: `/Current/{FirmwareItem}/(array index)/0/Version` (PATCHable integer)

A version number used for greater-than, less-than, equality comparison.

### Current.{FirmwareItem}[array-item].0.VersionString

**JSONPath**: `/Current/{FirmwareItem}/(array index)/0/VersionString` (PATCHable string)

The user-displayable version of the firmware item in string format

## HPPowerMeter
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/chassis/{item}/power/fastpowermeter`

> * `https://{iLO}/redfish/v1/chassis/{item}/power/powermeter`

### Average

**JSONPath**: `/Average` (read only integer)

Average power across all samples, over the last 24 hours.

### Maximum

**JSONPath**: `/Maximum` (read only integer)

Maximum power across all samples, taken from the 24 hour history.

### Minimum

**JSONPath**: `/Minimum` (read only integer)

Minimum power across all samples, taken from the 24 hour history.

### PowerDetail[array-item].AmbTemp

**JSONPath**: `/PowerDetail/(array index)/AmbTemp` (read only integer)

Ambient temperature, in degrees Celsius.

### PowerDetail[array-item].Average

**JSONPath**: `/PowerDetail/(array index)/Average` (read only integer)

Average power over the sample time.

### PowerDetail[array-item].Cap

**JSONPath**: `/PowerDetail/(array index)/Cap` (read only integer)

Overall power cap for the power meter.

### PowerDetail[array-item].CpuAvgFreq

**JSONPath**: `/PowerDetail/(array index)/CpuAvgFreq` (read only integer)

CPU average frequency of the power supply.

### PowerDetail[array-item].CpuCapLim

**JSONPath**: `/PowerDetail/(array index)/CpuCapLim` (read only integer)

CPU cap limit for the power meter.

### PowerDetail[array-item].CpuMax

**JSONPath**: `/PowerDetail/(array index)/CpuMax` (read only integer)

CPU maximum power consumed by the power meter.

### PowerDetail[array-item].CpuPwrSavLim

**JSONPath**: `/PowerDetail/(array index)/CpuPwrSavLim` (read only integer)

CPU power-saving limit for the power meter.

### PowerDetail[array-item].CpuUtil

**JSONPath**: `/PowerDetail/(array index)/CpuUtil` (read only integer)

CPU power utilization.

### PowerDetail[array-item].Minimum

**JSONPath**: `/PowerDetail/(array index)/Minimum` (read only integer)

Minimum power over the sample time.

### PowerDetail[array-item].Peak

**JSONPath**: `/PowerDetail/(array index)/Peak` (read only integer)

Peak power over the sample time.

### PowerDetail[array-item].PrMode

**JSONPath**: `/PowerDetail/(array index)/PrMode` (read only enumeration)

Power regulator mode, which can be OS Control, Static High, Static Low or Dynamic.

**Defined values**:

* `dyn`

* `min`

* `max`

* `osc`

### PowerDetail[array-item].PunCap

**JSONPath**: `/PowerDetail/(array index)/PunCap` (read only boolean)

Punitive cap for the power meter.

### PowerDetail[array-item].Time

**JSONPath**: `/PowerDetail/(array index)/Time` (read only string)

Time at which the power detail was captured.

### PowerDetail[array-item].UnachCap

**JSONPath**: `/PowerDetail/(array index)/UnachCap` (read only boolean)

Unachievable cap for the power meter.

### Samples

**JSONPath**: `/Samples` (read only integer)

Number of samples in the array.

## HpBaseConfigs
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/bios/boot/baseconfigs`

> * `https://{iLO}/redfish/v1/systems/{item}/bios/baseconfigs`

> * `https://{iLO}/redfish/v1/systems/{item}/bios/iscsi/baseconfigs`

### Capabilities.BaseConfig

**JSONPath**: `/Capabilities/BaseConfig` (read only boolean)

True if the provider supports PUT/PATCH of the named BaseConfig.

### Capabilities.BaseConfigs

**JSONPath**: `/Capabilities/BaseConfigs` (read only boolean)

True if the provider supports PUT/PATCH of the named BaseConfigs.

## HpBios

BIOS configuration settings vary with the server model and firmware version. The per-server settings are described with HpBios Attributes.  A GET of the BIOS settings will include a combination of properties from "HpBios" and "HpBios Attributes".

The BIOS settings are in two resources.  One is the current settings and are read only.  The second is the pending settings are are modifiable with PUT or PATCH.  The pending settings are evaluated and applied upon system restart when UEFI POST runs.  At this time the current settings are updated to reflect the changed configuration.  The results of the last settings application are in the `SettingsResults` sub-object of the current settings.

### Resetting BIOS Setting to Default

For the modifiyable settings resource, you may PATCH or PUT the property "BaseConfig" with the value "default" to cause the BIOS to revert to default settings on the next reboot. The BIOS will revert to default settings and override them with any other properties specified in the request payload.

> e.g. Reset BIOS settings to defaults
> PUT {"BaseConfig": "default", "Slot3NicBoot7": "PxeBoot"}
> To cause the BIOS to revert to defaults and also set Slot 3 NIC to boot to PXE.
			
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/bios/settings` (PATCHable Pending settings)

> * `https://{iLO}/redfish/v1/systems/{item}/bios` (read only current settings)

### AttributeRegistry

**JSONPath**: `/AttributeRegistry` (read only string)

This object represents the type property. It represents the schema used for the resource and indicates the version of the schema in the format <schema>.<majorversion>.<minorversion>.<errataversion>.

### SettingsResult.definitions.SettingsResult.ETag

**JSONPath**: `/SettingsResult/definitions/SettingsResult/ETag` (read only string)

ETag of this resource after the settings have been applied.

### SettingsResult.definitions.SettingsResult.Messages[array-item].Message

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/Message` (read only string)

Human-readable message.

### SettingsResult.definitions.SettingsResult.Messages[array-item].MessageID

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/MessageID` (read only string)

Key for this message, which is used to look up the message in a message registry. The key is in the format <registry>.<majorver>.<minorver>:<messagekey>.

### SettingsResult.definitions.SettingsResult.Messages[array-item].Resolution

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/Resolution` (read only string)

Instructions for resolving the issue that caused the error.

### SettingsResult.definitions.SettingsResult.Messages[array-item].Severity

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/Severity` (read only enumeration)

This is the severity of the errors.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### SettingsResult.definitions.SettingsResult.Operation

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Operation` (read only enumeration)

Details about the results of applying the settings.

**Defined values**:

* `SettingsApply`

### SettingsResult.definitions.SettingsResult.Time

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Time` (read only string)

Time at which the settings were applied.

## HpBios Attributes
This registry defines a representation of HP BIOS Attribute instances

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/bios/settings`

> * `https://{iLO}/redfish/v1/systems/{item}/bios`

### AcpiRootBridgePxm

**JSONPath**: `/AcpiRootBridgePxm` (PATCHable enumeration)

When enabled, the System ROM reports the proximity relationship between I/O devices and system memory to the operating system. Most operating systems can use this information to efficiently assign memory resources for devices, such as network controllers and storage devices. Additionally, certain I/O devices might not be able to take advantage of I/O handling benefits if their OS drivers are not properly optimized to support this feature. See your operating system and I/O device documentation for more details.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### AcpiSlit

**JSONPath**: `/AcpiSlit` (PATCHable enumeration)

The ACPI SLIT (System Locality Information Table) defines the relative access times between processors, memory subsystems, and I/O subsystems. Operating systems that support the SLIT can use this information to improve performance by allocating resources and workloads more efficiently.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### AdjSecPrefetch

**JSONPath**: `/AdjSecPrefetch` (PATCHable enumeration)

Use this option to disable the processor Adjacent Sector Prefetch feature. In some cases, setting this option to disabled can improve performance. Typically, setting this option to enabled provides better performance. Only disable this option after performing application benchmarking to verify improved performance in the environment.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### AdminEmail

**JSONPath**: `/AdminEmail` (PATCHable string)

Enter the server administrator's e-mail address.

### AdminName

**JSONPath**: `/AdminName` (PATCHable string)

Enter the server administrator's name text.

### AdminOtherInfo

**JSONPath**: `/AdminOtherInfo` (PATCHable string)

Enter the server administrator's information text.

### AdminPassword

**JSONPath**: `/AdminPassword` (PATCHable password)

Use this option to enter the administrator password to protect the server configuration. When this option is enabled, you are prompted for this password before being allowed to modify the configuration.

### AdminPhone

**JSONPath**: `/AdminPhone` (PATCHable string)

Enter the server administrator's phone number text.

### AdvancedMemProtection

**JSONPath**: `/AdvancedMemProtection` (PATCHable enumeration)

Use this option to configure additional memory protection with ECC (Error Checking and Correcting). Options and support vary per system. Advanced ECC keeps all installed memory available for use while still protecting the system against all single-bit failures and certain multi-bit failures. Online Spare Memory enables a system to automatically map out a group of memory that is detected to be at an increased risk of receiving uncorrected memory errors based on an advanced analysis of corrected memory errors.  The mapped out memory is automatically replaced by a spare group of memory without interrupting the system. Mirrored Memory provides the maximum protection against uncorrected memory errors that might otherwise result in a system failure. Lockstep Mode with DDDC Support keeps all installed memory available for use while error corrections are performed in cases of multiple DRAM device failures. This support enables protection beyond Advanced ECC. Enabling this option might impact memory performance.

**Defined values**:

* `AdvancedEcc`:  Advanced ECC Support

* `OnlineSpareAdvancedEcc`:  Online Spare with Advanced ECC Support

* `MirroredAdvancedEcc`:  Mirrored Memory with Advanced ECC Support

### AsrStatus

**JSONPath**: `/AsrStatus` (PATCHable enumeration)

Use this option to configure the Automatic Server Recovery option, which enables the system to automatically reboot if the server locks up.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### AsrTimeoutMinutes

**JSONPath**: `/AsrTimeoutMinutes` (PATCHable enumeration)

When Automatic Server Recovery is enabled, you can use this option to set the time to wait before rebooting the server in the event of an operating system crash or server lockup.

**Defined values**:

* `10`:  10 Minutes

* `15`:  15 Minutes

* `20`:  20 Minutes

* `30`:  30 Minutes

* `5`:  5 Minutes

### AssetTagProtection

**JSONPath**: `/AssetTagProtection` (PATCHable enumeration)

Use this option to lock Asset Tag information. When set to lock, the Asset Tag is not erased if the default system settings are restored.

**Defined values**:

* `Locked`:  Locked

* `Unlocked`:  Unlocked

### AutoPowerOn

**JSONPath**: `/AutoPowerOn` (PATCHable enumeration)

Use this option to configure the server to automatically power on when AC power is applied to the system. By default, the system returns to its previous power state when AC power is restored after an AC power loss. This option causes the system to always returns to the "on" state whenever power is applied, even if the system is in the "off" state when power is lost.

**Defined values**:

* `AlwaysPowerOn`:  Always Power on

* `AlwaysPowerOff`:  Always Power Off

* `RestoreLastState`:  Restore Last Power State

### BootMode

**JSONPath**: `/BootMode` (PATCHable enumeration)

Use this option to select the boot mode of the system. Selecting UEFI Mode configures the system to boot Unified Extensible Firmware Interface (UEFI) compatible operating systems. Selecting Legacy BIOS Mode configures the system to boot traditional operating systems in Legacy BIOS compatibility mode. The operating system can only boot in the mode in which it is installed. The following options require booting in UEFI Boot Mode: Secure Boot, IPv6 PXE Boot, boot > 2.2 TB Disks in AHCI SATA Mode, and Dynamic Smart Array RAID.

**Defined values**:

* `Uefi`:  UEFI Mode

* `LegacyBios`:  Legacy BIOS Mode

### BootOrderPolicy

**JSONPath**: `/BootOrderPolicy` (PATCHable enumeration)

Use this option to configure how the system attempts to boot devices per the Boot Order when no bootable device is found. If configured to "Retry Boot Order Indefinitely," the system continuously attempts to process the Boot Order until a bootable device is found. If configured to "Attempt Boot Order Once," the system attempts to process all items in the Boot Order once. If configured for "Reset After Failed Boot Attempt," the system attempts to process all items in the Boot Order once, and then reboots the system.

**Defined values**:

* `RetryIndefinitely`:  Retry Boot Order Indefinitely

* `AttemptOnce`:  Attempt Boot Order Once

* `ResetAfterFailed`:  Reset After Failed Boot Attempt

### ChannelInterleaving

**JSONPath**: `/ChannelInterleaving` (PATCHable enumeration)

You can only configure this option if the Power Profile is set to Custom. Use this option to modify the level of interleaving for which the memory system is configured. Typically, higher levels of memory interleaving result in maximum performance. However, reducing the level of interleaving can result in power savings.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### CollabPowerControl

**JSONPath**: `/CollabPowerControl` (PATCHable enumeration)

For operating systems that support the Processor Clocking Control (PCC) Interface, enabling this option enables the Operating System to request processor frequency changes even if the Power Regulator option on the server configured for Dynamic Power Savings Mode. For Operating Systems that do not support the PCC Interface, or when the Power Regulator Mode is not configured for Dynamic Power Savings Mode, this option has no effect on system operation.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### ConsistentDevNaming

**JSONPath**: `/ConsistentDevNaming` (PATCHable enumeration)

Use this option to select the level of Consistent Device Naming. On supported operating systems, NIC ports are named based on their location in the system. CDN Support for LOMs Only names Embedded NICs and FlexibleLOMs. Existing NIC connections retain their name until reinstalled under the OS environment.

**Defined values**:

* `LomsOnly`:  CDN Support for LOMs Only

* `Disabled`:  Disabled

### CustomPostMessage

**JSONPath**: `/CustomPostMessage` (PATCHable string)

Enter a message to be displayed during system startup.

### DaylightSavingsTime

**JSONPath**: `/DaylightSavingsTime` (PATCHable enumeration)

This option controls the Daylight Savings Time (DST) adjustment to the displayed Local time.  If this option is disabled, the displayed local time will not be adjusted for DST.  If this option is enabled, the displayed local time will be advanced by one hour.

**Defined values**:

* `Disabled`:  Disabled

* `Enabled`:  Enabled

### DcuIpPrefetcher

**JSONPath**: `/DcuIpPrefetcher` (PATCHable enumeration)

Use this option to disable the processor DCU IP Prefetcher feature. In some cases, setting this option to disabled can improve performance. In most cases, the default value of enabled provides optimal performance. Only disable this option after performing application benchmarking to verify improved performance in the environment. 

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### DcuStreamPrefetcher

**JSONPath**: `/DcuStreamPrefetcher` (PATCHable enumeration)

Use this option to disable the processor DCU Stream Prefetcher feature. In some cases, setting this option to disabled can improve performance. Typically, setting this option to enabled provides better performance. Only disable this option after performing application benchmarking to verify improved performance in your environment.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### Dhcpv4

**JSONPath**: `/Dhcpv4` (PATCHable enumeration)

When enabled, this option enables obtaining the pre-boot network IPv4 configuration from a DHCP server. Individual settings are not available. When disabled, you must configure static IP address settings individually.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### DynamicPowerCapping

**JSONPath**: `/DynamicPowerCapping` (PATCHable enumeration)

Use this option to configure when the System ROM executes power calibration during the boot process. In Auto mode, calibration is run the first time the server is booted and is then only run again when the server's hardware configuration or configuration settings change. When disabled, the calibration does not run and Dynamic Power Capping is not supported. When enabled, the calibration is run on every boot.

**Defined values**:
Seri
* `Auto`:  Auto

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### DynamicPowerResponse

**JSONPath**: `/DynamicPowerResponse` (PATCHable enumeration)

Use this option to enable the System BIOS to control processor performance and power states depending on the processor workload. You can set the response time for switching between power states. 
- The Fast setting is optimal for most workloads where low latency response to an increase in processor demand is a requirement. 
- The Slow setting is optimal for workloads where a longer latency response to an increase in processing demand is an acceptable trade-off for reduced power consumption. Selecting this option can have a negative effect on performance, depending on the workload.

**Defined values**:

* `Fast`:  Fast

* `Slow`:  Slow

### EmbNicEnable

**JSONPath**: `/EmbNicEnable` (PATCHable enumeration)

Select this option to enable or disable PCI devices.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### EmbSas1Boot

**JSONPath**: `/EmbSas1Boot` (PATCHable enumeration)

When Boot All Targets is selected, the UEFI BIOS will allow all valid boot targets attached to the storage controller to be made available in the UEFI Boot Order List. If Boot No Targets is selected, no boot targets from this storage controller will be made available in the UEFI Boot Order.If Boot Limit to 3 Targets is selected, 3 boot targets attached to the storage controller will be made available in the UEFI Boot Order.

**Defined values**:

* `AllTargets`:  Boot All Targets

* `ThreeTargets`:  Boot Limit to 3 Targets

* `NoTargets`:  Boot No Targets

### EmbSasEnable

**JSONPath**: `/EmbSasEnable` (PATCHable enumeration)

Select this option to enable or disable PCI devices.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### EmbSata1Enable

**JSONPath**: `/EmbSata1Enable` (PATCHable enumeration)

Select this option to enable or disable PCI devices.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### EmbSata2Enable

**JSONPath**: `/EmbSata2Enable` (PATCHable enumeration)

Select this option to enable or disable PCI devices.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### EmbVideoConnection

**JSONPath**: `/EmbVideoConnection` (PATCHable enumeration)

When configured for Auto mode, the external video connection to the embedded video controller is automatically disabled to save power when a monitor is not attached. It is automatically enabled when a monitor is attached, including when the server is operating. When configured for Always Disabled, the external video connection to the embedded video controller is disabled and a monitor connected to this port does not display except during system boot. This can be used for security reasons. When configured for Always Enabled, the external video connection to the embedded video controller is always enabled. This option is only required if a monitor is attached with a monitor detection that does not function properly (making AUTO mode not work properly). Note: This option does not affect Integrated Remote Console video. Also, if you press F9 or F11 during system boot, the configured video connector behavior is overridden and the video console remains enabled. This lets you reconfigure the Embedded Video Connection option even if the video is disabled.

**Defined values**:

* `Auto`:  Auto

* `AlwaysDisabled`:  Always Disabled

* `AlwaysEnabled`:  Always Enabled

### EmbeddedDiagnostics

**JSONPath**: `/EmbeddedDiagnostics` (PATCHable enumeration)

Use this option to enable or disable Embedded Diagnostics functionality. If disabled, you cannot launch Embedded Diagnostics. Enable this option to use the Embedded Diagnostics functionality.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### EmbeddedDiagsMode

**JSONPath**: `/EmbeddedDiagsMode` (PATCHable enumeration)

Use this option to configure Embedded Diagnostics in Auto or Text Console mode.

**Defined values**:

* `Auto`:  Auto

* `TextConsole`:  Text Console

### EmbeddedSata

**JSONPath**: `/EmbeddedSata` (PATCHable enumeration)

Important: Dynamic Smart Array RAID is not supported when the Boot Mode is configured in Legacy BIOS Mode. 

Use this option to configure the embedded chipset SATA controller. When selecting the Advanced Host Controller Interface (AHCI) or RAID (if supported), make sure the proper operating system drivers are used for proper operation.

**Defined values**:

* `Ahci`:  Enable SATA AHCI Support

* `Raid`:  Enable Dynamic Smart Array RAID Support

### EmbeddedSerialPort

**JSONPath**: `/EmbeddedSerialPort` (PATCHable enumeration)

Select this option to assign the logical COM Port address and associated default resources to the selected physical serial port. The operating system can overwrite this setting.

**Defined values**:

* `Com1Irq4`:  COM 1; IRQ4; I/O: 3F8h-3FFh

* `Com2Irq3`:  COM 2; IRQ3; I/O: 2F8h-2FFh

* `Disabled`:  Disabled

### EmbeddedUefiShell

**JSONPath**: `/EmbeddedUefiShell` (PATCHable enumeration)

Use this option to enable or disable the Embedded UEFI Shell. If enabled, you can launch the Embedded UEFI Shell from the pre-boot environment. When enabled, you can add the Embedded UEFI Shell to the UEFI Boot Order if the boot mode is configured for UEFI by selecting the option entitled 'Add Embedded UEFI Shell to Boot Order'. When disabled, the Embedded UEFI Shell is not available in the pre-boot environment, and you cannot add it to the UEFI boot order. The Embedded UEFI Shell is a pre-boot command line environment that you can use for scripting and running UEFI applications. It provides CLI-based commands to configure the server, update the System ROM and other firmware, and obtain system information and error logs.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### EmbeddedUserPartition

**JSONPath**: `/EmbeddedUserPartition` (PATCHable enumeration)

Use this option to control the Embedded User Partition. The Embedded User Partition is a general purpose disk partition on non-volatile flash memory that is embedded on the system board.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### EmsConsole

**JSONPath**: `/EmsConsole` (PATCHable enumeration)

Use this option to configure the ACPI serial port settings, which include redirecting the Windows Server Emergency Management console (EMS) through the serial port. If you select this option for redirecting EMS through a network connection, two options are available: 
1) When redirecting EMS through a virtual serial port, select the value (COM1 or COM2) that corresponds to the resources assigned to the Virtual Serial Port in the System Options menu. 
2) When redirecting EMS through a physical serial port, select the value (COM1 or COM2) that corresponds to the resources assigned to the embedded serial port in the System Options menu.
EMS Console is not supported at 38400 BAUD.

**Defined values**:

* `Disabled`:  Disabled

* `Com1Irq4`:  COM 1; IRQ4; I/O: 3F8h-3FFh

* `Com2Irq3`:  COM 2; IRQ3; I/O: 2F8h-2FFh

### EnergyPerfBias

**JSONPath**: `/EnergyPerfBias` (PATCHable enumeration)

You can only configure this option if the Power Profile is set to Custom. Use this option to configure several processor subsystems to optimize the performance and power usage of the processor. Balanced Performance provides optimum power efficiency and is recommended for most environments. Maximum Performance Mode is recommended for environments that require the highest performance and lowest latency but are not sensitive to power consumption. Only use Power Savings Mode in environments that are power sensitive and can accept reduced performance.

**Defined values**:

* `MaxPerf`:  Maximum Performance

* `BalancedPerf`:  Balanced Performance

* `BalancedPower`:  Balanced Power

* `PowerSavingsMode`:  Power Savings Mode

### EraseUserDefaults

**JSONPath**: `/EraseUserDefaults` (PATCHable enumeration)

Select this option to erase the user defaults backup.

**Defined values**:

* `No`:  No, Cancel

* `Yes`:  Yes, erase the current settings.

### ExtendedAmbientTemp

**JSONPath**: `/ExtendedAmbientTemp` (PATCHable enumeration)

Use this option to enable the server to operate at higher ambient temperatures than normally supported. These options are only supported with specific hardware configurations. See your server documentation before configuring the server to enable extended ambient temperature support. Improper system operation or damage to hardware components can result from enabling these options in unsupported configurations. Selecting Enabled for 40c Ambient (ASHRAE 3) enables the server to operate in environments with ambient temperatures up to 40 degrees Celsius. Selecting Enabled for 45c Ambient (ASHRAE 4) enables the server to operate in environments with ambient temperatures up to 45 degrees Celsius. Not all servers support both 40c Ambient (ASHRAE 3) and 45c Ambient (ASHRAE 4).

**Defined values**:

* `Disabled`:  Disabled

* `ASHRAE3`:  Enabled for 40c Ambient (ASHRAE 3)

* `ASHRAE4`:  Enabled for 45c Ambient (ASHRAE 4)

### ExtendedMemTest

**JSONPath**: `/ExtendedMemTest` (PATCHable enumeration)

When enabled, the system validates memory during the memory initialization process. If uncorrectable memory errors are detected, the memory is mapped out and the failed DIMMs are logged to the Integrated Management Log (IML). Enabling this option can result in a significant increase in system boot time.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### F11BootMenu

**JSONPath**: `/F11BootMenu` (PATCHable enumeration)

Use this option to disable the POST One-Time Boot F11 Prompt.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### FCScanPolicy

**JSONPath**: `/FCScanPolicy` (PATCHable enumeration)

Use this option to change the default Fibre Channel or FCoE policy for scanning for boot targets. When configured for Scan All Targets, each installed FC/FCoE adapter scans all available targets. When configured for Scan Configured Targets Only, the FC/FCoE adapters scan only targets that are preconfigured in the devices settings. This option overrides any individual device settings configured in the device specific setup.

**Defined values**:

* `AllTargets`:  Scan All Targets

* `CardConfig`:  Scan Configured Targets Only

### FanFailPolicy

**JSONPath**: `/FanFailPolicy` (PATCHable enumeration)

Use this option to configure how the server reacts when fans fail resulting in the server not having required fans in operation. When configured for "Shutdown/Halt on Critical Fan Failures," the server cannot boot or operate when it does not have required fans operating due to one or more fan failures.  When configured for "Allow Operation with Critical Fan Failures," the server can boot and operate if it does not have required fans operating due to one or more fan failures. It is recommended that you configure the Fan Failure Policy to the default state of "Shutdown/Halt on Critical Fan Failures." Operating without the required fans operating can result in damage to hardware components.

**Defined values**:

* `Shutdown`:  Shutdown/Halt on Critical Fan Failures

* `Allow`:  Allow Operation with Critical Fan Failures

### FanInstallReq

**JSONPath**: `/FanInstallReq` (PATCHable enumeration)

Use this option to configure how the server reacts when all required fans are not installed. When configured for Enable Messaging, the server displays messages and log events to the Integrated Management Log (IML) when required fans are not installed. The server can still boot and operate. When configured for Disable Messaging, the server does not display messages and log events when required fans are not installed. All indications that the server is operating without required fans are removed. It is recommended that you leave Fan Installation Requirements in the default state of Enable Messaging. Operating without the required fans can result in damage to hardware components.

**Defined values**:

* `EnableMessaging`:  Enable Messaging

* `DisableMessaging`:  Disable Messaging

### FlexLom1Enable

**JSONPath**: `/FlexLom1Enable` (PATCHable enumeration)

Select this option to enable or disable PCI devices.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### HwPrefetcher

**JSONPath**: `/HwPrefetcher` (PATCHable enumeration)

Use this option to disable the processor HW prefetch feature. In some cases, setting this option to disabled can improve performance. Typically, setting this option to enabled provides better performance. Only disable this option after performing application benchmarking to verify improved performance in the environment.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### IntelDmiLinkFreq

**JSONPath**: `/IntelDmiLinkFreq` (PATCHable enumeration)

Use this option to force the link speed between the processor and the southbridge to run at slower speeds to save power.

**Defined values**:

* `Auto`:  Auto

* `DmiGen1`:  Gen 1 Speed

### IntelNicDmaChannels

**JSONPath**: `/IntelNicDmaChannels` (PATCHable enumeration)

Use this option to select the Intel NIC DMA Channels support. This is a NIC acceleration option that runs only on Intel-based NICs.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### IntelPerfMonitoring

**JSONPath**: `/IntelPerfMonitoring` (PATCHable enumeration)

This option does not impact performance. When enabled, this option exposes certain chipset devices that can be used with the Intel Performance Monitoring Toolkit.

**Defined values**:

* `Disabled`:  Disabled

* `Enabled`:  Enabled

### IntelProcVtd

**JSONPath**: `/IntelProcVtd` (PATCHable enumeration)

If enabled, a hypervisor or operating system supporting this option can use hardware capabilities provided by Intel's Virtualization Technology for Directed I/O. You can leave this set to enabled even if you are not using a hypervisor or an operating system that uses this option.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### IntelQpiFreq

**JSONPath**: `/IntelQpiFreq` (PATCHable enumeration)

Use this option to set the QPI Link frequency to a lower speed. Running at a lower frequency can reduce power consumption, but can also affect system performance. You can only configure this option if two or more CPUs are present and the Power Profile is set to custom.

**Defined values**:

* `Auto`:  Auto

* `MinQpiSpeed`:  Min QPI Speed

### IntelQpiLinkEn

**JSONPath**: `/IntelQpiLinkEn` (PATCHable enumeration)

Use this option to configure the QPI topology to use fewer links between processors, when available. Changing from the default can reduce QPI bandwidth performance in exchange for less power consumption.

**Defined values**:

* `Auto`:  Auto

* `SingleLink`:  Single Link Operation

### IntelQpiPowerManagement

**JSONPath**: `/IntelQpiPowerManagement` (PATCHable enumeration)

Use this option to place the Quick Path Interconnect (QPI) links into a low power state when the links are not being used. This lowers power usage with minimal effect on performance. You can only configure this option if two or more CPUs are present and the Power Profile is set to custom.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### IntelTxt

**JSONPath**: `/IntelTxt` (PATCHable enumeration)

Use this option to modify Intel TXT support.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### IntelligentProvisioning

**JSONPath**: `/IntelligentProvisioning` (PATCHable enumeration)

Use this option to enable or disable the Intelligent Provisioning functionality. When disabled, you are prevented from entering the Intelligent Provisioning environment by pressing F10 during server boot. You must set this option to enabled to use Intelligent Provisioning functionality.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### InternalSDCardSlot

**JSONPath**: `/InternalSDCardSlot` (PATCHable enumeration)

Use this option to enable or disable the Internal SD Card Slot. When set to disabled, the SD card slot is disabled, regardless of whether an SD Card is installed or not. It will not be visible in the pre-boot environment or under the operating system.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### IoNonPostedPrefetching

**JSONPath**: `/IoNonPostedPrefetching` (PATCHable enumeration)

Disabling non-posted prefetching for I/O can significantly improve performance for a small set of configurations that require a balanced mix of read/write I/O traffic (for example, configurations that include Infiniband) or multiple x16 devices that utilize max bandwidth of the PCI-e bus. Disabling this feature does, however, have a slight impact on 100% I/O read bandwidth.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### Ipv4Address

**JSONPath**: `/Ipv4Address` (PATCHable string)

Use this option to specify the pre-boot network IPv4 address. Enter a static IP addresses using dotted-decimal notation (for example, 127.0.0.1). If DHCP is used (DHCPv4 option is enabled), this setting is unavailable because the value is supplied automatically.

### Ipv4Gateway

**JSONPath**: `/Ipv4Gateway` (PATCHable string)

Use this option to specify the pre-boot network gateway IPv4 address. Enter a static IP addresses using dotted-decimal notation (for example, 127.0.0.1). If DHCP is used (DHCPv4 option is enabled), this setting is unavailable because the value is supplied automatically.

### Ipv4PrimaryDNS

**JSONPath**: `/Ipv4PrimaryDNS` (PATCHable string)

Use this option to specify the pre-boot network Primary DNS Server IPv4 address. Enter a static IP addresses using dotted-decimal notation (for example, 127.0.0.1). If DHCP is used (DHCPv4 option is enabled), this setting is unavailable because the value is supplied automatically.

### Ipv4SecondaryDNS

**JSONPath**: `/Ipv4SecondaryDNS` (PATCHable string)

Use this option to specify the pre-boot network Secondary DNS Server IPv4 address. Enter a static IP addresses using dotted-decimal notation (for example, 127.0.0.1). If DHCP is used (DHCPv4 option is enabled), this setting is unavailable because the value is supplied automatically.

### Ipv4SubnetMask

**JSONPath**: `/Ipv4SubnetMask` (PATCHable string)

Use this option to specify the pre-boot network subnet mask. Enter a static IP addresses using dotted-decimal notation (for example, 255.255.255.0). If DHCP is used (DHCPv4 option is enabled), this setting is unavailable because the value is supplied automatically.

### Ipv6Duid

**JSONPath**: `/Ipv6Duid` (PATCHable enumeration)

Use this option to control the IPv6 DHCP Unique Identifier (DUID). If configured for Auto, the DUID is set using the server's Universal Unique Identifier (UUID), or using the DUID-LLT method if the server UUID is not available. If configured for DUID-LLT, the DUID is set based on Link-layer Address Plus Time [DUID-LLT] method. You can configure this option only when Boot Mode is set to UEFI.

**Defined values**:

* `Auto`:  Auto

* `DuidLlt`:  DUID-LLT

### MaxMemBusFreqMHz

**JSONPath**: `/MaxMemBusFreqMHz` (PATCHable enumeration)

You can only configure this option if the Power Profile is set to Custom. Use this option to configure the memory system to run memory at a lower maximum speed than that supported by the installed processor and DIMM configuration. Setting this option to Auto configures the system to run memory at the maximum speed supported.

**Defined values**:

* `Auto`:  Auto

* `2133`:  2133 MHz

* `1867`:  1867 MHz

* `1600`:  1600 MHz

* `1333`:  1333 MHz

### MaxPcieSpeed

**JSONPath**: `/MaxPcieSpeed` (PATCHable enumeration)

You can only configure this option if the Power Profile is set to Custom. If a PCI Express device does not run properly at its optimal speed, lowering the speed at which the device is running can address this issue. This option enables you to lower the maximum PCI Express speed at which the server allows PCI Express devices to operate. You can also use it to address issues with problematic PCI Express devices. Setting this value to Maximum Supported configures the platform to run at the maximum speed supported by the platform or the PCIe device, whichever is lower.

**Defined values**:

* `MaxSupported`:  Maximum Supported

* `PcieGen1`:  PCIe Generation 1.0

### MemFastTraining

**JSONPath**: `/MemFastTraining` (PATCHable enumeration)

Use this option to configure memory training on server reboots. When enabled, the platform uses the previously saved memory training parameters determined from the last cold boot of the server, which improves the server boot time. When disabled, the platform performs a full-memory training on every server reboot.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### MinProcIdlePkgState

**JSONPath**: `/MinProcIdlePkgState` (PATCHable enumeration)

You can configure this option only if the Power Profile is set to Custom. Use this option to select the lowest idle package power state (C-state) of the processor. The processor automatically transitions into package C-states based on the Core C-states in which cores on the processor have transitioned. The higher the package C-state, the lower the power usage of that idle package state. (Package C6 (retention) is the lowest power idle package state supported by the processor).

**Defined values**:

* `C6Retention`:  Package C6 (retention) State

* `C6NonRetention`:  Package C6 (non-retention) State

* `NoState`:  No Package State

### MinProcIdlePower

**JSONPath**: `/MinProcIdlePower` (PATCHable enumeration)

You can only configure this option if Power Profile is set to Custom. Use this option to select the lowest idle power state (C-state) of the processor that the operating system uses. The higher the C-state, the lower the power usage of that idle state. (C6 is the lowest power idle state supported by the processor).

**Defined values**:

* `C6`:  C6 State

* `C3`:  C3 State

* `C1E`:  C1E State

* `NoCStates`:  No C-states

### MixedPowerSupplyReporting

**JSONPath**: `/MixedPowerSupplyReporting` (PATCHable enumeration)

When enabled, the server logs a message that a mixed power supply configuration is present. When disabled, the server no longer logs messages that a mixed power supply configuration is present.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### NetworkBootRetry

**JSONPath**: `/NetworkBootRetry` (PATCHable enumeration)

Use this option to disable the Network Boot Retry setting. By default, the System BIOS attempts to boot the Network device (such as a PXE device) up to 20 times before moving to the next IPL device.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### NicBoot1

**JSONPath**: `/NicBoot1` (PATCHable enumeration)

Use this option to enable network boot (PXE, iSCSI, or FCoE) for the selected NIC. You might need to configure the NIC firmware for the boot option to be active.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### NicBoot10

**JSONPath**: `/NicBoot10` (PATCHable enumeration)

Use this option to enable network boot (PXE, iSCSI, or FCoE) for the selected NIC. You might need to configure the NIC firmware for the boot option to be active.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### NicBoot11

**JSONPath**: `/NicBoot11` (PATCHable enumeration)

Use this option to enable network boot (PXE, iSCSI, or FCoE) for the selected NIC. You might need to configure the NIC firmware for the boot option to be active.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### NicBoot12

**JSONPath**: `/NicBoot12` (PATCHable enumeration)

Use this option to enable network boot (PXE, iSCSI, or FCoE) for the selected NIC. You might need to configure the NIC firmware for the boot option to be active.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### NicBoot2

**JSONPath**: `/NicBoot2` (PATCHable enumeration)

Use this option to enable network boot (PXE, iSCSI, or FCoE) for the selected NIC. You might need to configure the NIC firmware for the boot option to be active.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### NicBoot3

**JSONPath**: `/NicBoot3` (PATCHable enumeration)

Use this option to enable network boot (PXE, iSCSI, or FCoE) for the selected NIC. You might need to configure the NIC firmware for the boot option to be active.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### NicBoot4

**JSONPath**: `/NicBoot4` (PATCHable enumeration)

Use this option to enable network boot (PXE, iSCSI, or FCoE) for the selected NIC. You might need to configure the NIC firmware for the boot option to be active.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### NicBoot5

**JSONPath**: `/NicBoot5` (PATCHable enumeration)

Use this option to enable network boot (PXE, iSCSI, or FCoE) for the selected NIC. You might need to configure the NIC firmware for the boot option to be active.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### NicBoot6

**JSONPath**: `/NicBoot6` (PATCHable enumeration)

Use this option to enable network boot (PXE, iSCSI, or FCoE) for the selected NIC. You might need to configure the NIC firmware for the boot option to be active.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### NicBoot7

**JSONPath**: `/NicBoot7` (PATCHable enumeration)

Use this option to enable network boot (PXE, iSCSI, or FCoE) for the selected NIC. You might need to configure the NIC firmware for the boot option to be active.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### NicBoot8

**JSONPath**: `/NicBoot8` (PATCHable enumeration)

Use this option to enable network boot (PXE, iSCSI, or FCoE) for the selected NIC. You might need to configure the NIC firmware for the boot option to be active.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### NicBoot9

**JSONPath**: `/NicBoot9` (PATCHable enumeration)

Use this option to enable network boot (PXE, iSCSI, or FCoE) for the selected NIC. You might need to configure the NIC firmware for the boot option to be active.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### NmiDebugButton

**JSONPath**: `/NmiDebugButton` (PATCHable enumeration)

Use this option to generate an NMI via the NMI button/jumper.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### NodeInterleaving

**JSONPath**: `/NodeInterleaving` (PATCHable enumeration)

Use this option to disable the NUMA architecture properties for the system. All operating system platforms support NUMA architectures. In most cases, optimum performance is obtained by disabling the Node Interleaving option. When this option is enabled, memory addresses are interleaved across the memory installed for each processor. Some workloads might experience improved performance when this option is enabled.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### NumaGroupSizeOpt

**JSONPath**: `/NumaGroupSizeOpt` (PATCHable enumeration)

Use this option to configure how the System ROM reports the size of a NUMA node (number of logical processors), which assists the Operating System in grouping processors for application use (referred to as Kgroups). The default setting of Clustered provides better performance due to the resulting groups being optimized along NUMA boundaries. However, some applications might not be optimized to take advantage of processors spanning multiple groups. In such cases, selecting the Flat option might be necessary in order for those applications to utilize more logical processors.

**Defined values**:

* `Clustered`:  Clustered

* `Flat`:  Flat

### OldAdminPassword

**JSONPath**: `/OldAdminPassword` (PATCHable password)

In order to set a new Admin Password, the previous Admin Password must be specified.

### OldPowerOnPassword

**JSONPath**: `/OldPowerOnPassword` (PATCHable password)

In order to set a new Power On Password, the previous Power On Password must be specified.

### PciBusPadding

**JSONPath**: `/PciBusPadding` (PATCHable enumeration)

Use this option to disable the default PCI Bus setting where each expansion slot is provided with an extra PCI Bus number. By default, the System BIOS pads one PCI bus per expansion slot so that expansion cards with PCI-PCI bridges do not effect current bus numbering schemes. Disabling this option works around issues with certain expansion cards. It is recommended that you do not disable this option unless a specific issue is encountered.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### PciSlot1Enable

**JSONPath**: `/PciSlot1Enable` (PATCHable enumeration)

Select this option to enable or disable PCI devices.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### PciSlot2Enable

**JSONPath**: `/PciSlot2Enable` (PATCHable enumeration)

Select this option to enable or disable PCI devices.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### PciSlot3Enable

**JSONPath**: `/PciSlot3Enable` (PATCHable enumeration)

Select this option to enable or disable PCI devices.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### PciSlot4Enable

**JSONPath**: `/PciSlot4Enable` (PATCHable enumeration)

Select this option to enable or disable PCI devices.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### PciSlot5Enable

**JSONPath**: `/PciSlot5Enable` (PATCHable enumeration)

Select this option to enable or disable PCI devices.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### PciSlot6Enable

**JSONPath**: `/PciSlot6Enable` (PATCHable enumeration)

Select this option to enable or disable PCI devices.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### PcieExpressEcrcSupport

**JSONPath**: `/PcieExpressEcrcSupport` (PATCHable enumeration)

Use this option to control the PCI Express End-to-End CRC (ECRC) policy for all installed PCIe Devices. When set to enabled, a PCI Express device that supports this option can take advantage of end-to-end CRC checking to increase the reliability of data transfers. 

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### PostF1Prompt

**JSONPath**: `/PostF1Prompt` (PATCHable enumeration)

Use this option to configure the system to display the F1 key in the server POST screen. If an error is encountered, you can press the F1 key to continue with the server power-up sequence. Select one of the following options: 
Delayed 20 Seconds - If an error occurs, the system pauses for 20 seconds at the F1 prompt and continues to boot the OS. 
Delayed 2 Seconds - If an error occurs, the system pauses for 2 seconds at the F1 prompt and continues to boot the OS. 
Disabled - If an error occurs, the system bypasses the F1 prompt and continues to boot the OS. 
Note: For critical errors, the system pauses for 20 seconds at the F1 prompt, regardless of how this option is configured.

**Defined values**:

* `Delayed20Sec`:  Delayed 20 seconds

* `Delayed2Sec`:  Delayed 2 seconds

* `Disabled`:  Disabled

### PowerButton

**JSONPath**: `/PowerButton` (PATCHable enumeration)

Disabling this option disables the momentary power button functionality. This option does not affect the four-second power button override or the remote power control functionality.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### PowerOnDelay

**JSONPath**: `/PowerOnDelay` (PATCHable enumeration)

Use this option to delay the server from turning on for a specified time. Pressing the power button (using the Virtual Power Button), or Wake-ON LAN events, and RTC Wake-up events override the delay and immediately turn on the server. This enables staggering when servers power-up after a power loss to prevent power usage spikes.

**Defined values**:

* `None`:  No Delay

* `Random`:  Random Delay

* `15Sec`:  15 Second Delay

* `30Sec`:  30 Second Delay

* `45Sec`:  45 Second Delay

* `60Sec`:  60 Second Delay

### PowerOnLogo

**JSONPath**: `/PowerOnLogo` (PATCHable enumeration)

Use this option to disable the display of the logo during system boot. This option does not affect system boot times.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### PowerOnPassword

**JSONPath**: `/PowerOnPassword` (PATCHable password)

When the server powers on, a prompt is displayed to enter a password before continuing the boot process. In the event of an ASR reboot, the Power-On Password is bypassed and the server boots normally.

### PowerProfile

**JSONPath**: `/PowerProfile` (PATCHable enumeration)

- Balanced Power and Performance:  Provides the optimum settings to maximize power savings with minimal impact to performance for most operating systems and applications. 
- Minimum Power Usage:  Enables power reduction mechanisms that can negatively affect performance. This mode guarantees a lower maximum power usage by the system. 
- Maximum Performance:  Disables all power management options that can negatively affect performance.

**Defined values**:

* `BalancedPowerPerf`:  Balanced Power and Performance

* `MinPower`:  Minimum Power Usage

* `MaxPerf`:  Maximum Performance

* `Custom`:  Custom

### PowerRegulator

**JSONPath**: `/PowerRegulator` (PATCHable enumeration)

You can only configure this option if the Power Profile is set to Custom. Use this option to configure the following Power Regulator support: 
- Dynamic Power Savings Mode: Automatically varies processor speed and power usage based on processor utilization. Allows for the reduction of overall power consumption with little or no impact on performance. Does not require OS support. 
- Static Low Power Mode: Reduces processor speed and power usage. Guarantees a lower maximum power usage for the system. Performance impacts are greater for environments with higher processor utilization. 
- Static High Performance Mode: Processors run in their maximum power/performance state at all times regardless of the OS power management policy. 
- OS Control Mode: Processors run in their maximum power/performance state at all times unless the OS enables a power management policy.

**Defined values**:

* `DynamicPowerSavings`:  Dynamic Power Savings Mode

* `StaticLowPower`:  Static Low Power Mode

* `StaticHighPerf`:  Static High Performance Mode

* `OsControl`:  OS Control Mode

### PreBootNetwork

**JSONPath**: `/PreBootNetwork` (PATCHable enumeration)

Use this option to select the network interface used for pre-boot network connections. If the selected NIC has more than one port, only the first port with a network connection is used. When the selection is Auto, the system uses the first available port with a network connection.

**Defined values**:

* `Auto`:  Auto

* `EmbNic`:  Embedded NIC

* `FlexLom1`:  Embedded FlexibleLOM 1

* `PciSlot1`:  PCIe Slot 1

* `PciSlot2`:  PCIe Slot 2

* `PciSlot3`:  PCIe Slot 3

* `PciSlot4`:  PCIe Slot 4

* `PciSlot5`:  PCIe Slot 5

* `PciSlot6`:  PCIe Slot 6

### ProcAes

**JSONPath**: `/ProcAes` (PATCHable enumeration)

Use this option to enable or disable the Advanced Encryption Standard Instruction Set (AES-NI) in the processor.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### ProcCoreDisable

**JSONPath**: `/ProcCoreDisable` (PATCHable integer)

Use this option to disable processor cores using Intel's Core Multi-Processing (CMP) Technology. This option disables a specific number of the cores on each physical processor, which can reduce processor power usage and can improve performance for some applications, such as those that benefit from higher performance cores rather than more processing cores. This option also addresses issues with software that is licensed on a per-core basis. Enter a value equal to the number of enabled cores per socket.

### ProcHyperthreading

**JSONPath**: `/ProcHyperthreading` (PATCHable enumeration)

Use this option to enable or disable Intel Hyperthreading. When enabled, each physical processor core operates as two logical processor cores. When disabled, each physical processor core operates as only one logical processor core. Enabling this option can improve overall performance for applications that benefit from a higher processor core count.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### ProcNoExecute

**JSONPath**: `/ProcNoExecute` (PATCHable enumeration)

Use this option to protect your system against malicious code and viruses. Memory is marked as non-executable unless the location contains executable code. Some viruses attempt to insert and execute code from non-executable memory locations. Attacks are intercepted and an exception is generated. Your operating system must support this option. 

Certain operating systems (including Windows 2012 and Windows 2012 R2) require this option to be enabled and override this setting.  See your operating system documentation for more details.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### ProcTurbo

**JSONPath**: `/ProcTurbo` (PATCHable enumeration)

Turbo Boost Technology enables the processor to transition to a higher frequency than the processor's rated speed if the processor has available power and is within temperature specifications. Disabling this option reduces power usage and also reduces the system's maximum achievable performance under some workloads.

**Defined values**:

* `Disabled`:  Disabled

* `Enabled`:  Enabled

### ProcVirtualization

**JSONPath**: `/ProcVirtualization` (PATCHable enumeration)

When enabled, a hypervisor or operating system supporting this option can use hardware capabilities provided by Intel's Virtualization Technology. Some hypervisors require that you enable Virtualization Technology. You can leave this set to enabled even if you are not using a hypervisor or an operating system that uses this option.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### ProcX2Apic

**JSONPath**: `/ProcX2Apic` (PATCHable enumeration)

x2APIC support enables operating systems to run more efficiently on high core count configurations. It also optimized interrupt distribution in virtualized environments. In most cases, set this option to enabled. This configures the operating system to optionally enable x2APIC support when it loads. Some older hypervisors and operating systems might have issues with optional x2APIC support, in which case disabling x2APIC might be necessary to address those issues. Additionally, some hypervisors and operating systems will not use X2APIC unless this option is set to Force Enabled prior to booting.  The Force Enabled option also causes the Intel(R) VT-d setting to be set to enabled.

**Defined values**:

* `Enabled`:  Enabled

* `ForceEnabled`:  Force Enabled

* `Disabled`:  Disabled

### ProductId

**JSONPath**: `/ProductId` (PATCHable string)

Use this option to set the system product ID. This value must always match the product ID sticker located on the chassis.

### QpiBandwidthOpt

**JSONPath**: `/QpiBandwidthOpt` (PATCHable enumeration)

The QPI link between two processors provides the best performance for most applications. The Balanced option provides the best performance for most applications and benchmarks. The optimized for I/O option can increase bandwidth from I/O devices, such as GPUs that rely on direct access to system memory. This option is only configurable if two or more CPUs are present.

**Defined values**:

* `Balanced`:  Balanced

* `OptimizedForIo`:  Optimized for I/O (Alternate RTID)

### QpiHomeSnoopOpt

**JSONPath**: `/QpiHomeSnoopOpt` (PATCHable enumeration)

This option allows the disabling of the Directory and Opportunistic Snoop Broadcast (OSB) functionality that is available when the QPI snoop mode is set to Home Snoop. Directory and OSB provides better memory latency and increased bandwidth and is recommended for the vast majority of workloads that benefit from Home Snoop. 

**Defined values**:

* `DirectoryOsbEnabled`:  Directory + OSB Enabled

* `DirectoryOsbDisabled`:  Directory + OSB Disabled

### QpiSnoopConfig

**JSONPath**: `/QpiSnoopConfig` (PATCHable enumeration)

Use this option to select the snoop mode used by the processor and QPI bus. Changing this option can have an impact on memory performance. The Home Snoop option provides high-memory bandwidth in an average NUMA environment. The Cluster on Die option can provide increased memory bandwidth in highly optimized NUMA workloads. The Early Snoop option can decrease memory latency, but can also result in lower overall bandwidth as compared to the other modes. 

**Defined values**:

* `Standard`:  Home Snoop

* `EarlySnoop`:  Early Snoop

* `ClusterOnDie`:  Cluster on Die

### RedundantPowerSupply

**JSONPath**: `/RedundantPowerSupply` (PATCHable enumeration)

Use this option to configure how the system handles redundant power supply configurations. Balanced Mode shares the power delivery equally between all installed power supplies. All High Efficiency Mode options provide the most power efficient operation with redundant power supplies by keeping half of the power supplies in standby mode at lower power usage levels. The High Efficiency Mode options enable the system to select which power supply to place in standby. Auto enables the system to select between the odd or even power supply based on a semi-random distribution within a group of systems.

**Defined values**:

* `BalancedMode`:  Balanced Mode

* `HighEfficiencyAuto`:  High Efficiency Mode (Auto)

* `HighEfficiencyOddStandby`:  High Efficiency Mode (Odd Supply Standby)

* `HighEfficiencyEvenStandby`:  High Efficiency Mode (Even Supply Standby)

### RemovableFlashBootSeq

**JSONPath**: `/RemovableFlashBootSeq` (PATCHable enumeration)

Use this option to select which USB or SD Card devices you want to search for first when enumerating boot devices. You can select whether the systemboots to external USB drive keys, internal USB drive keys, or the internal SD card slot. This option does not override the device boot order in the Standard Boot Order (IPL) option. You can only configure this option when Boot Mode is set to Legacy BIOS.

**Defined values**:

* `InternalSdCardFirst`:  Internal SD Card First

* `InternalKeysFirst`:  Internal DriveKeys First

* `ExternalKeysFirst`:  External DriveKeys First

### RestoreDefaults

**JSONPath**: `/RestoreDefaults` (PATCHable enumeration)

Use this option to reset all configuration settings to their default values. Changes that have been made might be lost. You need to reboot the system for changes to take effect.

**Defined values**:

* `No`:  No, cancel the restore procedure.

* `Yes`:  Yes, restore the default settings.

### RestoreManufacturingDefaults

**JSONPath**: `/RestoreManufacturingDefaults` (PATCHable enumeration)

Use this option to reset all configuration settings to their default manufacturing values. Changes that have been made might be lost. If Secure Boot is enabled, related security settings might be lost. You need to reboot the system for changes to take effect.

**Defined values**:

* `No`:  No, cancel restore procedure.

* `Yes`:  Yes, restore the default settings.

### RomSelection

**JSONPath**: `/RomSelection` (PATCHable enumeration)

Use this option to revert the server to a previous BIOS ROM image. The backup image is the BIOS ROM image that was used prior to the last flash event.

**Defined values**:

* `CurrentRom`:  Use Current ROM

* `BackupRom`:  Switch to Backup ROM

### SataSecureErase

**JSONPath**: `/SataSecureErase` (PATCHable enumeration)

Use this option to control whether Secure Erase functionality is supported. When enabled, the Security Freeze Lock command is not sent to supported SATA hard drives, enabling Secure erase to function (the Secure Erase command is supported). This option is only supported when the SATA controller is in AHCI mode. Secure Erase only operates with hard drives that support the Secure Erase command.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### SaveUserDefaults

**JSONPath**: `/SaveUserDefaults` (PATCHable enumeration)

Select this option to save the current settings as the system defaults.

**Defined values**:

* `No`:  No, Cancel

* `Yes`:  Yes, Save

### SecureBootStatus

**JSONPath**: `/SecureBootStatus` (read only enumeration)

The current state of Secure Boot configuration.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### SerialConsoleBaudRate

**JSONPath**: `/SerialConsoleBaudRate` (PATCHable enumeration)

This is the transfer rate at which data is transmitted through the serial port.

**Defined values**:

* `9600`:  9600

* `19200`:  19200

* `38400`:  38400

* `57600`:  57600

* `115200`:  115200

### SerialConsoleEmulation

**JSONPath**: `/SerialConsoleEmulation` (PATCHable enumeration)

Use this option to select the emulation mode type. The option you select depends on the emulation you want to use in your serial terminal program (such as Hyperterminal or Putty). The BIOS emulation mode must match the mode you select in your terminal program.

**Defined values**:

* `Vt100`:  VT100

* `Ansi`:  ANSI

* `Vt100Plus`:  VT100+

### SerialConsolePort

**JSONPath**: `/SerialConsolePort` (PATCHable enumeration)

Use this option to re-direct video and keystrokes through the serial port to OS boot. This option can interfere with non-terminal devices attached to the serial port. In such cases, set this option to Disabled. This option is only supported in English language mode when running in the UEFI pre-boot System Utilities.

**Defined values**:

* `Auto`:  Auto

* `Disabled`:  Disabled

* `Physical`:  Physical Serial Port

* `Virtual`:  Virtual Serial Port

### SerialNumber

**JSONPath**: `/SerialNumber` (PATCHable string)

Use this option to set the system serial number. This value must always match the serial number sticker located on the chassis.

### ServerAssetTag

**JSONPath**: `/ServerAssetTag` (PATCHable string)

Select this option to modify the Server Asset Tag text line.

### ServerName

**JSONPath**: `/ServerName` (PATCHable string)

Select this option to modify the server name text line.

### ServerOtherInfo

**JSONPath**: `/ServerOtherInfo` (PATCHable string)

Use this option to modify the Other Server text line.

### ServerPrimaryOs

**JSONPath**: `/ServerPrimaryOs` (PATCHable string)

Use this option to modify the Server Primary OS text line.

### ServiceEmail

**JSONPath**: `/ServiceEmail` (PATCHable string)

Enter the server service contact e-mail address.

### ServiceName

**JSONPath**: `/ServiceName` (PATCHable string)

Enter the server service contact name text.

### ServiceOtherInfo

**JSONPath**: `/ServiceOtherInfo` (PATCHable string)

Enter the other server service contact information text.

### ServicePhone

**JSONPath**: `/ServicePhone` (PATCHable string)

Enter the server service contact phone number text.

### Slot1NicBoot1

**JSONPath**: `/Slot1NicBoot1` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot1NicBoot2

**JSONPath**: `/Slot1NicBoot2` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot1NicBoot3

**JSONPath**: `/Slot1NicBoot3` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot1NicBoot4

**JSONPath**: `/Slot1NicBoot4` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot1NicBoot5

**JSONPath**: `/Slot1NicBoot5` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot1NicBoot6

**JSONPath**: `/Slot1NicBoot6` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot1NicBoot7

**JSONPath**: `/Slot1NicBoot7` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot1NicBoot8

**JSONPath**: `/Slot1NicBoot8` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot1StorageBoot

**JSONPath**: `/Slot1StorageBoot` (PATCHable enumeration)

When Boot All Targets is selected, the UEFI BIOS will allow all valid boot targets attached to the storage controller to be made available in the UEFI Boot Order List. If Boot No Targets is selected, no boot targets from this storage controller will be made available in the UEFI Boot Order.If Boot Limit to 3 Targets is selected, 3 boot targets attached to the storage controller will be made available in the UEFI Boot Order.

**Defined values**:

* `AllTargets`:  Boot All Targets

* `ThreeTargets`:  Boot Limit to 3 Targets

* `NoTargets`:  Boot No Targets

### Slot2NicBoot1

**JSONPath**: `/Slot2NicBoot1` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot2NicBoot2

**JSONPath**: `/Slot2NicBoot2` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot2NicBoot3

**JSONPath**: `/Slot2NicBoot3` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot2NicBoot4

**JSONPath**: `/Slot2NicBoot4` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot2NicBoot5

**JSONPath**: `/Slot2NicBoot5` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot2NicBoot6

**JSONPath**: `/Slot2NicBoot6` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot2NicBoot7

**JSONPath**: `/Slot2NicBoot7` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot2NicBoot8

**JSONPath**: `/Slot2NicBoot8` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot2StorageBoot

**JSONPath**: `/Slot2StorageBoot` (PATCHable enumeration)

When Boot All Targets is selected, the UEFI BIOS will allow all valid boot targets attached to the storage controller to be made available in the UEFI Boot Order List. If Boot No Targets is selected, no boot targets from this storage controller will be made available in the UEFI Boot Order.If Boot Limit to 3 Targets is selected, 3 boot targets attached to the storage controller will be made available in the UEFI Boot Order.

**Defined values**:

* `AllTargets`:  Boot All Targets

* `ThreeTargets`:  Boot Limit to 3 Targets

* `NoTargets`:  Boot No Targets

### Slot3NicBoot1

**JSONPath**: `/Slot3NicBoot1` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot3NicBoot2

**JSONPath**: `/Slot3NicBoot2` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot3NicBoot3

**JSONPath**: `/Slot3NicBoot3` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot3NicBoot4

**JSONPath**: `/Slot3NicBoot4` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot3NicBoot5

**JSONPath**: `/Slot3NicBoot5` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot3NicBoot6

**JSONPath**: `/Slot3NicBoot6` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot3NicBoot7

**JSONPath**: `/Slot3NicBoot7` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot3NicBoot8

**JSONPath**: `/Slot3NicBoot8` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot3StorageBoot

**JSONPath**: `/Slot3StorageBoot` (PATCHable enumeration)

When Boot All Targets is selected, the UEFI BIOS will allow all valid boot targets attached to the storage controller to be made available in the UEFI Boot Order List. If Boot No Targets is selected, no boot targets from this storage controller will be made available in the UEFI Boot Order.If Boot Limit to 3 Targets is selected, 3 boot targets attached to the storage controller will be made available in the UEFI Boot Order.

**Defined values**:

* `AllTargets`:  Boot All Targets

* `ThreeTargets`:  Boot Limit to 3 Targets

* `NoTargets`:  Boot No Targets

### Slot4NicBoot1

**JSONPath**: `/Slot4NicBoot1` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot4NicBoot2

**JSONPath**: `/Slot4NicBoot2` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot4NicBoot3

**JSONPath**: `/Slot4NicBoot3` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot4NicBoot4

**JSONPath**: `/Slot4NicBoot4` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot4NicBoot5

**JSONPath**: `/Slot4NicBoot5` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot4NicBoot6

**JSONPath**: `/Slot4NicBoot6` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot4NicBoot7

**JSONPath**: `/Slot4NicBoot7` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot4NicBoot8

**JSONPath**: `/Slot4NicBoot8` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot4StorageBoot

**JSONPath**: `/Slot4StorageBoot` (PATCHable enumeration)

When Boot All Targets is selected, the UEFI BIOS will allow all valid boot targets attached to the storage controller to be made available in the UEFI Boot Order List. If Boot No Targets is selected, no boot targets from this storage controller will be made available in the UEFI Boot Order.If Boot Limit to 3 Targets is selected, 3 boot targets attached to the storage controller will be made available in the UEFI Boot Order.

**Defined values**:

* `AllTargets`:  Boot All Targets

* `ThreeTargets`:  Boot Limit to 3 Targets

* `NoTargets`:  Boot No Targets

### Slot5NicBoot1

**JSONPath**: `/Slot5NicBoot1` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot5NicBoot2

**JSONPath**: `/Slot5NicBoot2` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot5NicBoot3

**JSONPath**: `/Slot5NicBoot3` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot5NicBoot4

**JSONPath**: `/Slot5NicBoot4` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot5NicBoot5

**JSONPath**: `/Slot5NicBoot5` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot5NicBoot6

**JSONPath**: `/Slot5NicBoot6` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot5NicBoot7

**JSONPath**: `/Slot5NicBoot7` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot5NicBoot8

**JSONPath**: `/Slot5NicBoot8` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot5StorageBoot

**JSONPath**: `/Slot5StorageBoot` (PATCHable enumeration)

When Boot All Targets is selected, the UEFI BIOS will allow all valid boot targets attached to the storage controller to be made available in the UEFI Boot Order List. If Boot No Targets is selected, no boot targets from this storage controller will be made available in the UEFI Boot Order.If Boot Limit to 3 Targets is selected, 3 boot targets attached to the storage controller will be made available in the UEFI Boot Order.

**Defined values**:

* `AllTargets`:  Boot All Targets

* `ThreeTargets`:  Boot Limit to 3 Targets

* `NoTargets`:  Boot No Targets

### Slot6NicBoot1

**JSONPath**: `/Slot6NicBoot1` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot6NicBoot2

**JSONPath**: `/Slot6NicBoot2` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot6NicBoot3

**JSONPath**: `/Slot6NicBoot3` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot6NicBoot4

**JSONPath**: `/Slot6NicBoot4` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot6NicBoot5

**JSONPath**: `/Slot6NicBoot5` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot6NicBoot6

**JSONPath**: `/Slot6NicBoot6` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot6NicBoot7

**JSONPath**: `/Slot6NicBoot7` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot6NicBoot8

**JSONPath**: `/Slot6NicBoot8` (PATCHable enumeration)

Use this option to enable/disable UEFI network boot for the selected NIC card.This option applies only for PXE Boot and iSCSI Software Initiator boot attempts in UEFI Boot Mode.

**Defined values**:

* `NetworkBoot`:  Network Boot

* `Disabled`:  Disabled

### Slot6StorageBoot

**JSONPath**: `/Slot6StorageBoot` (PATCHable enumeration)

When Boot All Targets is selected, the UEFI BIOS will allow all valid boot targets attached to the storage controller to be made available in the UEFI Boot Order List. If Boot No Targets is selected, no boot targets from this storage controller will be made available in the UEFI Boot Order.If Boot Limit to 3 Targets is selected, 3 boot targets attached to the storage controller will be made available in the UEFI Boot Order.

**Defined values**:

* `AllTargets`:  Boot All Targets

* `ThreeTargets`:  Boot Limit to 3 Targets

* `NoTargets`:  Boot No Targets

### Sriov

**JSONPath**: `/Sriov` (PATCHable enumeration)

If enabled, SR-IOV support enables a hypervisor to create virtual instances of a PCI-express device, potentially increasing performance. If enabled, the BIOS allocates additional resources to PCI-express devices. You can leave this option set to enabled even if you are not using a hypervisor.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### ThermalConfig

**JSONPath**: `/ThermalConfig` (PATCHable enumeration)

Use this option to select the fan cooling solution for the system. Optimal Cooling provides the most efficient solution by configuring fan speeds to the minimum required speedto provide adequate cooling. Increased Cooling runs fans at higher speeds to provide additional cooling. Select Increased Cooling when third-party storage controllers are cabled to the embedded hard drive cage, or if the system is experiencing thermal issues that cannot be resolved. Maximum cooling provides the maximum cooling available on this platform.

**Defined values**:

* `OptimalCooling`:  Optimal Cooling

* `IncreasedCooling`:  Increased Cooling

* `MaxCooling`:  Maximum Cooling

### ThermalShutdown

**JSONPath**: `/ThermalShutdown` (PATCHable enumeration)

Use this option to control the reaction of the system to caution level thermal events. When disabled, the System Management Firmware ignores thermal events and the system immediately powers off in data-destructive situations.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### TimeFormat

**JSONPath**: `/TimeFormat` (PATCHable enumeration)

This option controls how the system time is stored in the hardware Real Time Clock (RTC). When configured to 'Coordinated Universal Time (UTC)' (default) the local time is calculated from the associated time zone value. When configured to 'Local Time' the time is stored directly as local time and the time zone option does not have meaning. Setting this option to 'Local Time' works around an issue when using Microsoft Windows operating systems in Legacy Boot Mode where the time is set incorrectly.

**Defined values**:

* `Utc`:  Coordinated Universal Time (UTC)

* `Local`:  Local Time

### TimeZone

**JSONPath**: `/TimeZone` (PATCHable enumeration)

This option displays the current time zone setting for the system.

**Defined values**:

* `UtcM12`:  UTC-12:00, International Date Line West

* `UtcM11`:  UTC-11:00, Midway Island, Samoa

* `UtcM10`:  UTC-10:00, Hawaii

* `UtcM9`:  UTC-09:00, Alaska

* `UtcM8`:  UTC-08:00, Pacific Time(US & Canada)

* `UtcM7`:  UTC-07:00, Mountain Time (US & Canada)

* `UtcM6`:  UTC-06:00, Central America, Central Time(US & Canada)

* `UtcM5`:  UTC-05:00, Eastern Time(US & Canada)

* `UtcM430`:  UTC-04:30, Caracas

* `UtcM4`:  UTC-04:00, Atlantic Time(Canada), Caracas, Santiago

* `UtcM330`:  UTC-03:30, Newfoundland

* `UtcM3`:  UTC-03:00, Brasilia, Buenos Aires, Georgetown, Greenland

* `UtcM2`:  UTC-02:00, Mid-Atlantic

* `UtcM1`:  UTC-01:00, Azores, Cape Verde Is.

* `Utc0`:  UTC-00:00, Greenwich Mean Time, Dublin, London

* `UtcP1`:  UTC+01:00, Amsterdam, Berlin, Rome, Paris, West Central Africa

* `UtcP2`:  UTC+02:00, Athens, Istanbul, Cairo, Jerusalem

* `UtcP3`:  UTC+03:00, Baghdad, Kuwait, Riyadh, Moscow, Nairobi

* `UtcP330`:  UTC+03:30, Tehran

* `UtcP4`:  UTC+04:00, Abu Dhabi, Muscat, Baku, Tbilisi, Yerevan

* `UtcP430`:  UTC+04:30, Kabul

* `UtcP5`:  UTC+05:00, Ekaterinburg, Islamabad, Karachi, Tashkent

* `UtcP530`:  UTC+05:30, Chennai, Kolkata, Mumbai, New Delhi

* `UtcP545`:  UTC+05:45, Kathmandu

* `UtcP6`:  UTC+06:00, Almaty, Novosibirsk, Astana, Dhaka

* `UtcP630`:  UTC+06:30, Rangoon

* `UtcP7`:  UTC+07:00, Bangkok, Hanio, Jakarta, Krasnoyarsk

* `UtcP8`:  UTC+08:00, Taipei, Beijing, Chongqing, Hong Kong, Urumqi

* `UtcP9`:  UTC+09:00, Osaka, Sapporo, Tokyo, Seoul, Yakutsk

* `UtcP930`:  UTC+09:30, Adelaide, Darwin

* `UtcP10`:  UTC+10:00, Canberra, Melbourne, Sydney, Guam, Hobart, Vladivostok

* `UtcP11`:  UTC+11:00, Magadan, Solomon Is., New Caledonia

* `UtcP12`:  UTC+12:00, Auckland, Wellington, Fiji, Kamchatka, Marshall Is.

* `UtcP13`:  UTC+13:00, Nuku'alofa

* `UtcP14`:  UTC+14:00, Line Islands

* `Unspecified`:  Unspecified Time Zone

### TmOperation

**JSONPath**: `/TmOperation` (PATCHable enumeration)

Use this option to enable the Trusted Module (TM) and BIOS secure startup. When enabled, the TM is fully functional. When disabled, the TM is visible; however, functionality is limited. This option also enables you to reset the TM to factory settings, which clears any assigned passwords, keys, or ownership data. Clearing the TM can prevent the server from booting to a TM-aware operating system if the operating system uses TM's measurements.

**Defined values**:

* `NoAction`:  No Action

* `Enable`:  Enable

* `Disable`:  Disable

* `Clear`:  Clear

### TmVisibility

**JSONPath**: `/TmVisibility` (PATCHable enumeration)

Use this option to hide the Trusted Module (TM) from the operating system. When the TM is hidden, BIOS secure startup is disabled, and the TM does not respond to any commands. Intended use is for removing the TM option from the system without removing the actual hardware.

**Defined values**:

* `Hidden`:  Hidden

* `Visible`:  Visible

### Tpm2Operation

**JSONPath**: `/Tpm2Operation` (PATCHable enumeration)

Use this option to perform a clear operation on the TPM. Clearing the TPM can prevent the server from booting to a TPM-aware operating system if the operating system uses TPM's measurements. TPM 2.0 is supported only in UEFI Boot Mode.

**Defined values**:

* `NoAction`:  No Action

* `Clear`:  Clear

### Tpm2Ppi

**JSONPath**: `/Tpm2Ppi` (PATCHable enumeration)

Use this option to control Physical Presence Interface for TPM 2.0 operation. This option is used to control whether the user is prompted during the next boot after a TPM 2.0 operation request was initiated by the Operating System. When TPM 2.0 Physical Presence Confirmation is Enabled, the system will prompt for confirmation during POST. When TPM 2.0 Physical Presence Confirmation is Disabled, the system will not prompt for confirmation during POST.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### Tpm2Visibility

**JSONPath**: `/Tpm2Visibility` (PATCHable enumeration)

Use this option to hide TPM from the operating system. When the TPM is hidden, BIOS secure startup is disabled, and the TPM does not respond to any commands. Intended use is for removing the TPM option from the system without removing the actual hardware. TPM 2.0 is only supported in UEFI boot mode.

**Defined values**:

* `Hidden`:  Hidden

* `Visible`:  Visible

### TpmBinding

**JSONPath**: `/TpmBinding` (PATCHable enumeration)

Use this option to bind the TPM module to the system board by using a value that is unique to each server board. This option ensures that the TPM measurement in PCR[0] is unique for every server regardless of hardware and firmware configuration.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### TpmOperation

**JSONPath**: `/TpmOperation` (PATCHable enumeration)

Use this option to enable the Trusted Platform Module and BIOS secure startup. When enabled, the TPM is fully functional. When disabled, the TPM is visible; however, functionality is limited. This option also enables you to reset the TPM to factory settings, which clears any assigned passwords, keys, or ownership data. Clearing the TPM can prevent the server from booting to a TPM-aware operating system if the operating system uses TPM's measurements.

**Defined values**:

* `NoAction`:  No Action

* `Enable`:  Enable

* `Disable`:  Disable

* `Clear`:  Clear

### TpmState

**JSONPath**: `/TpmState` (read only enumeration)

Current TPM device state: Not Present; Present and Disabled; Present and Enabled.

**Defined values**:

* `NotPresent`:  Not Present

* `PresentDisabled`:  Present and Disabled

* `PresentEnabled`:  Present and Enabled

### TpmType

**JSONPath**: `/TpmType` (read only enumeration)

Current TPM device type.

**Defined values**:

* `NoTpm`:  No TPM

* `Tpm12`:  TPM 1.2

* `Tpm20`:  TPM 2.0

* `Tm10`:  TM 1.0

### TpmUefiOpromMeasuring

**JSONPath**: `/TpmUefiOpromMeasuring` (PATCHable enumeration)

Use this option to enable measuring the UEFI PCI option ROMs. Disabling this option skips measuring the UEFI PCI option ROMs.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### TpmVisibility

**JSONPath**: `/TpmVisibility` (PATCHable enumeration)

Use this option to hide TPM from the operating system. When the TPM is hidden, BIOS secure startup is disabled, and the TPM does not respond to any commands. Intended use is for removing the TPM option from the system without removing the actual hardware.

**Defined values**:

* `Hidden`:  Hidden

* `Visible`:  Visible

### UefiOptimizedBoot

**JSONPath**: `/UefiOptimizedBoot` (PATCHable enumeration)

When enabled, the System BIOS boots using native UEFI graphics drivers. When disabled, the System BIOS boots using INT10 legacy video support. You cannot disable this option if Secure Boot is enabled. You can only configure this option if Boot Mode is configured to UEFI. 
Set this option to disabled for compatibility with Microsoft Windows 2008 and Windows 2008 R2 operating systems on a system configured for UEFI Boot Mode. 
Set this option to enabled for compatibility with VMWare ESXi operating systems on a system configured for UEFI Boot Mode.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### UefiPxeBoot

**JSONPath**: `/UefiPxeBoot` (PATCHable enumeration)

Use this option to control the ordering of network boot targets in the UEFI Boot Order list.
If configured for Auto, the order of the existing network boot targets is not modified in the UEFI Boot Order list. New network boot targets are added to the end of the list using the default policy of the System ROM.
If configured for IPv4 then IPv6, the UEFI  Boot Order is modified to list all existing IPv4 targets before any existing IPv6 targets. New network boot targets will have IPv4 targets added before IPv6 targets. 
If configured for IPv6 then IPv4, the UEFI Boot Order is modified to list all existing IPv6 targets before any existing IPv4 targets. 
If configured for IPv4, all existing IPv6 network boot targets are removed in the UEFI Boot Order. No new IPv6 network boot targets are added to the list. 
If configured for IPv6, all existing IPv4 network boot targets in the UEFI Boot Order are removed. No new IPv4 network boot targets are added to the list. 
When modifying these settings, changes to the UEFI Boot Order are not reflected until you reboot the system. You can configure this option only when Boot Mode is set to UEFI.

**Defined values**:

* `Auto`:  Auto

* `IPv4ThenIPv6`:  IPv4 then IPv6

* `IPv4`:  IPv4

* `IPv6`:  IPv6

* `IPv6ThenIPv4`:  IPv6 then IPv4

### UefiShellBootOrder

**JSONPath**: `/UefiShellBootOrder` (PATCHable enumeration)

When enabled, this option adds the Embedded UEFI Shell as an entry in the UEFI Boot Order list. This option is only available when the Boot Mode is configured as UEFI, and the Embedded UEFI Shell is enabled.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### UefiShellStartup

**JSONPath**: `/UefiShellStartup` (PATCHable enumeration)

Use this option to enable or disable automatic execution of the Embedded UEFI Shell startup script. You can store the script file on local media or access it from a network location. The script file must be named "startup.nsh" and must be placed on local media or a network location accessible to the server.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### UefiShellStartupLocation

**JSONPath**: `/UefiShellStartupLocation` (PATCHable enumeration)

Use this option to select the location of the Embedded UEFI Shell startup script. For the 'File Systems on Attached Media' option, you must name the script file "startup.nsh" and place it on a UEFI accessible local file system, such as a FAT32 partition on a USB disk or HDD. For the 'Network Location' option, the file must end with a .nsh extension, and must be placed at an HTTP or FTP location accessible to the server. When you select the 'Auto' option, the system attempts to retrieve the startup script from the network location first, followed by locally attached media.

**Defined values**:

* `Auto`:  Auto

* `AttachedMedia`:  File Systems on Attached Media

* `NetworkLocation`:  Network Location

### UefiShellStartupUrl

**JSONPath**: `/UefiShellStartupUrl` (PATCHable string)

Use this option to configure a network URL to a UEFI Shell startup script. URLs in HTTP or FTP formats are accepted using either an IPv4 server address or host name. For example, this can be http://192.168.0.0/file/file.nsh or http://example.com/file/file.nsh. IPv6 server addresses are not supported. The file must end with an .nsh extension. When configured, the Embedded UEFI Shell attempts to load and execute the startup script from the network location pointed to by this URL.

### UrlBootFile

**JSONPath**: `/UrlBootFile` (PATCHable string)

Use this option to configure a network URL to a bootable ISO or EFI file. URLs in HTTP or FTP formats are accepted using either an IPv4 server address or host name. For example, this can be http://192.168.0.0/file/image.iso or http://example.com/file/image.efi. IPv6 server addresses are not supported. When configured, this URL is listed as a boot option in the UEFI boot menu. Selecting the boot option downloads the file to the system memory and attempts booting from it. This setting requires configuring the pre-boot network settings to access the URL location. It is supported only in UEFI boot mode. 
Note: Booting from an ISO file is limited to files that enable the system to boot a preliminary OS environment (such as WinPE or a mini Linux) where further installation can proceed over an OS network connection. ISO files that contain the full OS installation media are not supported.

### Usb3Mode

**JSONPath**: `/Usb3Mode` (PATCHable enumeration)

Use this option to configure the operating mode of the USB 3.0 ports. If set to Auto Mode, USB 3.0 capable devices operate at USB 2.0 speeds in the pre-boot environment and during boot. When a USB 3.0 capable OS USB driver loads, USB 3.0 devices transition to USB 3.0 speeds. This mode provides compatibility with operating systems that do not support USB 3.0, while enabling USB 3.0 devices to operate at USB 3.0 speeds with current operating systems. If enabled, USB 3.0 capable devices operate at USB 3.0 speeds at all times (including the pre-boot environment) when in UEFI Boot Mode. Do not use this mode with operating systems that do not support USB 3.0. If operating in Legacy Boot Mode, the USB 3.0 ports do not function in the pre-boot environment, and are not bootable. If set to disabled, USB 3.0 capable devices function at USB 2.0 speeds at all times.

**Defined values**:

* `Auto`:  Auto

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### UsbBoot

**JSONPath**: `/UsbBoot` (PATCHable enumeration)

Set this option to disabled to prevent the system from booting to any USB devices connected to the server. This includes preventing boot to virtual media devices and the embedded SD or uSD card slot (if supported).

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### UsbControl

**JSONPath**: `/UsbControl` (PATCHable enumeration)

USB Enabled: Enables all USB ports and embedded devices. External USB Ports Disabled: Disables only external USB ports.

**Defined values**:

* `UsbEnabled`:  USB Enabled

* `ExternalUsbDisabled`:  External USB Ports Disabled

### UtilityLang

**JSONPath**: `/UtilityLang` (PATCHable enumeration)

Select this option to adjust the current language for the system.

**Defined values**:

* `English`:  English

* `Japanese`:  日本語

* `Chinese`:  中文（简体）

### VideoOptions

**JSONPath**: `/VideoOptions` (PATCHable enumeration)

Use this option to configure video settings in the system. When set to Add-in Video Enabled, Embedded Video Disabled, the system only displays video to the first discovered add-in video controller. When set to Both Add-in and Embedded Video Enabled, the system displays video to both the embedded and the first discovered add-in video controllers. In both modes, early system startup video is displayed to the embedded video controller.

**Defined values**:

* `OptionalVideoOnly`:  Add-in Video Enabled, Embedded Video Disabled

* `BothVideoEnabled`:  Both Add-in and Embedded Video Enabled

### VirtualInstallDisk

**JSONPath**: `/VirtualInstallDisk` (PATCHable enumeration)

Use this option to control the Virtual Install Disk. The Virtual Install Disk contains drivers specific to this server that an OS can use during installation. If enabled, the Virtual Install Disk appears as a drive in the operating system.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### VirtualSerialPort

**JSONPath**: `/VirtualSerialPort` (PATCHable enumeration)

Use this option to assign the logical COM port address and associated default resources used by the Virtual Serial Port (VSP). VSP enables the Management Processor to present an emulated serial port to support the BIOS Serial Console and operating system serial console.

**Defined values**:

* `Com1Irq4`:  COM 1; IRQ4; I/O: 3F8h-3FFh

* `Com2Irq3`:  COM 2; IRQ3; I/O: 2F8h-2FFh

* `Disabled`:  Disabled

### VlanControl

**JSONPath**: `/VlanControl` (PATCHable enumeration)

Use this option to enable or disable VLAN tagging on all enabled network interfaces.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

### VlanId

**JSONPath**: `/VlanId` (PATCHable integer)

Use this option to set the global VLAN ID for all enabled network interfaces. Possible values are 0 to 4094.A value of 0 indicates that the device will send untagged frames.

### VlanPriority

**JSONPath**: `/VlanPriority` (PATCHable integer)

Use this option to set the priority for the VLAN tagged frames. Possible values are 0 to 7.

### WakeOnLan

**JSONPath**: `/WakeOnLan` (PATCHable enumeration)

You can configure the server to be powered on remotely when it receives a special packet. This option requires a NIC, NIC driver, and operating system that are WOL-capable.

**Defined values**:

* `Enabled`:  Enabled

* `Disabled`:  Disabled

## HpBiosMapping
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/bios/mappings`

### AttributeRegistry

**JSONPath**: `/AttributeRegistry` (read only string)

This object represents the type property. It represents the schema used for the resource and indicates the version of the schema in the format <schema>.<majorversion>.<minorversion>.<errataversion>.

### BiosPciSettingsMappings[array-item].CorrelatableID

**JSONPath**: `/BiosPciSettingsMappings/(array index)/CorrelatableID` (read only string)

Contains any CorrelatableIDs that represent this PCI device. The CorrelatableID values can be JSON Pointers or UEFI identifiers.

### BiosPciSettingsMappings[array-item].Instance

**JSONPath**: `/BiosPciSettingsMappings/(array index)/Instance` (read only integer)

The instance number of the parent PCI device for this association set.

### BiosPciSettingsMappings[array-item].Subinstances[array-item].CorrelatableID

**JSONPath**: `/BiosPciSettingsMappings/(array index)/Subinstances/(array index)/CorrelatableID` (read only string)

Contains any CorrelatableIDs that represent this PCI device. The CorrelatableID values can be JSON Pointers or UEFI identifiers.

### BiosPciSettingsMappings[array-item].Subinstances[array-item].Subinstance

**JSONPath**: `/BiosPciSettingsMappings/(array index)/Subinstances/(array index)/Subinstance` (read only integer)

The sub-instance number of the child PCI device for this association set.

## HpESKM
ESKM (Enterprise Security Key Manager) object enables user to connect to an operational key manager, change redundancy settings, view the key manager connection settings, test the connection, and view key management events.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/securityservice/eskm`

### ESKMEvents[array-item].Event

**JSONPath**: `/ESKMEvents/(array index)/Event` (read only string)

ESKM event description.

### ESKMEvents[array-item].Timestamp

**JSONPath**: `/ESKMEvents/(array index)/Timestamp` (read only string)

Time of ESKM event.

### KeyManagerConfig.AccountGroup

**JSONPath**: `/KeyManagerConfig/AccountGroup` (PATCHable string)

Account group on ESKM.

> example PATCH: {"KeyManagerConfig": {"AccountGroup": "&lt;string-value&gt;"}}

### KeyManagerConfig.AccountName

**JSONPath**: `/KeyManagerConfig/AccountName` (read only string)

Account name on ESKM.

### KeyManagerConfig.ESKMLocalCACertificateName

**JSONPath**: `/KeyManagerConfig/ESKMLocalCACertificateName` (PATCHable string)

This is the name of Local CA (Certificate Authority) in ESKM that is used to sign the ESKM server certificate. iLO will retrieve this certificate from the ESKM server.

> example PATCH: {"KeyManagerConfig": {"ESKMLocalCACertificateName": "&lt;string-value&gt;"}}

### KeyManagerConfig.ImportedCertificateIssuer

**JSONPath**: `/KeyManagerConfig/ImportedCertificateIssuer` (read only string)

Imported certificate issuer.

### KeyManagerConfig.ImportedCertificateSubject

**JSONPath**: `/KeyManagerConfig/ImportedCertificateSubject` (read only string)

Imported certificate subject.

### KeyManagerConfig.LoginName

**JSONPath**: `/KeyManagerConfig/LoginName` (PATCHable string)

ESKM administrator account login name. This property always returns null on GET.

> example PATCH: {"KeyManagerConfig": {"LoginName": "&lt;string-value&gt;"}}

### KeyManagerConfig.Password

**JSONPath**: `/KeyManagerConfig/Password` (PATCHable string)

ESKM administrator account password. This property always returns null on GET.

> example PATCH: {"KeyManagerConfig": {"Password": "&lt;string-value&gt;"}}

### KeyServerRedundancyReq

**JSONPath**: `/KeyServerRedundancyReq` (PATCHable boolean)

If true encryption keys will be maintained on both the configured key servers. When this option is disabled, iLO will not verify that encryption keys are copied to both of the configured key servers.

> example PATCH: {"KeyServerRedundancyReq": true}

### PrimaryKeyServerAddress

**JSONPath**: `/PrimaryKeyServerAddress` (PATCHable string)

Primary key server IP address or FQDN. Set to null to clear the value.

> example PATCH: {"PrimaryKeyServerAddress": "&lt;string-value&gt;"}

### PrimaryKeyServerPort

**JSONPath**: `/PrimaryKeyServerPort` (PATCHable integer)

Primary key server port number. Set to null to clear the value.

> example PATCH: {"PrimaryKeyServerPort": &lt;integer-value&gt;}

### SecondaryKeyServerAddress

**JSONPath**: `/SecondaryKeyServerAddress` (PATCHable string)

Secondary key server IP address or FQDN. Set to null to clear the value.

> example PATCH: {"SecondaryKeyServerAddress": "&lt;string-value&gt;"}

### SecondaryKeyServerPort

**JSONPath**: `/SecondaryKeyServerPort` (PATCHable integer)

Secondary key server port number. Set to null to clear the value.

> example PATCH: {"SecondaryKeyServerPort": &lt;integer-value&gt;}

### POST Action "TestESKMConnections"

Test Enterprise Storage Key Manager connections.  TODO - need to describe this better -what's the outcome?

> example "TestESKMConnections" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{}
```

### POST Action "ClearESKMLog"

Clears the Enterprise Storage Key Manager log.

> example "ClearESKMLog" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{}
```

## HpHttpsCert
This is the schema definition for the X509 Certificate.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/securityservice/httpscert`

### CertificateSigningRequest

**JSONPath**: `/CertificateSigningRequest` (read only string)

GenerateCSR action, wait few minutes (upto 10), perform GET operation, fills CSR. Contains a public and private key pair.

### X509CertificateInformation.Issuer

**JSONPath**: `/X509CertificateInformation/Issuer` (read only string)

The Certificate Authority that issued the certificate.

### X509CertificateInformation.SerialNumber

**JSONPath**: `/X509CertificateInformation/SerialNumber` (read only string)

The serial number that the Certificate Authority assigned to the certificate.

### X509CertificateInformation.Subject

**JSONPath**: `/X509CertificateInformation/Subject` (read only string)

The entity to which the certificate was issued.

### X509CertificateInformation.ValidNotAfter

**JSONPath**: `/X509CertificateInformation/ValidNotAfter` (read only string)

The date on which the certificate validity period ends.

### X509CertificateInformation.ValidNotBefore

**JSONPath**: `/X509CertificateInformation/ValidNotBefore` (read only string)

The date on which the certificate validity period begins.

### POST Action "GenerateCSR"

Causes iLO 4 to begin creation of a new certificate signing request. The action will return a GeneratingCertificate message while this process is underway. The process may take up to ten minutes. Upon completion, the new request is available upon GET to this same resource in the "CertificateSigningRequest" property. 

Parameters:

"**Country**" (string)

"**State**" (string)

"**City**" (string)

"**OrgName**" (string)

"**OrgUnit**" (string)

"**CommonName**" (string)

> example "GenerateCSR" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{
    "Country": "<string>", 
    "State": "<string>", 
    "City": "<string>", 
    "OrgName": "<string>", 
    "OrgUnit": "<string>", 
    "CommonName": "<string>"
}
```

### POST Action "ImportCertificate"

Imports a Trusted Certificate and iLO 4 is reset.

Parameters:

"**Certificate**" (The certificate as a base-64 string) - TODO correct?

> example "ImportCertificate" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{
    "Certificate": "<base-64 string>"
}
```

## HpMemory
The schema definition for the properties of Memory DIMMs.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/memory/{item}`

### AssetTag

**JSONPath**: `/AssetTag` (read only string)

The asset tag for this memory device.

### BankLocator

**JSONPath**: `/BankLocator` (read only string)

Identifies the physically labeled bank, where the memory device is located.

### DIMMStatus

**JSONPath**: `/DIMMStatus` (read only enumeration)

Specifies memory module status and whether the module in use.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Unknown`

* `Other`

* `NotPresent`

* `PresentUnused`

* `GoodInUse`

* `AddedButUnused`

* `UpgradedButUnused`

* `ExpectedButMissing`

* `DoesNotMatch`

* `NotSupported`

* `ConfigurationError`

* `Degraded`

* `PresentSpare`

* `GoodPartiallyInUse`

### DIMMTechnology

**JSONPath**: `/DIMMTechnology` (read only enumeration)

The memory module technology type.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `BurstEDO`

* `FastPage`

* `Synchronous`

* `EDO`

* `LRDIMM`

* `RDRAM`

* `RDIMM`

* `UDIMM`

* `NVDIMM`

* `RNVDIMM`

* `LRNVDIMM`

* `Unknown`

### DIMMType

**JSONPath**: `/DIMMType` (read only enumeration)

The type of memory DIMM used in this system.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `DDR`

* `DDR2`

* `DDR3`

* `DDR4`

* `FBD2`

* `LPDD3`

* `LPDDR`

* `LPDDR2`

* `LPDDR4`

### DataWidth

**JSONPath**: `/DataWidth` (read only integer)

The data width, in bits, of this memory device. A Data Width value of 0 and a Total Width value of 8 indicates that the device is being used solely to provide 8 error-correction bits. If the width is unknown, the field is set to null.

### ErrorCorrection

**JSONPath**: `/ErrorCorrection` (read only enumeration)

The error correction used for this DIMM. If the value is null, the error correction is unknown.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `None`

* `Parity`

* `SingleBitECC`

* `MultiBitECC`

* `CRC`

### HPMemoryType

**JSONPath**: `/HPMemoryType` (read only enumeration)

Indicates whether or not HP SmartMemory is present.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `HPSmartMemory`

* `HPStandard`

* `Unknown`

### Manufacturer

**JSONPath**: `/Manufacturer` (read only string)

Identifies the manufacturer of this memory device.

### MaximumFrequencyMHz

**JSONPath**: `/MaximumFrequencyMHz` (read only integer)

Identifies the maximum, capable speed of the device in megahertz (MHz). If the value is null, the speed is unknown.

### MinimumVoltageVoltsX10

**JSONPath**: `/MinimumVoltageVoltsX10` (read only integer)

The minimum DIMM voltage multiplied by 10, for example, 1.2v = 12.

### PartNumber

**JSONPath**: `/PartNumber` (read only string)

The part number for this memory device.

### Rank

**JSONPath**: `/Rank` (read only integer)

Specifies the DIMM rank. A value of null indicates the rank is unknown.

### SerialNumber

**JSONPath**: `/SerialNumber` (read only string)

The serial number for this memory device.

### SizeMB

**JSONPath**: `/SizeMB` (read only integer)

The size of the memory device in megabytes.

### SocketLocator

**JSONPath**: `/SocketLocator` (read only string)

Identifies the physically labeled socket or board position, where the memory device is located.

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollup

**JSONPath**: `/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### TotalWidth

**JSONPath**: `/TotalWidth` (read only integer)

The total width, in bits, of this memory device, including any check or error-correction bits. If there are no error-correction bits, this value should be equal to Data Width. If the width is unknown, the field is set to null.

## HpSecureBoot
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/secureboot`

### ResetAllKeys

**JSONPath**: `/ResetAllKeys` (PATCHable boolean)

If true, clear all Secure Boot keys on next boot.

> example PATCH: {"ResetAllKeys": true}

### ResetToDefaultKeys

**JSONPath**: `/ResetToDefaultKeys` (PATCHable boolean)

If true, reset to default Secure Boot keys on next boot.

> example PATCH: {"ResetToDefaultKeys": true}

### SecureBootCurrentState

**JSONPath**: `/SecureBootCurrentState` (read only boolean)

Current enabled state of Secure Boot

### SecureBootEnable

**JSONPath**: `/SecureBootEnable` (PATCHable boolean)

Enable or disable UEFI Secure Boot (takes effect on next boot).

> example PATCH: {"SecureBootEnable": true}

## HpSecurityService

TODO - what's up with this?

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/securityservice`

## HpServerBootSettings
The schema definition of the server UEFI Boot Order resource.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/bios/boot`

> * `https://{iLO}/redfish/v1/systems/{item}/bios/boot/settings`

### AttributeRegistry

**JSONPath**: `/AttributeRegistry` (read only string)

This object represents the type property. It represents the schema used for the resource and indicates the version of the schema in the format <schema>.<majorversion>.<minorversion>.<errataversion>.

### BootSources[array-item].BootString

**JSONPath**: `/BootSources/(array index)/BootString` (PATCHable string)

User-readable string that describes the UEFI boot option.

### BootSources[array-item].CorrelatableID

**JSONPath**: `/BootSources/(array index)/CorrelatableID` (PATCHable string)

Contains any CorrelatableIDs that represent this boot option. The correlatableID values can be JSON Pointers or UEFI identifiers.

### BootSources[array-item].StructuredBootString

**JSONPath**: `/BootSources/(array index)/StructuredBootString` (PATCHable string)

Uniquely identifies this boot option within the server.

### BootSources[array-item].UEFIDevicePath

**JSONPath**: `/BootSources/(array index)/UEFIDevicePath` (PATCHable string)

Standardized text representation of the UEFI device path for this boot option, in UTF-8 format.

### DesiredBootDevices[array-item].CorrelatableID

**JSONPath**: `/DesiredBootDevices/(array index)/CorrelatableID` (PATCHable string)

Standardized text representation of the UEFI device path of the desired boot device, in UTF-8 format. For example 'PciRoot(0x0)/Pci(0x2,0x2)/Pci(0x0,0x0)'

> example PATCH: {"DesiredBootDevices": [{"CorrelatableID": "&lt;string-value&gt;"}|null, ...]}

### DesiredBootDevices[array-item].Lun

**JSONPath**: `/DesiredBootDevices/(array index)/Lun` (PATCHable string)

The Logical Unit Number (LUN) of the desired boot device. This value must be a hexadecimal string with an even number of 2 to 16 characters, excluding the first two characters, 0x (for example, '0x01').

> example PATCH: {"DesiredBootDevices": [{"Lun": "&lt;string-value&gt;"}|null, ...]}

### DesiredBootDevices[array-item].Wwn

**JSONPath**: `/DesiredBootDevices/(array index)/Wwn` (PATCHable string)

The Fibre Channel World Wide Name (WWN) of the desired boot device. This value must be a hexadecimal string with an even number of 2 to 16 characters, excluding the first two characters, 0x (for example, '0x0001020304050607').

> example PATCH: {"DesiredBootDevices": [{"Wwn": "&lt;string-value&gt;"}|null, ...]}

### DesiredBootDevices[array-item].iScsiTargetName

**JSONPath**: `/DesiredBootDevices/(array index)/iScsiTargetName` (PATCHable string)

The iSCSI node target name of the desired boot device. The value must be a string based on IETF RFC 3270, and can be up to 223 characters in length (for example, 'iqn.1991-05.com.microsoft:iscsitarget-iscsidisk-target').

> example PATCH: {"DesiredBootDevices": [{"iScsiTargetName": "&lt;string-value&gt;"}|null, ...]}

### SettingsResult.definitions.SettingsResult.ETag

**JSONPath**: `/SettingsResult/definitions/SettingsResult/ETag` (read only string)

ETag of this resource after the settings have been applied.

### SettingsResult.definitions.SettingsResult.Messages[array-item].Message

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/Message` (read only string)

Human-readable message.

### SettingsResult.definitions.SettingsResult.Messages[array-item].MessageID

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/MessageID` (read only string)

Key for this message, which is used to look up the message in a message registry. The key is in the format <registry>.<majorver>.<minorver>:<messagekey>.

### SettingsResult.definitions.SettingsResult.Messages[array-item].Resolution

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/Resolution` (read only string)

Instructions for resolving the issue that caused the error.

### SettingsResult.definitions.SettingsResult.Messages[array-item].Severity

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/Severity` (read only enumeration)

This is the severity of the errors.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### SettingsResult.definitions.SettingsResult.Operation

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Operation` (read only enumeration)

Details about the results of applying the settings.

**Defined values**:

* `SettingsApply`

### SettingsResult.definitions.SettingsResult.Time

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Time` (read only string)

Time at which the settings were applied.

## HpServerPCISlot

This describes a PCI slot on a server.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/pcislots/{item}`

### Length

**JSONPath**: `/Length` (read only enumeration)

PCI slot length

**Defined values**:

* `Short`

* `Long`

* `Other`

### LinkLanes

**JSONPath**: `/LinkLanes` (read only enumeration)

Bandwidth capacity of the slot, measured by the number of PCI Express Lanes present. Also known as the slot width.

**Defined values**:

* `8 bit`

* `16 bit`

* `32 bit`

* `64 bit`

* `128 bit`

* `x1`

* `x2`

* `x4`

* `x8`

* `x16`

* `x32`

* `Other`

### Status.EnabledState

**JSONPath**: `/Status/EnabledState` (read only string)

Specifies whether the slot is enabled or disabled.

### Status.OperationalStatus[array-item].Status

**JSONPath**: `/Status/OperationalStatus/(array index)/Status` (read only string)

Current usage status of the slot: InUse or Empty

### SupportsHotPlug

**JSONPath**: `/SupportsHotPlug` (read only boolean)

Specifies whether the slot supports hot-plug devices.

### Technology

**JSONPath**: `/Technology` (read only enumeration)

PCI technology

**Defined values**:

* `PCIExpressGen3`

* `PCIExpressGen2`

* `PCIExpress`

### UEFIDevicePath

**JSONPath**: `/UEFIDevicePath` (read only string)

Standardized text representation of the UEFI device path, in UTF-8 format

## HpServerPciDevice

This describes a logical PCI Device on a server.  This does not necessarily correspond to a specific FRU because a FRU or card might contain mutiple logical PCI devices.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/pcidevices/{item}`

### BayNumber

**JSONPath**: `/BayNumber` (read only integer)

Bay number value.

### BusNumber

**JSONPath**: `/BusNumber` (read only integer)

PCI device bus number value.

### ClassCode

**JSONPath**: `/ClassCode` (read only integer)

PCI class code of the endpoint.

### DeviceID

**JSONPath**: `/DeviceID` (read only integer)

PCI device ID of the device.

### DeviceInstance

**JSONPath**: `/DeviceInstance` (read only integer)

PCI device instance value.

### DeviceLocation

**JSONPath**: `/DeviceLocation` (read only string)

PCI device location.

### DeviceNumber

**JSONPath**: `/DeviceNumber` (read only integer)

PCI device number value.

### DeviceSubInstance

**JSONPath**: `/DeviceSubInstance` (read only integer)

PCI device sub-instance value.

### DeviceType

**JSONPath**: `/DeviceType` (read only enumeration)

Device type value.

**Defined values**:

* `Flexible LOM`

* `Embedded LOM`

* `NIC`

* `HDD Not attached to a SA Controller`

* `HDD Attached to a SA Controller`

* `Other PCI Device`

* `Unknown`

* `Other`

* `Video`

* `SCSI Controller`

* `Ethernet`

* `Token Ring`

* `Sound`

* `PATA Controller`

* `SATA Controller`

* `SAS Controller`

### EnclosureNumber

**JSONPath**: `/EnclosureNumber` (read only integer)

Enclosure number value.

### FunctionNumber

**JSONPath**: `/FunctionNumber` (read only integer)

PCI device function number value.

### SegmentNumber

**JSONPath**: `/SegmentNumber` (read only integer)

PCI segment group number value.

### StructuredName

**JSONPath**: `/StructuredName` (read only string)

PCI device structured name in UTF-8 format.

### SubclassCode

**JSONPath**: `/SubclassCode` (read only integer)

PCI sub class code of the endpoint.

### SubsystemDeviceID

**JSONPath**: `/SubsystemDeviceID` (read only integer)

PCI subsystem device ID of the device.

### SubsystemVendorID

**JSONPath**: `/SubsystemVendorID` (read only integer)

PCI subsystem vendor ID of the device.

### UEFIDevicePath

**JSONPath**: `/UEFIDevicePath` (read only string)

Standardized text representation of the UEFI device path, in UTF-8 format.

### VendorID

**JSONPath**: `/VendorID` (read only integer)

PCI vendor ID of the device.

## HpSmartStorage

This is the HPE Smart Storage subsystem for a server.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/smartstorage`

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollup

**JSONPath**: `/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

## HpSmartStorageArrayController

This is a Smart Storage array controller for a server.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}`

### AdapterType

**JSONPath**: `/AdapterType` (read only enumeration)

Type of Smart controller

**Defined values**:

* `SmartArray`

* `SmartHBA`

* `DynamicSmartArray`

### ArrayCount

**JSONPath**: `/ArrayCount` (read only integer)

The number of arrays configured on this controller

### BackupPowerSourceStatus

**JSONPath**: `/BackupPowerSourceStatus` (read only enumeration)

The current status of the backup power source (battery, capacitor, megacell etc.)

**Defined values**:

* `Present`

* `NotPresent`

* `PresentAndCharged`

* `PresentAndCharging`

### BootVolumePrimary

**JSONPath**: `/BootVolumePrimary` (read only string)

The primary boot volume of this controller

### BootVolumeSecondary

**JSONPath**: `/BootVolumeSecondary` (read only string)

The secondary boot volume of this controller

### CacheArrayCount

**JSONPath**: `/CacheArrayCount` (read only integer)

The number of cache arrays configured on this controller

### CacheLogicalDriveCount

**JSONPath**: `/CacheLogicalDriveCount` (read only integer)

The number of cache logical drives configured on this controller

### CacheMemorySizeMiB

**JSONPath**: `/CacheMemorySizeMiB` (read only integer)

The total cache memory size for the controller in MiB

### CachePhysicalDriveCount

**JSONPath**: `/CachePhysicalDriveCount` (read only integer)

The number of physical drives assigned as cache drives attached to this controller

### CurrentOperatingMode

**JSONPath**: `/CurrentOperatingMode` (read only enumeration)

The current operating mode of the controller.

**Defined values**:

* `RAID`

* `HBA`

### CurrentParallelSurfaceScanCount

**JSONPath**: `/CurrentParallelSurfaceScanCount` (read only integer)

Number of disks the controller is scanning in parallel

### DataLogicalDriveCount

**JSONPath**: `/DataLogicalDriveCount` (read only integer)

The number of data logical drives configured on this controller

### DataPhysicalDriveCount

**JSONPath**: `/DataPhysicalDriveCount` (read only integer)

The number of physical drives assigned as data drives attached to this controller

### DegradedPerformanceOptimization

**JSONPath**: `/DegradedPerformanceOptimization` (read only enumeration)

Enables the controller to attempt to improve performance on RAID 5/50/6(ADG)/60 logical drives when one or more physical drives in the logical drive are failed

**Defined values**:

* `Enabled`

* `Disabled`

### DriveWriteCache

**JSONPath**: `/DriveWriteCache` (read only enumeration)

Enables or disables the write cache of the physical drives attached to the controller

**Defined values**:

* `Enabled`

* `Disabled`

### ElevatorSort

**JSONPath**: `/ElevatorSort` (read only enumeration)

Enables the controller to sort requests to a physical drive

**Defined values**:

* `Enabled`

* `Disabled`

### EncryptionBootPasswordSet

**JSONPath**: `/EncryptionBootPasswordSet` (read only boolean)

True if there is a boot password set, false otherwise

### EncryptionCryptoOfficerPasswordSet

**JSONPath**: `/EncryptionCryptoOfficerPasswordSet` (read only boolean)

True if a password has been set for the Encryption Crypto Officer, false otherwise

### EncryptionEnabled

**JSONPath**: `/EncryptionEnabled` (read only boolean)

True if encryption is currently enabled for this controller, false otherwise

### EncryptionFwLocked

**JSONPath**: `/EncryptionFwLocked` (read only boolean)

True if the controller firmware has been locked, preventing firmware updates, false otherwise

### EncryptionHasLockedVolumes

**JSONPath**: `/EncryptionHasLockedVolumes` (read only boolean)

True if the controller has one or more volumes that are locked, false otherwise

### EncryptionHasLockedVolumesMissingBootPassword

**JSONPath**: `/EncryptionHasLockedVolumesMissingBootPassword` (read only boolean)

True if there are locked drives due to a missing boot password, false otherwise

### EncryptionHasSuspendedVolumes

**JSONPath**: `/EncryptionHasSuspendedVolumes` (read only boolean)

True if the controller password has been temporarily suspended, false otherwise

### EncryptionKekSet

**JSONPath**: `/EncryptionKekSet` (read only boolean)

True if the Master Key has been set, false otherwise

### EncryptionLocalKeyCacheEnabled

**JSONPath**: `/EncryptionLocalKeyCacheEnabled` (read only boolean)

True if the controller caches encryption keys locally when a remote key manager is being used, false otherwise

### EncryptionMixedVolumesEnabled

**JSONPath**: `/EncryptionMixedVolumesEnabled` (read only boolean)

True if the controller will allow plaintext and encrypted volumes to exist simultaneously, false otherwise

### EncryptionPhysicalDriveCount

**JSONPath**: `/EncryptionPhysicalDriveCount` (read only integer)

The number of encrypted physical drives attached to the controller

### EncryptionRecoveryParamsSet

**JSONPath**: `/EncryptionRecoveryParamsSet` (read only boolean)

True if the encryption password recovery question and answer have been set, false otherwise

### EncryptionStandaloneModeEnabled

**JSONPath**: `/EncryptionStandaloneModeEnabled` (read only boolean)

True if the controller manages encryption keys locally, false if a remote key manager is being used

### EncryptionUserPasswordSet

**JSONPath**: `/EncryptionUserPasswordSet` (read only boolean)

True if a password has been set for the Encryption User, false otherwise.

### ExpandPriority

**JSONPath**: `/ExpandPriority` (read only enumeration)

The level of priority that transformations have over handling current operating system requests

**Defined values**:

* `High`

* `Medium`

* `Low`

### ExternalPortCount

**JSONPath**: `/ExternalPortCount` (read only integer)

The number of external ports

### FirmwareVersion.Current.VersionString

**JSONPath**: `/FirmwareVersion/Current/VersionString` (read only string)

This string represents the version of the firmware image.

### FlexibleLatencySchedulerSetting

**JSONPath**: `/FlexibleLatencySchedulerSetting` (read only enumeration)

This allows the controller to process certain high-latency requests after a delay that may time out when elevator sorting

**Defined values**:

* `Default`

* `Low250`

* `Middle100`

* `Middle50`

* `Aggressive30`

* `Aggressive10`

### HardwareRevision

**JSONPath**: `/HardwareRevision` (read only string)

The hardware revision of the controller

### InconsistencyRepairPolicy

**JSONPath**: `/InconsistencyRepairPolicy` (read only enumeration)

Enables the controller to update data on RAID 6(ADG) and 60 volumes based on parity information when an inconsistency is discovered during surface scan

**Defined values**:

* `Enabled`

* `Disabled`

### InternalPortCount

**JSONPath**: `/InternalPortCount` (read only integer)

The number of internal ports

### IsBootController

**JSONPath**: `/IsBootController` (read only boolean)

True if this controller is the OS boot controller, false otherwise

### Location

**JSONPath**: `/Location` (read only string)

Location identifier

### LocationFormat

**JSONPath**: `/LocationFormat` (read only enumeration)

Format for Location Identifier

**Defined values**:

* `PCISlot`

### LogicalDriveCount

**JSONPath**: `/LogicalDriveCount` (read only integer)

The number of logical drives configured on this controller

### Manufacturer

**JSONPath**: `/Manufacturer` (read only string)

The manufacturer of the controller

### MaxParallelSurfaceScanCount

**JSONPath**: `/MaxParallelSurfaceScanCount` (read only integer)

Maximum number of disks that the controller supports scanning in parallel

### Model

**JSONPath**: `/Model` (read only string)

The model number for the controller

### OperatingModeAfterReboot

**JSONPath**: `/OperatingModeAfterReboot` (read only enumeration)

The operating mode the controller will be functioning in (RAID versus HBA) after a reboot

**Defined values**:

* `RAID`

* `HBA`

### ParallelSurfaceScanSupported

**JSONPath**: `/ParallelSurfaceScanSupported` (read only boolean)

True if the controller supports scanning multiple disk surfaces

### PhysicalDriveCount

**JSONPath**: `/PhysicalDriveCount` (read only integer)

The number of physical drives attached to this controller

### PowerModeAfterReboot

**JSONPath**: `/PowerModeAfterReboot` (read only enumeration)

The power mode of the controller after a reboot

**Defined values**:

* `Invalid`

* `Low`

* `LowAutomated`

* `Performant`

### PowerModeConfigured

**JSONPath**: `/PowerModeConfigured` (read only enumeration)

The current power mode of the controller

**Defined values**:

* `Invalid`

* `Low`

* `LowAutomated`

* `Performant`

### PowerModeWarningChangedDrive

**JSONPath**: `/PowerModeWarningChangedDrive` (read only boolean)

True if the controller's drive configuration has changed while using configuration based power settings, false otherwise

### PowerModeWarningChangedMode

**JSONPath**: `/PowerModeWarningChangedMode` (read only boolean)

True if the controller has a new power mode configured, false otherwise

### PowerModeWarningReboot

**JSONPath**: `/PowerModeWarningReboot` (read only enumeration)

True if a reboot is required to change the active power mode on the controller, false otherwise

**Defined values**:

* `NotRequired`

* `RequiredNoReason`

* `RequiredPowerSavings`

* `RequiredPerformance`

### PowerModeWarningTemperature

**JSONPath**: `/PowerModeWarningTemperature` (read only boolean)

True if the controller has crossed a critical temperature threshold and performance has been reduced to prevent damage to the controller, false otherwise

### PredictiveSpareRebuild

**JSONPath**: `/PredictiveSpareRebuild` (read only enumeration)

Enables or disables predictive spare rebuild mode

**Defined values**:

* `Enabled`

* `Disabled`

### QueueDepth

**JSONPath**: `/QueueDepth` (read only enumeration)

This sets the maximum number of requests the controller will submit to a drive at any given time

**Defined values**:

* `2`

* `4`

* `8`

* `16`

* `32`

* `Automatic`

### RebuildPriority

**JSONPath**: `/RebuildPriority` (read only enumeration)

The level of priority that rebuilds have over handling current operating system requests

**Defined values**:

* `High`

* `Medium`

* `Low`

* `RapidHigh`

* `RapidMediumHigh`

* `RapidMedium`

* `RapidLow`

### SerialNumber

**JSONPath**: `/SerialNumber` (read only string)

The serial number for this controller

### SoftwareRaidHbaFirmwareRev

**JSONPath**: `/SoftwareRaidHbaFirmwareRev` (read only string)

The firmware version of the underlying HBA that is being used by the software RAID stack

### SoftwareRaidHbaModeOptionRomRev

**JSONPath**: `/SoftwareRaidHbaModeOptionRomRev` (read only string)

The option ROM firmware version used to bootstrap the software RAID stack

### SparePhysicalDriveCount

**JSONPath**: `/SparePhysicalDriveCount` (read only integer)

he number of physical drives assigned as spare drives attached to this controller

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollup

**JSONPath**: `/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### SurfaceScanAnalysisPriority

**JSONPath**: `/SurfaceScanAnalysisPriority` (read only enumeration)

Priority that the controller takes to find and correct disk surface errors

**Defined values**:

* `Disabled`

* `High`

* `Medium`

* `Low`

* `Idle`

### UnassignedPhysicalDriveCount

**JSONPath**: `/UnassignedPhysicalDriveCount` (read only integer)

The number of unassigned physical drives attached to this controller

## HpSmartStorageDiskDrive

This represents a disk drive managed by Smart Storage.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}/diskdrives/{item}`

### BlockSizeBytes

**JSONPath**: `/BlockSizeBytes` (read only integer)

Block size of the drive in bytes. This is the block size presented by the drive to clients such as the array controller or operating system.

### CapacityLogicalBlocks

**JSONPath**: `/CapacityLogicalBlocks` (read only integer)

Total number of logical blocks in the drive

### CapacityMiB

**JSONPath**: `/CapacityMiB` (read only integer)

Total capacity of the drive in MiB

### CarrierApplicationVersion

**JSONPath**: `/CarrierApplicationVersion` (read only string)

Carrier PIC firmware version currently running

### CarrierAuthenticationStatus

**JSONPath**: `/CarrierAuthenticationStatus` (read only enumeration)

Authentication status of the drive carrier

**Defined values**:

* `OK`

* `Fail`

* `NoCommunication`

* `NotApplicable`

### CurrentTemperatureCelsius

**JSONPath**: `/CurrentTemperatureCelsius` (read only integer)

The current temperature of the drive

### EncryptedDrive

**JSONPath**: `/EncryptedDrive` (read only boolean)

True if encryption is currently enabled on this disk drive, false otherwise

### EraseCompletionPercentage

**JSONPath**: `/EraseCompletionPercentage` (read only integer)

The percent complete for an erase operation currently occurring on the disk drive or null if not currently erasing a drive.

### ErasePattern

**JSONPath**: `/ErasePattern` (read only string)

The pattern used for erasing the disk drive

### FirmwareVersion.Current.VersionString

**JSONPath**: `/FirmwareVersion/Current/VersionString` (read only string)

This string represents the version of the firmware image.

### IndicatorLED

**JSONPath**: `/IndicatorLED` (read only enumeration)

The state of the indicator LED.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Unknown`

* `Lit`

* `Blinking`

* `Off`

### InterfaceSpeedMbps

**JSONPath**: `/InterfaceSpeedMbps` (read only integer)

Native interface speed for the device

### InterfaceType

**JSONPath**: `/InterfaceType` (read only enumeration)

The connection interface of the drive. The value NVME has been deprecated.

**Defined values**:

* `SAS`

* `SATA`

* `NVME`

* `PCIe`

* `Unknown`

### Location

**JSONPath**: `/Location` (read only string)

The location of the drive

### LocationFormat

**JSONPath**: `/LocationFormat` (read only enumeration)

Format for the location property

**Defined values**:

* `ControllerPort:Box:Bay`

* `SwitchPort:Box:Bay`

* `SwitchPort:SwitchBay:Bay`

### Manufacturer

**JSONPath**: `/Manufacturer` (read only string)

Manufacturer of the disk drive

### MaximumTemperatureCelsius

**JSONPath**: `/MaximumTemperatureCelsius` (read only integer)

The maximum recommended temperature for the drive

### MediaType

**JSONPath**: `/MediaType` (read only enumeration)

Type of disk

**Defined values**:

* `HDD`

* `SSD`

### MinimumGoodFirmwareVersion

**JSONPath**: `/MinimumGoodFirmwareVersion` (read only string)

The minimum recommended firmware revision for the drive

### Model

**JSONPath**: `/Model` (read only string)

Drive model number

### NativeBlockSizeBytes

**JSONPath**: `/NativeBlockSizeBytes` (read only integer)

Native block size of the drive in bytes. This is the underlying sector size used by the physical drive to store data. For example, an advanced format drive that uses 4K sector sizes to store data will return 4K as the NativeBlockSizeBytes but may return 512 for the BlockSizeBytes when running in 512e (emulation) mode for backward compatibility

### PhyCount

**JSONPath**: `/PhyCount` (read only integer)

The number of phys the drive has

### PortCount

**JSONPath**: `/PortCount` (read only integer)

The number of ports on the drive. Typically 1 (single-domain) or 2 (dual-domain)

### PowerOnHours

**JSONPath**: `/PowerOnHours` (read only integer)

The number of lifetime hours that the drive has been powered on. The value is null if the disk power on hours cannot be determined or is not supported.

### RotationalSpeedRpm

**JSONPath**: `/RotationalSpeedRpm` (read only integer)

The rotational speed of the drive, only applicable on HDDs

### SSDEnduranceUtilizationPercentage

**JSONPath**: `/SSDEnduranceUtilizationPercentage` (read only integer)

This is the percentage of the drive that has been worn out and can no longer be used. When this values reaches 100%, the drive has 0% usage remaining and is completely worn out. The value is null if percent endurance used cannot be determined or is not supported.

### SerialNumber

**JSONPath**: `/SerialNumber` (read only string)

The serial number of the drive

### SpareRebuildMode

**JSONPath**: `/SpareRebuildMode` (read only enumeration)

Method to used activate this drive when another drive fails, this is only applicable if the drive is configured as a spare drive

**Defined values**:

* `Dedicated`

* `Roaming`

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollup

**JSONPath**: `/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### TransferSpeedMbps

**JSONPath**: `/TransferSpeedMbps` (read only integer)

Effective transfer speed to the device taking into account hardware acceleration such as edge-buffering

### WWID

**JSONPath**: `/WWID` (read only string)

Unique identifier for the device

## HpSmartStorageLogicalDrive

This represents a logical drive managed by Smart Storage.  It may consist of one or more physical drives.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}/logicaldrives/{item}`

### BlockSizeBytes

**JSONPath**: `/BlockSizeBytes` (read only integer)

The block size of the disk drive in bytes

### CapacityMiB

**JSONPath**: `/CapacityMiB` (read only integer)

Total usable capacity available on this logical drive in MiB units

### DriveAccessName

**JSONPath**: `/DriveAccessName` (read only string)

The access ID of the logical drive given by the OS

### DriveGeometryCylinders

**JSONPath**: `/DriveGeometryCylinders` (read only string)

The number of cylinders on the drive

### DriveGeometryHeads

**JSONPath**: `/DriveGeometryHeads` (read only string)

The number of heads on the drive

### DriveGeometrySectors

**JSONPath**: `/DriveGeometrySectors` (read only string)

The number of sectors on the drive

### LegacyBootPriority

**JSONPath**: `/LegacyBootPriority` (read only enumeration)

**Defined values**:

* `Primary`

* `Secondary`

* `None`

### LogicalDriveEncryption

**JSONPath**: `/LogicalDriveEncryption` (read only boolean)

True if encryption is currently enabled on this logical drive, false otherwise

### LogicalDriveEncryptionDataKeysVolatile

**JSONPath**: `/LogicalDriveEncryptionDataKeysVolatile` (read only boolean)

True if volatile keys are enabled for encryption, false otherwise

### LogicalDriveEncryptionDataKeysVolatileBackup

**JSONPath**: `/LogicalDriveEncryptionDataKeysVolatileBackup` (read only boolean)

True if volatile keys are backed up to a remote key manager, false if volatile keys are not backed up

### LogicalDriveEncryptionDataKeysVolatileStatus

**JSONPath**: `/LogicalDriveEncryptionDataKeysVolatileStatus` (read only enumeration)

The status of the encryption volatile keys

**Defined values**:

* `NoOp`

* `BackupInProgress`

* `BackupAndSetInProgress`

* `RestoreInProgress`

* `DeleteInProgress`

### LogicalDriveName

**JSONPath**: `/LogicalDriveName` (read only string)

Label given to the logical drive

### LogicalDriveNumber

**JSONPath**: `/LogicalDriveNumber` (read only integer)

logical drive number

### LogicalDriveType

**JSONPath**: `/LogicalDriveType` (read only enumeration)

How the logical drive is being used

**Defined values**:

* `Data`

* `Cache`

* `SplitMirrorSetPrimary`

* `SplitMirrorSetBackup`

* `SplitMirrorSetBackupOrphan`

### ParityInitializationCompletionPercentage

**JSONPath**: `/ParityInitializationCompletionPercentage` (read only integer)

Parity initialization complete percentage for a parity based logical drive (e.g. RAID 5)

### ParityInitializationType

**JSONPath**: `/ParityInitializationType` (read only enumeration)

When creating a logical drive with a RAID level that requires parity, parity blocks can be initialized with two different methods

**Defined values**:

* `Default`

* `Rapid`

### PartitionInformation

**JSONPath**: `/PartitionInformation` (read only string)

OS partition information for the drive

### Raid

**JSONPath**: `/Raid` (read only enumeration)

The current RAID level configured on the logical drive

**Defined values**:

* `0`

* `1`

* `1ADM`

* `10`

* `10ADM`

* `5`

* `50`

* `6`

* `60`

### RebuildCompletionPercentage

**JSONPath**: `/RebuildCompletionPercentage` (read only integer)

The percent complete for a rebuild operation currently occurring on the logical drive

### SmartCacheState

**JSONPath**: `/SmartCacheState` (read only enumeration)

The state of the SmartCache cache. This is valid if this drive either is a cache drive, or has a cache drive attached to it

**Defined values**:

* `Good`

* `Limited`

* `DDRUnsafe`

* `CacheLUNOffline`

* `PrimaryLUNOffline`

* `Destroyed`

* `Flushing`

* `Configuring`

* `PairFailAtPowerup`

* `Unknown`

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollup

**JSONPath**: `/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### StripSizeBytes

**JSONPath**: `/StripSizeBytes` (read only integer)

The strip size of the logical drive in bytes

### StripeSizeBytes

**JSONPath**: `/StripeSizeBytes` (read only integer)

The stripe size of the logical drive in bytes

### TransformationCompletionPercentage

**JSONPath**: `/TransformationCompletionPercentage` (read only integer)

The percent complete for any transformations the logical drive may be undergoing such as RAID migration, stripesize migration, capacity expansion etc.

### VolumeUniqueIdentifier

**JSONPath**: `/VolumeUniqueIdentifier` (read only string)

An identifier (typically SCSI Inquiry based such as Inquiry VPD Page 0x83 NAA 64 identifier) used to uniquely identify this volume.

## HpSmartStorageStorageEnclosure

This represents an enclosure for physical disk drives which may be internal or external to the server.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}/storageenclosures/{item}`

### DoorLockLED

**JSONPath**: `/DoorLockLED` (read only enumeration)

The state of the Door Lock LED. When Lit, this indicates that the Enclosure should not be removed since the drives are currently in use.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Unknown`

* `Lit`

* `Off`

### DriveBayCount

**JSONPath**: `/DriveBayCount` (read only integer)

Number of drive bays supported within the storage enclosure

### EnclosureLogicalID

**JSONPath**: `/EnclosureLogicalID` (read only string)

Unique ID for the storage enclosure

### FaultLED

**JSONPath**: `/FaultLED` (read only enumeration)

The state of the Fault LED.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Unknown`

* `Lit`

* `Off`

### FirmwareVersion.Current.VersionString

**JSONPath**: `/FirmwareVersion/Current/VersionString` (read only string)

This string represents the version of the firmware image.

### IndicatorLED

**JSONPath**: `/IndicatorLED` (read only enumeration)

The state of the indicator LED.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Unknown`

* `Lit`

* `Blinking`

* `Off`

### Location

**JSONPath**: `/Location` (read only string)

Location identifier

### LocationFormat

**JSONPath**: `/LocationFormat` (read only enumeration)

Format for Location Identifier

**Defined values**:

* `Controller:Box`

* `SwitchPort:Box`

* `SwitchPort:SwitchBay`

### Manufacturer

**JSONPath**: `/Manufacturer` (read only string)

The manufacturer of the storage enclosure

### Model

**JSONPath**: `/Model` (read only string)

The model string for the storage enclosure

### PartNumber

**JSONPath**: `/PartNumber` (read only string)

Part number of this storage enclosure

### SKU

**JSONPath**: `/SKU` (read only string)

SKU for the storage enclosure

### SerialNumber

**JSONPath**: `/SerialNumber` (read only string)

The serial number for this storage enclosure

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollup

**JSONPath**: `/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### SubEnclosureLocation

**JSONPath**: `/SubEnclosureLocation` (read only string)

Location within the chassis if this storage enclosure is part of a larger chassis hosting multiple storage enclosures

## HpiLOActiveHealthSystem

This resource enables access to Active Health System data.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/activehealthsystem`

### AHSEnabled

**JSONPath**: `/AHSEnabled` (PATCHable boolean)

Determines whether HP Active Health System logging is enabled or disabled.  

<aside class="warning">
When this property is enabled by PATCHing the value to true, iLO 4 will respond with "ResetRequired" and iLO 4 must be reset for the setting to take effect.  PATCHing the value to false does not require an iLO 4 reset.
</aside>

> example PATCH: {"AHSEnabled": true}

### Links.AHSLocation.extref and links.AHSLocation.extref

**JSONPath**: `/Links/AHSLocation/extref` (read only string) with the Redfish OData-Version header

**JSONPath**: `/links/AHSLocation/extref` (read only string) without the Redfish OData-Version header

This is the URI of the Active Health System binary download.  This URI is not fixed and must be read from this property.  Perform a GET to this URI with the following query parameters to define the download time range and embed customer case information:

* `from`:  the starting date of the download range (in YYYY-MM-DD format)
* `to`:    the ending date of the download range (in YYYY-MM-DD format)
* `case_no`:  case identification string
* `co_name`:  company or organization name
* `contact`:  contact name
* `email`:  contact email address
* `phone`:  contact phone number

> e.g. `GET /ahsdata/HP_8CW4340017_20340417.ahs?from=2016-02-16&&to=2016-02-19&&case_no=90125&&co_name=HPE&&contact_name=John Smith&&email=dummy-email-address@hpe.com&&phone=555-555-5555`

If successful, the response of the GET is a binary download which can be saved to a file.

### POST Action "ClearLog"

Clears the Active Health System Log.

<aside class="warning">
When this action is invoked, iLO 4 will respond with "ResetRequired" and iLO 4 must be reset for the setting to take effect.
</aside>


> example "ClearLog" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{}
```

## HpiLODateTime
The management processor date and time.

<aside class="warning">
iLO 4 will respond with "ResetRequired" for some data-time and SNTP configuration changes, and iLO 4 must be reset for the settings to take effect.  Specifically, changing the SNTP servers and the time zone will cause iLO 4 to indicate a reset is required.
</aside>

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/datetime`

### ConfigurationSettings

**JSONPath**: `/ConfigurationSettings` (read only enumeration)

The state of the currently displayed configuration settings.

**Defined values**:

* `Current`

* `SomePendingReset`

### DateTime

**JSONPath**: `/DateTime` (read only string)

The date and time used by management processor.

### PropagateTimeToHost

**JSONPath**: `/PropagateTimeToHost` (PATCHable boolean)

Determines whether the server time is synchronized with the management processor time during the first POST after AC power is applied.

> example PATCH: {"PropagateTimeToHost": true}

### TimeZone.Index

**JSONPath**: `/TimeZone/Index` (PATCHable integer)

The index of the current time zone. To set a new time zone, specify a different time zone index. This property can be set only when DHCPv4 or DHCPv6 supplied time settings are disabled. Since the time zone list might vary from one firmware version to another (which often leads to differences in time zone indices), setting the time zone by name is recommended over setting by index, for better compatibility.

> example PATCH: {"TimeZone": {"Index": &lt;integer-value&gt;}}

### TimeZone.UtcOffset

**JSONPath**: `/TimeZone/UtcOffset` (read only string)

The UTC offset of the current time zone, in the format {+/-}hh:mm

### TimeZone.Value

**JSONPath**: `/TimeZone/Value` (read only string)

The environment variable value.

### TimeZoneList[array-item].Index

**JSONPath**: `/TimeZoneList/(array index)/Index` (read only integer)

The time zone index.

### TimeZoneList[array-item].UtcOffset

**JSONPath**: `/TimeZoneList/(array index)/UtcOffset` (read only string)

The UTC offset of the time zone, in the format {+/-}hh:mm

### TimeZoneList[array-item].Value

**JSONPath**: `/TimeZoneList/(array index)/Value` (read only string)

The environment variable value.

## HpiLOEmbeddedMedia

This represent's the state of iLO's managed media including the internal SD-Card on Gen8 and Gen9 ProLiant servers.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/embeddedmedia`

### Controller.Firmware.Current.VersionString

**JSONPath**: `/Controller/Firmware/Current/VersionString` (read only string)

The current version of the embedded media controller.

### Controller.Status.Health

**JSONPath**: `/Controller/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Controller.Status.HealthRollUp

**JSONPath**: `/Controller/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Controller.Status.HealthRollup

**JSONPath**: `/Controller/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Controller.Status.State

**JSONPath**: `/Controller/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### SDCard.HpCertified

**JSONPath**: `/SDCard/HpCertified` (read only boolean)

True if this is an HP-certified SD card.

### SDCard.LBACount

**JSONPath**: `/SDCard/LBACount` (read only integer)

The LBA count.

### SDCard.SizeString

**JSONPath**: `/SDCard/SizeString` (read only string)

The size of the SD card present in the server, in a readable format.

### SDCard.Status.Health

**JSONPath**: `/SDCard/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### SDCard.Status.HealthRollUp

**JSONPath**: `/SDCard/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### SDCard.Status.HealthRollup

**JSONPath**: `/SDCard/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### SDCard.Status.State

**JSONPath**: `/SDCard/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### SDCard.WriteCount

**JSONPath**: `/SDCard/WriteCount` (read only integer)

The number of writes on the SD card. Rendered only if this is an HP-certified SD card. 

## HpiLOFederatedGroupCapping

This resource manages the system's participating in iLO Federation group power capping.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/chassis/{item}/power/federatedgroupcapping`

### CapWatts

**JSONPath**: `/CapWatts` (read only integer)

The configured power cap for all servers in a group. This value is 0 if the power cap is not configured.

### CapacityWatts

**JSONPath**: `/CapacityWatts` (read only integer)

The total power supply capacity for all servers in a group.

### Throttle

**JSONPath**: `/Throttle` (read only string)

High, Med, or Low based on the percentage of power usage.

## HpiLOFederationGroup

This manages iLO's participation in Federation groups.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/federationgroups/{item}`

### Key

**JSONPath**: `/Key` (PATCHable string)

The password used by the Federation Group.

> example PATCH: {"Key": "&lt;string-value&gt;"}

### Privileges.LoginPriv

**JSONPath**: `/Privileges/LoginPriv` (PATCHable boolean)

Login privileges.

> example PATCH: {"Privileges": {"LoginPriv": true}}

### Privileges.RemoteConsolePriv

**JSONPath**: `/Privileges/RemoteConsolePriv` (PATCHable boolean)

Remote console privileges.

> example PATCH: {"Privileges": {"RemoteConsolePriv": true}}

### Privileges.UserConfigPriv

**JSONPath**: `/Privileges/UserConfigPriv` (PATCHable boolean)

User configuration privileges.

> example PATCH: {"Privileges": {"UserConfigPriv": true}}

### Privileges.VirtualMediaPriv

**JSONPath**: `/Privileges/VirtualMediaPriv` (PATCHable boolean)

Virtual media privileges.

> example PATCH: {"Privileges": {"VirtualMediaPriv": true}}

### Privileges.VirtualPowerAndResetPriv

**JSONPath**: `/Privileges/VirtualPowerAndResetPriv` (PATCHable boolean)

Virtual power and reset privileges.

> example PATCH: {"Privileges": {"VirtualPowerAndResetPriv": true}}

### Privileges.iLOConfigPriv

**JSONPath**: `/Privileges/iLOConfigPriv` (PATCHable boolean)

The management processor configuration privileges.

> example PATCH: {"Privileges": {"iLOConfigPriv": true}}

## HpiLOFederationPeers

This is a view of iLO's Federation peers based upon its current group membership.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/federationpeers/{item}`

### Peers[array-item].HttpErrorCode

**JSONPath**: `/Peers/(array index)/HttpErrorCode` (read only integer)

Error code for success or failure.

### Peers[array-item].ManagerIPAddress

**JSONPath**: `/Peers/(array index)/ManagerIPAddress` (read only string)

Manager IP address of the federation peer.

### Peers[array-item].Time

**JSONPath**: `/Peers/(array index)/Time` (read only string)

Time when the federation peer was added.

### Peers[array-item].URL

**JSONPath**: `/Peers/(array index)/URL` (read only string)

URL of the federation peer.

### Peers[array-item].UUID

**JSONPath**: `/Peers/(array index)/UUID` (read only string)

UUID peers that are part of the federation group.

## HpiLOFirmwareUpdate

This is the iLO 4 firmware update service which enables a client to update supported system firmware.

Several of the properties in this resource represent the details of the last firmware update operation, including:
* Copyright message
* Details
* Post-update flags
* Image type (recognized by iLO 4)
* ProgressPercent - updated during flashing
* Flash engine state

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/updateservice`

### Links.UpdateUri.extref and links.UpdateUri.extref

**JSONPath**: `/Links/UpdateUri/extref` (read only string) with the Redfish OData-Version header

**JSONPath**: `/links/UpdateUri/extref` (read only string) without the Redfish OData-Version header

This property indicates the URI location a client my upload a firmware image directly to iLO 4.

> TODO:  example

**Actions**

### POST Action "InstallFromURI"

Causes iLO 4 to GET and flash the firmware image indicated by FirmwareURI. 

Parameters:

"**FirmwareURI**" (uri) the URI of the firmware image

"**TPMOverrideFlag**" (boolean) with one of the following value(s): - TODO (is this really a boolean?

* true
* false

> example "InstallFromURI" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{
    "FirmwareURI": "<uri>", 
    "TPMOverrideFlag": true
}
```

## HpiLOLicense

This indicates the current iLO license status.

You may install an iLO license by POSTing a JSON object containing `{"LicenseKey": "key-string"}` to the license service collection.  PATCHing an existing LicenseKey property does not alter the license.

> e.g. POST https://{iLO}/redfish/v1/managers/{item}/licenseservice/

```json
{
	"LicenseKey": "key-string"
}
```

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/licenseservice/{item}`

### License

**JSONPath**: `/License` (read only string)

The name of the license installed on this management processor.

### LicenseExpire

**JSONPath**: `/LicenseExpire` (read only string)

The expiration information of the installed management processor license.

### LicenseKey

**JSONPath**: `/LicenseKey` (read only string)

The license key installed on this management processor. License keys are 25 characters in length and contain both letters and numbers.Use POST method to collection of membertype HpiLOLicense to install / update the license

### LicenseType

**JSONPath**: `/LicenseType` (read only enumeration)

The type of license installed on this management processor.

**Defined values**:

* `Unlicensed`

* `Evaluation`

* `Perpetual`

* `Subscription`

* `Internal`

* `Duration`

* `Expired`

## HpiLOResourceDirectory

This is a directory of important resources in the REST API.  It exists as a performance enhancer for clients that know exactly what kind of resources they are looking for.  It does this by flattening the data model and reducing the required number of HTTP GET operations needed to access a resource deep in the model.


**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/resourcedirectory`

### Instances[array-item].ETag

**JSONPath**: `/Instances/(array index)/ETag` (read only string)

This is the last known etag of the resource. The property is omitted if not known.

### Instances[array-item].MemberType

**JSONPath**: `/Instances/(array index)/MemberType` (read only string)

This property has the type of members for collection resources.

## HpiLOSSO
This is the schema definition for the HP SSO Trusted Server.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/securityservice/sso`

### ManagerTrustedCertificates[array-item].Certificate

**JSONPath**: `/ManagerTrustedCertificates/(array index)/Certificate` (read only string)

Contains PEM formatted X509 certificate (Base64 encoded).

### ManagerTrustedCertificates[array-item].SerialNumber

**JSONPath**: `/ManagerTrustedCertificates/(array index)/SerialNumber` (read only integer)

Contains the Serial number for the SSO records.

### ManagerTrustedCertificates[array-item].ServerName

**JSONPath**: `/ManagerTrustedCertificates/(array index)/ServerName` (read only string)

The Server name (or certificate subject).

### ManagerTrustedCertificates[array-item].Status

**JSONPath**: `/ManagerTrustedCertificates/(array index)/Status` (read only enumeration)

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Degraded`

* `Failed`

### SSOsettings.AdminPrivilege.LoginPriv

**JSONPath**: `/SSOsettings/AdminPrivilege/LoginPriv` (PATCHable boolean)

Login Privileges.

> example PATCH: {"SSOsettings": {"AdminPrivilege": {"LoginPriv": true}}}

### SSOsettings.AdminPrivilege.PowerandResetPriv

**JSONPath**: `/SSOsettings/AdminPrivilege/PowerandResetPriv` (PATCHable boolean)

Power and Reset Privileges.

> example PATCH: {"SSOsettings": {"AdminPrivilege": {"PowerandResetPriv": true}}}

### SSOsettings.AdminPrivilege.RemoteConsolePriv

**JSONPath**: `/SSOsettings/AdminPrivilege/RemoteConsolePriv` (PATCHable boolean)

Remote Console Privileges.

> example PATCH: {"SSOsettings": {"AdminPrivilege": {"RemoteConsolePriv": true}}}

### SSOsettings.AdminPrivilege.UserConfigPriv

**JSONPath**: `/SSOsettings/AdminPrivilege/UserConfigPriv` (PATCHable boolean)

User Configuration Privileges.

> example PATCH: {"SSOsettings": {"AdminPrivilege": {"UserConfigPriv": true}}}

### SSOsettings.AdminPrivilege.VirtualMediaPriv

**JSONPath**: `/SSOsettings/AdminPrivilege/VirtualMediaPriv` (PATCHable boolean)

Power and Reset Privileges.

> example PATCH: {"SSOsettings": {"AdminPrivilege": {"VirtualMediaPriv": true}}}

### SSOsettings.AdminPrivilege.iLOConfigPriv

**JSONPath**: `/SSOsettings/AdminPrivilege/iLOConfigPriv` (PATCHable boolean)

iLO Configuration Privileges.

> example PATCH: {"SSOsettings": {"AdminPrivilege": {"iLOConfigPriv": true}}}

### SSOsettings.OperatorPrivilege.LoginPriv

**JSONPath**: `/SSOsettings/OperatorPrivilege/LoginPriv` (PATCHable boolean)

Login Privileges.

> example PATCH: {"SSOsettings": {"OperatorPrivilege": {"LoginPriv": true}}}

### SSOsettings.OperatorPrivilege.PowerandResetPriv

**JSONPath**: `/SSOsettings/OperatorPrivilege/PowerandResetPriv` (PATCHable boolean)

Power and Reset Privileges.

> example PATCH: {"SSOsettings": {"OperatorPrivilege": {"PowerandResetPriv": true}}}

### SSOsettings.OperatorPrivilege.RemoteConsolePriv

**JSONPath**: `/SSOsettings/OperatorPrivilege/RemoteConsolePriv` (PATCHable boolean)

Remote Console Privileges.

> example PATCH: {"SSOsettings": {"OperatorPrivilege": {"RemoteConsolePriv": true}}}

### SSOsettings.OperatorPrivilege.UserConfigPriv

**JSONPath**: `/SSOsettings/OperatorPrivilege/UserConfigPriv` (PATCHable boolean)

User Configuration Privileges.

> example PATCH: {"SSOsettings": {"OperatorPrivilege": {"UserConfigPriv": true}}}

### SSOsettings.OperatorPrivilege.VirtualMediaPriv

**JSONPath**: `/SSOsettings/OperatorPrivilege/VirtualMediaPriv` (PATCHable boolean)

Virtual Media Privileges.

> example PATCH: {"SSOsettings": {"OperatorPrivilege": {"VirtualMediaPriv": true}}}

### SSOsettings.OperatorPrivilege.iLOConfigPriv

**JSONPath**: `/SSOsettings/OperatorPrivilege/iLOConfigPriv` (PATCHable boolean)

iLO Configuration Privileges.

> example PATCH: {"SSOsettings": {"OperatorPrivilege": {"iLOConfigPriv": true}}}

### SSOsettings.SSOTrustMode

**JSONPath**: `/SSOsettings/SSOTrustMode` (PATCHable enumeration)

Represents the SSO Trust Mode.

> example PATCH: {"SSOsettings": {"SSOTrustMode": "TrustbyName"}}

**Defined values**:

* `TrustNone`

* `TrustAll`

* `TrustbyName`

* `TrustbyCert`

### SSOsettings.UserPrivilege.LoginPriv

**JSONPath**: `/SSOsettings/UserPrivilege/LoginPriv` (PATCHable boolean)

Login Privileges.

> example PATCH: {"SSOsettings": {"UserPrivilege": {"LoginPriv": true}}}

### SSOsettings.UserPrivilege.PowerandResetPriv

**JSONPath**: `/SSOsettings/UserPrivilege/PowerandResetPriv` (PATCHable boolean)

Power and Reset Privileges.

> example PATCH: {"SSOsettings": {"UserPrivilege": {"PowerandResetPriv": true}}}

### SSOsettings.UserPrivilege.RemoteConsolePriv

**JSONPath**: `/SSOsettings/UserPrivilege/RemoteConsolePriv` (PATCHable boolean)

Remote Console Privileges.

> example PATCH: {"SSOsettings": {"UserPrivilege": {"RemoteConsolePriv": true}}}

### SSOsettings.UserPrivilege.UserConfigPriv

**JSONPath**: `/SSOsettings/UserPrivilege/UserConfigPriv` (PATCHable boolean)

User Configuration Privileges.

> example PATCH: {"SSOsettings": {"UserPrivilege": {"UserConfigPriv": true}}}

### SSOsettings.UserPrivilege.VirtualMediaPriv

**JSONPath**: `/SSOsettings/UserPrivilege/VirtualMediaPriv` (PATCHable boolean)

Virtual Media Privileges.

> example PATCH: {"SSOsettings": {"UserPrivilege": {"VirtualMediaPriv": true}}}

### SSOsettings.UserPrivilege.iLOConfigPriv

**JSONPath**: `/SSOsettings/UserPrivilege/iLOConfigPriv` (PATCHable boolean)

iLO Configuration Privileges.

> example PATCH: {"SSOsettings": {"UserPrivilege": {"iLOConfigPriv": true}}}

### POST Action "ImportCertificate"

Import an HPE Single Sign On Certificate.

Parameters:

"**CertType**" (string) with one of the following value(s):

* DirectImportCert
* ImportCertUri

"**CertInput**" (The certificate as a base-64 string) - TODO correct?

> example "ImportCertificate" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{
    "CertType": "DirectImportCert", 
    "CertInput": "<base-64 string>"
}
```

### POST Action "ImportDNSName"

Add DNS Name to the record list.

Parameters:

"**DNSName**" (string)

> example "ImportDNSName" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{
    "DNSName": "<string>"
}
```

### POST Action "DeleteAllSSORecords"

Delete all the Single Sign On records.

> example "DeleteAllSSORecords" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{}
```

### POST Action "DeleteSSORecordbyNumber"

Delete Single Sign On record by record number.

Parameters:

"**RecordNumber**" (integer) - TODO - is this really an integer?

> example "DeleteSSORecordbyNumber" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{
    "RecordNumber": "<integer>"
}
```

## HpiSCSISoftwareInitiator
The schema definition of UEFI iSCSI Software Initiator boot configuration.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/bios/iscsi`

> * `https://{iLO}/redfish/v1/systems/{item}/bios/iscsi/settings`

### AttributeRegistry

**JSONPath**: `/AttributeRegistry` (read only string)

This object represents the type property. It represents the schema used for the resource and indicates the version of the schema in the format <schema>.<majorversion>.<minorversion>.<errataversion>.

### SettingsResult.definitions.SettingsResult.ETag

**JSONPath**: `/SettingsResult/definitions/SettingsResult/ETag` (read only string)

ETag of this resource after the settings have been applied.

### SettingsResult.definitions.SettingsResult.Messages[array-item].Message

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/Message` (read only string)

Human-readable message.

### SettingsResult.definitions.SettingsResult.Messages[array-item].MessageID

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/MessageID` (read only string)

Key for this message, which is used to look up the message in a message registry. The key is in the format <registry>.<majorver>.<minorver>:<messagekey>.

### SettingsResult.definitions.SettingsResult.Messages[array-item].Resolution

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/Resolution` (read only string)

Instructions for resolving the issue that caused the error.

### SettingsResult.definitions.SettingsResult.Messages[array-item].Severity

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/Severity` (read only enumeration)

This is the severity of the errors.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### SettingsResult.definitions.SettingsResult.Operation

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Operation` (read only enumeration)

Details about the results of applying the settings.

**Defined values**:

* `SettingsApply`

### SettingsResult.definitions.SettingsResult.Time

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Time` (read only string)

Time at which the settings were applied.

### iSCSIBootSources[array-item].StructuredBootString

**JSONPath**: `/iSCSIBootSources/(array index)/StructuredBootString` (read only string)

Identifies this iSCSI UEFI boot option within the server.

### iSCSIBootSources[array-item].UEFIDevicePath

**JSONPath**: `/iSCSIBootSources/(array index)/UEFIDevicePath` (read only string)

Standardized text representation of the UEFI device path for this boot option, in UTF-8 format.

### iSCSIBootSources[array-item].iSCSIAuthenticationMethod

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIAuthenticationMethod` (PATCHable enumeration)

The iSCSI connection authentication method.

**Defined values**:

* `None`

* `CHAP`

### iSCSIBootSources[array-item].iSCSIBootAttemptInstance

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIBootAttemptInstance` (PATCHable integer)

Uniquely identifies this iSCSI boot attempt within iSCSIBootSources array. If set to zero, all other properties in the boot option object are ignored (which will delete an existing boot attempt).

### iSCSIBootSources[array-item].iSCSIBootAttemptName

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIBootAttemptName` (PATCHable string)

Human readable descriptive name for this iSCSI boot attempt configuration

### iSCSIBootSources[array-item].iSCSIBootEnable

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIBootEnable` (PATCHable enumeration)

Enables or Disables iSCSI Boot for a selected iSCSI boot attempt.

**Defined values**:

* `Disabled`

* `Enabled`

* `EnabledMpio`

### iSCSIBootSources[array-item].iSCSIBootLUN

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIBootLUN` (PATCHable string)

The iSCSI boot target Logical Unit Number (LUN), if not obtained from DHCP. This value must follow the SAM-2 spec. E.g. 0001-1234-5678-9ABC. If the digit number is less then 5 characters, a dash character is not required. E.g. 0001. If the lun number is 12345, input 1234-5

### iSCSIBootSources[array-item].iSCSIChapSecret

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIChapSecret` (PATCHable string)

The password needed for CHAP authentication. This is applicable only when the Authentication Method is set to CHAP, and the CHAP Type is set to Mutual.

### iSCSIBootSources[array-item].iSCSIChapType

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIChapType` (PATCHable enumeration)

The CHAP authentication type. This is applicable only when the Authentication Method is set to CHAP.

**Defined values**:

* `OneWay`

* `Mutual`

### iSCSIBootSources[array-item].iSCSIChapUsername

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIChapUsername` (PATCHable string)

The password needed for CHAP authentication. This is applicable only when the Authentication Method is set to CHAP.

### iSCSIBootSources[array-item].iSCSIConnectRetry

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIConnectRetry` (PATCHable integer)

The number of times to retry the iSCSI connection. Zero means no retries.

### iSCSIBootSources[array-item].iSCSIConnectTimeoutMS

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIConnectTimeoutMS` (PATCHable integer)

The iSCSI connection timeout value in milliseconds.

### iSCSIBootSources[array-item].iSCSIInitiatorGateway

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIInitiatorGateway` (PATCHable string)

The gateway address of the iSCSI Initiator, if not configured via DHCP. The address must be an IPv4 or IPv6 address, depending on the IP Address Type.

### iSCSIBootSources[array-item].iSCSIInitiatorInfoViaDHCP

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIInitiatorInfoViaDHCP` (PATCHable boolean)

If enabled, the iSCSI Initiator information is configured from DHCP. Otherwise, the iSCSI initiator information must be statically configured.

### iSCSIBootSources[array-item].iSCSIInitiatorIpAddress

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIInitiatorIpAddress` (PATCHable string)

The IP Address of the iSCSI Initiator, if not configured via DHCP. The Initiator IP Address is always auto-assigned if IP address type is IPv6. The address must be an IPv4 or IPv6 address, depending on the IP Address Type.

### iSCSIBootSources[array-item].iSCSIInitiatorNetmask

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIInitiatorNetmask` (PATCHable string)

The subnet mask of the iSCSI Initiator, if not configured via DHCP. The address must be an IPv4.

### iSCSIBootSources[array-item].iSCSIIpAddressType

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIIpAddressType` (PATCHable enumeration)

The iSCSI IP Address type. If set to Auto, IPv4 will be attempted first, followed by IPv6.

**Defined values**:

* `IPv4`

* `IPv6`

* `Auto`

### iSCSIBootSources[array-item].iSCSINicSource

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSINicSource` (PATCHable string)

A BIOS Attribute that describes this selected NIC instance. This must match one of the possible values listed in the iSCSINicSources array.

### iSCSIBootSources[array-item].iSCSIReverseChapSecret

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIReverseChapSecret` (PATCHable string)

The password needed for reverse CHAP authentication (from the target to the initiator). This is applicable only when the Authentication Method is set to CHAP, and the CHAP Type is set to Mutual.

### iSCSIBootSources[array-item].iSCSIReverseChapUsername

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIReverseChapUsername` (PATCHable string)

User Name for reverse CHAP authentication (from the target to the initiator). This is applicable only when the Authentication Method is set to CHAP, and the CHAP Type is set to Mutual.

### iSCSIBootSources[array-item].iSCSITargetInfoViaDHCP

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSITargetInfoViaDHCP` (PATCHable boolean)

If enabled, the iSCSI target information are configured from DHCP. Otherwise, the iSCSI target information must be statically configured.

### iSCSIBootSources[array-item].iSCSITargetIpAddress

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSITargetIpAddress` (PATCHable string)

The IP Address of the iSCSI Target, if not obtained from DHCP. The address must be an IPv4 or IPv6 address, depending on the IP Address Type.

### iSCSIBootSources[array-item].iSCSITargetName

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSITargetName` (PATCHable string)

The worldwide unique iSCSI Qualified Name (IQN) of this iSCSI target. Only the IQN format is accepted. EUI format is not supported (for example, 'iqn.1991-05.com.microsoft:iscsitarget-iscsidisk-target').

### iSCSIBootSources[array-item].iSCSITargetTcpPort

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSITargetTcpPort` (PATCHable integer)

The iSCSI Target TCP Port number, if not obtained from DHCP.

### iSCSIInitiatorName

**JSONPath**: `/iSCSIInitiatorName` (PATCHable string)

The worldwide unique iSCSI Qualified Name (IQN) of this iSCSI Initiator. Only IQN format is accepted. EUI format is not supported (for example, 'iqn.1986-03.com.hp:init.sn-123456').

## LogEntry

Resources of type "LogEntry" are members of a log entry parent collection.  For the Integrated Management Log (IML) a client may create a Maintenance Note log entry by performing a POST of a JSON object to the parent log entry collection with the following format:   {"EntryCode": "Maintenance", "Message":"text message here"}

> e.g. Create a Maintenance Note.  POST
```json
{
	"EntryCode": "Maintenance",
	"Message": "text message here"
}
```


**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/logservices/iml/entries/{item}`

> * `https://{iLO}/redfish/v1/managers/{item}/logservices/iel/entries/{item}`

### Created

**JSONPath**: `/Created` (read only string)

The date and time when the log entry was created, for example, 2014-04-15T00:38:00Z.

### EntryType

**JSONPath**: `/EntryType` (read only enumeration)

The log entry type.

**Defined values**:

* `Oem`

### Message

**JSONPath**: `/Message` (read only string)

The log entry details.

### Number

**JSONPath**: `/Number` (read only integer)

The number of duplicate log entries, with the possible exception of timestamps, that are not in the collection.

### Class

**JSONPath**: `/Oem/Hp/Class` (read only integer)

The IML event class.

### Code

**JSONPath**: `/Oem/Hp/Code` (read only integer)

The IML event code.

### EventNumber

**JSONPath**: `/Oem/Hp/EventNumber` (read only integer)

The event log identification number. Events are numbered in the order in which they are generated.

### Repaired

**JSONPath**: `/Oem/Hp/Repaired` (PATCHable boolean)

The repaired status of the IML event.

> example PATCH: {"Oem": {"Hp": {"Repaired": true}}}

### Updated

**JSONPath**: `/Oem/Hp/Updated` (read only string)

The date and time of the latest log entry update, for example, 2014-04-15T00:38:00Z.

### OemRecordFormat

**JSONPath**: `/OemRecordFormat` (read only enumeration)

The format of an OEM record.

**Defined values**:

* `Hp-IML`

* `Hp-iLOEventLog`

### RecordId

**JSONPath**: `/RecordId` (read only integer)

The log entry ID.

### Severity

**JSONPath**: `/Severity` (read only enumeration)

The log entry severity.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

## LogService

This is the log service for Integrated Management Log and iLO 4 Event Log.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/logservices/iml`

> * `https://{iLO}/redfish/v1/managers/{item}/logservices/iel`

### MaxNumberOfRecords

**JSONPath**: `/MaxNumberOfRecords` (read only integer)

The maximum number of log entries.

### OverWritePolicy

**JSONPath**: `/OverWritePolicy` (read only enumeration)

When the log is full, the overwrite policy is enforced.

**Defined values**:

* `Unknown`

* `WrapsWhenFull`

* `NeverOverwrites`

### POST Action "ClearLog"

Clears the Integrated Management Log or iLO Event Log depending upon the resource instance.

> example "ClearLog" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{}
```

## Manager

This represents iLO 4 in the HPE server.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}`

### CommandShell.Enabled

**JSONPath**: `/CommandShell/Enabled` (PATCHable boolean)

Indicates if the Command Shell service is enabled for this manager.

> example PATCH: {"CommandShell": {"Enabled": true}}

### CommandShell.MaxConcurrentSessions

**JSONPath**: `/CommandShell/MaxConcurrentSessions` (read only integer)

This is the maximum number of Command Shell sessions, regardless of protocol, that this manager supports.

### CommandShell.ServiceEnabled

**JSONPath**: `/CommandShell/ServiceEnabled` (PATCHable boolean)

Indicates if the Command Shell service is enabled for this manager.

> example PATCH: {"CommandShell": {"ServiceEnabled": true}}

### Firmware.Current.VersionString

**JSONPath**: `/Firmware/Current/VersionString` (read only string)

This string represents the version of the firmware image.

### FirmwareVersion

**JSONPath**: `/FirmwareVersion` (read only string)

The firmware version of this Manager

### GraphicalConsole.Enabled

**JSONPath**: `/GraphicalConsole/Enabled` (PATCHable boolean)

Indicates if the Graphical Console service is enabled for this manager.

> example PATCH: {"GraphicalConsole": {"Enabled": true}}

### GraphicalConsole.MaxConcurrentSessions

**JSONPath**: `/GraphicalConsole/MaxConcurrentSessions` (read only integer)

Indicates the maximum number of Graphical Console sessions, regardless of protocol, this manager supports.

### GraphicalConsole.ServiceEnabled

**JSONPath**: `/GraphicalConsole/ServiceEnabled` (PATCHable boolean)

Indicates if the Command Shell service is enabled for this manager.

> example PATCH: {"GraphicalConsole": {"ServiceEnabled": true}}

### ManagerType

**JSONPath**: `/ManagerType` (read only enumeration)

This property is the manager type for this resource.

**Defined values**:

* `ManagementController`

* `EnclosureManager`

* `BMC`

### Model

**JSONPath**: `/Model` (read only string)

Model name of the manager.

### ClearRestApiStatus

**JSONPath**: `/Oem/Hp/ClearRestApiStatus` (read only enumeration)

Status of external provider data in NVRAM.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `DataPresent`

* `DataCleared`

### FederationConfig.IPv6MulticastScope

**JSONPath**: `/Oem/Hp/FederationConfig/IPv6MulticastScope` (PATCHable enumeration)

The IPv6 network scope of multicast announcements.

> example PATCH: {"Oem": {"Hp": {"FederationConfig": {"IPv6MulticastScope": "Site"}}}}

**Defined values**:

* `Link`

* `Site`

* `Organization`

### FederationConfig.MulticastAnnouncementInterval

**JSONPath**: `/Oem/Hp/FederationConfig/MulticastAnnouncementInterval` (PATCHable integer)

The frequency in Seconds at which the iLO system announces itself on the network. A value of 0 disables multicast announcments.

> example PATCH: {"Oem": {"Hp": {"FederationConfig": {"MulticastAnnouncementInterval": &lt;integer-value&gt;}}}}

### FederationConfig.MulticastDiscovery

**JSONPath**: `/Oem/Hp/FederationConfig/MulticastDiscovery` (PATCHable enumeration)

Enables or Disables Multicast Discovery for the local iLO system.

> example PATCH: {"Oem": {"Hp": {"FederationConfig": {"MulticastDiscovery": "Disabled"}}}}

**Defined values**:

* `Enabled`

* `Disabled`

### FederationConfig.MulticastTimeToLive

**JSONPath**: `/Oem/Hp/FederationConfig/MulticastTimeToLive` (PATCHable integer)

The maximum number of switches a multicast announcement will traverse before being discarded.

> example PATCH: {"Oem": {"Hp": {"FederationConfig": {"MulticastTimeToLive": &lt;integer-value&gt;}}}}

### FederationConfig.iLOFederationManagement

**JSONPath**: `/Oem/Hp/FederationConfig/iLOFederationManagement` (PATCHable enumeration)

Enables or Disables iLO Federation features for the local iLO system.

> example PATCH: {"Oem": {"Hp": {"FederationConfig": {"iLOFederationManagement": "Disabled"}}}}

**Defined values**:

* `Enabled`

* `Disabled`

### Firmware.Backup.BuildNumber

**JSONPath**: `/Oem/Hp/Firmware/Backup/BuildNumber` (read only integer)

The build number of the firmware.

### Firmware.Backup.BuildNumberString

**JSONPath**: `/Oem/Hp/Firmware/Backup/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### Firmware.Backup.Date

**JSONPath**: `/Oem/Hp/Firmware/Backup/Date` (read only string)

The build date of the firmware.

### Firmware.Backup.DebugBuild

**JSONPath**: `/Oem/Hp/Firmware/Backup/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### Firmware.Backup.Family

**JSONPath**: `/Oem/Hp/Firmware/Backup/Family` (read only string)

The family of the firmware.

### Firmware.Backup.MajorVersion

**JSONPath**: `/Oem/Hp/Firmware/Backup/MajorVersion` (read only integer)

The major version of the firmware.

### Firmware.Backup.MinorVersion

**JSONPath**: `/Oem/Hp/Firmware/Backup/MinorVersion` (read only integer)

The minor version of the firmware.

### Firmware.Backup.Time

**JSONPath**: `/Oem/Hp/Firmware/Backup/Time` (read only string)

The build time of the firmware.

### Firmware.Backup.VersionString

**JSONPath**: `/Oem/Hp/Firmware/Backup/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### Firmware.Bootblock.BuildNumber

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/BuildNumber` (read only integer)

The build number of the firmware.

### Firmware.Bootblock.BuildNumberString

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### Firmware.Bootblock.Date

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/Date` (read only string)

The build date of the firmware.

### Firmware.Bootblock.DebugBuild

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### Firmware.Bootblock.Family

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/Family` (read only string)

The family of the firmware.

### Firmware.Bootblock.MajorVersion

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/MajorVersion` (read only integer)

The major version of the firmware.

### Firmware.Bootblock.MinorVersion

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/MinorVersion` (read only integer)

The minor version of the firmware.

### Firmware.Bootblock.Time

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/Time` (read only string)

The build time of the firmware.

### Firmware.Bootblock.VersionString

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### Firmware.Current.BuildNumber

**JSONPath**: `/Oem/Hp/Firmware/Current/BuildNumber` (read only integer)

The build number of the firmware.

### Firmware.Current.BuildNumberString

**JSONPath**: `/Oem/Hp/Firmware/Current/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### Firmware.Current.Date

**JSONPath**: `/Oem/Hp/Firmware/Current/Date` (read only string)

The build date of the firmware.

### Firmware.Current.DebugBuild

**JSONPath**: `/Oem/Hp/Firmware/Current/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### Firmware.Current.Family

**JSONPath**: `/Oem/Hp/Firmware/Current/Family` (read only string)

The family of the firmware.

### Firmware.Current.MajorVersion

**JSONPath**: `/Oem/Hp/Firmware/Current/MajorVersion` (read only integer)

The major version of the firmware.

### Firmware.Current.MinorVersion

**JSONPath**: `/Oem/Hp/Firmware/Current/MinorVersion` (read only integer)

The minor version of the firmware.

### Firmware.Current.Time

**JSONPath**: `/Oem/Hp/Firmware/Current/Time` (read only string)

The build time of the firmware.

### Firmware.Current.VersionString

**JSONPath**: `/Oem/Hp/Firmware/Current/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### Firmware.Pending.BuildNumber

**JSONPath**: `/Oem/Hp/Firmware/Pending/BuildNumber` (read only integer)

The build number of the firmware.

### Firmware.Pending.BuildNumberString

**JSONPath**: `/Oem/Hp/Firmware/Pending/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### Firmware.Pending.Date

**JSONPath**: `/Oem/Hp/Firmware/Pending/Date` (read only string)

The build date of the firmware.

### Firmware.Pending.DebugBuild

**JSONPath**: `/Oem/Hp/Firmware/Pending/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### Firmware.Pending.Family

**JSONPath**: `/Oem/Hp/Firmware/Pending/Family` (read only string)

The family of the firmware.

### Firmware.Pending.MajorVersion

**JSONPath**: `/Oem/Hp/Firmware/Pending/MajorVersion` (read only integer)

The major version of the firmware.

### Firmware.Pending.MinorVersion

**JSONPath**: `/Oem/Hp/Firmware/Pending/MinorVersion` (read only integer)

The minor version of the firmware.

### Firmware.Pending.Time

**JSONPath**: `/Oem/Hp/Firmware/Pending/Time` (read only string)

The build time of the firmware.

### Firmware.Pending.VersionString

**JSONPath**: `/Oem/Hp/Firmware/Pending/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### Firmware.definitions.HpFWVersion.BuildNumber

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/BuildNumber` (read only integer)

The build number of the firmware.

### Firmware.definitions.HpFWVersion.BuildNumberString

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### Firmware.definitions.HpFWVersion.Date

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/Date` (read only string)

The build date of the firmware.

### Firmware.definitions.HpFWVersion.DebugBuild

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### Firmware.definitions.HpFWVersion.Family

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/Family` (read only string)

The family of the firmware.

### Firmware.definitions.HpFWVersion.MajorVersion

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/MajorVersion` (read only integer)

The major version of the firmware.

### Firmware.definitions.HpFWVersion.MinorVersion

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/MinorVersion` (read only integer)

The minor version of the firmware.

### Firmware.definitions.HpFWVersion.Time

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/Time` (read only string)

The build time of the firmware.

### Firmware.definitions.HpFWVersion.VersionString

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### License.LicenseKey

**JSONPath**: `/Oem/Hp/License/LicenseKey` (read only string)

The installed license key.

### License.LicenseString

**JSONPath**: `/Oem/Hp/License/LicenseString` (read only string)

Describes the type of license installed on management processor.

### License.LicenseType

**JSONPath**: `/Oem/Hp/License/LicenseType` (read only string)

Indicates whether the license is Perpetual or Evaluation.

### RequiredLoginForiLORBSU

**JSONPath**: `/Oem/Hp/RequiredLoginForiLORBSU` (PATCHable boolean)

Determines whether a user-credential prompt is displayed when a user accesses the iLO RBSU or the iLO 4 Configuration Utility. The following settings are valid: Enabled-A login dialog box opens when a user accesses the iLO RBSU or the iLO 4 Configuration Utility. Disabled (default)-No login is required when a user accesses the iLO RBSU or the iLO 4 Configuration Utility.

> example PATCH: {"Oem": {"Hp": {"RequiredLoginForiLORBSU": true}}}

### SerialCLISpeed

**JSONPath**: `/Oem/Hp/SerialCLISpeed` (PATCHable integer)

Serial command line interface speed in bits/second.

> example PATCH: {"Oem": {"Hp": {"SerialCLISpeed": &lt;integer-value&gt;}}}

### SerialCLIStatus

**JSONPath**: `/Oem/Hp/SerialCLIStatus` (PATCHable enumeration)

Status of serial command line interface.

> example PATCH: {"Oem": {"Hp": {"SerialCLIStatus": "EnabledNoAuth"}}}

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Disabled`

* `EnabledNoAuth`

* `EnabledAuthReq`

### VSPLogDownloadEnabled

**JSONPath**: `/Oem/Hp/VSPLogDownloadEnabled` (PATCHable boolean)

This property enables or disables download of Virtual Serial Port (VSP) log.

> example PATCH: {"Oem": {"Hp": {"VSPLogDownloadEnabled": true}}}

### iLOFunctionalityRequired

**JSONPath**: `/Oem/Hp/iLOFunctionalityRequired` (read only boolean)

iLO is required and can't be disabled on this platform (usually blades).

### iLORBSUEnabled

**JSONPath**: `/Oem/Hp/iLORBSUEnabled` (PATCHable boolean)

Enables or disables the iLO RBSU or the iLO 4 Configuration Utility. The following settings are valid: Enabled (default)-On servers that support the iLO RBSU, pressing F8 during POST starts the iLO RBSU. On servers that support UEFI, the iLO 4 Configuration Utility is available when you access the UEFI System Utilities. Disabled-On servers that support the iLO RBSU, pressing F8 during POST will not start the iLO RBSU. On servers that support UEFI, the iLO 4 Configuration Utility is not available when you access the UEFI System Utilities.

> example PATCH: {"Oem": {"Hp": {"iLORBSUEnabled": true}}}

### iLOSelfTestResults[array-item].Notes

**JSONPath**: `/Oem/Hp/iLOSelfTestResults/(array index)/Notes` (read only string)

Additional Information (if any) about the Self Test.

### iLOSelfTestResults[array-item].SelfTestName

**JSONPath**: `/Oem/Hp/iLOSelfTestResults/(array index)/SelfTestName` (read only enumeration)

iLO Self Test Name.

**Defined values**:

* `CryptographicHardware`

* `Memory`

* `WebServerCryptography`

* `MiscCryptography`

* `UART`

* `NVRAMInterface`

* `NVRAMData`

* `NVRAMSpace`

* `NIC`

* `EmbeddedFlash/SDCard`

* `StaticRAM`

* `EEPROM`

* `I2C`

* `BootBlock`

* `ThreadInit`

* `Infrastructure`

* `HostRom`

* `SupportedHost`

* `EEPROMContent`

* `PowerManagementController`

* `CPLDPAL0`

* `CPLDPAL1`

* `CPLDPAL2`

* `CPLDPAL3`

* `CPLDPAL4`

* `CPLDPAL5`

### iLOSelfTestResults[array-item].Status

**JSONPath**: `/Oem/Hp/iLOSelfTestResults/(array index)/Status` (read only enumeration)

Status of the Self Test.

**Defined values**:

* `NA`

* `OK`

* `Informational`

* `Degraded`

### Links.FederationDispatch.extref and links.FederationDispatch.extref

**JSONPath**: `/Oem/Hp/Links/FederationDispatch/extref` (read only URI reference) with the Redfish OData-Version header

**JSONPath**: `/Oem/Hp/links/FederationDispatch/extref` (read only URI reference) without the Redfish OData-Version header

Federation commands are dispatched to the URI described by this property.

### Links.VSPLogLocation.extref and links.VSPLogLocation.extref

**JSONPath**: `/Oem/Hp/Links/VSPLogLocation/extref` (read only string) with the Redfish OData-Version header

**JSONPath**: `/Oem/Hp/links/VSPLogLocation/extref` (read only string) without the Redfish OData-Version header

TODO:  describe this better

### Redundancy.MaxNumSupported

**JSONPath**: `/Redundancy/MaxNumSupported` (read only integer)

This is the maximum number of members allowable for this particular managers redundancy, including this manager.

### Redundancy.MemberId

**JSONPath**: `/Redundancy/MemberId` (PATCHable string)

This is the identifier for the member within the collection.

### Redundancy.MinNumNeeded

**JSONPath**: `/Redundancy/MinNumNeeded` (read only integer)

This is the minumum number of managers needed for this manager to be redundant.

### Redundancy.Mode

**JSONPath**: `/Redundancy/Mode` (read only enumeration)

This is the redundancy mode of the group.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Failover`

* `N+1`

* `LoadBalanced`

* `Sparing`

* `LimitedSparing`

### Redundancy.Status.Health

**JSONPath**: `/Redundancy/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Redundancy.Status.HealthRollUp

**JSONPath**: `/Redundancy/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Redundancy.Status.HealthRollup

**JSONPath**: `/Redundancy/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Redundancy.Status.State

**JSONPath**: `/Redundancy/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### SerialConsole.Enabled

**JSONPath**: `/SerialConsole/Enabled` (PATCHable boolean)

Indicates if the Serial Console service is enabled for this manager.

> example PATCH: {"SerialConsole": {"Enabled": true}}

### SerialConsole.MaxConcurrentSessions

**JSONPath**: `/SerialConsole/MaxConcurrentSessions` (read only integer)

This is the maximum number of Serial Console sessions, regardless of protocol, that this manager supports.

### SerialConsole.ServiceEnabled

**JSONPath**: `/SerialConsole/ServiceEnabled` (PATCHable boolean)

Indicates if the Command Shell service is enabled for this manager.

> example PATCH: {"SerialConsole": {"ServiceEnabled": true}}

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollup

**JSONPath**: `/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### UUID

**JSONPath**: `/UUID` (read only string)

This is a universally unique identifier that software (for example, HP SIM) uses to uniquely identify this manager. The UUID is assigned when the system is manufactured.

### POST Action "Reset"

Resets iLO 4. iLO 4 will be unresponsive during the reset process and the client should expect to wait for up to a minute for functionality to be restored. 

> example "Reset" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{}
```

### POST Action "ClearRestApiState"

Clears the persistent state of the REST API. Some portions of the API may not be available until after the server reboots.

> example "ClearRestApiState" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{}
```

### POST Action "iLOFunctionality"

Specifies whether iLO functionality is available. The following settings are valid: Enabled (default)-The iLO network is available and communications with operating system drivers are active. Disabled-The iLO network and communications with operating system drivers are terminated when iLO Functionality is disabled. For ProLiant Gen8 servers only: To re-enable iLO functionality, disable iLO security with the system maintenance switch, and then use the iLO RBSU to set iLO Functionality to Enabled. For more information about using the system maintenance switch, see the Maintenance and Service Guide for your server model. For ProLiant Gen9 servers only: To re-enable iLO functionality, use the iLO 4 Configuration Utility (in the UEFI System Utilities) to set iLO Functionality to Enabled. For more information see the HP UEFI System Utilities User Guide. The action resets/reboots the manager. iLO functionality cannot be disabled on server blades.

The "iLOFunctionality" action disables iLO 4's accessibility via the network and resets iLO 4. This should be used with caution as it will render iLO unable to respond to further network operations (including REST operations) until iLO 4 is re-enabled using the RBSU menu.


> example "iLOFunctionality" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{}
```

### POST Action "ResetToFactoryDefaults"

Resets the iLO to Factory Defaults.

ResetToFactoryDefaults performs the following:

* Removes Language Packs
* Erases all customized settings
* Removes user accounts and restores iLO 4's default username and password
* Removes all certificates and user licenses
* Restores iLO 4 network settings to defaults
* Clears event logs
* Resets iLO 4 upon completion


Parameters:

"**ResetType**" (string) with the value **"Default"**

> example "ResetToFactoryDefaults" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{
    "ResetType": "Default"
}
```

## ManagerAccount

This represents a user account on the REST API service.

You may create an iLO account by building a request JSON object and POSTing to the Accounts collection pointed to by the AccountService.

> POST to https://redfish/v1/accountservice/accounts/

```json
{
	"UserName": "the name used to log into the API",
	"Password": "newpassword",
	"Oem": {
		"Hp": {
			"Privileges": {
				"RemoteConsolePriv": true,
				"VirtualMediaPriv": true,
				"UserConfigPriv": true,
				"iLOConfigPriv": true,
				"VirtualPowerAndResetPriv": true
			},
			"LoginName": "the friendly user name"
		}
	}
}
```


**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/accountservice/accounts/{item}`

### LoginName

**JSONPath**: `/Oem/Hp/LoginName` (PATCHable string)

Descriptive login name that helps to easily identify the owner of each user name. The login name does not have to be the same as the user name and must use printable characters. The maximum length for a user name is 39 characters.

> example PATCH: {"Oem": {"Hp": {"LoginName": "&lt;string-value&gt;"}}}

### Privileges.LoginPriv

**JSONPath**: `/Oem/Hp/Privileges/LoginPriv` (PATCHable boolean)

This privilege enables a user to log in to management processor. All local accounts have the login privilege. This privilege is added automatically if it is not specified.

> example PATCH: {"Oem": {"Hp": {"Privileges": {"LoginPriv": true}}}}

### Privileges.RemoteConsolePriv

**JSONPath**: `/Oem/Hp/Privileges/RemoteConsolePriv` (PATCHable boolean)

This privilege enables a user to remotely access the host system Remote Console, including video, keyboard, and mouse control.

> example PATCH: {"Oem": {"Hp": {"Privileges": {"RemoteConsolePriv": true}}}}

### Privileges.UserConfigPriv

**JSONPath**: `/Oem/Hp/Privileges/UserConfigPriv` (PATCHable boolean)

This privilege enables a user to add, edit, and delete local management processor user accounts. A user with this privilege can change privileges for all users.

> example PATCH: {"Oem": {"Hp": {"Privileges": {"UserConfigPriv": true}}}}

### Privileges.VirtualMediaPriv

**JSONPath**: `/Oem/Hp/Privileges/VirtualMediaPriv` (PATCHable boolean)

This privilege enables a user to use the Virtual Media feature on the host system.

> example PATCH: {"Oem": {"Hp": {"Privileges": {"VirtualMediaPriv": true}}}}

### Privileges.VirtualPowerAndResetPriv

**JSONPath**: `/Oem/Hp/Privileges/VirtualPowerAndResetPriv` (PATCHable boolean)

This privilege enables a user to power-cycle or reset the host system. These activities interrupt system availability. A user with this privilege can diagnose the system by using the Generate NMI to System button.

> example PATCH: {"Oem": {"Hp": {"Privileges": {"VirtualPowerAndResetPriv": true}}}}

### Privileges.iLOConfigPriv

**JSONPath**: `/Oem/Hp/Privileges/iLOConfigPriv` (PATCHable boolean)

This privilege enables a user to configure most management processor settings, including security settings, and to remotely update the management processor firmware. This privilege does not enable local user account administration.

> example PATCH: {"Oem": {"Hp": {"Privileges": {"iLOConfigPriv": true}}}}

### Password

**JSONPath**: `/Password` (PATCHable string)

The password used to log in to the management processor. The maximum length for a password is 39 characters. The minimum length for a password is specified in the MinPasswordLength property of the AccountService schema.

> example PATCH: {"Password": "&lt;string-value&gt;"}

### UserName

**JSONPath**: `/UserName` (PATCHable string)

The name used to log in to the management processor. The user name does not have to be the same as the login name. The maximum length for the user name is 39 characters. The user name must use printable characters.

> example PATCH: {"UserName": "&lt;string-value&gt;"}

## ManagerNetworkProtocol
This resource is used to obtain or modify the network services managed by this manager.

PATCHing the following properties will not take effect until iLO 4 is reset.
* `HTTP/Port`
* `HTTPS/Port`
* `SSH/Enabled`
* `SSH/Port`

<aside class="notice">
Client software should PATCH these properties together in one PATCH operation at a time where an iLO reset is best accomodated.
</aside>

iLO 4 responds with "ResetRequired" when the following properties are PATCHed:

* `VirtualMedia/Port`
* `KVMIP/Port`
* `SNMP/Enabled`
* `SNMP/Port`
* `Oem/Hp/SNMPTrapPort`
* `HostName`

<aside class="notice">
Client software must reset iLO 4 for these changes to take effect.
</aside>

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/networkservice`

### FQDN

**JSONPath**: `/FQDN` (read only string)

The fully-qualified domain name of the manager that is obtained by DNS and includes the host name and top-level domain name.

### HTTP.Enabled

**JSONPath**: `/HTTP/Enabled` (read only boolean)

Indicates whether HTTP is enabled or disabled.

### HTTP.Port

**JSONPath**: `/HTTP/Port` (PATCHable integer)

The HTTP port number.  NOTE: When this field is modified, the Manager will reset automatically.

> example PATCH: {"HTTP": {"Port": &lt;integer-value&gt;}}

### HTTP.ProtocolEnabled

**JSONPath**: `/HTTP/ProtocolEnabled` (read only boolean)

Indicates whether HTTP is enabled or disabled.

### HTTPS.Enabled

**JSONPath**: `/HTTPS/Enabled` (read only boolean)

Indicates whether HTTPS/SSL is enabled or disabled.

### HTTPS.Port

**JSONPath**: `/HTTPS/Port` (PATCHable integer)

The HTTPS/SSL port number.  NOTE: When this field is modified, the Manager will reset automatically.

> example PATCH: {"HTTPS": {"Port": &lt;integer-value&gt;}}

### HTTPS.ProtocolEnabled

**JSONPath**: `/HTTPS/ProtocolEnabled` (read only boolean)

Indicates whether HTTPS/SSL is enabled or disabled.

### HostName

**JSONPath**: `/HostName` (PATCHable string)

The host name of the manager that is obtained by DNS and does not include any domain information.

> example PATCH: {"HostName": "&lt;string-value&gt;"}

### IPMI.Enabled

**JSONPath**: `/IPMI/Enabled` (PATCHable boolean)

Indicates whether IPMI over LAN is enabled for the manager.

> example PATCH: {"IPMI": {"Enabled": true}}

### IPMI.Port

**JSONPath**: `/IPMI/Port` (read only integer)

The IPMI over LAN port number.

### IPMI.ProtocolEnabled

**JSONPath**: `/IPMI/ProtocolEnabled` (PATCHable boolean)

Indicates whether IPMI over LAN is enabled for the manager.

> example PATCH: {"IPMI": {"ProtocolEnabled": true}}

### KVMIP.Enabled

**JSONPath**: `/KVMIP/Enabled` (read only boolean)

Indicates whether KVM-IP is enabled for the manager.

### KVMIP.Port

**JSONPath**: `/KVMIP/Port` (PATCHable integer)

The KVM-IP port number.

> example PATCH: {"KVMIP": {"Port": &lt;integer-value&gt;}}

### KVMIP.ProtocolEnabled

**JSONPath**: `/KVMIP/ProtocolEnabled` (read only boolean)

Indicates whether KVM-IP is enabled for the manager.

### AlertMailEmail

**JSONPath**: `/Oem/Hp/AlertMailEmail` (PATCHable string)

The destination email address for email alerts.

> example PATCH: {"Oem": {"Hp": {"AlertMailEmail": "&lt;string-value&gt;"}}}

### AlertMailEnabled

**JSONPath**: `/Oem/Hp/AlertMailEnabled` (PATCHable boolean)

Indicates whether AlertMail is enabled. This can be enabled only when the properties AlertMailEmail, AlertMailSenderDomain and AlertMailSMTPServer are set or not empty.

> example PATCH: {"Oem": {"Hp": {"AlertMailEnabled": true}}}

### AlertMailSMTPPort

**JSONPath**: `/Oem/Hp/AlertMailSMTPPort` (PATCHable integer)

The SMTP server port number.

> example PATCH: {"Oem": {"Hp": {"AlertMailSMTPPort": &lt;integer-value&gt;}}}

### AlertMailSMTPServer

**JSONPath**: `/Oem/Hp/AlertMailSMTPServer` (PATCHable string)

The IP address or DNS name of the SMTP server or the Mail Submission Agent (MSA).

> example PATCH: {"Oem": {"Hp": {"AlertMailSMTPServer": "&lt;string-value&gt;"}}}

### AlertMailSenderDomain

**JSONPath**: `/Oem/Hp/AlertMailSenderDomain` (PATCHable string)

The domain name for the sender email address.

> example PATCH: {"Oem": {"Hp": {"AlertMailSenderDomain": "&lt;string-value&gt;"}}}

### ConfigurationSettings

**JSONPath**: `/Oem/Hp/ConfigurationSettings` (read only enumeration)

State of the currently displayed configuration settings.

**Defined values**:

* `Current`

* `SomePendingReset`

### EnforceAES3DESEncryption

**JSONPath**: `/Oem/Hp/EnforceAES3DESEncryption` (PATCHable boolean)

Indicates whether AES/3DES encryption is enforced for the management processor.  When enabled, the management processor accepts only those connections that use AES or 3DES ciphers. The management processor will automatically reset when this field is modified.

> example PATCH: {"Oem": {"Hp": {"EnforceAES3DESEncryption": true}}}

### FederationEnabled

**JSONPath**: `/Oem/Hp/FederationEnabled` (PATCHable boolean)

Indicates whether management processor federation management is enabled or disabled.

> example PATCH: {"Oem": {"Hp": {"FederationEnabled": true}}}

### FederationSupported

**JSONPath**: `/Oem/Hp/FederationSupported` (read only boolean)

Indicates whether management processor federation is supported.

### HPSystemManagementHomepageAddress

**JSONPath**: `/Oem/Hp/HPSystemManagementHomepageAddress` (PATCHable string)

The IP address or FQDN of the HP System Management Homepage (HP SMH) server.

> example PATCH: {"Oem": {"Hp": {"HPSystemManagementHomepageAddress": "&lt;string-value&gt;"}}}

### RemoteSyslogEnabled

**JSONPath**: `/Oem/Hp/RemoteSyslogEnabled` (PATCHable boolean)

Indicates whether Remote Syslog is enabled. When enabled, management processor sends notification messages to the specified Syslog server. This can be enabled only when the property RemoteSyslogServer is set or not empty.

> example PATCH: {"Oem": {"Hp": {"RemoteSyslogEnabled": true}}}

### RemoteSyslogPort

**JSONPath**: `/Oem/Hp/RemoteSyslogPort` (PATCHable integer)

The port number through which the Syslog server is listening.

> example PATCH: {"Oem": {"Hp": {"RemoteSyslogPort": &lt;integer-value&gt;}}}

### RemoteSyslogServer

**JSONPath**: `/Oem/Hp/RemoteSyslogServer` (PATCHable string)

The IP address, FQDN, IPv6 name, or short name of the server running the Syslog service.

> example PATCH: {"Oem": {"Hp": {"RemoteSyslogServer": "&lt;string-value&gt;"}}}

### SNMPTrapPort

**JSONPath**: `/Oem/Hp/SNMPTrapPort` (PATCHable integer)

The SNMP trap port number.

> example PATCH: {"Oem": {"Hp": {"SNMPTrapPort": &lt;integer-value&gt;}}}

### SerialOverLanLogging

**JSONPath**: `/Oem/Hp/SerialOverLanLogging` (PATCHable boolean)

Indicates whether Serial Over LAN (SOL) or Virtual Serial Port (VSP) logging is enabled.

> example PATCH: {"Oem": {"Hp": {"SerialOverLanLogging": true}}}

### XMLResponseEnabled

**JSONPath**: `/Oem/Hp/XMLResponseEnabled` (PATCHable boolean)

Determines whether management processor responds to anonymous XML discovery requests.

> example PATCH: {"Oem": {"Hp": {"XMLResponseEnabled": true}}}

### SNMP.Enabled

**JSONPath**: `/SNMP/Enabled` (PATCHable boolean)

Indicates whether SNMP is enabled for the manager.

> example PATCH: {"SNMP": {"Enabled": true}}

### SNMP.Port

**JSONPath**: `/SNMP/Port` (PATCHable integer)

The SNMP port number.

> example PATCH: {"SNMP": {"Port": &lt;integer-value&gt;}}

### SNMP.ProtocolEnabled

**JSONPath**: `/SNMP/ProtocolEnabled` (PATCHable boolean)

Indicates whether SNMP is enabled for the manager.

> example PATCH: {"SNMP": {"ProtocolEnabled": true}}

### SSDP.Enabled

**JSONPath**: `/SSDP/Enabled` (PATCHable boolean)

Indicates whether SSDP is enabled for the manager.

> example PATCH: {"SSDP": {"Enabled": true}}

### SSDP.NotifyIPv6Scope

**JSONPath**: `/SSDP/NotifyIPv6Scope` (PATCHable enumeration)

The scope for IPv6 Notify messages for SSDP.

> example PATCH: {"SSDP": {"NotifyIPv6Scope": "Site"}}

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Link`

* `Site`

* `Organization`

### SSDP.NotifyMulticastIntervalSeconds

**JSONPath**: `/SSDP/NotifyMulticastIntervalSeconds` (PATCHable integer)

Indicates how often multicast is performed for SSDP.

> example PATCH: {"SSDP": {"NotifyMulticastIntervalSeconds": &lt;integer-value&gt;}}

### SSDP.NotifyTTL

**JSONPath**: `/SSDP/NotifyTTL` (PATCHable integer)

The Time to Live (TTL) hop count for SSDP Notify messages.

> example PATCH: {"SSDP": {"NotifyTTL": &lt;integer-value&gt;}}

### SSDP.Port

**JSONPath**: `/SSDP/Port` (read only integer)

The SSDP port number.

### SSDP.ProtocolEnabled

**JSONPath**: `/SSDP/ProtocolEnabled` (PATCHable boolean)

Indicates whether SSDP is enabled for the manager.

> example PATCH: {"SSDP": {"ProtocolEnabled": true}}

### SSH.Enabled

**JSONPath**: `/SSH/Enabled` (PATCHable boolean)

Indicates whether SSH is enabled for the manager.  NOTE: When this field is modified, the Manager will reset automatically.

> example PATCH: {"SSH": {"Enabled": true}}

### SSH.Port

**JSONPath**: `/SSH/Port` (PATCHable integer)

The SSH port number.  NOTE: When this field is modified, the Manager will reset automatically.

> example PATCH: {"SSH": {"Port": &lt;integer-value&gt;}}

### SSH.ProtocolEnabled

**JSONPath**: `/SSH/ProtocolEnabled` (PATCHable boolean)

Indicates whether SSH is enabled for the manager.  NOTE: When this field is modified, the Manager will reset automatically.

> example PATCH: {"SSH": {"ProtocolEnabled": true}}

### SessionTimeoutMinutes

**JSONPath**: `/SessionTimeoutMinutes` (PATCHable integer)

The session timeout (minutes). A zero value indicates infinite timeout.

> example PATCH: {"SessionTimeoutMinutes": &lt;integer-value&gt;}

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollup

**JSONPath**: `/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### VirtualMedia.Enabled

**JSONPath**: `/VirtualMedia/Enabled` (read only boolean)

Indicates whether Virtual Media is enabled for the manager.

### VirtualMedia.Port

**JSONPath**: `/VirtualMedia/Port` (PATCHable integer)

The Virtual Media port number.

> example PATCH: {"VirtualMedia": {"Port": &lt;integer-value&gt;}}

### VirtualMedia.ProtocolEnabled

**JSONPath**: `/VirtualMedia/ProtocolEnabled` (read only boolean)

Indicates whether Virtual Media is enabled for the manager.

### POST Action "SendTestSyslog"

> example "SendTestSyslog" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{}
```

### POST Action "SendTestAlertMail"

Sends test alert mail to configured AlertMail email address.

> example "SendTestAlertMail" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{}
```

## Power
This is the schema definition for the Power Metrics.  It represents the properties for Power Consumption and Power Limiting.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/chassis/{item}/power`

### SNMPPowerThresholdAlert.DurationInMin

**JSONPath**: `/Oem/Hp/SNMPPowerThresholdAlert/DurationInMin` (PATCHable integer)

Sets the length of time, in minutes, that power consumption must remain above the warning threshold before an SNMP alert is triggered. The maximum duration is 240 minutes, and the duration must be a multiple of 5.

> example PATCH: {"Oem": {"Hp": {"SNMPPowerThresholdAlert": {"DurationInMin": &lt;integer-value&gt;}}}}

### SNMPPowerThresholdAlert.ThresholdWatts

**JSONPath**: `/Oem/Hp/SNMPPowerThresholdAlert/ThresholdWatts` (PATCHable integer)

Sets the power consumption threshold (watts). If power consumption exceeds this value for the specified time duration, an SNMP alert is triggered.

> example PATCH: {"Oem": {"Hp": {"SNMPPowerThresholdAlert": {"ThresholdWatts": &lt;integer-value&gt;}}}}

### SNMPPowerThresholdAlert.Trigger

**JSONPath**: `/Oem/Hp/SNMPPowerThresholdAlert/Trigger` (PATCHable enumeration)

Trigger determines whether alerts are based on peak power consumption, average power consumption, or if they are disabled. Trigger property can only be enabled if the ThresholdWatts and DurationInMin values are specified/configured.

> example PATCH: {"Oem": {"Hp": {"SNMPPowerThresholdAlert": {"Trigger": "AveragePowerConsumption"}}}}

**Defined values**:

* `Disabled`

* `AveragePowerConsumption`

* `PeakPowerConsumption`

### PowerAllocatedWatts

**JSONPath**: `/PowerAllocatedWatts` (read only integer)

The total power (Watts) allocated to the chassis.

### PowerAvailableWatts

**JSONPath**: `/PowerAvailableWatts` (read only integer)

Amount of power (Watts) not already budgeted and therefore available for additional allocation. (PowerCapacity - PowerAllocated).  This indicates how much reserve power capacity is left.

### PowerCapacityWatts

**JSONPath**: `/PowerCapacityWatts` (read only integer)

The total power (Watts) available to the chassis from all power supplies (adjusting for redundancy settings).

### PowerConsumedWatts

**JSONPath**: `/PowerConsumedWatts` (read only integer)

The latest observed power (Watts) being drawn by this chassis. The update interval may vary depending upon implementation but is usually measured in seconds.

### PowerControl[array-item].MemberId

**JSONPath**: `/PowerControl/(array index)/MemberId` (PATCHable string)

This is the identifier for the member within the collection.

### PowerControl[array-item].PowerAllocatedWatts

**JSONPath**: `/PowerControl/(array index)/PowerAllocatedWatts` (read only integer)

The total amount of power that has been allocated (or budegeted)to  chassis resources.

### PowerControl[array-item].PowerAvailableWatts

**JSONPath**: `/PowerControl/(array index)/PowerAvailableWatts` (read only integer)

The amount of power not already budgeted and therefore available for additional allocation. (powerCapacity - powerAllocated).  This indicates how much reserve power capacity is left.

### PowerControl[array-item].PowerCapacityWatts

**JSONPath**: `/PowerControl/(array index)/PowerCapacityWatts` (read only integer)

The total amount of power available to the chassis for allocation. This may the power supply capacity, or power budget assigned to the chassis from an up-stream chassis.

### PowerControl[array-item].PowerConsumedWatts

**JSONPath**: `/PowerControl/(array index)/PowerConsumedWatts` (read only integer)

The actual power being consumed by the chassis.

### PowerControl[array-item].PowerLimit.CorrectionInMs

**JSONPath**: `/PowerControl/(array index)/PowerLimit/CorrectionInMs` (read only integer)

The time required for the limiting process to reduce power consumption to below the limit.

### PowerControl[array-item].PowerLimit.LimitException

**JSONPath**: `/PowerControl/(array index)/PowerLimit/LimitException` (PATCHable enumeration)

The action that is taken if the power cannot be maintained below the LimitInWatts.

> example PATCH: {"PowerControl": [{"PowerLimit": {"LimitException": "LogEventOnly"}}|null, ...]}

**Defined values**:

* `NoAction`

* `HardPowerOff`

* `LogEventOnly`

* `Oem`

### PowerControl[array-item].PowerLimit.LimitInWatts

**JSONPath**: `/PowerControl/(array index)/PowerLimit/LimitInWatts` (PATCHable integer)

The Power limit in watts. Set to null to disable power capping.

> example PATCH: {"PowerControl": [{"PowerLimit": {"LimitInWatts": &lt;integer-value&gt;}}|null, ...]}

### PowerControl[array-item].PowerMetrics.AverageConsumedWatts

**JSONPath**: `/PowerControl/(array index)/PowerMetrics/AverageConsumedWatts` (read only integer)

The average power level over the measurement window (the last IntervalInMin minutes).

### PowerControl[array-item].PowerMetrics.IntervalInMin

**JSONPath**: `/PowerControl/(array index)/PowerMetrics/IntervalInMin` (read only integer)

The time interval (or window) in which the PowerMetrics are measured over.

### PowerControl[array-item].PowerMetrics.MaxConsumedWatts

**JSONPath**: `/PowerControl/(array index)/PowerMetrics/MaxConsumedWatts` (read only integer)

The highest power consumption level that has occured over the measurement window (the last IntervalInMin minutes).

### PowerControl[array-item].PowerMetrics.MinConsumedWatts

**JSONPath**: `/PowerControl/(array index)/PowerMetrics/MinConsumedWatts` (read only integer)

The lowest power consumption level over the measurement window (the last IntervalInMin minutes).

### PowerControl[array-item].PowerRequestedWatts

**JSONPath**: `/PowerControl/(array index)/PowerRequestedWatts` (read only integer)

The potential power that the chassis resources are requesting which may be higher than the current level being consumed since requested power includes budget that the chassis resource wants for future use.

### PowerControl[array-item].Status.Health

**JSONPath**: `/PowerControl/(array index)/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### PowerControl[array-item].Status.HealthRollUp

**JSONPath**: `/PowerControl/(array index)/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### PowerControl[array-item].Status.HealthRollup

**JSONPath**: `/PowerControl/(array index)/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### PowerControl[array-item].Status.State

**JSONPath**: `/PowerControl/(array index)/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### PowerLimit.CorrectionInMs

**JSONPath**: `/PowerLimit/CorrectionInMs` (read only integer)

Time in milliseconds that it takes for the limiting process to react and correct the power consumption below the limit.

### PowerLimit.CorrelatableID

**JSONPath**: `/PowerLimit/CorrelatableID` (read only string)

The value of this property shall represent a reference to the resource that is being limited.

### PowerLimit.LimitException

**JSONPath**: `/PowerLimit/LimitException` (PATCHable enumeration)

Action that is taken if the power cannot be maintained below the LimitInWatts.

> example PATCH: {"PowerLimit": {"LimitException": "HardPowerOff"}}

**Defined values**:

* `null`:  the value is temporarily unavailable

* `NoAction`

* `HardPowerOff`

* `LogEventOnly`

* `Oem`

### PowerLimit.LimitInWatts

**JSONPath**: `/PowerLimit/LimitInWatts` (PATCHable integer)

The Power (Watts) limit (also known as 'Power Cap'). Set to null to disable the power cap.

> example PATCH: {"PowerLimit": {"LimitInWatts": &lt;integer-value&gt;}}

### PowerMetrics.AverageConsumedWatts

**JSONPath**: `/PowerMetrics/AverageConsumedWatts` (read only integer)

The average power consumed during the interval specified by 'IntervalInMin'.

### PowerMetrics.IntervalInMin

**JSONPath**: `/PowerMetrics/IntervalInMin` (read only integer)

The interval between power metric evaluation in minutes.

### PowerMetrics.MaxConsumedWatts

**JSONPath**: `/PowerMetrics/MaxConsumedWatts` (read only integer)

The maximum power consumed during the interval specified by 'IntervalInMin'.

### PowerMetrics.MinConsumedWatts

**JSONPath**: `/PowerMetrics/MinConsumedWatts` (read only integer)

The minimum power consumed during the interval specified by 'IntervalInMin'.

### PowerRequestedWatts

**JSONPath**: `/PowerRequestedWatts` (read only integer)

Potential power (Watts) that the chassis is requesting that might be higher than the current level being consumed. This is because the requested power includes budget that the chassis has reserved for future use.

### PowerSupplies[array-item].CorrelatableID

**JSONPath**: `/PowerSupplies/(array index)/CorrelatableID` (read only string)

CorrelatableID for this power supply.

### PowerSupplies[array-item].FirmwareVersion

**JSONPath**: `/PowerSupplies/(array index)/FirmwareVersion` (read only string)

The firmware version for this Power Supply

### PowerSupplies[array-item].LastPowerOutputWatts

**JSONPath**: `/PowerSupplies/(array index)/LastPowerOutputWatts` (read only integer)

The average power output of this Power Supply

### PowerSupplies[array-item].LineInputVoltage

**JSONPath**: `/PowerSupplies/(array index)/LineInputVoltage` (read only integer)

The line input voltage at which the Power Supply is operating

### PowerSupplies[array-item].LineInputVoltageType

**JSONPath**: `/PowerSupplies/(array index)/LineInputVoltageType` (read only enumeration)

The line voltage type supported as an input to this Power Supply

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Unknown`

* `ACLowLine`

* `ACMidLine`

* `ACHighLine`

* `DCNeg48V`

* `HighVoltageDC`

### PowerSupplies[array-item].MemberId

**JSONPath**: `/PowerSupplies/(array index)/MemberId` (PATCHable string)

This is the identifier for the member within the collection.

### PowerSupplies[array-item].Model

**JSONPath**: `/PowerSupplies/(array index)/Model` (read only string)

The model number for this Power Supply

### PowerSupplies[array-item].Oem.Hp.AveragePowerOutputWatts

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/AveragePowerOutputWatts` (read only integer)

The latest observed average power being drawn by the power supply (Watts). This is usually updated every 10 seconds but the period can vary in some circumstances.

### PowerSupplies[array-item].Oem.Hp.BayNumber

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/BayNumber` (read only integer)

The power supply bay number.

### PowerSupplies[array-item].Oem.Hp.HotplugCapable

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/HotplugCapable` (read only boolean)

If true, this power supply (and power supply bay) is capable of being hot-plugged.

### PowerSupplies[array-item].Oem.Hp.MaxPowerOutputWatts

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/MaxPowerOutputWatts` (read only integer)

The latest observed maximum output power being drawn by the power supply (Watts). This is usually updated every 10 seconds but the period can vary in some circumstances.

### PowerSupplies[array-item].Oem.Hp.Mismatched

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/Mismatched` (read only boolean)

If true, this power supply is mismatched with others in the system.

### PowerSupplies[array-item].Oem.Hp.PowerSupplyStatus.State

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/PowerSupplyStatus/State` (read only enumeration)

Indicates the known state of the resource.

**Defined values**:

* `Unknown`

* `Ok`

* `Degraded`

* `Failed`

* `OverVoltage`

* `OverCurrent`

* `OverTemperature`

* `ACPowerLost`

* `FanFailure`

* `WarningHighInputVoltage`

* `WarningLowInputVoltage`

* `WarningHighOutputVoltage`

* `WarningLowOutputVoltage`

* `WarningInletTemperature`

* `WarningInternalTemperature`

* `WarningHighAuxiliaryVoltage`

* `WarningLowAuxiliaryVoltage`

* `PowerSupplyMismatch`

### PowerSupplies[array-item].Oem.Hp.iPDU.IPAddress

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/iPDU/IPAddress` (read only string)

The IP address of the iPDU connected to this power supply.

### PowerSupplies[array-item].Oem.Hp.iPDU.MacAddress

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/iPDU/MacAddress` (read only string)

The Ethernet MAC address of the iPDU connected to this power supply.

### PowerSupplies[array-item].Oem.Hp.iPDU.Model

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/iPDU/Model` (read only string)

The model number of the iPDU connected to this power supply.

### PowerSupplies[array-item].Oem.Hp.iPDU.SerialNumber

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/iPDU/SerialNumber` (read only string)

The serial number of the iPDU connected to this power supply.

### PowerSupplies[array-item].Oem.Hp.iPDU.iPDUStatus.State

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/iPDU/iPDUStatus/State` (read only enumeration)

Indicates the known state of the resource.

**Defined values**:

* `Unknown`

* `Ok`

* `Degraded`

* `Failed`

* `OverVoltage`

* `OverCurrent`

* `OverTemperature`

* `ACPowerLost`

* `FanFailure`

* `WarningHighInputVoltage`

* `WarningLowInputVoltage`

* `WarningHighOutputVoltage`

* `WarningLowOutputVoltage`

* `WarningInletTemperature`

* `WarningInternalTemperature`

* `WarningHighAuxiliaryVoltage`

* `WarningLowAuxiliaryVoltage`

* `PowerSupplyMismatch`

### PowerSupplies[array-item].Oem.Hp.iPDUCapable

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/iPDUCapable` (read only boolean)

If true, this power supply is capable of being connected to an iPDUs.

### PowerSupplies[array-item].PartNumber

**JSONPath**: `/PowerSupplies/(array index)/PartNumber` (read only string)

The part number for this Power Supply

### PowerSupplies[array-item].PowerCapacityWatts

**JSONPath**: `/PowerSupplies/(array index)/PowerCapacityWatts` (read only integer)

The maximum capacity of this Power Supply

### PowerSupplies[array-item].PowerSupplyType

**JSONPath**: `/PowerSupplies/(array index)/PowerSupplyType` (read only enumeration)

The Power Supply type (AC or DC)

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Unknown`

* `AC`

* `DC`

### PowerSupplies[array-item].Redundancy[array-item].MaxNumSupported

**JSONPath**: `/PowerSupplies/(array index)/Redundancy/(array index)/MaxNumSupported` (read only integer)

This is the maximum number of members allowable for this particular managers redundancy, including this manager.

### PowerSupplies[array-item].Redundancy[array-item].MemberId

**JSONPath**: `/PowerSupplies/(array index)/Redundancy/(array index)/MemberId` (PATCHable string)

This is the identifier for the member within the collection.

### PowerSupplies[array-item].Redundancy[array-item].MinNumNeeded

**JSONPath**: `/PowerSupplies/(array index)/Redundancy/(array index)/MinNumNeeded` (read only integer)

This is the minumum number of managers needed for this manager to be redundant.

### PowerSupplies[array-item].Redundancy[array-item].Mode

**JSONPath**: `/PowerSupplies/(array index)/Redundancy/(array index)/Mode` (read only enumeration)

This is the redundancy mode of the group.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Failover`

* `N+1`

* `LoadBalanced`

* `Sparing`

* `LimitedSparing`

### PowerSupplies[array-item].Redundancy[array-item].Status.Health

**JSONPath**: `/PowerSupplies/(array index)/Redundancy/(array index)/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### PowerSupplies[array-item].Redundancy[array-item].Status.HealthRollUp

**JSONPath**: `/PowerSupplies/(array index)/Redundancy/(array index)/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### PowerSupplies[array-item].Redundancy[array-item].Status.HealthRollup

**JSONPath**: `/PowerSupplies/(array index)/Redundancy/(array index)/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### PowerSupplies[array-item].Redundancy[array-item].Status.State

**JSONPath**: `/PowerSupplies/(array index)/Redundancy/(array index)/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### PowerSupplies[array-item].SerialNumber

**JSONPath**: `/PowerSupplies/(array index)/SerialNumber` (read only string)

The serial number for this Power Supply

### PowerSupplies[array-item].SparePartNumber

**JSONPath**: `/PowerSupplies/(array index)/SparePartNumber` (read only string)

The spare part number for this Power Supply

### PowerSupplies[array-item].Status.Health

**JSONPath**: `/PowerSupplies/(array index)/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### PowerSupplies[array-item].Status.HealthRollUp

**JSONPath**: `/PowerSupplies/(array index)/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### PowerSupplies[array-item].Status.HealthRollup

**JSONPath**: `/PowerSupplies/(array index)/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### PowerSupplies[array-item].Status.State

**JSONPath**: `/PowerSupplies/(array index)/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Redundancy[array-item].MaxNumSupported

**JSONPath**: `/Redundancy/(array index)/MaxNumSupported` (read only integer)

This is the maximum number of members allowable for this particular managers redundancy, including this manager.

### Redundancy[array-item].MemberId

**JSONPath**: `/Redundancy/(array index)/MemberId` (PATCHable string)

This is the identifier for the member within the collection.

### Redundancy[array-item].MinNumNeeded

**JSONPath**: `/Redundancy/(array index)/MinNumNeeded` (read only integer)

This is the minumum number of managers needed for this manager to be redundant.

### Redundancy[array-item].Mode

**JSONPath**: `/Redundancy/(array index)/Mode` (read only enumeration)

This is the redundancy mode of the group.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Failover`

* `N+1`

* `LoadBalanced`

* `Sparing`

* `LimitedSparing`

### Redundancy[array-item].Status.Health

**JSONPath**: `/Redundancy/(array index)/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Redundancy[array-item].Status.HealthRollUp

**JSONPath**: `/Redundancy/(array index)/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Redundancy[array-item].Status.HealthRollup

**JSONPath**: `/Redundancy/(array index)/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Redundancy[array-item].Status.State

**JSONPath**: `/Redundancy/(array index)/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollup

**JSONPath**: `/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

## ServiceRoot
This object represents the HP RESTful API root service.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1`

### Manager[array-item].Blade.BayNumber

**JSONPath**: `/Oem/Hp/Manager/(array index)/Blade/BayNumber` (read only string)

Specifies the location of the blade in the enclosure.

### Manager[array-item].Blade.EnclosureName

**JSONPath**: `/Oem/Hp/Manager/(array index)/Blade/EnclosureName` (read only string)

Specifies the name of the enclosure in which the blade is present.

### Manager[array-item].Blade.RackName

**JSONPath**: `/Oem/Hp/Manager/(array index)/Blade/RackName` (read only string)

Specifies the name of the rack in which the enclosure is present.

### Manager[array-item].DefaultLanguage

**JSONPath**: `/Oem/Hp/Manager/(array index)/DefaultLanguage` (read only string)

Default language used for the Web interface.

### Manager[array-item].FQDN

**JSONPath**: `/Oem/Hp/Manager/(array index)/FQDN` (read only string)

Fully qualified domain name of the management processor.

### Manager[array-item].HostName

**JSONPath**: `/Oem/Hp/Manager/(array index)/HostName` (read only string)

The name of management processor.

### Manager[array-item].IPManager

**JSONPath**: `/Oem/Hp/Manager/(array index)/IPManager` (read only object)

### Manager[array-item].Languages[array-item].Language

**JSONPath**: `/Oem/Hp/Manager/(array index)/Languages/(array index)/Language` (read only string)

Specifies one of the languages supported by the management processor.

### Manager[array-item].Languages[array-item].TranslationName

**JSONPath**: `/Oem/Hp/Manager/(array index)/Languages/(array index)/TranslationName` (read only string)

Specifies one of the languages supported by the management processor.

### Manager[array-item].Languages[array-item].Version

**JSONPath**: `/Oem/Hp/Manager/(array index)/Languages/(array index)/Version` (read only string)

Specifies the version of the management processor in the respective language.

### Manager[array-item].ManagerFirmwareVersion

**JSONPath**: `/Oem/Hp/Manager/(array index)/ManagerFirmwareVersion` (read only string)

The major and minor management processor version numbers.

### Manager[array-item].ManagerFirmwareVersionPass

**JSONPath**: `/Oem/Hp/Manager/(array index)/ManagerFirmwareVersionPass` (read only string)

The build or pass number of the management processor version.

### Manager[array-item].ManagerType

**JSONPath**: `/Oem/Hp/Manager/(array index)/ManagerType` (read only string)

The type of the service manager.

### Sessions.CertCommonName

**JSONPath**: `/Oem/Hp/Sessions/CertCommonName` (read only string)

The name of the management processor as it appears in the digital certificate when a secure web GUI session is established to the management processor.

### Sessions.KerberosEnabled

**JSONPath**: `/Oem/Hp/Sessions/KerberosEnabled` (read only boolean)

Specifies whether Kerberos login is enabled.

### Sessions.LDAPAuthLicenced

**JSONPath**: `/Oem/Hp/Sessions/LDAPAuthLicenced` (read only boolean)

Specifies whether a valid license is installed for LDAP use.

### Sessions.LDAPEnabled

**JSONPath**: `/Oem/Hp/Sessions/LDAPEnabled` (read only boolean)

Specifies whether LDAP login is enabled.

### Sessions.LocalLoginEnabled

**JSONPath**: `/Oem/Hp/Sessions/LocalLoginEnabled` (read only boolean)

Specifies whether local users can log in.

### Sessions.LoginFailureDelay

**JSONPath**: `/Oem/Hp/Sessions/LoginFailureDelay` (read only integer)

The delay (seconds) when a management processor login attempt has failed.

### Sessions.LoginHint.Hint

**JSONPath**: `/Oem/Hp/Sessions/LoginHint/Hint` (read only string)

The information on how to log in to the management processor.

### Sessions.LoginHint.HintPOSTData.Password

**JSONPath**: `/Oem/Hp/Sessions/LoginHint/HintPOSTData/Password` (read only string)

The password for logging in to the management processor.

### Sessions.LoginHint.HintPOSTData.UserName

**JSONPath**: `/Oem/Hp/Sessions/LoginHint/HintPOSTData/UserName` (read only string)

The user name for logging in to the management processor.

### Sessions.SecurityMessage

**JSONPath**: `/Oem/Hp/Sessions/SecurityMessage` (read only string)

The login security banner message that is displayed on the management processor Login page.

### Sessions.SecurityOverride

**JSONPath**: `/Oem/Hp/Sessions/SecurityOverride` (read only boolean)

Specifies whether the security override switch is enabled.

### Sessions.ServerName

**JSONPath**: `/Oem/Hp/Sessions/ServerName` (read only string)

The name of the server that this management processor is managing.

### RedfishVersion

**JSONPath**: `/RedfishVersion` (read only string)

The version of the Redfish service

### ServiceVersion

**JSONPath**: `/ServiceVersion` (read only string)

The web service version. This is different from the version of the data model.

### Time

**JSONPath**: `/Time` (read only string)

The current web service time.

### UUID

**JSONPath**: `/UUID` (read only string)

Unique identifier for a service instance.  This value should be an exact match of the UUID value returned in a 200OK from an SSDP M-SEARCH request during discovery.

## Session

This represents a single logged in session.  See Authentication and Sessions for more detail.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/sessionservice/sessions/{item}`

### AccessTime

**JSONPath**: `/Oem/Hp/AccessTime` (read only string)

User session last-access time

### LoginTime

**JSONPath**: `/Oem/Hp/LoginTime` (read only string)

User session login time

### MySession

**JSONPath**: `/Oem/Hp/MySession` (read only boolean)

Indicates whether this is a session I own.

### Privileges.LoginPriv

**JSONPath**: `/Oem/Hp/Privileges/LoginPriv` (read only boolean)

This privilege enables a user to log in to the management processor. All local accounts have the login privilege. This privilege is added automatically if it is not specified.

### Privileges.RemoteConsolePriv

**JSONPath**: `/Oem/Hp/Privileges/RemoteConsolePriv` (read only boolean)

This privilege enables a user to remotely access the host system Remote Console, including video, keyboard, and mouse control.

### Privileges.UserConfigPriv

**JSONPath**: `/Oem/Hp/Privileges/UserConfigPriv` (read only boolean)

This privilege enables a user to add, edit, and delete local management processor user accounts. A user with this privilege can change privileges for all users.

### Privileges.VirtualMediaPriv

**JSONPath**: `/Oem/Hp/Privileges/VirtualMediaPriv` (read only boolean)

This privilege enables a user to use the Virtual Media feature on the host system.

### Privileges.VirtualPowerAndResetPriv

**JSONPath**: `/Oem/Hp/Privileges/VirtualPowerAndResetPriv` (read only boolean)

This privilege enables a user to power-cycle or reset the host system. These activities interrupt system availability. A user with this privilege can diagnose the system by using the Generate NMI to System button.

### Privileges.iLOConfigPriv

**JSONPath**: `/Oem/Hp/Privileges/iLOConfigPriv` (read only boolean)

This privilege enables a user to configure most management processor settings, including security settings, and to remotely update the management processor firmware. This privilege does not enable local user account administration.

### UserAccount

**JSONPath**: `/Oem/Hp/UserAccount` (read only string)

Login details of the user

### UserDistinguishedName

**JSONPath**: `/Oem/Hp/UserDistinguishedName` (read only string)

LDAP user is identified by its distinguished name (DN).

### UserExpires

**JSONPath**: `/Oem/Hp/UserExpires` (read only string)

User session expire time

### UserIP

**JSONPath**: `/Oem/Hp/UserIP` (read only string)

IP address of the user

### UserTag

**JSONPath**: `/Oem/Hp/UserTag` (read only enumeration)

Session source

**Defined values**:

* `Web UI`

* `RBSU`

* `Remote Console`

* `SSH`

* `IPMI/RMCP`

* `SM-CLP`

* `RIBCL`

* `Unknown`

### UserType

**JSONPath**: `/Oem/Hp/UserType` (read only enumeration)

User type

**Defined values**:

* `Local`

* `Directory`

* `Single Sign On`

* `Kerberos`

* `Trusted Key`

* `Security Override`

* `System`

* `Federation`

### UserName

**JSONPath**: `/UserName` (read only string)

Name to use to log in to the management processor.

## SessionService

This represents the REST API's session manager, enabling clients to create new sessions or end sessions.  See the section "Authentication and Sessions" for details on how to manage sessions.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/sessionservice`

### ServiceEnabled

**JSONPath**: `/ServiceEnabled` (PATCHable boolean)

This indicates whether this service is enabled.

### SessionTimeout

**JSONPath**: `/SessionTimeout` (PATCHable integer)

This is the number of seconds of inactivity that a session may have before the session service closes the session due to inactivity.

> example PATCH: {"SessionTimeout": &lt;integer-value&gt;}

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollup

**JSONPath**: `/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

## SnmpService

This represents iLO 4's SNMP configuration and status

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/snmpservice`

### AlertsEnabled

**JSONPath**: `/AlertsEnabled` (PATCHable boolean)

The alert conditions that the management processor detects independently of the host operating system can be sent to specified SNMP alert destinations, such as HP SIM.

> example PATCH: {"AlertsEnabled": true}

### Contact

**JSONPath**: `/Contact` (PATCHable string)

The string of up to 49 characters that specifies the system administrator or server owner. The string can include a name, email address, or phone number.

> example PATCH: {"Contact": "&lt;string-value&gt;"}

### Location

**JSONPath**: `/Location` (PATCHable string)

The string of up to 49 characters that specifies the physical location of the server.

> example PATCH: {"Location": "&lt;string-value&gt;"}

### Mode

**JSONPath**: `/Mode` (PATCHable enumeration)

Agentless Management Mode (default): Use SNMP agents running on the management processor to manage the server. SNMP Pass-thru Mode: Use SNMP agents running on the host operating system to manage the server. This setting does not affect alerts.

> example PATCH: {"Mode": "Passthru"}

**Defined values**:

* `Agentless`

* `Passthru`

### SNMPColdStartTrapBroadcast

**JSONPath**: `/Oem/Hp/SNMPColdStartTrapBroadcast` (PATCHable boolean)

If set to true, the Cold Start Trap will be enabled. The Cold Start Trap is broadcast to a subnet broadcast address if there are no trap destinations configured in the SNMP Alert Destination(s) boxes.

> example PATCH: {"Oem": {"Hp": {"SNMPColdStartTrapBroadcast": true}}}

### SNMPForwardInsightManagerAgentAlerts

**JSONPath**: `/Oem/Hp/SNMPForwardInsightManagerAgentAlerts` (PATCHable boolean)

If set to true, the alert conditions detected by the host management agents are forwarded to SNMP alert destinations through the management processor. These alerts are generated by the Insight Management Agents, which are available for each supported operating system. Insight Management Agents must be installed on the host server to receive these alerts.

> example PATCH: {"Oem": {"Hp": {"SNMPForwardInsightManagerAgentAlerts": true}}}

### Role

**JSONPath**: `/Role` (PATCHable string)

The string of up to 64 characters that describes the server role or function.

> example PATCH: {"Role": "&lt;string-value&gt;"}

### RoleDetail

**JSONPath**: `/RoleDetail` (PATCHable string)

The string of up to 512 characters that describes specific tasks that the server might perform.

> example PATCH: {"RoleDetail": "&lt;string-value&gt;"}

### SNMPv1Traps

**JSONPath**: `/SNMPv1Traps` (PATCHable boolean)

When enabled, SNMPv1 traps are sent to the remote management systems configured in the SNMP Alert Destination(s) boxes.

> example PATCH: {"SNMPv1Traps": true}

### SNMPv3EngineID

**JSONPath**: `/SNMPv3EngineID` (PATCHable string)

The SNMPv3 Engine ID is the unique identifier of an SNMP engine that belongs to an SNMP agent entity. This value must be a hexadecimal string with an even number of 6 to 32 characters, excluding the first two characters, 0x (for example, 0x01020304abcdef).

> example PATCH: {"SNMPv3EngineID": "&lt;string-value&gt;"}

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollup

**JSONPath**: `/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### TrapSourceHostname

**JSONPath**: `/TrapSourceHostname` (PATCHable enumeration)

Determines the host name that is used in the SNMP-defined sysName variable when the management processor generates SNMP traps.

> example PATCH: {"TrapSourceHostname": "System"}

**Defined values**:

* `Manager`

* `System`

### Users[array-item].AuthPassphrase

**JSONPath**: `/Users/(array index)/AuthPassphrase` (PATCHable string)

Sets the passphrase to use for sign operations. Enter a value of 8 to 49 characters.

> example PATCH: {"Users": [{"AuthPassphrase": "&lt;string-value&gt;"}|null, ...]}

### Users[array-item].AuthProtocol

**JSONPath**: `/Users/(array index)/AuthProtocol` (PATCHable enumeration)

Sets the message digest algorithm to use for encoding the authorization passphrase. The message digest is calculated over an appropriate portion of an SNMP message, and is included as part of the message sent to the recipient. Select MD5 (Message Digest) or SHA (Secure Hash Algorithm).

> example PATCH: {"Users": [{"AuthProtocol": "SHA"}|null, ...]}

**Defined values**:

* `MD5`

* `SHA`

### Users[array-item].PrivacyPassphrase

**JSONPath**: `/Users/(array index)/PrivacyPassphrase` (PATCHable string)

Sets the passphrase to use for encrypt operations. Enter a value of 8 to 49 characters.

> example PATCH: {"Users": [{"PrivacyPassphrase": "&lt;string-value&gt;"}|null, ...]}

### Users[array-item].PrivacyProtocol

**JSONPath**: `/Users/(array index)/PrivacyProtocol` (PATCHable enumeration)

Sets the encryption algorithm to use for encoding the privacy passphrase. A portion of an SNMP message is encrypted before transmission. Select AES (Advanced Encryption Standard) or DES (Data Encryption Standard).

> example PATCH: {"Users": [{"PrivacyProtocol": "AES"}|null, ...]}

**Defined values**:

* `DES`

* `AES`

### Users[array-item].SecurityName

**JSONPath**: `/Users/(array index)/SecurityName` (PATCHable string)

The user profile name. Enter an alphanumeric string of 1 to 32 characters.

> example PATCH: {"Users": [{"SecurityName": "&lt;string-value&gt;"}|null, ...]}

### POST Action "SendSNMPTestAlert"

Causes iLO 4 to send a test SNMP trap to registered trap destinations. 

> example "SendSNMPTestAlert" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{}
```

## Thermal
The schema definition for the Thermal Metrics. It represents the properties for temperature and cooling.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/chassis/{item}/thermal`

### Fans[array-item].Context

**JSONPath**: `/Fans/(array index)/Context` (read only enumeration)

The area or device to which this temperature measurement applies.

**Defined values**:

* `System`

* `System Board`

* `I/O Board`

* `CPU`

* `Memory`

* `Storage`

* `Removable Media`

* `Power Supply`

* `Ambient`

* `Chassis`

* `Bridge Board`

* `Exhaust`

* `Processor Bay`

* `IO Bay`

* `Blade Slot`

* `Virtual`

### Fans[array-item].CorrelatableID

**JSONPath**: `/Fans/(array index)/CorrelatableID` (read only string)

The CorrelatableID for this fan.

### Fans[array-item].CurrentReading

**JSONPath**: `/Fans/(array index)/CurrentReading` (read only integer)

The current speed of the fan.

### Fans[array-item].FanName

**JSONPath**: `/Fans/(array index)/FanName` (read only string)

The name of the fan sensor.

### Fans[array-item].LowerThresholdCritical

**JSONPath**: `/Fans/(array index)/LowerThresholdCritical` (read only integer)

Below normal range but not yet fatal.

### Fans[array-item].LowerThresholdFatal

**JSONPath**: `/Fans/(array index)/LowerThresholdFatal` (read only integer)

Below normal range and is fatal.

### Fans[array-item].LowerThresholdNonCritical

**JSONPath**: `/Fans/(array index)/LowerThresholdNonCritical` (read only integer)

Below normal range.

### Fans[array-item].MaximumValue

**JSONPath**: `/Fans/(array index)/MaximumValue` (read only integer)

Maximum value for CurrentReading.

### Fans[array-item].MinimumValue

**JSONPath**: `/Fans/(array index)/MinimumValue` (read only integer)

Minimum value for CurrentReading.

### Fans[array-item].Oem.Hp.Location

**JSONPath**: `/Fans/(array index)/Oem/Hp/Location` (read only enumeration)

Indicates the component (i.e. CPU, Memory, and Storage) that the fan is being used to cool.

**Defined values**:

* `System`

* `System Board`

* `I/O Board`

* `CPU`

* `Memory`

* `Storage`

* `Removable Media`

* `Power Supply`

* `Ambient`

* `Chassis`

* `Bridge Board`

* `Exhaust`

* `Processor Bay`

* `IO Bay`

* `Blade Slot`

* `Virtual`

### Fans[array-item].PhysicalContext

**JSONPath**: `/Fans/(array index)/PhysicalContext` (PATCHable enumeration)

**Defined values**:

* `Room`

* `Intake`

* `Exhaust`

* `Front`

* `Back`

* `Upper`

* `Lower`

* `CPU`

* `GPU`

* `Backplane`

* `SystemBoard`

* `PowerSupply`

* `VoltageRegulator`

* `StorageDevice`

* `NetworkingDevice`

* `ComputeBay`

* `StorageBay`

* `NetworkBay`

* `ExpansionBay`

* `PowerSupplyBay`

### Fans[array-item].ReadingRPM

**JSONPath**: `/Fans/(array index)/ReadingRPM` (read only integer)

The current speed of the fan.

### Fans[array-item].Status.Health

**JSONPath**: `/Fans/(array index)/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Fans[array-item].Status.HealthRollUp

**JSONPath**: `/Fans/(array index)/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Fans[array-item].Status.HealthRollup

**JSONPath**: `/Fans/(array index)/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Fans[array-item].Status.State

**JSONPath**: `/Fans/(array index)/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Fans[array-item].Units

**JSONPath**: `/Fans/(array index)/Units` (read only enumeration)

Units for the CurrentReading.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `RPM`

* `Percent`

### Fans[array-item].UpperThresholdCritical

**JSONPath**: `/Fans/(array index)/UpperThresholdCritical` (read only integer)

Above normal range but not yet fatal.

### Fans[array-item].UpperThresholdFatal

**JSONPath**: `/Fans/(array index)/UpperThresholdFatal` (read only integer)

Above normal range and is fatal.

### Fans[array-item].UpperThresholdNonCritical

**JSONPath**: `/Fans/(array index)/UpperThresholdNonCritical` (read only integer)

Above normal range.

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.HealthRollup

**JSONPath**: `/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Temperatures[array-item].Context

**JSONPath**: `/Temperatures/(array index)/Context` (read only enumeration)

The area or device to which this temperature measurement applies.

**Defined values**:

* `System`

* `System Board`

* `I/O Board`

* `CPU`

* `Memory`

* `Storage`

* `Removable Media`

* `Power Supply`

* `Ambient`

* `Chassis`

* `Bridge Board`

* `Exhaust`

* `Processor Bay`

* `IO Bay`

* `Blade Slot`

* `Virtual`

### Temperatures[array-item].CorrelatableID

**JSONPath**: `/Temperatures/(array index)/CorrelatableID` (read only string)

The CorrelatableID for this temperature sensor.

### Temperatures[array-item].CurrentReading

**JSONPath**: `/Temperatures/(array index)/CurrentReading` (read only integer)

The current reading of the temperature sensor.

### Temperatures[array-item].LowerThresholdCritical

**JSONPath**: `/Temperatures/(array index)/LowerThresholdCritical` (read only integer)

Below normal range but not yet fatal.

### Temperatures[array-item].LowerThresholdFatal

**JSONPath**: `/Temperatures/(array index)/LowerThresholdFatal` (read only integer)

Below normal range and is fatal.

### Temperatures[array-item].LowerThresholdNonCritical

**JSONPath**: `/Temperatures/(array index)/LowerThresholdNonCritical` (read only integer)

Below normal range.

### Temperatures[array-item].MaximumValue

**JSONPath**: `/Temperatures/(array index)/MaximumValue` (read only integer)

Maximum value for CurrentReading.

### Temperatures[array-item].MinimumValue

**JSONPath**: `/Temperatures/(array index)/MinimumValue` (read only integer)

Minimum value for CurrentReading.

### Temperatures[array-item].Number

**JSONPath**: `/Temperatures/(array index)/Number` (read only integer)

A numerical identifier to represent the temperature sensor.

### Temperatures[array-item].Oem.Hp.LocationXmm

**JSONPath**: `/Temperatures/(array index)/Oem/Hp/LocationXmm` (read only integer)

The location of the sensor, in millimeters, along the X axis from the logical reference point.

### Temperatures[array-item].Oem.Hp.LocationYmm

**JSONPath**: `/Temperatures/(array index)/Oem/Hp/LocationYmm` (read only integer)

The location of the sensor, in millimeters, along the Y axis from the logical reference point.

### Temperatures[array-item].Oem.Hp.LocationZmm

**JSONPath**: `/Temperatures/(array index)/Oem/Hp/LocationZmm` (read only integer)

The location of the sensor, in millimeters, along the Z axis from the logical reference point.

### Temperatures[array-item].PhysicalContext

**JSONPath**: `/Temperatures/(array index)/PhysicalContext` (PATCHable enumeration)

**Defined values**:

* `Room`

* `Intake`

* `Exhaust`

* `Front`

* `Back`

* `Upper`

* `Lower`

* `CPU`

* `GPU`

* `Backplane`

* `SystemBoard`

* `PowerSupply`

* `VoltageRegulator`

* `StorageDevice`

* `NetworkingDevice`

* `ComputeBay`

* `StorageBay`

* `NetworkBay`

* `ExpansionBay`

* `PowerSupplyBay`

### Temperatures[array-item].ReadingCelsius

**JSONPath**: `/Temperatures/(array index)/ReadingCelsius` (read only integer)

The current reading of the temperature sensor.

### Temperatures[array-item].Status.Health

**JSONPath**: `/Temperatures/(array index)/Status/Health` (read only enumeration)

This represents the health state of this resource in the absence of its dependent resources.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Temperatures[array-item].Status.HealthRollUp

**JSONPath**: `/Temperatures/(array index)/Status/HealthRollUp` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Temperatures[array-item].Status.HealthRollup

**JSONPath**: `/Temperatures/(array index)/Status/HealthRollup` (read only enumeration)

This represents the overall health state from the view of this resource.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `OK`

* `Warning`

* `Critical`

### Temperatures[array-item].Status.State

**JSONPath**: `/Temperatures/(array index)/Status/State` (read only enumeration)

This indicates the known state of the resource, such as if it is enabled.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Temperatures[array-item].Units

**JSONPath**: `/Temperatures/(array index)/Units` (read only enumeration)

The temperature sensor's units.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `Celsius`

* `Fahrenheit`

### Temperatures[array-item].UpperThresholdCritical

**JSONPath**: `/Temperatures/(array index)/UpperThresholdCritical` (read only integer)

Above normal range but not yet fatal.

### Temperatures[array-item].UpperThresholdFatal

**JSONPath**: `/Temperatures/(array index)/UpperThresholdFatal` (read only integer)

Above normal range and is fatal.

### Temperatures[array-item].UpperThresholdNonCritical

**JSONPath**: `/Temperatures/(array index)/UpperThresholdNonCritical` (read only integer)

The noncritical temperature threshold.

## VirtualMedia

This is iLO 4's Virtual Media service.  It enables clients to mount or unmount virtual media images.

<aside class="notice">
You must install a license with the Virtual Media feature (e.g. the iLO Advanced License) to mount virtual media images.
</aside>

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/virtualmedia/{item}`

### ConnectedVia

**JSONPath**: `/ConnectedVia` (read only enumeration)

Specifies how the virtual media is connected to the server.

**Defined values**:

* `null`:  the value is temporarily unavailable

* `NotConnected`

* `URI`

* `Applet`

### Image

**JSONPath**: `/Image` (PATCHable string)

The valid URI indicating the image that is mounted on this server. A null value indicates that no image exists.

> example PATCH: {"Image": "&lt;string-value&gt;"}

### ImageName

**JSONPath**: `/ImageName` (read only string)

The name of the image that is mounted on this server. This is usually provided when a URL image is mounted through scripted virtual media.

### Inserted

**JSONPath**: `/Inserted` (read only boolean)

Indicates whether the virtual media is mounted on the server.

### BootOnNextServerReset

**JSONPath**: `/Oem/Hp/BootOnNextServerReset` (PATCHable boolean)

If set to true, the server will boot to this image on the next server reboot. The image will be ejected automatically on the second server reboot so that the server does not boot to this image twice.

> example PATCH: {"Oem": {"Hp": {"BootOnNextServerReset": true}}}

### WriteProtected

**JSONPath**: `/WriteProtected` (read only boolean)

Indicates whether the virtual media is protected against write operations.

### POST Action "InsertVirtualMedia"

Causes iLO 4 to mount a virtual media image from the specified URI.

Parameters:

"**Image**" (uri)

> example "InsertVirtualMedia" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{
    "Image": "<uri-of-virtual-media-image>" 
}
```

### POST Action "EjectVirtualMedia"

Causes iLO 4 to unmount a virtual media image.

> example "EjectVirtualMedia" action:

```
POST <target-uri>
Content-Type: application/json
OData-Version: 4.0

{}
```

