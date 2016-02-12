## AccountService
This is the schema definition for the Account service. It represents the properties for this service and has links to the list of accounts.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/accountservice`

### AuthFailureLoggingThreshold

**JSONPath**: `/Oem/Hp/AuthFailureLoggingThreshold` (PATCHable integer)

This property enables you to view and configure logging criteria for failed authentications. A failed login log entry is recorded after the configured number of attempts. 0 = feature disabled; 1-3 and 5 are allowable values.

> example PATCH: {"Oem": {"Hp": {"AuthFailureLoggingThreshold": &lt;integer-value&gt;}}}

### MinPasswordLength

**JSONPath**: `/Oem/Hp/MinPasswordLength` (PATCHable integer)

This property specifies the minimum number of characters allowed when a user password is set or changed. It must be a value from 0 to 39.

> example PATCH: {"Oem": {"Hp": {"MinPasswordLength": &lt;integer-value&gt;}}}

## BaseNetworkAdapter
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/networkadapters/{item}`

### StructuredName

**JSONPath**: `/StructuredName` (read only string)

PCI device structured name in UTF-8 format (e.g. 'NIC.LOM.1.1' - see PCIDevices in /rest/v1/Systems/x/PCIDevices - this comes from SMBIOS

### PhysicalPorts[array-item].MacAddress

**JSONPath**: `/PhysicalPorts/(array index)/MacAddress` (read only string)

The port MAC address.

### PartNumber

**JSONPath**: `/PartNumber` (read only string)

The device part number.

### PhysicalPorts[array-item].Oem.Hp.StructuredName

**JSONPath**: `/PhysicalPorts/(array index)/Oem/Hp/StructuredName` (read only string)

PCI device structured name in UTF-8 format (e.g. 'NIC.LOM.1.1' - see PCIDevices in /rest/v1/Systems/x/PCIDevices - this comes from SMBIOS

### PhysicalPorts[array-item].Oem.Hp.GoodTransmits

**JSONPath**: `/PhysicalPorts/(array index)/Oem/Hp/GoodTransmits` (read only integer)

A count of frames successfully transmitted by the physical adapter.

### PhysicalPorts[array-item].Status.Health

**JSONPath**: `/PhysicalPorts/(array index)/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### PhysicalPorts[array-item].Oem.Hp.GoodReceives

**JSONPath**: `/PhysicalPorts/(array index)/Oem/Hp/GoodReceives` (read only integer)

A count of frames successfully received by the physical adapter.

### PhysicalPorts[array-item].Status.HealthRollUp

**JSONPath**: `/PhysicalPorts/(array index)/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### PhysicalPorts[array-item].SpeedMbps

**JSONPath**: `/PhysicalPorts/(array index)/SpeedMbps` (read only integer)

An estimate of the interface's current bandwidth in Megabits per second.  For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made, this object should contain the nominal bandwidth.

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### PhysicalPorts[array-item].UEFIDevicePath

**JSONPath**: `/PhysicalPorts/(array index)/UEFIDevicePath` (read only string)

UEFIDevice Path for correlation purposes

### PhysicalPorts[array-item].Oem.Hp.BadTransmits

**JSONPath**: `/PhysicalPorts/(array index)/Oem/Hp/BadTransmits` (read only integer)

A count of frames that were not transmitted by the adapter because of an error.  This counter is the sum of MIB items cpqNicIfPhysAdapterDeferredTransmissions, cpqNicIfPhysAdapterLateCollisions, cpqNicIfPhysAdapterExcessiveCollisions, cpqNicIfPhysAdapterCarrierSenseErrors, and cpqNicIfPhysAdapterInternalMacTransmitErrors. If this counter increments frequently, check the more detailed error statistics and take appropriate action.

### PhysicalPorts[array-item].Oem.Hp.Team

**JSONPath**: `/PhysicalPorts/(array index)/Oem/Hp/Team` (read only string)

If a port is configured for NIC teaming, the name of the configured link between the physical ports that form a logical network adapter. This value is displayed for system NICs only (embedded and stand-up).

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Firmware.definitions.FWVersion.VersionString

**JSONPath**: `/Firmware/definitions/FWVersion/VersionString` (read only string)

This string represents the version of the firmware image.

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Firmware.Current.VersionString

**JSONPath**: `/Firmware/Current/VersionString` (read only string)

This string represents the version of the firmware image.

### PhysicalPorts[array-item].IPv6Addresses[array-item].Address

**JSONPath**: `/PhysicalPorts/(array index)/IPv6Addresses/(array index)/Address` (read only string)

This is the IPv6 Address.

### UEFIDevicePath

**JSONPath**: `/UEFIDevicePath` (read only string)

UEFIDevice Path for correlation purposes

### PhysicalPorts[array-item].FullDuplex

**JSONPath**: `/PhysicalPorts/(array index)/FullDuplex` (read only boolean)

Full-duplex data transmission means that data can be transmitted in both directions on a signal carrier at the same time.

### PhysicalPorts[array-item].Status.State

**JSONPath**: `/PhysicalPorts/(array index)/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### PhysicalPorts[array-item].Oem.Hp.BadReceives

**JSONPath**: `/PhysicalPorts/(array index)/Oem/Hp/BadReceives` (read only integer)

A count of frames that were received by the adapter but which had an error.  This counter is the sum of mib items cpqNicIfPhysAdapterAlignmentErrors, cpqNicIfPhysAdapterFCSErrors, cpqNicIfPhysAdapterFrameTooLongs, and cpqNicIfPhysAdapterInternalMacReceiveErrors. If this counter increments frequently, check the more detailed error statistics and take appropriate action.

### PhysicalPorts[array-item].IPv4Addresses[array-item].Address

**JSONPath**: `/PhysicalPorts/(array index)/IPv4Addresses/(array index)/Address` (read only string)

This is the IPv4 Address.

## Chassis
The schema definition for the Chassis resource represents the properties for physical components for any system. This object represents racks, rack mount servers, blades, standalone, modular systems, enclosures, and all other containers. The non-CPU/device-centric parts of the schema are accessed either directly or indirectly through this resource.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/chassis/{item}`

### Location.LocationInRack.UPosition

**JSONPath**: `/Oem/Hp/Location/LocationInRack/UPosition` (read only integer)

The chassis U position in the rack.

### Location.GeographicLocation.RackName

**JSONPath**: `/Oem/Hp/Location/GeographicLocation/RackName` (read only string)

The name of the chassis enclosure.

### Firmware.SASProgrammableLogicDevice.Current.VersionString

**JSONPath**: `/Oem/Hp/Firmware/SASProgrammableLogicDevice/Current/VersionString` (read only string)

The firmware version of the SAS controller.

### PartNumber

**JSONPath**: `/PartNumber` (read only string)

The chassis part number.

### Manufacturer

**JSONPath**: `/Manufacturer` (read only string)

The chassis manufacturer.

### Location.LocationInRack.RackLdsProductDescription

**JSONPath**: `/Oem/Hp/Location/LocationInRack/RackLdsProductDescription` (read only string)

 The chassis rack product description.

### Firmware.SPSFirmwareVersionData.Current.VersionString

**JSONPath**: `/Oem/Hp/Firmware/SPSFirmwareVersionData/Current/VersionString` (read only string)

The SPS FW Version number, aka ME FW Version, AAAA.BBBB.CCCC.DDDD.E

### Version

**JSONPath**: `/Version` (read only string)

The chassis version.

### Location.LocationInRack.RackUUID

**JSONPath**: `/Oem/Hp/Location/LocationInRack/RackUUID` (read only string)

The chassis rack UUID.

### AssetTag

**JSONPath**: `/AssetTag` (PATCHable string)

The chassis user-assigned asset tag.

> example PATCH: {"AssetTag": "&lt;string-value&gt;"}

### Firmware.PowerManagementControllerBootloader.Current.VersionString

**JSONPath**: `/Oem/Hp/Firmware/PowerManagementControllerBootloader/Current/VersionString` (read only string)

The firmware version of the Power Monitor boot loader.

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Model

**JSONPath**: `/Model` (read only string)

The chassis model number.

### Location.LocationInRack.TagVersion

**JSONPath**: `/Oem/Hp/Location/LocationInRack/TagVersion` (read only integer)

The chassis rack tag version.

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Firmware.PlatformDefinitionTable.Current.VersionString

**JSONPath**: `/Oem/Hp/Firmware/PlatformDefinitionTable/Current/VersionString` (read only string)

The version of the Intelligent Platform Abstraction Data.

### Images.Front.extref

**JSONPath**: `/Oem/Hp/Images/Front/extref` (read only string)

The URI of an external resource.

### Firmware.PowerManagementControllerBootloader.Current.Family

**JSONPath**: `/Oem/Hp/Firmware/PowerManagementControllerBootloader/Current/Family` (read only string)

The family type of the Power Monitor hardware.

### BayNumber

**JSONPath**: `/Oem/Hp/BayNumber` (read only integer)

The position of the chassis inside an enclosure.

### Location.LocationOfChassis.UUID

**JSONPath**: `/Oem/Hp/Location/LocationOfChassis/UUID` (read only string)

The chassis UUID provided by SMBIOS.

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

### Location.LocationInRack.RackUHeight

**JSONPath**: `/Oem/Hp/Location/LocationInRack/RackUHeight` (read only integer)

The chassis rack U height.

### Location.LocationInRack.RackLdsPartNumber

**JSONPath**: `/Oem/Hp/Location/LocationInRack/RackLdsPartNumber` (read only string)

The chassis rack part number.

### IndicatorLED

**JSONPath**: `/IndicatorLED` (PATCHable enumeration)

The chassis indicator LED that is used to identify the chassis. The user can manipulate this LED.

> example PATCH: {"IndicatorLED": "Lit"}

**Defined values**:

* `Unknown`

* `Lit`

* `Blinking`

* `Off`

### SKU

**JSONPath**: `/SKU` (read only string)

The chassis SKU.

### PowerAlertMode.Activated

**JSONPath**: `/Oem/Hp/PowerAlertMode/Activated` (read only boolean)

The power alert mode activation state.

### Firmware.SystemProgrammableLogicDevice.Current.VersionString

**JSONPath**: `/Oem/Hp/Firmware/SystemProgrammableLogicDevice/Current/VersionString` (read only string)

The firmware version of the CPLD.

### SerialNumber

**JSONPath**: `/SerialNumber` (read only string)

The chassis serial number.

### Location.LocationInRack.ULocation

**JSONPath**: `/Oem/Hp/Location/LocationInRack/ULocation` (read only string)

The chassis rack U location.

### Images.Model.extref

**JSONPath**: `/Oem/Hp/Images/Model/extref` (read only string)

The URI of an external resource.

### Firmware.PowerManagementController.Current.VersionString

**JSONPath**: `/Oem/Hp/Firmware/PowerManagementController/Current/VersionString` (read only string)

The firmware version of the Power Monitor.

### PowerAlertMode.AlertPowerWatts

**JSONPath**: `/Oem/Hp/PowerAlertMode/AlertPowerWatts` (read only integer)

The power consumption of the system when operating in alert mode.

## Collection
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems`

> * `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers`

> * `https://{iLO}/redfish/v1/systems/{item}/logservices/iml/entries`

> * `https://{iLO}/redfish/v1/registries`

> * `https://{iLO}/redfish/v1/managers/{item}/virtualmedia`

> * `https://{iLO}/redfish/v1/systems/{item}/smartstorage/hostbusadapters`

> * `https://{iLO}/redfish/v1/managers/{item}/logservices`

> * `https://{iLO}/redfish/v1/managers`

> * `https://{iLO}/redfish/v1/managers/{item}/licenseservice`

> * `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}/diskdrives`

> * `https://{iLO}/redfish/v1/managers/{item}/ethernetinterfaces`

> * `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}/logicaldrives`

> * `https://{iLO}/redfish/v1/eventservice/eventsubscriptions`

> * `https://{iLO}/redfish/v1/managers/{item}/logservices/iel/entries`

> * `https://{iLO}/redfish/v1/managers/{item}/federationgroups`

> * `https://{iLO}/redfish/v1/schemas`

> * `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}/storageenclosures`

> * `https://{iLO}/redfish/v1/systems/{item}/pcidevices`

> * `https://{iLO}/redfish/v1/accountservice/accounts`

> * `https://{iLO}/redfish/v1/systems/{item}/pcislots`

> * `https://{iLO}/redfish/v1/chassis`

> * `https://{iLO}/redfish/v1/managers/{item}/federationpeers`

> * `https://{iLO}/redfish/v1/systems/{item}/logservices`

> * `https://{iLO}/redfish/v1/systems/{item}/memory`

> * `https://{iLO}/redfish/v1/sessionservice/sessions`

> * `https://{iLO}/redfish/v1/systems/{item}/networkadapters`

### links.FirstPage.1.count

**JSONPath**: `/links/FirstPage/1/count` (read only integer)

The number of resources represented on the referenced page.

### links.Member[array-item].frag

**JSONPath**: `/links/Member/(array index)/frag` (read only string)

A JSON path fragment to a member of the items array.

### links.PrevPage.1.count

**JSONPath**: `/links/PrevPage/1/count` (read only integer)

The number of resources represented on the referenced page.

### Total

**JSONPath**: `/Total` (read only integer)

The total number of collection members.

### links.LastPage.0.page

**JSONPath**: `/links/LastPage/0/page` (read only integer)

The number of the last page.

### links.FirstPage.0.page

**JSONPath**: `/links/FirstPage/0/page` (read only integer)

The number of the first page.

### links.FirstPage.1.start

**JSONPath**: `/links/FirstPage/1/start` (read only integer)

The start item index of the first page.

### links.NextPage.0.page

**JSONPath**: `/links/NextPage/0/page` (read only integer)

The number of the next page.

### links.LastPage.1.start

**JSONPath**: `/links/LastPage/1/start` (read only integer)

The start item index of the last page.

### links.PrevPage.0.page

**JSONPath**: `/links/PrevPage/0/page` (read only integer)

The number of the previous page.

### links.PrevPage.0.count

**JSONPath**: `/links/PrevPage/0/count` (read only integer)

The number of resources represented on the referenced page.

### links.LastPage.1.count

**JSONPath**: `/links/LastPage/1/count` (read only integer)

The number of resources represented on the referenced page.

### links.NextPage.1.start

**JSONPath**: `/links/NextPage/1/start` (read only integer)

The start value can be used in a query on the URI to get the next page.

### links.Member[array-item].id

**JSONPath**: `/links/Member/(array index)/id` (read only string)

The identifier value of the linked resource.

### links.LastPage.0.count

**JSONPath**: `/links/LastPage/0/count` (read only integer)

The number of resources represented on the referenced page.

### links.NextPage.1.count

**JSONPath**: `/links/NextPage/1/count` (read only integer)

The number of items on the next page.

### links.PrevPage.1.start

**JSONPath**: `/links/PrevPage/1/start` (read only integer)

The start item index of the previous page.

### links.NextPage.0.count

**JSONPath**: `/links/NextPage/0/count` (read only integer)

The number of resources represented on the referenced page.

### links.FirstPage.0.count

**JSONPath**: `/links/FirstPage/0/count` (read only integer)

The number of resources represented on the referenced page.

### MemberType

**JSONPath**: `/MemberType` (read only string)

This property has the type of members in this collection.  All of the members of a collection have the same value for their Type property, thus they are all the same kind of resource.

## ComputerSystem
The schema definition of a computer system and its properties. A computer system represents a physical or virtual machine and the local resources, such as memory, CPU, and other devices that can be accessed from that machine.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}`

### PartNumber

**JSONPath**: `/PartNumber` (read only string)

The manufacturer's system part number.

### PowerOnDelay

**JSONPath**: `/Oem/Hp/PowerOnDelay` (PATCHable enumeration)

The PowerAutoOn policy delay that can also be found in the HpBios::PowerOnDelay object.

> example PATCH: {"Oem": {"Hp": {"PowerOnDelay": "45Sec"}}}

**Defined values**:

* `Minimum`

* `15Sec`

* `30Sec`

* `45Sec`

* `60Sec`

* `RandomUpTo120Sec`

### Bios.Bootblock.BuildNumber

**JSONPath**: `/Oem/Hp/Bios/Bootblock/BuildNumber` (read only integer)

The build number of the firmware.

### IntelligentProvisioningLocation

**JSONPath**: `/Oem/Hp/IntelligentProvisioningLocation` (read only string)

 Location string of Intelligent Provisioning in Firmware Version Table.

### Processors.ProcessorFamily

**JSONPath**: `/Processors/ProcessorFamily` (read only string)

The processor family for the processors in the system.

### Bios.Backup.BuildNumber

**JSONPath**: `/Oem/Hp/Bios/Backup/BuildNumber` (read only integer)

The build number of the firmware.

### Bios.Backup.Time

**JSONPath**: `/Oem/Hp/Bios/Backup/Time` (read only string)

The build time of the firmware.

### Battery[array-item].ErrorCode

**JSONPath**: `/Oem/Hp/Battery/(array index)/ErrorCode` (read only integer)

Error Code of battery.

### Bios.Bootblock.Family

**JSONPath**: `/Oem/Hp/Bios/Bootblock/Family` (read only string)

The family of the firmware.

### PostState

**JSONPath**: `/Oem/Hp/PostState` (read only enumeration)

The current state of system POST.

**Defined values**:

* `Unknown`

* `Reset`

* `PowerOff`

* `InPost`

* `InPostDiscoveryComplete`

* `FinishedPost`

### ServerSignature

**JSONPath**: `/Oem/Hp/ServerSignature` (read only integer)

 The CRC32 of:  All Device Signatures combined together, Blade Slot Location in Enclosure, Enclosure UUID, and OneView Domain IP Address

### Processors.Status.State

**JSONPath**: `/Processors/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### VirtualUUID

**JSONPath**: `/Oem/Hp/VirtualUUID` (read only string)

Used in conjunction with the UUID (Logical) value.

### Bios.Backup.DebugBuild

**JSONPath**: `/Oem/Hp/Bios/Backup/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### Version

**JSONPath**: `/Version` (read only string)

The manufacturer's system version.

### Bios.Bootblock.MajorVersion

**JSONPath**: `/Oem/Hp/Bios/Bootblock/MajorVersion` (read only integer)

The major version of the firmware.

### Battery[array-item].SerialNumber

**JSONPath**: `/Oem/Hp/Battery/(array index)/SerialNumber` (read only string)

Serial Number of battery.

### Bios.Backup.Date

**JSONPath**: `/Oem/Hp/Bios/Backup/Date` (read only string)

The build date of the firmware.

### Boot.UefiTargetBootSourceOverride

**JSONPath**: `/Boot/UefiTargetBootSourceOverride` (PATCHable string)

The UEFI device path of the device to boot from when BootSourceOverrideTarget is UefiTarget.

> example PATCH: {"Boot": {"UefiTargetBootSourceOverride": "&lt;string-value&gt;"}}

### PostMode

**JSONPath**: `/Oem/Hp/PostMode` (PATCHable enumeration)

Supported on UEFI based systems only. The manner in which the system will operate durring and at completion of POST.

> example PATCH: {"Oem": {"Hp": {"PostMode": "PostToShutdown"}}}

**Defined values**:

* `Normal`

* `PostToShutdown`

* `PostToReboot`

### Bios.Current.Date

**JSONPath**: `/Oem/Hp/Bios/Current/Date` (read only string)

The build date of the firmware.

### Memory.TotalSystemMemoryGB

**JSONPath**: `/Memory/TotalSystemMemoryGB` (read only integer)

The total amount of memory (GB) in the system.

### Memory.Status.HealthRollUp

**JSONPath**: `/Memory/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Boot.BootSourceOverrideTarget

**JSONPath**: `/Boot/BootSourceOverrideTarget` (PATCHable enumeration)

The current boot source to be used at next boot instead of the normal boot device, if BootSourceOverrideEnabled is not Disabled.

> example PATCH: {"Boot": {"BootSourceOverrideTarget": "Hdd"}}

**Defined values**:

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

### Bios.Backup.BuildNumberString

**JSONPath**: `/Oem/Hp/Bios/Backup/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### AssetTag

**JSONPath**: `/AssetTag` (PATCHable string)

A user-definable tag that is used to track this system for inventory or other client purposes.

> example PATCH: {"AssetTag": "&lt;string-value&gt;"}

### Bios.Bootblock.BuildNumberString

**JSONPath**: `/Oem/Hp/Bios/Bootblock/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### IntelligentProvisioningVersion

**JSONPath**: `/Oem/Hp/IntelligentProvisioningVersion` (read only string)

 Intelligent Provisioning Version.

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### PowerRegulatorMode

**JSONPath**: `/Oem/Hp/PowerRegulatorMode` (read only enumeration)

HP Power Regulator mode.

**Defined values**:

* `OSControl`

* `Dynamic`

* `Max`

* `Min`

### Bios.Current.MinorVersion

**JSONPath**: `/Oem/Hp/Bios/Current/MinorVersion` (read only integer)

The minor version of the firmware.

### HostCorrelation.HostName

**JSONPath**: `/HostCorrelation/HostName` (read only string)

### Bios.Bootblock.MinorVersion

**JSONPath**: `/Oem/Hp/Bios/Bootblock/MinorVersion` (read only integer)

The minor version of the firmware.

### Bios.Backup.Family

**JSONPath**: `/Oem/Hp/Bios/Backup/Family` (read only string)

The family of the firmware.

### Battery[array-item].Model

**JSONPath**: `/Oem/Hp/Battery/(array index)/Model` (read only string)

Model of battery.

### Memory.Status.Health

**JSONPath**: `/Memory/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### PowerAllocationLimit

**JSONPath**: `/Oem/Hp/PowerAllocationLimit` (read only integer)

The total amount of power allocated to the system.

### Bios.Backup.VersionString

**JSONPath**: `/Oem/Hp/Bios/Backup/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### Bios.Current.MajorVersion

**JSONPath**: `/Oem/Hp/Bios/Current/MajorVersion` (read only integer)

The major version of the firmware.

### Model

**JSONPath**: `/Model` (read only string)

The model information that the manufacturer uses to refer to this system.

### Bios.Current.VersionString

**JSONPath**: `/Bios/Current/VersionString` (read only string)

This string represents the version of the firmware image.

### Bios.Backup.MinorVersion

**JSONPath**: `/Oem/Hp/Bios/Backup/MinorVersion` (read only integer)

The minor version of the firmware.

### Bios.Bootblock.Date

**JSONPath**: `/Oem/Hp/Bios/Bootblock/Date` (read only string)

The build date of the firmware.

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### BIOSPOSTCode

**JSONPath**: `/BIOSPOSTCode` (read only integer)

The BIOS Power on Self Test code from the last system boot.

### Bios.Bootblock.Time

**JSONPath**: `/Oem/Hp/Bios/Bootblock/Time` (read only string)

The build time of the firmware.

### Bios.Current.BuildNumberString

**JSONPath**: `/Oem/Hp/Bios/Current/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### IntelligentProvisioningIndex

**JSONPath**: `/Oem/Hp/IntelligentProvisioningIndex` (read only integer)

 Index in the Firmware Version Table for Intelligent Provisioning.

### Bios.Current.Family

**JSONPath**: `/Oem/Hp/Bios/Current/Family` (read only string)

The family of the firmware.

### Manufacturer

**JSONPath**: `/Manufacturer` (read only string)

The manufacturer or OEM of this system.

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

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

### Bios.Current.VersionString

**JSONPath**: `/Oem/Hp/Bios/Current/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### Battery[array-item].Present

**JSONPath**: `/Oem/Hp/Battery/(array index)/Present` (read only string)

Presence of battery.

### UUID

**JSONPath**: `/UUID` (read only string)

The universal unique identifier for this system.

### VirtualSerialNumber

**JSONPath**: `/VirtualSerialNumber` (read only string)

The system virtual serial number.

### Battery[array-item].Spare

**JSONPath**: `/Oem/Hp/Battery/(array index)/Spare` (read only string)

Spare of battery.

### Bios.Current.DebugBuild

**JSONPath**: `/Oem/Hp/Bios/Current/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### Memory.Status.State

**JSONPath**: `/Memory/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Bios.Current.Time

**JSONPath**: `/Oem/Hp/Bios/Current/Time` (read only string)

The build time of the firmware.

### Power

**JSONPath**: `/Power` (read only enumeration)

The current power state of the system.

**Defined values**:

* `On`

* `Off`

* `Unknown`

* `Reset`

### Battery[array-item].MaxCapWatts

**JSONPath**: `/Oem/Hp/Battery/(array index)/MaxCapWatts` (read only integer)

Maximum Capacity of battery in watts.

### VirtualProfile

**JSONPath**: `/Oem/Hp/VirtualProfile` (read only enumeration)

The current state of the systems virtual profile.  This profile is the one that, when the server is rebooted, will set the  Virtual properties.  Intent is to use this state to determine whether the server needs to be rebooted so these values are set.  Additional informaiton about the profile will be considered later.

**Defined values**:

* `Active`

* `Busy`

* `Inactive`

* `Unknown`

### Bios.Current.BuildNumber

**JSONPath**: `/Oem/Hp/Bios/Current/BuildNumber` (read only integer)

The build number of the firmware.

### IndicatorLED

**JSONPath**: `/IndicatorLED` (PATCHable enumeration)

The state of the indicator LED.

> example PATCH: {"IndicatorLED": "Lit"}

**Defined values**:

* `Unknown`

* `Lit`

* `Blinking`

* `Off`

### Battery[array-item].Index

**JSONPath**: `/Oem/Hp/Battery/(array index)/Index` (read only integer)

Index of battery.

### Battery[array-item].FirmwareVersion

**JSONPath**: `/Oem/Hp/Battery/(array index)/FirmwareVersion` (read only string)

Firmware Version of battery.

### Bios.Backup.MajorVersion

**JSONPath**: `/Oem/Hp/Bios/Backup/MajorVersion` (read only integer)

The major version of the firmware.

### TrustedModules[array-item].Status

**JSONPath**: `/Oem/Hp/TrustedModules/(array index)/Status` (read only enumeration)

This property indicates the TPM or TM status.

**Defined values**:

* `NotPresent`

* `PresentEnabled`

* `PresentDisabled`

* `Unknown`

### PowerAutoOn

**JSONPath**: `/Oem/Hp/PowerAutoOn` (PATCHable enumeration)

Auto Power-On mode defines what occurs when the AC power is applied to the system.

> example PATCH: {"Oem": {"Hp": {"PowerAutoOn": "PowerOn"}}}

**Defined values**:

* `RemainOff`

* `PowerOn`

* `Restore`

### SKU

**JSONPath**: `/SKU` (read only string)

SKU for this system.

### Processors.Status.HealthRollUp

**JSONPath**: `/Processors/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### SerialNumber

**JSONPath**: `/SerialNumber` (read only string)

The system serial number.

### Processors.Count

**JSONPath**: `/Processors/Count` (read only integer)

The number of processors in the system.

### EndOfPostDelaySeconds

**JSONPath**: `/Oem/Hp/EndOfPostDelaySeconds` (PATCHable integer)

Supported on UEFI based systems only. The number of seconds to delay before finalizing POST with the Mode action (e.g. delay before shutdown).

> example PATCH: {"Oem": {"Hp": {"EndOfPostDelaySeconds": &lt;integer-value&gt;}}}

### Processors.Status.Health

**JSONPath**: `/Processors/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Battery[array-item].Condition

**JSONPath**: `/Oem/Hp/Battery/(array index)/Condition` (read only string)

Condition of battery.

### Bios.Bootblock.VersionString

**JSONPath**: `/Oem/Hp/Bios/Bootblock/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### Bios.Bootblock.DebugBuild

**JSONPath**: `/Oem/Hp/Bios/Bootblock/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### HostCorrelation.HostFQDN

**JSONPath**: `/HostCorrelation/HostFQDN` (read only string)

### Boot.BootSourceOverrideEnabled

**JSONPath**: `/Boot/BootSourceOverrideEnabled` (PATCHable enumeration)

BootSourceOverrideTarget must be specified before BootSourceOverrideEnabled can be used.

> example PATCH: {"Boot": {"BootSourceOverrideEnabled": "Once"}}

**Defined values**:

* `Disabled`

* `Once`

* `Continuous`

### Bios.UefiClass

**JSONPath**: `/Oem/Hp/Bios/UefiClass` (read only integer)

The UEFI BIOS Class value defined in the UEFI specification.

## EthernetNetworkInterface
The schema definition of a simple Ethernet NIC resource.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/ethernetinterfaces/{item}`

### LinkTechnology

**JSONPath**: `/LinkTechnology` (read only enumeration)

The link technology, such as Ethernet, for this NIC.

**Defined values**:

* `Ethernet`

### FactoryMacAddress

**JSONPath**: `/FactoryMacAddress` (read only string)

The MAC address assigned to the NIC at the factory.

### DHCPv4.Enabled

**JSONPath**: `/Oem/Hp/DHCPv4/Enabled` (PATCHable boolean)

Determines whether DHCPv4 is enabled.

> example PATCH: {"Oem": {"Hp": {"DHCPv4": {"Enabled": true}}}}

### VLANId

**JSONPath**: `/Oem/Hp/VLANId` (PATCHable integer)

The VLAN ID/tag. Only applies to Shared Network Port.

> example PATCH: {"Oem": {"Hp": {"VLANId": &lt;integer-value&gt;}}}

### Autosense

**JSONPath**: `/Autosense` (PATCHable boolean)

The autosense speed/duplex enabled or disabled. Autosense can only be disabled if the SpeedMbps and FullDuplex values are specified. Autosense is only applicable and modifiable for a dedicated network port and cannot be modified for blade servers.

> example PATCH: {"Autosense": true}

### SettingsResult.Operation

**JSONPath**: `/SettingsResult/Operation` (read only enumeration)

Details about the results of applying the settings.

**Defined values**:

* `SettingsApply`

### IPv6.StaticRoutes[array-item].PrefixLength

**JSONPath**: `/Oem/Hp/IPv6/StaticRoutes/(array index)/PrefixLength` (PATCHable integer)

The prefix length of the IPv6 static route destination address.

> example PATCH: {"Oem": {"Hp": {"IPv6": {"StaticRoutes": [{"PrefixLength": &lt;integer-value&gt;}|null, ...]}}}}

### MacAddress

**JSONPath**: `/MacAddress` (PATCHable string)

The effective current MAC address. If the assignable MAC address is not supported, this is a read-only alias of FactoryMacAddress.

> example PATCH: {"MacAddress": "&lt;string-value&gt;"}

### MaxIPv6StaticAddresses

**JSONPath**: `/MaxIPv6StaticAddresses` (read only integer)

The maximum number of IPv6 static addresses that can be configured on this interface.

### SettingsResult.Time

**JSONPath**: `/SettingsResult/Time` (read only string)

Time at which the settings were applied.

### SharedNetworkPortOptions.Port

**JSONPath**: `/Oem/Hp/SharedNetworkPortOptions/Port` (PATCHable integer)

The network adapter port number that is used for sharing. This feature is only applicable on systems and network adapters that support it.

> example PATCH: {"Oem": {"Hp": {"SharedNetworkPortOptions": {"Port": &lt;integer-value&gt;}}}}

### DHCPv6.UseRapidCommit

**JSONPath**: `/Oem/Hp/DHCPv6/UseRapidCommit` (PATCHable boolean)

Determines whether to use DHCPv6 rapid commit mode. Can only be enabled when DHCPv6 Stateful mode is also enabled; otherwise, this property will be set to false and will be read-only. Do not enable in networks where more than one DHCPv6 server is configured to provide address assignments.

> example PATCH: {"Oem": {"Hp": {"DHCPv6": {"UseRapidCommit": true}}}}

### IPv6.StaticRoutes[array-item].Destination

**JSONPath**: `/Oem/Hp/IPv6/StaticRoutes/(array index)/Destination` (PATCHable string)

The IPv6 static route destination address.

> example PATCH: {"Oem": {"Hp": {"IPv6": {"StaticRoutes": [{"Destination": "&lt;string-value&gt;"}|null, ...]}}}}

### IPv6.StaticDefaultGateway

**JSONPath**: `/Oem/Hp/IPv6/StaticDefaultGateway` (PATCHable string)

The IPv6 static default gateway entry.

> example PATCH: {"Oem": {"Hp": {"IPv6": {"StaticDefaultGateway": "&lt;string-value&gt;"}}}}

### ConfigurationSettings

**JSONPath**: `/Oem/Hp/ConfigurationSettings` (read only enumeration)

The state of the currently displayed configuration settings.

**Defined values**:

* `Current`

* `SomePendingReset`

### IPv6StaticAddresses[array-item].PrefixLength

**JSONPath**: `/IPv6StaticAddresses/(array index)/PrefixLength` (PATCHable integer)

The Prefix Length of this IPv6 address.

> example PATCH: {"IPv6StaticAddresses": [{"PrefixLength": &lt;integer-value&gt;}|null, ...]}

### FrameSize

**JSONPath**: `/FrameSize` (PATCHable integer)

The MAC frame size (bytes).

> example PATCH: {"FrameSize": &lt;integer-value&gt;}

### PingGatewayOnStartup

**JSONPath**: `/Oem/Hp/PingGatewayOnStartup` (PATCHable boolean)

Determines whether to ping the IPv4 gateway on startup.

> example PATCH: {"Oem": {"Hp": {"PingGatewayOnStartup": true}}}

### DHCPv4.UseWINSServers

**JSONPath**: `/Oem/Hp/DHCPv4/UseWINSServers` (PATCHable boolean)

Determines whether to use DHCPv4-supplied WINS servers. Can only be enabled when DHCPv4 is also enabled; otherwise, this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv4": {"UseWINSServers": true}}}}

### IPv6Addresses[array-item].AddressState

**JSONPath**: `/IPv6Addresses/(array index)/AddressState` (read only enumeration)

The current state of this address as defined in RFC 4862.

**Defined values**:

* `Preferred`

* `Deprecated`

* `Tentative`

* `Failed`

### SettingsResult.Messages[array-item].Resolution

**JSONPath**: `/SettingsResult/Messages/(array index)/Resolution` (read only string)

Instructions for resolving the issue that caused the error.

### SupportsLOM

**JSONPath**: `/Oem/Hp/SupportsLOM` (read only boolean)

Indicates whether this system supports LOM. Only applies to Shared Network Port.

### FullDuplex

**JSONPath**: `/FullDuplex` (PATCHable boolean)

The connection duplex status. If Autosense is enabled, this property cannot be modified. Autosense is only applicable and modifiable for a dedicated network port and cannot be modified for blade servers.

> example PATCH: {"FullDuplex": true}

### IPv6Addresses[array-item].PrefixLength

**JSONPath**: `/IPv6Addresses/(array index)/PrefixLength` (read only integer)

The IPv6 Address Prefix Length.

### DHCPv4.UseNTPServers

**JSONPath**: `/Oem/Hp/DHCPv4/UseNTPServers` (PATCHable boolean)

Determines whether to use DHCPv4-supplied NTP servers. Can only be enabled when DHCPv4 is also enabled; otherwise, this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv4": {"UseNTPServers": true}}}}

### NICSupportsIPv6

**JSONPath**: `/Oem/Hp/NICSupportsIPv6` (read only boolean)

Indicates whether or not this NIC can support the IPv6 protocol.

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### IPv6Addresses[array-item].Address

**JSONPath**: `/IPv6Addresses/(array index)/Address` (read only string)

The IPv6 Address.

### SupportsFlexibleLOM

**JSONPath**: `/Oem/Hp/SupportsFlexibleLOM` (read only boolean)

Indicates whether this system supports FlexibleLOM. Only applies to Shared Network Port.

### IPv6.DDNSRegistration

**JSONPath**: `/Oem/Hp/IPv6/DDNSRegistration` (PATCHable boolean)

Determines whether IPv6 DDNS registration is enabled.

> example PATCH: {"Oem": {"Hp": {"IPv6": {"DDNSRegistration": true}}}}

### IPv4.DDNSRegistration

**JSONPath**: `/Oem/Hp/IPv4/DDNSRegistration` (PATCHable boolean)

Determines whether DDNS registration is enabled.

> example PATCH: {"Oem": {"Hp": {"IPv4": {"DDNSRegistration": true}}}}

### IPv6AddressPolicyTable[array-item].Label

**JSONPath**: `/IPv6AddressPolicyTable/(array index)/Label` (PATCHable integer)

The label value for this table entry, as defined in RFC3484 section 2.1.

> example PATCH: {"IPv6AddressPolicyTable": [{"Label": &lt;integer-value&gt;}|null, ...]}

### DHCPv6.UseDNSServers

**JSONPath**: `/Oem/Hp/DHCPv6/UseDNSServers` (PATCHable boolean)

Determines whether to use DHCPv6-supplied DNS servers. Can only be enabled when DHCPv6 Stateless mode is also enabled; otherwise, this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv6": {"UseDNSServers": true}}}}

### FQDN

**JSONPath**: `/FQDN` (read only string)

The complete, fully qualified domain name obtained by DNS for this NIC.

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### IPv6.StaticRoutes[array-item].Gateway

**JSONPath**: `/Oem/Hp/IPv6/StaticRoutes/(array index)/Gateway` (PATCHable string)

The IPv6 static route gateway.

> example PATCH: {"Oem": {"Hp": {"IPv6": {"StaticRoutes": [{"Gateway": "&lt;string-value&gt;"}|null, ...]}}}}

### IPv6Addresses[array-item].AddressOrigin

**JSONPath**: `/IPv6Addresses/(array index)/AddressOrigin` (read only enumeration)

How the address was determined.

**Defined values**:

* `DHCP`

* `Static`

* `SLAAC`

### VLANId

**JSONPath**: `/VLANId` (read only integer)

The VLAN identifier for this NIC. The VLANId is only present when the VLANEnable is used and when the NIC supports only a single VLAN.

### DHCPv4.UseGateway

**JSONPath**: `/Oem/Hp/DHCPv4/UseGateway` (PATCHable boolean)

Determines whether to use a DHCPv4-supplied gateway. Can only be enabled when DHCPv4 is also enabled; otherwise, this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv4": {"UseGateway": true}}}}

### DHCPv4.UseDNSServers

**JSONPath**: `/Oem/Hp/DHCPv4/UseDNSServers` (PATCHable boolean)

Determines whether to use DHCPv4-supplied DNS servers. Can only be enabled when DHCPv4 is also enabled; otherwise, this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv4": {"UseDNSServers": true}}}}

### IPv6DefaultGateway

**JSONPath**: `/IPv6DefaultGateway` (read only string)

The IPv6 default gateway address that is currently in use on this interface.

### HostName

**JSONPath**: `/HostName` (read only string)

The DNS Host Name, without any domain information.

### NICEnabled

**JSONPath**: `/Oem/Hp/NICEnabled` (PATCHable boolean)

Determines whether this NIC is enabled or disabled. Enabling one NIC will disable the others. If no NIC is enabled, this management processor is not accessible over the network.

> example PATCH: {"Oem": {"Hp": {"NICEnabled": true}}}

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### DHCPv6.StatelessModeEnabled

**JSONPath**: `/Oem/Hp/DHCPv6/StatelessModeEnabled` (PATCHable boolean)

Determines whether DHCPv6 Stateless mode is enabled.  Always enabled by default whenever DHCPv6 Stateful mode is also enabled.

> example PATCH: {"Oem": {"Hp": {"DHCPv6": {"StatelessModeEnabled": true}}}}

### SettingsResult.ETag

**JSONPath**: `/SettingsResult/ETag` (read only string)

ETag of this resource after the settings have been applied.

### IPv6.SLAACEnabled

**JSONPath**: `/Oem/Hp/IPv6/SLAACEnabled` (PATCHable boolean)

Determines whether StateLess Address Auto-Configuration is enabled.

> example PATCH: {"Oem": {"Hp": {"IPv6": {"SLAACEnabled": true}}}}

### IPv6StaticAddresses[array-item].Address

**JSONPath**: `/IPv6StaticAddresses/(array index)/Address` (PATCHable string)

A valid IPv6 address.

> example PATCH: {"IPv6StaticAddresses": [{"Address": "&lt;string-value&gt;"}|null, ...]}

### DHCPv6.UseDomainName

**JSONPath**: `/Oem/Hp/DHCPv6/UseDomainName` (PATCHable boolean)

Determines whether to use a DHCPv6-supplied domain name. Can only be enabled when DHCPv6 Stateless mode is also enabled; otherwise, this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv6": {"UseDomainName": true}}}}

### IPv4.StaticRoutes[array-item].Destination

**JSONPath**: `/Oem/Hp/IPv4/StaticRoutes/(array index)/Destination` (PATCHable string)

An IPv4 static route subnet mask. Only writeable when use of DHCPv4-supplied static routes is disabled; otherwise this property is read-only indicating the value is provided by DHCPv4.

> example PATCH: {"Oem": {"Hp": {"IPv4": {"StaticRoutes": [{"Destination": "&lt;string-value&gt;"}|null, ...]}}}}

### HostName

**JSONPath**: `/Oem/Hp/HostName` (PATCHable string)

The management processor host name.

> example PATCH: {"Oem": {"Hp": {"HostName": "&lt;string-value&gt;"}}}

### IPv6AddressPolicyTable[array-item].Prefix

**JSONPath**: `/IPv6AddressPolicyTable/(array index)/Prefix` (PATCHable string)

The IPv6 Address Prefix for this table entry as defined in RFC3484 section 2.1.

> example PATCH: {"IPv6AddressPolicyTable": [{"Prefix": "&lt;string-value&gt;"}|null, ...]}

### IPv4.StaticRoutes[array-item].SubnetMask

**JSONPath**: `/Oem/Hp/IPv4/StaticRoutes/(array index)/SubnetMask` (PATCHable string)

An IPv4 static route gateway. Only writeable when use of DHCPv4-supplied static routes is disabled; otherwise this property is read-only indicating the value is provided by DHCPv4.

> example PATCH: {"Oem": {"Hp": {"IPv4": {"StaticRoutes": [{"SubnetMask": "&lt;string-value&gt;"}|null, ...]}}}}

### DHCPv4.UseDomainName

**JSONPath**: `/Oem/Hp/DHCPv4/UseDomainName` (PATCHable boolean)

Determines whether to use a DHCPv4-supplied domain name. Can only be enabled when DHCPv4 is also enabled; otherwis,e this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv4": {"UseDomainName": true}}}}

### UEFIDevicePath

**JSONPath**: `/UEFIDevicePath` (read only string)

The UEFI device path for this NIC.

### DHCPv4.UseStaticRoutes

**JSONPath**: `/Oem/Hp/DHCPv4/UseStaticRoutes` (PATCHable boolean)

Determines whether to use DHCPv4-supplied static routes. Can only be enabled when DHCPv4 is also enabled; otherwise, this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv4": {"UseStaticRoutes": true}}}}

### SettingsResult.Messages[array-item].MessageID

**JSONPath**: `/SettingsResult/Messages/(array index)/MessageID` (read only string)

Key for this message, which is used to look up the message in a message registry. The key is in the format <registry>.<majorver>.<minorver>:<messagekey>.

### DomainName

**JSONPath**: `/Oem/Hp/DomainName` (PATCHable string)

Domain name of the network to which this management processor belongs. This property can only be modified when the management processor is not configured to use a DHCP supplied domain name; otherwise this property is read-only indicating the value is provided by DHCP.

> example PATCH: {"Oem": {"Hp": {"DomainName": "&lt;string-value&gt;"}}}

### SpeedMbps

**JSONPath**: `/SpeedMbps` (PATCHable integer)

The link speed of the Ethernet interface. If Autosense is enabled, this property cannot be modified. This property can only be modified on a dedicated network port. It cannot be modified for blade servers.

> example PATCH: {"SpeedMbps": &lt;integer-value&gt;}

### IPv4Addresses[array-item].AddressOrigin

**JSONPath**: `/IPv4Addresses/(array index)/AddressOrigin` (read only enumeration)

How the address was determined.

**Defined values**:

* `DHCP`

* `Static`

### DHCPv6.UseNTPServers

**JSONPath**: `/Oem/Hp/DHCPv6/UseNTPServers` (PATCHable boolean)

Determines whether to use DHCPv6-supplied NTP servers. Can only be enabled when DHCPv6 Stateless mode is also enabled; otherwise, this property will be set to false and will be read-only.

> example PATCH: {"Oem": {"Hp": {"DHCPv6": {"UseNTPServers": true}}}}

### IPv6.StaticRoutes[array-item].Status

**JSONPath**: `/Oem/Hp/IPv6/StaticRoutes/(array index)/Status` (read only enumeration)

Status of this static route entry.

**Defined values**:

* `Unknown`

* `Pending`

* `Active`

* `Failed`

### IPv6AddressPolicyTable[array-item].Precedence

**JSONPath**: `/IPv6AddressPolicyTable/(array index)/Precedence` (PATCHable integer)

The precedence value for this table entry as defined in RFC3484 section 2.1.

> example PATCH: {"IPv6AddressPolicyTable": [{"Precedence": &lt;integer-value&gt;}|null, ...]}

### SettingsResult.Messages[array-item].Severity

**JSONPath**: `/SettingsResult/Messages/(array index)/Severity` (read only enumeration)

This is the severity of the errors.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### IPv4Addresses[array-item].Address

**JSONPath**: `/IPv4Addresses/(array index)/Address` (PATCHable string)

The IPv4 Address.

> example PATCH: {"IPv4Addresses": [{"Address": "&lt;string-value&gt;"}|null, ...]}

### IPv4Addresses[array-item].SubnetMask

**JSONPath**: `/IPv4Addresses/(array index)/SubnetMask` (PATCHable string)

The IPv4 Subnet mask.

> example PATCH: {"IPv4Addresses": [{"SubnetMask": "&lt;string-value&gt;"}|null, ...]}

### VLANEnable

**JSONPath**: `/VLANEnable` (read only boolean)

Indicates if VLANs are enabled. If this NIC supports more than one VLAN, this property will not be present and the client should look for VLANs collection in the link section of this resource.

### IPv4.WINSRegistration

**JSONPath**: `/Oem/Hp/IPv4/WINSRegistration` (PATCHable boolean)

Determines whether WINS registration is enabled.

> example PATCH: {"Oem": {"Hp": {"IPv4": {"WINSRegistration": true}}}}

### DHCPv6.StatefulModeEnabled

**JSONPath**: `/Oem/Hp/DHCPv6/StatefulModeEnabled` (PATCHable boolean)

Determines whether DHCPv6 Stateful mode is enabled.

> example PATCH: {"Oem": {"Hp": {"DHCPv6": {"StatefulModeEnabled": true}}}}

### IPv4.StaticRoutes[array-item].Gateway

**JSONPath**: `/Oem/Hp/IPv4/StaticRoutes/(array index)/Gateway` (PATCHable string)

Currently configured WINS servers in order of descending preference. Static values when not configured to use DHCPv4-supplied WINS servers; otherwise this property is read-only indicating the values are provided by DHCPv4.

> example PATCH: {"Oem": {"Hp": {"IPv4": {"StaticRoutes": [{"Gateway": "&lt;string-value&gt;"}|null, ...]}}}}

### SharedNetworkPortOptions.NIC

**JSONPath**: `/Oem/Hp/SharedNetworkPortOptions/NIC` (PATCHable enumeration)

Selects the system NIC that is to be shared with this management processor.

> example PATCH: {"Oem": {"Hp": {"SharedNetworkPortOptions": {"NIC": "FlexibleLOM"}}}}

**Defined values**:

* `LOM`

* `FlexibleLOM`

### VLANEnabled

**JSONPath**: `/Oem/Hp/VLANEnabled` (PATCHable boolean)

Determines whether VLAN is enabled. Only applies to Shared Network Port.

> example PATCH: {"Oem": {"Hp": {"VLANEnabled": true}}}

### SettingsResult.Messages[array-item].Message

**JSONPath**: `/SettingsResult/Messages/(array index)/Message` (read only string)

Human-readable message.

### IPv4Addresses[array-item].Gateway

**JSONPath**: `/IPv4Addresses/(array index)/Gateway` (PATCHable string)

The IPv4 gateway for this address.

> example PATCH: {"IPv4Addresses": [{"Gateway": "&lt;string-value&gt;"}|null, ...]}

## EventService
This is the schema definition for the Event Service.  It represents the properties for the service itself and has links to the actual list of subscriptions.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/eventservice`

### TTLCountDefault

**JSONPath**: `/Oem/Hp/TTLCountDefault` (read only integer)

The default number of TTLUnits until this listener destination subscription expires.  It may be renewed prior to expire to reset the Time to Live counter.  The value 999999 is reserved to mean a perpetual subscription.

### DeliveryRetryAttempts

**JSONPath**: `/DeliveryRetryAttempts` (read only integer)

This is the number of attempts an event posting is retried before the subscription is terminated.

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### RequestedMaxEventsToQueueDefault

**JSONPath**: `/Oem/Hp/RequestedMaxEventsToQueueDefault` (read only integer)

This represents the default number of events the service should queue.

### SubscriptionRemovalTimeIntervalInMinutes

**JSONPath**: `/SubscriptionRemovalTimeIntervalInMinutes` (read only integer)

This is the minimum amount of time after the failed events that the service will wait before doing the SubscriptionRemovalAction.

### RetireOldEventInMinutesDefault

**JSONPath**: `/Oem/Hp/RetireOldEventInMinutesDefault` (read only integer)

This represents the default number of minutes until an event is expired.

### DeliveryRetryIntervalInSeconds

**JSONPath**: `/DeliveryRetryIntervalInSeconds` (read only integer)

This represents the number of seconds between retry attempts for sending any given Event

### TTLUnitsDefault

**JSONPath**: `/Oem/Hp/TTLUnitsDefault` (read only enumeration)

The default time unit used to measure the subscription time of this listener destination.  This is the units for TTLCount and is used to express the subscription lifetime of the listener destination.

**Defined values**:

* `seconds`

* `minutes`

* `days`

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

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

## ExtendedError
This is the schema definition for the Extended Error. Extended errors can be included in the body of REST API operation responses. They augment the HTTP error codes with more meaningful information about why the error occurred.

**Properties**

> **Resource Instances of this Type**:  

### Messages[array-item].Message

**JSONPath**: `/Messages/(array index)/Message` (read only string)

The human readable message, if provided.

### Messages[array-item].MessageID

**JSONPath**: `/Messages/(array index)/MessageID` (read only string)

The key for this message that can be used to look up the message in a message registry.

### Messages[array-item].Severity

**JSONPath**: `/Messages/(array index)/Severity` (read only enumeration)

The severity of the errors.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Messages[array-item].Resolution

**JSONPath**: `/Messages/(array index)/Resolution` (read only string)

Provides suggestions for how to resolve the situation that caused the error.

## HPPowerMeter
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/chassis/{item}/power/fastpowermeter`

> * `https://{iLO}/redfish/v1/chassis/{item}/power/powermeter`

### PowerDetail[array-item].CpuCapLim

**JSONPath**: `/PowerDetail/(array index)/CpuCapLim` (read only integer)

CPU cap limit for the power meter.

### PowerDetail[array-item].Cap

**JSONPath**: `/PowerDetail/(array index)/Cap` (read only integer)

Overall power cap for the power meter.

### PowerDetail[array-item].Minimum

**JSONPath**: `/PowerDetail/(array index)/Minimum` (read only integer)

Minimum power over the sample time.

### Samples

**JSONPath**: `/Samples` (read only integer)

Number of samples in the array.

### PowerDetail[array-item].AmbTemp

**JSONPath**: `/PowerDetail/(array index)/AmbTemp` (read only integer)

Ambient temperature, in degrees Celsius.

### PowerDetail[array-item].PunCap

**JSONPath**: `/PowerDetail/(array index)/PunCap` (read only boolean)

Punitive cap for the power meter.

### PowerDetail[array-item].CpuUtil

**JSONPath**: `/PowerDetail/(array index)/CpuUtil` (read only integer)

CPU power utilization.

### Maximum

**JSONPath**: `/Maximum` (read only integer)

Maximum power across all samples, taken from the 24 hour history.

### Average

**JSONPath**: `/Average` (read only integer)

Average power across all samples, over the last 24 hours.

### PowerDetail[array-item].CpuMax

**JSONPath**: `/PowerDetail/(array index)/CpuMax` (read only integer)

CPU maximum power consumed by the power meter.

### PowerDetail[array-item].Average

**JSONPath**: `/PowerDetail/(array index)/Average` (read only integer)

Average power over the sample time.

### PowerDetail[array-item].PrMode

**JSONPath**: `/PowerDetail/(array index)/PrMode` (read only enumeration)

Power regulator mode, which can be OS Control, Static High, Static Low or Dynamic.

**Defined values**:

* `dyn`

* `min`

* `max`

* `osc`

### PowerDetail[array-item].Time

**JSONPath**: `/PowerDetail/(array index)/Time` (read only string)

Time at which the power detail was captured.

### PowerDetail[array-item].CpuAvgFreq

**JSONPath**: `/PowerDetail/(array index)/CpuAvgFreq` (read only integer)

CPU average frequency of the power supply.

### PowerDetail[array-item].UnachCap

**JSONPath**: `/PowerDetail/(array index)/UnachCap` (read only boolean)

Unachievable cap for the power meter.

### Minimum

**JSONPath**: `/Minimum` (read only integer)

Minimum power across all samples, taken from the 24 hour history.

### PowerDetail[array-item].CpuPwrSavLim

**JSONPath**: `/PowerDetail/(array index)/CpuPwrSavLim` (read only integer)

CPU power-saving limit for the power meter.

### PowerDetail[array-item].Peak

**JSONPath**: `/PowerDetail/(array index)/Peak` (read only integer)

Peak power over the sample time.

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
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/bios/settings`

> * `https://{iLO}/redfish/v1/systems/{item}/bios`

### SettingsResult.definitions.SettingsResult.ETag

**JSONPath**: `/SettingsResult/definitions/SettingsResult/ETag` (read only string)

ETag of this resource after the settings have been applied.

### SettingsResult.definitions.SettingsResult.Messages[array-item].Message

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/Message` (read only string)

Human-readable message.

### SettingsResult.definitions.SettingsResult.Messages[array-item].Resolution

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/Resolution` (read only string)

Instructions for resolving the issue that caused the error.

### SettingsResult.definitions.SettingsResult.Time

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Time` (read only string)

Time at which the settings were applied.

### SettingsResult.definitions.SettingsResult.Messages[array-item].MessageID

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/MessageID` (read only string)

Key for this message, which is used to look up the message in a message registry. The key is in the format <registry>.<majorver>.<minorver>:<messagekey>.

### AttributeRegistry

**JSONPath**: `/AttributeRegistry` (read only string)

This object represents the type property. It represents the schema used for the resource and indicates the version of the schema in the format <schema>.<majorversion>.<minorversion>.<errataversion>.

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

## HpBiosMapping
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/bios/mappings`

### BiosPciSettingsMappings[array-item].CorrelatableID

**JSONPath**: `/BiosPciSettingsMappings/(array index)/CorrelatableID` (read only string)

Contains any CorrelatableIDs that represent this PCI device. The CorrelatableID values can be JSON Pointers or UEFI identifiers.

### BiosPciSettingsMappings[array-item].Instance

**JSONPath**: `/BiosPciSettingsMappings/(array index)/Instance` (read only integer)

The instance number of the parent PCI device for this association set.

### BiosPciSettingsMappings[array-item].Subinstances[array-item].Subinstance

**JSONPath**: `/BiosPciSettingsMappings/(array index)/Subinstances/(array index)/Subinstance` (read only integer)

The sub-instance number of the child PCI device for this association set.

### AttributeRegistry

**JSONPath**: `/AttributeRegistry` (read only string)

This object represents the type property. It represents the schema used for the resource and indicates the version of the schema in the format <schema>.<majorversion>.<minorversion>.<errataversion>.

### BiosPciSettingsMappings[array-item].Subinstances[array-item].CorrelatableID

**JSONPath**: `/BiosPciSettingsMappings/(array index)/Subinstances/(array index)/CorrelatableID` (read only string)

Contains any CorrelatableIDs that represent this PCI device. The CorrelatableID values can be JSON Pointers or UEFI identifiers.

## HpESKM
ESKM (Enterprise Security Key Manager) object enables user to connect to an operational key manager, change redundancy settings, view the key manager connection settings, test the connection, and view key management events.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/securityservice/eskm`

### PrimaryKeyServerPort

**JSONPath**: `/PrimaryKeyServerPort` (PATCHable integer)

Primary key server port number. Set to null to clear the value.

> example PATCH: {"PrimaryKeyServerPort": &lt;integer-value&gt;}

### ESKMEvents[array-item].Event

**JSONPath**: `/ESKMEvents/(array index)/Event` (read only string)

ESKM event description.

### KeyManagerConfig.AccountGroup

**JSONPath**: `/KeyManagerConfig/AccountGroup` (PATCHable string)

Account group on ESKM.

> example PATCH: {"KeyManagerConfig": {"AccountGroup": "&lt;string-value&gt;"}}

### KeyManagerConfig.ImportedCertificateIssuer

**JSONPath**: `/KeyManagerConfig/ImportedCertificateIssuer` (read only string)

Imported certificate issuer.

### KeyServerRedundancyReq

**JSONPath**: `/KeyServerRedundancyReq` (PATCHable boolean)

If true encryption keys will be maintained on both the configured key servers. When this option is disabled, iLO will not verify that encryption keys are copied to both of the configured key servers.

> example PATCH: {"KeyServerRedundancyReq": true}

### KeyManagerConfig.AccountName

**JSONPath**: `/KeyManagerConfig/AccountName` (read only string)

Account name on ESKM.

### KeyManagerConfig.LoginName

**JSONPath**: `/KeyManagerConfig/LoginName` (PATCHable string)

ESKM administrator account login name. This property always returns null on GET.

> example PATCH: {"KeyManagerConfig": {"LoginName": "&lt;string-value&gt;"}}

### SecondaryKeyServerPort

**JSONPath**: `/SecondaryKeyServerPort` (PATCHable integer)

Secondary key server port number. Set to null to clear the value.

> example PATCH: {"SecondaryKeyServerPort": &lt;integer-value&gt;}

### KeyManagerConfig.ImportedCertificateSubject

**JSONPath**: `/KeyManagerConfig/ImportedCertificateSubject` (read only string)

Imported certificate subject.

### PrimaryKeyServerAddress

**JSONPath**: `/PrimaryKeyServerAddress` (PATCHable string)

Primary key server IP address or FQDN. Set to null to clear the value.

> example PATCH: {"PrimaryKeyServerAddress": "&lt;string-value&gt;"}

### ESKMEvents[array-item].Timestamp

**JSONPath**: `/ESKMEvents/(array index)/Timestamp` (read only string)

Time of ESKM event.

### KeyManagerConfig.Password

**JSONPath**: `/KeyManagerConfig/Password` (PATCHable string)

ESKM administrator account password. This property always returns null on GET.

> example PATCH: {"KeyManagerConfig": {"Password": "&lt;string-value&gt;"}}

### SecondaryKeyServerAddress

**JSONPath**: `/SecondaryKeyServerAddress` (PATCHable string)

Secondary key server IP address or FQDN. Set to null to clear the value.

> example PATCH: {"SecondaryKeyServerAddress": "&lt;string-value&gt;"}

### KeyManagerConfig.ESKMLocalCACertificateName

**JSONPath**: `/KeyManagerConfig/ESKMLocalCACertificateName` (PATCHable string)

This is the name of Local CA (Certificate Authority) in ESKM that is used to sign the ESKM server certificate. iLO will retrieve this certificate from the ESKM server.

> example PATCH: {"KeyManagerConfig": {"ESKMLocalCACertificateName": "&lt;string-value&gt;"}}

## HpHttpsCert
This is the schema definition for the X509 Certificate.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/securityservice/httpscert`

### X509CertificateInformation.ValidNotAfter

**JSONPath**: `/X509CertificateInformation/ValidNotAfter` (read only string)

The date on which the certificate validity period ends.

### CertificateSigningRequest

**JSONPath**: `/CertificateSigningRequest` (read only string)

GenerateCSR action, wait few minutes (upto 10), perform GET operation, fills CSR. Contains a public and private key pair.

### X509CertificateInformation.SerialNumber

**JSONPath**: `/X509CertificateInformation/SerialNumber` (read only string)

The serial number that the Certificate Authority assigned to the certificate.

### X509CertificateInformation.Subject

**JSONPath**: `/X509CertificateInformation/Subject` (read only string)

The entity to which the certificate was issued.

### X509CertificateInformation.ValidNotBefore

**JSONPath**: `/X509CertificateInformation/ValidNotBefore` (read only string)

The date on which the certificate validity period begins.

### X509CertificateInformation.Issuer

**JSONPath**: `/X509CertificateInformation/Issuer` (read only string)

The Certificate Authority that issued the certificate.

## HpMemory
The schema definition for the properties of Memory DIMMs.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/memory/{item}`

### SocketLocator

**JSONPath**: `/SocketLocator` (read only string)

Identifies the physically labeled socket or board position, where the memory device is located.

### BankLocator

**JSONPath**: `/BankLocator` (read only string)

Identifies the physically labeled bank, where the memory device is located.

### MinimumVoltageVoltsX10

**JSONPath**: `/MinimumVoltageVoltsX10` (read only integer)

The minimum DIMM voltage multiplied by 10, for example, 1.2v = 12.

### TotalWidth

**JSONPath**: `/TotalWidth` (read only integer)

The total width, in bits, of this memory device, including any check or error-correction bits. If there are no error-correction bits, this value should be equal to Data Width. If the width is unknown, the field is set to null.

### HPMemoryType

**JSONPath**: `/HPMemoryType` (read only enumeration)

Indicates whether or not HP SmartMemory is present.

**Defined values**:

* `HPSmartMemory`

* `HPStandard`

* `Unknown`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### MaximumFrequencyMHz

**JSONPath**: `/MaximumFrequencyMHz` (read only integer)

Identifies the maximum, capable speed of the device in megahertz (MHz). If the value is null, the speed is unknown.

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### DIMMTechnology

**JSONPath**: `/DIMMTechnology` (read only enumeration)

The memory module technology type.

**Defined values**:

* `BurstEDO`

* `FastPage`

* `Synchronous`

* `EDO`

* `LRDIMM`

* `RDRAM`

* `RDIMM`

* `UDIMM`

* `Unknown`

### PartNumber

**JSONPath**: `/PartNumber` (read only string)

The part number for this memory device.

### Manufacturer

**JSONPath**: `/Manufacturer` (read only string)

Identifies the manufacturer of this memory device.

### SerialNumber

**JSONPath**: `/SerialNumber` (read only string)

The serial number for this memory device.

### ErrorCorrection

**JSONPath**: `/ErrorCorrection` (read only enumeration)

The error correction used for this DIMM. If the value is null, the error correction is unknown.

**Defined values**:

* `None`

* `Parity`

* `SingleBitECC`

* `MultiBitECC`

* `CRC`

### AssetTag

**JSONPath**: `/AssetTag` (read only string)

The asset tag for this memory device.

### DIMMType

**JSONPath**: `/DIMMType` (read only enumeration)

The type of memory DIMM used in this system.

**Defined values**:

* `DDR`

* `DDR2`

* `DDR3`

* `DDR4`

* `FBD2`

* `LPDD3`

* `LPDDR`

* `LPDDR2`

* `LPDDR4`

### Rank

**JSONPath**: `/Rank` (read only integer)

Specifies the DIMM rank. A value of null indicates the rank is unknown.

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### DataWidth

**JSONPath**: `/DataWidth` (read only integer)

The data width, in bits, of this memory device. A Data Width value of 0 and a Total Width value of 8 indicates that the device is being used solely to provide 8 error-correction bits. If the width is unknown, the field is set to null.

### SizeMB

**JSONPath**: `/SizeMB` (read only integer)

The size of the memory device in megabytes.

## HpSecureBoot
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/secureboot`

### SecureBootEnable

**JSONPath**: `/SecureBootEnable` (PATCHable boolean)

Enable or disable UEFI Secure Boot (takes effect on next boot).

> example PATCH: {"SecureBootEnable": true}

### SecureBootCurrentState

**JSONPath**: `/SecureBootCurrentState` (read only boolean)

Current enabled state of Secure Boot

### ResetAllKeys

**JSONPath**: `/ResetAllKeys` (PATCHable boolean)

If true, clear all Secure Boot keys on next boot.

> example PATCH: {"ResetAllKeys": true}

### ResetToDefaultKeys

**JSONPath**: `/ResetToDefaultKeys` (PATCHable boolean)

If true, reset to default Secure Boot keys on next boot.

> example PATCH: {"ResetToDefaultKeys": true}

## HpSecurityService
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/securityservice`

## HpServerBootSettings
The schema definition of the server UEFI Boot Order.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/bios/boot`

> * `https://{iLO}/redfish/v1/systems/{item}/bios/boot/settings`

### BootSources[array-item].BootString

**JSONPath**: `/BootSources/(array index)/BootString` (PATCHable string)

User-readable string that describes the UEFI boot option.

### SettingsResult.definitions.SettingsResult.ETag

**JSONPath**: `/SettingsResult/definitions/SettingsResult/ETag` (read only string)

ETag of this resource after the settings have been applied.

### DesiredBootDevices[array-item].CorrelatableID

**JSONPath**: `/DesiredBootDevices/(array index)/CorrelatableID` (PATCHable string)

Standardized text representation of the UEFI device path of the desired boot device, in UTF-8 format. For example 'PciRoot(0x0)/Pci(0x2,0x2)/Pci(0x0,0x0)'

> example PATCH: {"DesiredBootDevices": [{"CorrelatableID": "&lt;string-value&gt;"}|null, ...]}

### BootSources[array-item].CorrelatableID

**JSONPath**: `/BootSources/(array index)/CorrelatableID` (PATCHable string)

Contains any CorrelatableIDs that represent this boot option. The correlatableID values can be JSON Pointers or UEFI identifiers.

### SettingsResult.definitions.SettingsResult.Messages[array-item].MessageID

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/MessageID` (read only string)

Key for this message, which is used to look up the message in a message registry. The key is in the format <registry>.<majorver>.<minorver>:<messagekey>.

### SettingsResult.definitions.SettingsResult.Messages[array-item].Message

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/Message` (read only string)

Human-readable message.

### BootSources[array-item].StructuredBootString

**JSONPath**: `/BootSources/(array index)/StructuredBootString` (PATCHable string)

Uniquely identifies this boot option within the server.

### SettingsResult.definitions.SettingsResult.Messages[array-item].Resolution

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/Resolution` (read only string)

Instructions for resolving the issue that caused the error.

### SettingsResult.definitions.SettingsResult.Time

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Time` (read only string)

Time at which the settings were applied.

### AttributeRegistry

**JSONPath**: `/AttributeRegistry` (read only string)

This object represents the type property. It represents the schema used for the resource and indicates the version of the schema in the format <schema>.<majorversion>.<minorversion>.<errataversion>.

### DesiredBootDevices[array-item].Lun

**JSONPath**: `/DesiredBootDevices/(array index)/Lun` (PATCHable string)

The Logical Unit Number (LUN) of the desired boot device. This value must be a hexadecimal string with an even number of 2 to 16 characters, excluding the first two characters, 0x (for example, '0x01').

> example PATCH: {"DesiredBootDevices": [{"Lun": "&lt;string-value&gt;"}|null, ...]}

### DesiredBootDevices[array-item].iScsiTargetName

**JSONPath**: `/DesiredBootDevices/(array index)/iScsiTargetName` (PATCHable string)

The iSCSI node target name of the desired boot device. The value must be a string based on IETF RFC 3270, and can be up to 244 characters in length (for example, 'iqn.1991-05.com.microsoft:iscsitarget-iscsidisk-target').

> example PATCH: {"DesiredBootDevices": [{"iScsiTargetName": "&lt;string-value&gt;"}|null, ...]}

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

### DesiredBootDevices[array-item].Wwn

**JSONPath**: `/DesiredBootDevices/(array index)/Wwn` (PATCHable string)

The Fibre Channel World Wide Name (WWN) of the desired boot device. This value must be a hexadecimal string with an even number of 2 to 16 characters, excluding the first two characters, 0x (for example, '0x0001020304050607').

> example PATCH: {"DesiredBootDevices": [{"Wwn": "&lt;string-value&gt;"}|null, ...]}

### BootSources[array-item].UEFIDevicePath

**JSONPath**: `/BootSources/(array index)/UEFIDevicePath` (PATCHable string)

Standardized text representation of the UEFI device path for this boot option, in UTF-8 format.

## HpServerPCISlot
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/pcislots/{item}`

### Status.OperationalStatus[array-item].Status

**JSONPath**: `/Status/OperationalStatus/(array index)/Status` (read only string)

Current usage status of the slot: InUse or Empty

### UEFIDevicePath

**JSONPath**: `/UEFIDevicePath` (read only string)

Standardized text representation of the UEFI device path, in UTF-8 format

### SupportsHotPlug

**JSONPath**: `/SupportsHotPlug` (read only boolean)

Specifies whether the slot supports hot-plug devices.

### Length

**JSONPath**: `/Length` (read only enumeration)

PCI slot length

**Defined values**:

* `Short`

* `Long`

* `Other`

### Technology

**JSONPath**: `/Technology` (read only enumeration)

PCI technology

**Defined values**:

* `PCIExpressGen3`

* `PCIExpressGen2`

* `PCIExpress`

### Status.EnabledState

**JSONPath**: `/Status/EnabledState` (read only string)

Specifies whether the slot is enabled or disabled.

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

## HpServerPciDevice
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/pcidevices/{item}`

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

### StructuredName

**JSONPath**: `/StructuredName` (read only string)

PCI device structured name in UTF-8 format.

### EnclosureNumber

**JSONPath**: `/EnclosureNumber` (read only integer)

Enclosure number value.

### BayNumber

**JSONPath**: `/BayNumber` (read only integer)

Bay number value.

### SubclassCode

**JSONPath**: `/SubclassCode` (read only integer)

PCI sub class code of the endpoint.

### BusNumber

**JSONPath**: `/BusNumber` (read only integer)

PCI device bus number value.

### DeviceSubInstance

**JSONPath**: `/DeviceSubInstance` (read only integer)

PCI device sub-instance value.

### SubsystemVendorID

**JSONPath**: `/SubsystemVendorID` (read only integer)

PCI subsystem vendor ID of the device.

### SubsystemDeviceID

**JSONPath**: `/SubsystemDeviceID` (read only integer)

PCI subsystem device ID of the device.

### SegmentNumber

**JSONPath**: `/SegmentNumber` (read only integer)

PCI segment group number value.

### ClassCode

**JSONPath**: `/ClassCode` (read only integer)

PCI class code of the endpoint.

### FunctionNumber

**JSONPath**: `/FunctionNumber` (read only integer)

PCI device function number value.

### UEFIDevicePath

**JSONPath**: `/UEFIDevicePath` (read only string)

Standardized text representation of the UEFI device path, in UTF-8 format.

### DeviceLocation

**JSONPath**: `/DeviceLocation` (read only string)

PCI device location.

### DeviceInstance

**JSONPath**: `/DeviceInstance` (read only integer)

PCI device instance value.

### DeviceNumber

**JSONPath**: `/DeviceNumber` (read only integer)

PCI device number value.

### VendorID

**JSONPath**: `/VendorID` (read only integer)

PCI vendor ID of the device.

### DeviceID

**JSONPath**: `/DeviceID` (read only integer)

PCI device ID of the device.

## HpSmartStorage
HpSmartStorage

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/smartstorage`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

## HpSmartStorageArrayController
HpSmartStorageArrayController

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}`

### PhysicalDriveCount

**JSONPath**: `/PhysicalDriveCount` (read only integer)

The number of physical drives attached to this controller

### BootVolumePrimary

**JSONPath**: `/BootVolumePrimary` (read only string)

The primary boot volume of this controller

### EncryptionHasLockedVolumesMissingBootPassword

**JSONPath**: `/EncryptionHasLockedVolumesMissingBootPassword` (read only boolean)

True if there are locked drives due to a missing boot password, false otherwise

### Manufacturer

**JSONPath**: `/Manufacturer` (read only string)

The manufacturer of the controller

### EncryptionStandaloneModeEnabled

**JSONPath**: `/EncryptionStandaloneModeEnabled` (read only boolean)

True if the controller manages encryption keys locally, false if a remote key manager is being used

### EncryptionCryptoOfficerPasswordSet

**JSONPath**: `/EncryptionCryptoOfficerPasswordSet` (read only boolean)

True if a password has been set for the Encryption Crypto Officer, false otherwise

### PowerModeWarningTemperature

**JSONPath**: `/PowerModeWarningTemperature` (read only boolean)

True if the controller has crossed a critical temperature threshold and performance has been reduced to prevent damage to the controller, false otherwise

### SoftwareRaidHbaModeOptionRomRev

**JSONPath**: `/SoftwareRaidHbaModeOptionRomRev` (read only string)

The option ROM firmware version used to bootstrap the software RAID stack

### ArrayCount

**JSONPath**: `/ArrayCount` (read only integer)

The number of arrays configured on this controller

### OperatingModeAfterReboot

**JSONPath**: `/OperatingModeAfterReboot` (read only enumeration)

The operating mode the controller will be functioning in (RAID versus HBA) after a reboot

**Defined values**:

* `RAID`

* `HBA`

### SparePhysicalDriveCount

**JSONPath**: `/SparePhysicalDriveCount` (read only integer)

he number of physical drives assigned as spare drives attached to this controller

### DataLogicalDriveCount

**JSONPath**: `/DataLogicalDriveCount` (read only integer)

The number of data logical drives configured on this controller

### EncryptionKekSet

**JSONPath**: `/EncryptionKekSet` (read only boolean)

True if the Master Key has been set, false otherwise

### CacheArrayCount

**JSONPath**: `/CacheArrayCount` (read only integer)

The number of cache arrays configured on this controller

### EncryptionUserPasswordSet

**JSONPath**: `/EncryptionUserPasswordSet` (read only boolean)

True if a password has been set for the Encryption User, false otherwise.

### ParallelSurfaceScanSupported

**JSONPath**: `/ParallelSurfaceScanSupported` (read only boolean)

True if the controller supports scanning multiple disk surfaces

### EncryptionBootPasswordSet

**JSONPath**: `/EncryptionBootPasswordSet` (read only boolean)

True if there is a boot password set, false otherwise

### FirmwareVersion.definitions.FWVersion.VersionString

**JSONPath**: `/FirmwareVersion/definitions/FWVersion/VersionString` (read only string)

This string represents the version of the firmware image.

### DegradedPerformanceOptimization

**JSONPath**: `/DegradedPerformanceOptimization` (read only enumeration)

Enables the controller to attempt to improve performance on RAID 5/50/6(ADG)/60 logical drives when one or more physical drives in the logical drive are failed

**Defined values**:

* `Enabled`

* `Disabled`

### CurrentOperatingMode

**JSONPath**: `/CurrentOperatingMode` (read only enumeration)

The current operating mode of the controller.

**Defined values**:

* `RAID`

* `HBA`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### EncryptionPhysicalDriveCount

**JSONPath**: `/EncryptionPhysicalDriveCount` (read only integer)

The number of encrypted physical drives attached to the controller

### EncryptionLocalKeyCacheEnabled

**JSONPath**: `/EncryptionLocalKeyCacheEnabled` (read only boolean)

True if the controller caches encryption keys locally when a remote key manager is being used, false otherwise

### PowerModeWarningChangedDrive

**JSONPath**: `/PowerModeWarningChangedDrive` (read only boolean)

True if the controller's drive configuration has changed while using configuration based power settings, false otherwise

### CacheMemorySizeMiB

**JSONPath**: `/CacheMemorySizeMiB` (read only integer)

The total cache memory size for the controller in MiB

### Model

**JSONPath**: `/Model` (read only string)

The model number for the controller

### DriveWriteCache

**JSONPath**: `/DriveWriteCache` (read only enumeration)

Enables or disables the write cache of the physical drives attached to the controller

**Defined values**:

* `Enabled`

* `Disabled`

### BootVolumeSecondary

**JSONPath**: `/BootVolumeSecondary` (read only string)

The secondary boot volume of this controller

### EncryptionEnabled

**JSONPath**: `/EncryptionEnabled` (read only boolean)

True if encryption is currently enabled for this controller, false otherwise

### EncryptionRecoveryParamsSet

**JSONPath**: `/EncryptionRecoveryParamsSet` (read only boolean)

True if the encryption password recovery question and answer have been set, false otherwise

### PowerModeConfigured

**JSONPath**: `/PowerModeConfigured` (read only enumeration)

The current power mode of the controller

**Defined values**:

* `Invalid`

* `Low`

* `LowAutomated`

* `Performant`

### ElevatorSort

**JSONPath**: `/ElevatorSort` (read only enumeration)

Enables the controller to sort requests to a physical drive

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

### PowerModeAfterReboot

**JSONPath**: `/PowerModeAfterReboot` (read only enumeration)

The power mode of the controller after a reboot

**Defined values**:

* `Invalid`

* `Low`

* `LowAutomated`

* `Performant`

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

### CurrentParallelSurfaceScanCount

**JSONPath**: `/CurrentParallelSurfaceScanCount` (read only integer)

Number of disks the controller is scanning in parallel

### BackupPowerSourceStatus

**JSONPath**: `/BackupPowerSourceStatus` (read only enumeration)

The current status of the backup power source (battery, capacitor, megacell etc.)

**Defined values**:

* `Present`

* `NotPresent`

* `PresentAndCharged`

* `PresentAndCharging`

### SoftwareRaidHbaFirmwareRev

**JSONPath**: `/SoftwareRaidHbaFirmwareRev` (read only string)

The firmware version of the underlying HBA that is being used by the software RAID stack

### LocationFormat

**JSONPath**: `/LocationFormat` (read only enumeration)

Format for Location Identifier

**Defined values**:

* `PCISlot`

### AdapterType

**JSONPath**: `/AdapterType` (read only enumeration)

Type of Smart controller

**Defined values**:

* `SmartArray`

* `SmartHBA`

* `DynamicSmartArray`

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### EncryptionFwLocked

**JSONPath**: `/EncryptionFwLocked` (read only boolean)

True if the controller firmware has been locked, preventing firmware updates, false otherwise

### LogicalDriveCount

**JSONPath**: `/LogicalDriveCount` (read only integer)

The number of logical drives configured on this controller

### PredictiveSpareRebuild

**JSONPath**: `/PredictiveSpareRebuild` (read only enumeration)

Enables or disables predictive spare rebuild mode

**Defined values**:

* `Enabled`

* `Disabled`

### Location

**JSONPath**: `/Location` (read only string)

Location identifier

### IsBootController

**JSONPath**: `/IsBootController` (read only boolean)

True if this controller is the OS boot controller, false otherwise

### UnassignedPhysicalDriveCount

**JSONPath**: `/UnassignedPhysicalDriveCount` (read only integer)

The number of unassigned physical drives attached to this controller

### MaxParallelSurfaceScanCount

**JSONPath**: `/MaxParallelSurfaceScanCount` (read only integer)

Maximum number of disks that the controller supports scanning in parallel

### SerialNumber

**JSONPath**: `/SerialNumber` (read only string)

The serial number for this controller

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

### FirmwareVersion.Current.VersionString

**JSONPath**: `/FirmwareVersion/Current/VersionString` (read only string)

This string represents the version of the firmware image.

### EncryptionHasLockedVolumes

**JSONPath**: `/EncryptionHasLockedVolumes` (read only boolean)

True if the controller has one or more volumes that are locked, false otherwise

### PowerModeWarningReboot

**JSONPath**: `/PowerModeWarningReboot` (read only enumeration)

True if a reboot is required to change the active power mode on the controller, false otherwise

**Defined values**:

* `NotRequired`

* `RequiredNoReason`

* `RequiredPowerSavings`

* `RequiredPerformance`

### InconsistencyRepairPolicy

**JSONPath**: `/InconsistencyRepairPolicy` (read only enumeration)

Enables the controller to update data on RAID 6(ADG) and 60 volumes based on parity information when an inconsistency is discovered during surface scan

**Defined values**:

* `Enabled`

* `Disabled`

### HardwareRevision

**JSONPath**: `/HardwareRevision` (read only string)

The hardware revision of the controller

### PowerModeWarningChangedMode

**JSONPath**: `/PowerModeWarningChangedMode` (read only boolean)

True if the controller has a new power mode configured, false otherwise

### EncryptionHasSuspendedVolumes

**JSONPath**: `/EncryptionHasSuspendedVolumes` (read only boolean)

True if the controller password has been temporarily suspended, false otherwise

### CachePhysicalDriveCount

**JSONPath**: `/CachePhysicalDriveCount` (read only integer)

The number of physical drives assigned as cache drives attached to this controller

### DataPhysicalDriveCount

**JSONPath**: `/DataPhysicalDriveCount` (read only integer)

The number of physical drives assigned as data drives attached to this controller

### CacheLogicalDriveCount

**JSONPath**: `/CacheLogicalDriveCount` (read only integer)

The number of cache logical drives configured on this controller

### SurfaceScanAnalysisPriority

**JSONPath**: `/SurfaceScanAnalysisPriority` (read only enumeration)

Priority that the controller takes to find and correct disk surface errors

**Defined values**:

* `Disabled`

* `High`

* `Medium`

* `Low`

* `Idle`

### EncryptionMixedVolumesEnabled

**JSONPath**: `/EncryptionMixedVolumesEnabled` (read only boolean)

True if the controller will allow plaintext and encrypted volumes to exist simultaneously, false otherwise

### ExpandPriority

**JSONPath**: `/ExpandPriority` (read only enumeration)

The level of priority that transformations have over handling current operating system requests

**Defined values**:

* `High`

* `Medium`

* `Low`

## HpSmartStorageDiskDrive
HpSmartStorageDiskDrive

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}/diskdrives/{item}`

### MediaType

**JSONPath**: `/MediaType` (read only enumeration)

Type of disk

**Defined values**:

* `HDD`

* `SSD`

### FirmwareVersion.definitions.FWVersion.VersionString

**JSONPath**: `/FirmwareVersion/definitions/FWVersion/VersionString` (read only string)

This string represents the version of the firmware image.

### CapacityMiB

**JSONPath**: `/CapacityMiB` (read only integer)

Total capacity of the drive in MiB

### PhyCount

**JSONPath**: `/PhyCount` (read only integer)

The number of phys the drive has

### CurrentTemperatureCelsius

**JSONPath**: `/CurrentTemperatureCelsius` (read only integer)

The current temperature of the drive

### SSDEnduranceUtilizationPercentage

**JSONPath**: `/SSDEnduranceUtilizationPercentage` (read only integer)

This is the percentage of the drive that has been worn out and can no longer be used. When this values reaches 100%, the drive has 0% usage remaining and is completely  worn out

### PortCount

**JSONPath**: `/PortCount` (read only integer)

The number of ports on the drive. Typically 1 (single-domain) or 2 (dual-domain)

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### InterfaceSpeedGbps

**JSONPath**: `/InterfaceSpeedGbps` (read only integer)

Native interface speed for the device

### BlockSizeBytes

**JSONPath**: `/BlockSizeBytes` (read only integer)

Block size of the drive in bytes. This is the block size presented by the drive to clients such as the array controller or operating system.

### ErasePattern

**JSONPath**: `/ErasePattern` (read only string)

The pattern used for erasing the disk drive

### WWID

**JSONPath**: `/WWID` (read only string)

Unique identifier for the device

### NativeBlockSizeBytes

**JSONPath**: `/NativeBlockSizeBytes` (read only integer)

Native block size of the drive in bytes. This is the underlying sector size used by the physical drive to store data. For example, an advanced format drive that uses 4K sector sizes to store data will return 4K as the NativeBlockSizeBytes but may return 512 for the BlockSizeBytes when running in 512e (emulation) mode for backward compatibility

### MaximumTemperatureCelsius

**JSONPath**: `/MaximumTemperatureCelsius` (read only integer)

The maximum recommended temperature for the drive

### Manufacturer

**JSONPath**: `/Manufacturer` (read only string)

Manufacturer of the disk drive

### RotationalSpeedRpm

**JSONPath**: `/RotationalSpeedRpm` (read only integer)

The rotational speed of the drive, only applicable on HDDs

### SerialNumber

**JSONPath**: `/SerialNumber` (read only string)

The serial number of the drive

### CarrierAuthenticationStatus

**JSONPath**: `/CarrierAuthenticationStatus` (read only enumeration)

Authentication status of the drive carrier

**Defined values**:

* `OK`

* `Fail`

* `NoCommunication`

* `NotApplicable`

### SpareRebuildMode

**JSONPath**: `/SpareRebuildMode` (read only enumeration)

Method to used activate this drive when another drive fails, this is only applicable if the drive is configured as a spare drive

**Defined values**:

* `Dedicated`

* `Roaming`

### EraseCompletionPercentage

**JSONPath**: `/EraseCompletionPercentage` (read only integer)

The percent complete for an erase operation currently occurring on the disk drive

### Model

**JSONPath**: `/Model` (read only string)

Drive model number

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### TransferSpeedGbps

**JSONPath**: `/TransferSpeedGbps` (read only integer)

Effective transfer speed to the device taking into account hardware acceleration such as edge-buffering

### PowerOnHours

**JSONPath**: `/PowerOnHours` (read only integer)

The number of lifetime hours that the drive has been powered on

### LocationFormat

**JSONPath**: `/LocationFormat` (read only enumeration)

Format for the location property

**Defined values**:

* `ControllerPort:Box:Bay`

* `SwitchPort:Box:Bay`

* `SwitchPort:SwitchBay:Bay`

### FirmwareVersion.Current.VersionString

**JSONPath**: `/FirmwareVersion/Current/VersionString` (read only string)

This string represents the version of the firmware image.

### InterfaceType

**JSONPath**: `/InterfaceType` (read only enumeration)

The connection interface of the drive

**Defined values**:

* `SAS`

* `SATA`

* `NVME`

* `Unknown`

### EncryptedDrive

**JSONPath**: `/EncryptedDrive` (read only boolean)

True if encryption is currently enabled on this disk drive, false otherwise

### Location

**JSONPath**: `/Location` (read only string)

The location of the drive

### MinimumGoodFirmwareVersion

**JSONPath**: `/MinimumGoodFirmwareVersion` (read only string)

The minimum recommended firmware revision for the drive

### CarrierApplicationVersion

**JSONPath**: `/CarrierApplicationVersion` (read only string)

Carrier PIC firmware version currently running

## HpSmartStorageLogicalDrive
HpSmartStorageLogicalDrive

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}/logicaldrives/{item}`

### LogicalDriveEncryption

**JSONPath**: `/LogicalDriveEncryption` (read only boolean)

True if encryption is currently enabled on this logical drive, false otherwise

### TransformationCompletionPercentage

**JSONPath**: `/TransformationCompletionPercentage` (read only integer)

The percent complete for any transformations the logical drive may be undergoing such as RAID migration, stripesize migration, capacity expansion etc.

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

### StripeSizeBytes

**JSONPath**: `/StripeSizeBytes` (read only integer)

The stripe size of the logical drive in bytes

### StripSizeBytes

**JSONPath**: `/StripSizeBytes` (read only integer)

The strip size of the logical drive in bytes

### DriveGeometryCylinders

**JSONPath**: `/DriveGeometryCylinders` (read only string)

The number of cylinders on the drive

### LogicalDriveEncryptionDataKeysVolatileBackup

**JSONPath**: `/LogicalDriveEncryptionDataKeysVolatileBackup` (read only boolean)

True if volatile keys are backed up to a remote key manager, false if volatile keys are not backed up

### DriveGeometryHeads

**JSONPath**: `/DriveGeometryHeads` (read only string)

The number of heads on the drive

### DriveAccessName

**JSONPath**: `/DriveAccessName` (read only string)

The access ID of the logical drive given by the OS

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

### PartitionInformation

**JSONPath**: `/PartitionInformation` (read only string)

OS partition information for the drive

### ParityInitializationCompletionPercentage

**JSONPath**: `/ParityInitializationCompletionPercentage` (read only integer)

Parity initialization complete percentage for a parity based logical drive (e.g. RAID 5)

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### LogicalDriveType

**JSONPath**: `/LogicalDriveType` (read only enumeration)

How the logical drive is being used

**Defined values**:

* `Data`

* `Cache`

* `SplitMirrorSetPrimary`

* `SplitMirrorSetBackup`

* `SplitMirrorSetBackupOrphan`

### RebuildCompletionPercentage

**JSONPath**: `/RebuildCompletionPercentage` (read only integer)

The percent complete for a rebuild operation currently occurring on the logical drive

### LogicalDriveEncryptionDataKeysVolatile

**JSONPath**: `/LogicalDriveEncryptionDataKeysVolatile` (read only boolean)

True if volatile keys are enabled for encryption, false otherwise

### VolumeUniqueIdentifier

**JSONPath**: `/VolumeUniqueIdentifier` (read only string)

An identifier (typically SCSI Inquiry based such as Inquiry VPD Page 0x83 NAA 64 identifier) used to uniquely identify this volume.

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### ParityInitializationType

**JSONPath**: `/ParityInitializationType` (read only enumeration)

When creating a logical drive with a RAID level that requires parity, parity blocks can be initialized with two different methods

**Defined values**:

* `Default`

* `Rapid`

### DriveGeometrySectors

**JSONPath**: `/DriveGeometrySectors` (read only string)

The number of sectors on the drive

### BlockSizeBytes

**JSONPath**: `/BlockSizeBytes` (read only integer)

The block size of the disk drive in bytes

### LogicalDriveName

**JSONPath**: `/LogicalDriveName` (read only string)

Label given to the logical drive

### LogicalDriveNumber

**JSONPath**: `/LogicalDriveNumber` (read only integer)

logical drive number

### CapacityMiB

**JSONPath**: `/CapacityMiB` (read only integer)

Total usable capacity available on this logical drive in MiB units

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### LogicalDriveEncryptionDataKeysVolatileStatus

**JSONPath**: `/LogicalDriveEncryptionDataKeysVolatileStatus` (read only enumeration)

The status of the encryption volatile keys

**Defined values**:

* `NoOp`

* `BackupInProgress`

* `BackupAndSetInProgress`

* `RestoreInProgress`

* `DeleteInProgress`

## HpSmartStorageStorageEnclosure
HpSmartStorageStorageEnclosure

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}/storageenclosures/{item}`

### FirmwareVersion.definitions.FWVersion.VersionString

**JSONPath**: `/FirmwareVersion/definitions/FWVersion/VersionString` (read only string)

This string represents the version of the firmware image.

### SubEnclosureLocation

**JSONPath**: `/SubEnclosureLocation` (read only string)

Location within the chassis if this storage enclosure is part of a larger chassis hosting multiple storage enclosures

### DriveBayCount

**JSONPath**: `/DriveBayCount` (read only integer)

Number of drive bays supported within the storage enclosure

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### PartNumber

**JSONPath**: `/PartNumber` (read only string)

Part number of this storage enclosure

### SKU

**JSONPath**: `/SKU` (read only string)

SKU for the storage enclosure

### Manufacturer

**JSONPath**: `/Manufacturer` (read only string)

The manufacturer of the storage enclosure

### LocationFormat

**JSONPath**: `/LocationFormat` (read only enumeration)

Format for Location Identifier

**Defined values**:

* `Controller:Box`

* `SwitchPort:Box`

* `SwitchPort:SwitchBay`

### SerialNumber

**JSONPath**: `/SerialNumber` (read only string)

The serial number for this storage enclosure

### FirmwareVersion.Current.VersionString

**JSONPath**: `/FirmwareVersion/Current/VersionString` (read only string)

This string represents the version of the firmware image.

### Model

**JSONPath**: `/Model` (read only string)

The model string for the storage enclosure

### EnclosureLogicalID

**JSONPath**: `/EnclosureLogicalID` (read only string)

Unique ID for the storage enclosure

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Location

**JSONPath**: `/Location` (read only string)

Location identifier

## HpiLOActiveHealthSystem
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/activehealthsystem`

### LocationParameters.contact_name

**JSONPath**: `/LocationParameters/contact_name` (read only string)

This query parameter may be added to the AHS location URI to insert the contact name into the AHS log header. For example, http://iloname.example.net/ahsdata/HP_xxxxxxxxxx_20140821.ahs?downloadAll=1&&contact_name=JohnDoe.

### LocationParameters.downloadAll

**JSONPath**: `/LocationParameters/downloadAll` (read only string)

This query parameter should be used to download entire AHS log. For example, http://iloname.example.net/ahsdata/HP_xxxxxxxxxx_20140821.ahs?downloadAll=1.

### links.AHSLocation.extref

**JSONPath**: `/links/AHSLocation/extref` (read only string)

The URI of an external resource.

### LocationParameters.co_name

**JSONPath**: `/LocationParameters/co_name` (read only string)

This query parameter may be added to the AHS location URI to insert the company name into the AHS log header. For example, http://iloname.example.net/ahsdata/HP_xxxxxxxxxx_20140821.ahs?downloadAll=1&&co_name=myCompany.

### LocationParameters.case_no

**JSONPath**: `/LocationParameters/case_no` (read only string)

This query parameter may be added to the AHS location URI to insert the case number into the AHS log header. For example, http://iloname.example.net/ahsdata/HP_xxxxxxxxxx_20140821.ahs?downloadAll=1&&case_no=abc123.

### AHSEnabled

**JSONPath**: `/AHSEnabled` (PATCHable boolean)

Determines whether HP Active Health System logging is enabled or disabled.

> example PATCH: {"AHSEnabled": true}

### LocationParameters.from

**JSONPath**: `/LocationParameters/from` (read only string)

This query parameter may be added with the 'to' query parameter to the AHS location URI to limit the range of data returned. The default range is the last seven days of the log and the format is (yyyy-mm-dd). 'downloadAll' parameter should not be used with this query parameter. For example, http://iloname.example.net/ahsdata/HP_xxxxxxxxxx_20140821.ahs?from=2014-03-01&&to=2014-03-30.

### LocationParameters.email

**JSONPath**: `/LocationParameters/email` (read only string)

This query parameter may be added to the AHS location URI to insert the contacts email address into the AHS log header. For example, http://iloname.example.net/ahsdata/HP_xxxxxxxxxx_20140821.ahs?downloadAll=1&&email=abc@xyz.com.

### LocationParameters.to

**JSONPath**: `/LocationParameters/to` (read only string)

This query parameter may be added with the 'from' query parameter to the AHS location URI to limit the range of data returned. The default range is the last seven days of the log and the format is (yyyy-mm-dd). 'downloadAll' parameter should not be used with this query parameter. For example, http://iloname.example.net/ahsdata/HP_xxxxxxxxxx_20140821.ahs?from=2014-03-01&&to=2014-03-30.

### LocationParameters.phone

**JSONPath**: `/LocationParameters/phone` (read only string)

This query parameter may be added to the AHS location URI to insert the contacts phone number into the AHS log header. For example, http://iloname.example.net/ahsdata/HP_xxxxxxxxxx_20140821.ahs?downloadAll=1&&contact_name=JohnDoe&&phone=555-555-5555.

## HpiLODateTime
The management processor date and time.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/datetime`

### TimeZoneList[array-item].Index

**JSONPath**: `/TimeZoneList/(array index)/Index` (read only integer)

The time zone index.

### ConfigurationSettings

**JSONPath**: `/ConfigurationSettings` (read only enumeration)

The state of the currently displayed configuration settings.

**Defined values**:

* `Current`

* `SomePendingReset`

### TimeZone.Index

**JSONPath**: `/TimeZone/Index` (PATCHable integer)

The index of the current time zone. To set a new time zone, specify a different time zone index. This property can be set only when DHCPv4 or DHCPv6 supplied time settings are disabled. Since the time zone list might vary from one firmware version to another (which often leads to differences in time zone indices), setting the time zone by name is recommended over setting by index, for better compatibility.

> example PATCH: {"TimeZone": {"Index": &lt;integer-value&gt;}}

### TimeZoneList[array-item].UtcOffset

**JSONPath**: `/TimeZoneList/(array index)/UtcOffset` (read only string)

The UTC offset of the time zone, in the format {+/-}hh:mm

### TimeZoneList[array-item].Value

**JSONPath**: `/TimeZoneList/(array index)/Value` (read only string)

The environment variable value.

### PropagateTimeToHost

**JSONPath**: `/PropagateTimeToHost` (PATCHable boolean)

Determines whether the server time is synchronized with the management processor time during the first POST after AC power is applied.

> example PATCH: {"PropagateTimeToHost": true}

### TimeZone.Value

**JSONPath**: `/TimeZone/Value` (read only string)

The environment variable value.

### TimeZone.UtcOffset

**JSONPath**: `/TimeZone/UtcOffset` (read only string)

The UTC offset of the current time zone, in the format {+/-}hh:mm

### DateTime

**JSONPath**: `/DateTime` (read only string)

The date and time used by management processor.

## HpiLOEmbeddedMedia
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/embeddedmedia`

### SDCard.Status.State

**JSONPath**: `/SDCard/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### SDCard.WriteCount

**JSONPath**: `/SDCard/WriteCount` (read only integer)

The number of writes on the SD card. Rendered only if this is an HP-certified SD card. 

### SDCard.Status.HealthRollUp

**JSONPath**: `/SDCard/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### SDCard.SizeString

**JSONPath**: `/SDCard/SizeString` (read only string)

The size of the SD card present in the server, in a readable format.

### Controller.Status.State

**JSONPath**: `/Controller/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Controller.Status.Health

**JSONPath**: `/Controller/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Controller.Status.HealthRollUp

**JSONPath**: `/Controller/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### SDCard.HpCertified

**JSONPath**: `/SDCard/HpCertified` (read only boolean)

True if this is an HP-certified SD card.

### SDCard.Status.Health

**JSONPath**: `/SDCard/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Controller.Firmware.Current.VersionString

**JSONPath**: `/Controller/Firmware/Current/VersionString` (read only string)

The current version of the embedded media controller.

### SDCard.LBACount

**JSONPath**: `/SDCard/LBACount` (read only integer)

The LBA count.

## HpiLOFederatedGroupCapping
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/chassis/{item}/power/federatedgroupcapping`

### Throttle

**JSONPath**: `/Throttle` (read only string)

High, Med, or Low based on the percentage of power usage.

### CapacityWatts

**JSONPath**: `/CapacityWatts` (read only integer)

The total power supply capacity for all servers in a group.

### CapWatts

**JSONPath**: `/CapWatts` (read only integer)

The configured power cap for all servers in a group. This value is 0 if the power cap is not configured.

## HpiLOFederationGroup
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/federationgroups/{item}`

### Privileges.RemoteConsolePriv

**JSONPath**: `/Privileges/RemoteConsolePriv` (PATCHable boolean)

Remote console privileges.

> example PATCH: {"Privileges": {"RemoteConsolePriv": true}}

### Key

**JSONPath**: `/Key` (PATCHable string)

The password used by the Federation Group.

> example PATCH: {"Key": "&lt;string-value&gt;"}

### Privileges.UserConfigPriv

**JSONPath**: `/Privileges/UserConfigPriv` (PATCHable boolean)

User configuration privileges.

> example PATCH: {"Privileges": {"UserConfigPriv": true}}

### Privileges.LoginPriv

**JSONPath**: `/Privileges/LoginPriv` (PATCHable boolean)

Login privileges.

> example PATCH: {"Privileges": {"LoginPriv": true}}

### Privileges.VirtualMediaPriv

**JSONPath**: `/Privileges/VirtualMediaPriv` (PATCHable boolean)

Virtual media privileges.

> example PATCH: {"Privileges": {"VirtualMediaPriv": true}}

### Privileges.iLOConfigPriv

**JSONPath**: `/Privileges/iLOConfigPriv` (PATCHable boolean)

The management processor configuration privileges.

> example PATCH: {"Privileges": {"iLOConfigPriv": true}}

### Privileges.VirtualPowerAndResetPriv

**JSONPath**: `/Privileges/VirtualPowerAndResetPriv` (PATCHable boolean)

Virtual power and reset privileges.

> example PATCH: {"Privileges": {"VirtualPowerAndResetPriv": true}}

## HpiLOFederationPeers
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/federationpeers/{item}`

### Peers[array-item].URL

**JSONPath**: `/Peers/(array index)/URL` (read only string)

URL of the federation peer.

### Peers[array-item].UUID

**JSONPath**: `/Peers/(array index)/UUID` (read only string)

UUID peers that are part of the federation group.

### Peers[array-item].Time

**JSONPath**: `/Peers/(array index)/Time` (read only string)

Time when the federation peer was added.

### Peers[array-item].ManagerIPAddress

**JSONPath**: `/Peers/(array index)/ManagerIPAddress` (read only string)

Manager IP address of the federation peer.

### Peers[array-item].HttpErrorCode

**JSONPath**: `/Peers/(array index)/HttpErrorCode` (read only integer)

Error code for success or failure.

## HpiLOFirmwareUpdate
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/updateservice`

### ImageSizeInBytes

**JSONPath**: `/ImageSizeInBytes` (read only integer)

The size of the firmware image (including any signatures) in bytes.

### ProgressPercent

**JSONPath**: `/ProgressPercent` (read only integer)

Firmware flash progress.

### Bootleg

**JSONPath**: `/Bootleg` (read only string)

Supplied bootleg text, if any, otherwise blank.

### Details

**JSONPath**: `/Details` (read only string)

Details about the current firmware flash status.

### Copyright

**JSONPath**: `/Copyright` (read only string)

The copyright date of the firmware image.

### ImageType

**JSONPath**: `/ImageType` (read only enumeration)

Firmware flash image type.

**Defined values**:

* `NO_DEVICE`

* `ILO_DEVICE`

* `ILO_DEVICE_FIRMWARE`

* `ILO_DEVICE_LANGPK`

* `ILO_DEVICE_DEBUGGER`

* `BIOS_DEVICE`

* `SCD_DEVICE`

* `CPLD_DEVICE`

* `CARB_DEVICE`

* `PM_DEVICE`

* `UNKNOWN`

### links.UpdateUri.extref

**JSONPath**: `/links/UpdateUri/extref` (read only string)

The URI of an external resource.

### Flags

**JSONPath**: `/Flags` (read only enumeration)

Other flags.

**Defined values**:

* `NONE`

* `RESET_ILO`

* `REQUEST_SYSTEM_COLD_BOOT`

* `REQUEST_SYSTEM_WARM_BOOT`

* `DEFERRED_AUX_PWR_CYCLE`

### State

**JSONPath**: `/State` (read only enumeration)

Current state of the firmware flash.

**Defined values**:

* `IDLE`

* `UPLOADING`

* `PROGRESSING`

* `COMPLETED`

* `ERROR`

## HpiLOLicense
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/licenseservice/{item}`

### License

**JSONPath**: `/License` (read only string)

The name of the license installed on this management processor.

### LicenseKey

**JSONPath**: `/LicenseKey` (read only string)

The license key installed on this management processor. License keys are 25 characters in length and contain both letters and numbers.

### LicenseExpire

**JSONPath**: `/LicenseExpire` (read only string)

The expiration information of the installed management processor license.

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

### ManagerTrustedCertificates[array-item].ServerName

**JSONPath**: `/ManagerTrustedCertificates/(array index)/ServerName` (read only string)

The Server name (or certificate subject).

### SSOsettings.UserPrivilege.iLOConfigPriv

**JSONPath**: `/SSOsettings/UserPrivilege/iLOConfigPriv` (PATCHable boolean)

iLO Configuration Privileges.

> example PATCH: {"SSOsettings": {"UserPrivilege": {"iLOConfigPriv": true}}}

### SSOsettings.AdminPrivilege.RemoteConsolePriv

**JSONPath**: `/SSOsettings/AdminPrivilege/RemoteConsolePriv` (PATCHable boolean)

Remote Console Privileges.

> example PATCH: {"SSOsettings": {"AdminPrivilege": {"RemoteConsolePriv": true}}}

### SSOsettings.UserPrivilege.UserConfigPriv

**JSONPath**: `/SSOsettings/UserPrivilege/UserConfigPriv` (PATCHable boolean)

User Configuration Privileges.

> example PATCH: {"SSOsettings": {"UserPrivilege": {"UserConfigPriv": true}}}

### SSOsettings.AdminPrivilege.iLOConfigPriv

**JSONPath**: `/SSOsettings/AdminPrivilege/iLOConfigPriv` (PATCHable boolean)

iLO Configuration Privileges.

> example PATCH: {"SSOsettings": {"AdminPrivilege": {"iLOConfigPriv": true}}}

### SSOsettings.SSOTrustMode

**JSONPath**: `/SSOsettings/SSOTrustMode` (PATCHable enumeration)

Represents the SSO Trust Mode.

> example PATCH: {"SSOsettings": {"SSOTrustMode": "TrustbyName"}}

**Defined values**:

* `TrustNone`

* `TrustAll`

* `TrustbyName`

* `TrustbyCert`

### SSOsettings.UserPrivilege.RemoteConsolePriv

**JSONPath**: `/SSOsettings/UserPrivilege/RemoteConsolePriv` (PATCHable boolean)

Remote Console Privileges.

> example PATCH: {"SSOsettings": {"UserPrivilege": {"RemoteConsolePriv": true}}}

### SSOsettings.UserPrivilege.PowerandResetPriv

**JSONPath**: `/SSOsettings/UserPrivilege/PowerandResetPriv` (PATCHable boolean)

Power and Reset Privileges.

> example PATCH: {"SSOsettings": {"UserPrivilege": {"PowerandResetPriv": true}}}

### ManagerTrustedCertificates[array-item].Certificate

**JSONPath**: `/ManagerTrustedCertificates/(array index)/Certificate` (read only string)

Contains PEM formatted X509 certificate (Base64 encoded).

### SSOsettings.OperatorPrivilege.iLOConfigPriv

**JSONPath**: `/SSOsettings/OperatorPrivilege/iLOConfigPriv` (PATCHable boolean)

iLO Configuration Privileges.

> example PATCH: {"SSOsettings": {"OperatorPrivilege": {"iLOConfigPriv": true}}}

### ManagerTrustedCertificates[array-item].Status

**JSONPath**: `/ManagerTrustedCertificates/(array index)/Status` (read only enumeration)

**Defined values**:

* `OK`

* `Degraded`

* `Failed`

### ManagerTrustedCertificates[array-item].SerialNumber

**JSONPath**: `/ManagerTrustedCertificates/(array index)/SerialNumber` (read only integer)

Contains the Serial number for the SSO records.

### SSOsettings.OperatorPrivilege.PowerandResetPriv

**JSONPath**: `/SSOsettings/OperatorPrivilege/PowerandResetPriv` (PATCHable boolean)

Power and Reset Privileges.

> example PATCH: {"SSOsettings": {"OperatorPrivilege": {"PowerandResetPriv": true}}}

### SSOsettings.OperatorPrivilege.UserConfigPriv

**JSONPath**: `/SSOsettings/OperatorPrivilege/UserConfigPriv` (PATCHable boolean)

User Configuration Privileges.

> example PATCH: {"SSOsettings": {"OperatorPrivilege": {"UserConfigPriv": true}}}

### SSOsettings.AdminPrivilege.PowerandResetPriv

**JSONPath**: `/SSOsettings/AdminPrivilege/PowerandResetPriv` (PATCHable boolean)

Power and Reset Privileges.

> example PATCH: {"SSOsettings": {"AdminPrivilege": {"PowerandResetPriv": true}}}

### SSOsettings.UserPrivilege.VirtualMediaPriv

**JSONPath**: `/SSOsettings/UserPrivilege/VirtualMediaPriv` (PATCHable boolean)

Virtual Media Privileges.

> example PATCH: {"SSOsettings": {"UserPrivilege": {"VirtualMediaPriv": true}}}

### SSOsettings.AdminPrivilege.UserConfigPriv

**JSONPath**: `/SSOsettings/AdminPrivilege/UserConfigPriv` (PATCHable boolean)

User Configuration Privileges.

> example PATCH: {"SSOsettings": {"AdminPrivilege": {"UserConfigPriv": true}}}

### SSOsettings.OperatorPrivilege.VirtualMediaPriv

**JSONPath**: `/SSOsettings/OperatorPrivilege/VirtualMediaPriv` (PATCHable boolean)

Virtual Media Privileges.

> example PATCH: {"SSOsettings": {"OperatorPrivilege": {"VirtualMediaPriv": true}}}

### SSOsettings.AdminPrivilege.LoginPriv

**JSONPath**: `/SSOsettings/AdminPrivilege/LoginPriv` (PATCHable boolean)

Login Privileges.

> example PATCH: {"SSOsettings": {"AdminPrivilege": {"LoginPriv": true}}}

### SSOsettings.AdminPrivilege.VirtualMediaPriv

**JSONPath**: `/SSOsettings/AdminPrivilege/VirtualMediaPriv` (PATCHable boolean)

Power and Reset Privileges.

> example PATCH: {"SSOsettings": {"AdminPrivilege": {"VirtualMediaPriv": true}}}

### SSOsettings.UserPrivilege.LoginPriv

**JSONPath**: `/SSOsettings/UserPrivilege/LoginPriv` (PATCHable boolean)

Login Privileges.

> example PATCH: {"SSOsettings": {"UserPrivilege": {"LoginPriv": true}}}

### SSOsettings.OperatorPrivilege.RemoteConsolePriv

**JSONPath**: `/SSOsettings/OperatorPrivilege/RemoteConsolePriv` (PATCHable boolean)

Remote Console Privileges.

> example PATCH: {"SSOsettings": {"OperatorPrivilege": {"RemoteConsolePriv": true}}}

### SSOsettings.OperatorPrivilege.LoginPriv

**JSONPath**: `/SSOsettings/OperatorPrivilege/LoginPriv` (PATCHable boolean)

Login Privileges.

> example PATCH: {"SSOsettings": {"OperatorPrivilege": {"LoginPriv": true}}}

## HpiSCSISoftwareInitiator
The schema definition of UEFI iSCSI Software Initiator boot configuration.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/bios/iscsi`

> * `https://{iLO}/redfish/v1/systems/{item}/bios/iscsi/settings`

### SettingsResult.definitions.SettingsResult.ETag

**JSONPath**: `/SettingsResult/definitions/SettingsResult/ETag` (read only string)

ETag of this resource after the settings have been applied.

### iSCSIBootSources[array-item].iSCSIInitiatorNetmask

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIInitiatorNetmask` (PATCHable string)

The subnet mask of the iSCSI Initiator, if not configured via DHCP. The address must be an IPv4.

### SettingsResult.definitions.SettingsResult.Messages[array-item].Resolution

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/Resolution` (read only string)

Instructions for resolving the issue that caused the error.

### iSCSIBootSources[array-item].iSCSIBootLUN

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIBootLUN` (PATCHable string)

The iSCSI boot target Logical Unit Number (LUN), if not obtained from DHCP. This value must follow the SAM-2 spec. E.g. 0001-1234-5678-9ABC. If the digit number is less then 5 characters, a dash character is not required. E.g. 0001. If the lun number is 12345, input 1234-5

### iSCSIBootSources[array-item].iSCSIBootAttemptName

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIBootAttemptName` (PATCHable string)

Human readable descriptive name for this iSCSI boot attempt configuration

### iSCSIBootSources[array-item].iSCSIIpAddressType

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIIpAddressType` (PATCHable enumeration)

The iSCSI IP Address type. If set to Auto, IPv4 will be attempted first, followed by IPv6.

**Defined values**:

* `IPv4`

* `IPv6`

* `Auto`

### iSCSIBootSources[array-item].iSCSIBootEnable

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIBootEnable` (PATCHable enumeration)

Enables or Disables iSCSI Boot for a selected iSCSI boot attempt.

**Defined values**:

* `Disabled`

* `Enabled`

* `EnabledMpio`

### iSCSIBootSources[array-item].iSCSIChapType

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIChapType` (PATCHable enumeration)

The CHAP authentication type. This is applicable only when the Authentication Method is set to CHAP.

**Defined values**:

* `OneWay`

* `Mutual`

### iSCSIBootSources[array-item].iSCSIBootAttemptInstance

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIBootAttemptInstance` (PATCHable integer)

Uniquely identifies this iSCSI boot attempt within iSCSIBootSources array.

### iSCSIBootSources[array-item].iSCSITargetTcpPort

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSITargetTcpPort` (PATCHable integer)

The iSCSI Target TCP Port number, if not obtained from DHCP.

### SettingsResult.definitions.SettingsResult.Operation

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Operation` (read only enumeration)

Details about the results of applying the settings.

**Defined values**:

* `SettingsApply`

### iSCSIBootSources[array-item].iSCSIInitiatorIpAddress

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIInitiatorIpAddress` (PATCHable string)

The IP Address of the iSCSI Initiator, if not configured via DHCP. The address must be an IPv4 or IPv6 address, depending on the IP Address Type.

### iSCSIBootSources[array-item].iSCSIChapUsername

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIChapUsername` (PATCHable string)

The password needed for CHAP authentication. This is applicable only when the Authentication Method is set to CHAP.

### iSCSIBootSources[array-item].iSCSITargetIpAddress

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSITargetIpAddress` (PATCHable string)

The IP Address of the iSCSI Target, if not obtained from DHCP. The address must be an IPv4 or IPv6 address, depending on the IP Address Type.

### iSCSIBootSources[array-item].iSCSIReverseChapSecret

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIReverseChapSecret` (PATCHable string)

The password needed for reverse CHAP authentication (from the target to the initiator). This is applicable only when the Authentication Method is set to CHAP, and the CHAP Type is set to Mutual.

### SettingsResult.definitions.SettingsResult.Messages[array-item].Severity

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/Severity` (read only enumeration)

This is the severity of the errors.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### iSCSIBootSources[array-item].iSCSIInitiatorGateway

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIInitiatorGateway` (PATCHable string)

The gateway address of the iSCSI Initiator, if not configured via DHCP. The address must be an IPv4 or IPv6 address, depending on the IP Address Type.

### iSCSIBootSources[array-item].iSCSINicSource

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSINicSource` (PATCHable string)

A BIOS Attribute that describes this selected NIC instance. This must match one of the possible values listed in the iSCSINicSources array.

### SettingsResult.definitions.SettingsResult.Time

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Time` (read only string)

Time at which the settings were applied.

### iSCSIBootSources[array-item].StructuredBootString

**JSONPath**: `/iSCSIBootSources/(array index)/StructuredBootString` (read only string)

Identifies this iSCSI UEFI boot option within the server.

### SettingsResult.definitions.SettingsResult.Messages[array-item].MessageID

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/MessageID` (read only string)

Key for this message, which is used to look up the message in a message registry. The key is in the format <registry>.<majorver>.<minorver>:<messagekey>.

### SettingsResult.definitions.SettingsResult.Messages[array-item].Message

**JSONPath**: `/SettingsResult/definitions/SettingsResult/Messages/(array index)/Message` (read only string)

Human-readable message.

### iSCSIBootSources[array-item].UEFIDevicePath

**JSONPath**: `/iSCSIBootSources/(array index)/UEFIDevicePath` (read only string)

Standardized text representation of the UEFI device path for this boot option, in UTF-8 format.

### iSCSIBootSources[array-item].iSCSIConnectRetry

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIConnectRetry` (PATCHable integer)

The number of times to retry the iSCSI connection. Zero means no retries.

### iSCSIBootSources[array-item].iSCSITargetName

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSITargetName` (PATCHable string)

The worldwide unique iSCSI Qualified Name (IQN) of this iSCSI target. Only the IQN format is accepted. EUI format is not supported (for example, 'iqn.1991-05.com.microsoft:iscsitarget-iscsidisk-target').

### iSCSIBootSources[array-item].iSCSIReverseChapUsername

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIReverseChapUsername` (PATCHable string)

User Name for reverse CHAP authentication (from the target to the initiator). This is applicable only when the Authentication Method is set to CHAP, and the CHAP Type is set to Mutual.

### iSCSIBootSources[array-item].iSCSIConnectTimeoutMS

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIConnectTimeoutMS` (PATCHable integer)

The iSCSI connection timeout value in milliseconds.

### iSCSIBootSources[array-item].iSCSITargetInfoViaDHCP

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSITargetInfoViaDHCP` (PATCHable boolean)

If enabled, the iSCSI target information are configured from DHCP. Otherwise, the iSCSI target information must be statically configured.

### iSCSIBootSources[array-item].iSCSIAuthenticationMethod

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIAuthenticationMethod` (PATCHable enumeration)

The iSCSI connection authentication method.

**Defined values**:

* `None`

* `CHAP`

### iSCSIBootSources[array-item].iSCSIChapSecret

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIChapSecret` (PATCHable string)

The password needed for CHAP authentication. This is applicable only when the Authentication Method is set to CHAP, and the CHAP Type is set to Mutual.

### iSCSIBootSources[array-item].iSCSIInitiatorInfoViaDHCP

**JSONPath**: `/iSCSIBootSources/(array index)/iSCSIInitiatorInfoViaDHCP` (PATCHable boolean)

If enabled, the iSCSI Initiator information is configured from DHCP. Otherwise, the iSCSI initiator information must be statically configured.

### AttributeRegistry

**JSONPath**: `/AttributeRegistry` (read only string)

This object represents the type property. It represents the schema used for the resource and indicates the version of the schema in the format <schema>.<majorversion>.<minorversion>.<errataversion>.

### iSCSIInitiatorName

**JSONPath**: `/iSCSIInitiatorName` (PATCHable string)

The worldwide unique iSCSI Qualified Name (IQN) of this iSCSI Initiator. Only IQN format is accepted. EUI format is not supported (for example, 'iqn.1986-03.com.hp:init.sn-123456').

## LogEntry
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/logservices/iml/entries/{item}`

> * `https://{iLO}/redfish/v1/managers/{item}/logservices/iel/entries/{item}`

### Created

**JSONPath**: `/Created` (read only string)

The date and time when the log entry was created, for example, 2014-04-15T00:38:00Z.

### Code

**JSONPath**: `/Oem/Hp/Code` (read only integer)

The IML event code.

### Class

**JSONPath**: `/Oem/Hp/Class` (read only integer)

The IML event class.

### OemRecordFormat

**JSONPath**: `/OemRecordFormat` (read only enumeration)

The format of an OEM record.

**Defined values**:

* `Hp-IML`

* `Hp-iLOEventLog`

### Number

**JSONPath**: `/Number` (read only integer)

The number of duplicate log entries, with the possible exception of timestamps, that are not in the collection.

### RecordId

**JSONPath**: `/RecordId` (read only integer)

The log entry ID.

### Updated

**JSONPath**: `/Oem/Hp/Updated` (read only string)

The date and time of the latest log entry update, for example, 2014-04-15T00:38:00Z.

### Message

**JSONPath**: `/Message` (read only string)

The log entry details.

### Repaired

**JSONPath**: `/Oem/Hp/Repaired` (PATCHable boolean)

The repaired status of the IML event.

> example PATCH: {"Oem": {"Hp": {"Repaired": true}}}

### EntryType

**JSONPath**: `/EntryType` (read only enumeration)

The log entry type.

**Defined values**:

* `Oem`

### Severity

**JSONPath**: `/Severity` (read only enumeration)

The log entry severity.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

## LogService
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/systems/{item}/logservices/iml`

> * `https://{iLO}/redfish/v1/managers/{item}/logservices/iel`

### OverWritePolicy

**JSONPath**: `/OverWritePolicy` (read only enumeration)

When the log is full, the overwrite policy is enforced.

**Defined values**:

* `Unknown`

* `WrapsWhenFull`

* `NeverOverwrites`

### MaxNumberOfRecords

**JSONPath**: `/MaxNumberOfRecords` (read only integer)

The maximum number of log entries.

## Manager
This is the schema definition for a manager.  Examples of managers are BMCs, Enclosure Managers, Management Controllers and other subsystems assigned manageability functions.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}`

### SerialCLIStatus

**JSONPath**: `/Oem/Hp/SerialCLIStatus` (PATCHable enumeration)

Status of serial command line interface.

> example PATCH: {"Oem": {"Hp": {"SerialCLIStatus": "EnabledNoAuth"}}}

**Defined values**:

* `Disabled`

* `EnabledNoAuth`

* `EnabledAuthReq`

### Redundancy.Status.State

**JSONPath**: `/Redundancy/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Firmware.Backup.BuildNumber

**JSONPath**: `/Oem/Hp/Firmware/Backup/BuildNumber` (read only integer)

The build number of the firmware.

### SerialConsole.MaxConcurrentSessions

**JSONPath**: `/SerialConsole/MaxConcurrentSessions` (read only integer)

This is the maximum number of Serial Console sessions, regardless of protocol, that this manager supports.

### GraphicalConsole.Enabled

**JSONPath**: `/GraphicalConsole/Enabled` (PATCHable boolean)

Indicates if the Graphical Console service is enabled for this manager.

> example PATCH: {"GraphicalConsole": {"Enabled": true}}

### Firmware.Bootblock.Family

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/Family` (read only string)

The family of the firmware.

### FederationConfig.MulticastTimeToLive

**JSONPath**: `/Oem/Hp/FederationConfig/MulticastTimeToLive` (PATCHable integer)

The maximum number of switches a multicast announcement will traverse before being discarded.

> example PATCH: {"Oem": {"Hp": {"FederationConfig": {"MulticastTimeToLive": &lt;integer-value&gt;}}}}

### Firmware.Backup.Time

**JSONPath**: `/Oem/Hp/Firmware/Backup/Time` (read only string)

The build time of the firmware.

### Firmware.Current.BuildNumber

**JSONPath**: `/Oem/Hp/Firmware/Current/BuildNumber` (read only integer)

The build number of the firmware.

### GraphicalConsole.MaxConcurrentSessions

**JSONPath**: `/GraphicalConsole/MaxConcurrentSessions` (read only integer)

Indicates the maximum number of Graphical Console sessions, regardless of protocol, this manager supports.

### Firmware.Bootblock.DebugBuild

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### Firmware.Current.MinorVersion

**JSONPath**: `/Oem/Hp/Firmware/Current/MinorVersion` (read only integer)

The minor version of the firmware.

### License.LicenseString

**JSONPath**: `/Oem/Hp/License/LicenseString` (read only string)

Describes the type of license installed on management processor.

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

### Firmware.definitions.HpFWVersion.BuildNumber

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/BuildNumber` (read only integer)

The build number of the firmware.

### Redundancy.MinNumNeeded

**JSONPath**: `/Redundancy/MinNumNeeded` (read only integer)

The minimum number of members allowed in the redundancy group for the current redundancy mode to still be fault tolerant.

### Firmware.Current.VersionString

**JSONPath**: `/Oem/Hp/Firmware/Current/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### RequiredLoginForiLORBSU

**JSONPath**: `/Oem/Hp/RequiredLoginForiLORBSU` (PATCHable boolean)

Determines whether a user-credential prompt is displayed when a user accesses the iLO RBSU or the iLO 4 Configuration Utility. The following settings are valid: Enabled-A login dialog box opens when a user accesses the iLO RBSU or the iLO 4 Configuration Utility. Disabled (default)-No login is required when a user accesses the iLO RBSU or the iLO 4 Configuration Utility.

> example PATCH: {"Oem": {"Hp": {"RequiredLoginForiLORBSU": true}}}

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### links.VSPLogLocation.extref

**JSONPath**: `/Oem/Hp/links/VSPLogLocation/extref` (read only string)

The URI of an external resource.

### links.FederationDispatch.extref

**JSONPath**: `/Oem/Hp/links/FederationDispatch/extref` (read only string)

The URI of an external resource.

### Firmware.Pending.MajorVersion

**JSONPath**: `/Oem/Hp/Firmware/Pending/MajorVersion` (read only integer)

The major version of the firmware.

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Model

**JSONPath**: `/Model` (read only string)

Model name of the manager.

### Firmware.Current.Time

**JSONPath**: `/Oem/Hp/Firmware/Current/Time` (read only string)

The build time of the firmware.

### ManagerType

**JSONPath**: `/ManagerType` (read only enumeration)

This property is the manager type for this resource.

**Defined values**:

* `ManagementController`

* `EnclosureManager`

* `BMC`

### FederationConfig.MulticastDiscovery

**JSONPath**: `/Oem/Hp/FederationConfig/MulticastDiscovery` (PATCHable enumeration)

Enables or Disables Multicast Discovery for the local iLO system.

> example PATCH: {"Oem": {"Hp": {"FederationConfig": {"MulticastDiscovery": "Disabled"}}}}

**Defined values**:

* `Enabled`

* `Disabled`

### License.LicenseKey

**JSONPath**: `/Oem/Hp/License/LicenseKey` (read only string)

The installed license key.

### CommandShell.MaxConcurrentSessions

**JSONPath**: `/CommandShell/MaxConcurrentSessions` (read only integer)

This is the maximum number of Command Shell sessions, regardless of protocol, that this manager supports.

### iLOSelfTestResults[array-item].Notes

**JSONPath**: `/Oem/Hp/iLOSelfTestResults/(array index)/Notes` (read only string)

Additional Information (if any) about the Self Test.

### License.LicenseType

**JSONPath**: `/Oem/Hp/License/LicenseType` (read only string)

Indicates whether the license is Perpetual or Evaluation.

### Firmware.definitions.HpFWVersion.Time

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/Time` (read only string)

The build time of the firmware.

### iLOSelfTestResults[array-item].Status

**JSONPath**: `/Oem/Hp/iLOSelfTestResults/(array index)/Status` (read only enumeration)

Status of the Self Test.

**Defined values**:

* `NA`

* `OK`

* `Informational`

* `Degraded`

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Firmware.definitions.HpFWVersion.DebugBuild

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### Firmware.Pending.BuildNumberString

**JSONPath**: `/Oem/Hp/Firmware/Pending/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### Firmware.Backup.MajorVersion

**JSONPath**: `/Oem/Hp/Firmware/Backup/MajorVersion` (read only integer)

The major version of the firmware.

### SerialCLISpeed

**JSONPath**: `/Oem/Hp/SerialCLISpeed` (PATCHable integer)

Serial command line interface speed in bits/second.

> example PATCH: {"Oem": {"Hp": {"SerialCLISpeed": &lt;integer-value&gt;}}}

### Redundancy.MaxNumSupported

**JSONPath**: `/Redundancy/MaxNumSupported` (read only integer)

The maximum number of members allowed in the redundancy group, including this member.

### Firmware.Bootblock.MajorVersion

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/MajorVersion` (read only integer)

The major version of the firmware.

### FederationConfig.MulticastAnnouncementInterval

**JSONPath**: `/Oem/Hp/FederationConfig/MulticastAnnouncementInterval` (PATCHable integer)

The frequency in Seconds at which the iLO system announces itself on the network. A value of 0 disables multicast announcments.

> example PATCH: {"Oem": {"Hp": {"FederationConfig": {"MulticastAnnouncementInterval": &lt;integer-value&gt;}}}}

### Firmware.Current.BuildNumberString

**JSONPath**: `/Oem/Hp/Firmware/Current/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### CommandShell.Enabled

**JSONPath**: `/CommandShell/Enabled` (PATCHable boolean)

Indicates if the Command Shell service is enabled for this manager.

> example PATCH: {"CommandShell": {"Enabled": true}}

### Firmware.Bootblock.VersionString

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### Firmware.Backup.VersionString

**JSONPath**: `/Oem/Hp/Firmware/Backup/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### Firmware.Pending.BuildNumber

**JSONPath**: `/Oem/Hp/Firmware/Pending/BuildNumber` (read only integer)

The build number of the firmware.

### Firmware.definitions.FWVersion.VersionString

**JSONPath**: `/Firmware/definitions/FWVersion/VersionString` (read only string)

This string represents the version of the firmware image.

### FederationConfig.iLOFederationManagement

**JSONPath**: `/Oem/Hp/FederationConfig/iLOFederationManagement` (PATCHable enumeration)

Enables or Disables iLO Federation features for the local iLO system.

> example PATCH: {"Oem": {"Hp": {"FederationConfig": {"iLOFederationManagement": "Disabled"}}}}

**Defined values**:

* `Enabled`

* `Disabled`

### Firmware.Pending.Date

**JSONPath**: `/Oem/Hp/Firmware/Pending/Date` (read only string)

The build date of the firmware.

### Firmware.Pending.MinorVersion

**JSONPath**: `/Oem/Hp/Firmware/Pending/MinorVersion` (read only integer)

The minor version of the firmware.

### SerialConsole.Enabled

**JSONPath**: `/SerialConsole/Enabled` (PATCHable boolean)

Indicates if the Serial Console service is enabled for this manager.

> example PATCH: {"SerialConsole": {"Enabled": true}}

### Firmware.Pending.Family

**JSONPath**: `/Oem/Hp/Firmware/Pending/Family` (read only string)

The family of the firmware.

### Firmware.Backup.MinorVersion

**JSONPath**: `/Oem/Hp/Firmware/Backup/MinorVersion` (read only integer)

The minor version of the firmware.

### Firmware.definitions.HpFWVersion.VersionString

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### Firmware.Current.VersionString

**JSONPath**: `/Firmware/Current/VersionString` (read only string)

This string represents the version of the firmware image.

### Redundancy.Status.Health

**JSONPath**: `/Redundancy/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### FederationConfig.IPv6MulticastScope

**JSONPath**: `/Oem/Hp/FederationConfig/IPv6MulticastScope` (PATCHable enumeration)

The IPv6 network scope of multicast announcements.

> example PATCH: {"Oem": {"Hp": {"FederationConfig": {"IPv6MulticastScope": "Site"}}}}

**Defined values**:

* `Link`

* `Site`

* `Organization`

### Redundancy.Status.HealthRollUp

**JSONPath**: `/Redundancy/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Firmware.Current.Family

**JSONPath**: `/Oem/Hp/Firmware/Current/Family` (read only string)

The family of the firmware.

### UUID

**JSONPath**: `/UUID` (read only string)

This is a universally unique identifier that software (for example, HP SIM) uses to uniquely identify this manager. The UUID is assigned when the system is manufactured.

### Firmware.definitions.HpFWVersion.MinorVersion

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/MinorVersion` (read only integer)

The minor version of the firmware.

### Firmware.Backup.BuildNumberString

**JSONPath**: `/Oem/Hp/Firmware/Backup/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### Firmware.Current.DebugBuild

**JSONPath**: `/Oem/Hp/Firmware/Current/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### Firmware.Pending.DebugBuild

**JSONPath**: `/Oem/Hp/Firmware/Pending/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### Firmware.definitions.HpFWVersion.MajorVersion

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/MajorVersion` (read only integer)

The major version of the firmware.

### Firmware.definitions.HpFWVersion.Date

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/Date` (read only string)

The build date of the firmware.

### Firmware.Bootblock.MinorVersion

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/MinorVersion` (read only integer)

The minor version of the firmware.

### VSPLogDownloadEnabled

**JSONPath**: `/Oem/Hp/VSPLogDownloadEnabled` (PATCHable boolean)

This property enables or disables download of Virtual Serial Port (VSP) log.

> example PATCH: {"Oem": {"Hp": {"VSPLogDownloadEnabled": true}}}

### Firmware.Bootblock.BuildNumberString

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### Redundancy.Mode

**JSONPath**: `/Redundancy/Mode` (read only enumeration)

This is the redundancy mode of the group.  Failover indicates a master/subordinate type arrangement where status indicates the role of this manager.  N+1 indicates an arrangement where the redundancy set needs MaxNumSupported-1 number of resources in order to be redundant.  Load Balanced indicates all members are active. However, their functionality is not independent of each other. Their functioning is determined by some sort of load balancing algorithm and sparing is implied (i.e. each member can be a spare for the others).  Sparing indicates that all members are active and are aware of each other. However, their functionality is independent until failover. Each member can be a spare for the other(s).  Limited Sparing indicates that all members are active, and they may or may not be aware of each and they are not spares for each other.

**Defined values**:

* `Failover`

* `N+1`

* `LoadBalanced`

* `Sparing`

* `LimitedSparing`

### Firmware.Pending.VersionString

**JSONPath**: `/Oem/Hp/Firmware/Pending/VersionString` (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

### Firmware.Bootblock.Time

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/Time` (read only string)

The build time of the firmware.

### Firmware.Current.Date

**JSONPath**: `/Oem/Hp/Firmware/Current/Date` (read only string)

The build date of the firmware.

### Firmware.Backup.Family

**JSONPath**: `/Oem/Hp/Firmware/Backup/Family` (read only string)

The family of the firmware.

### Firmware.definitions.HpFWVersion.Family

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/Family` (read only string)

The family of the firmware.

### Firmware.Backup.DebugBuild

**JSONPath**: `/Oem/Hp/Firmware/Backup/DebugBuild` (read only boolean)

True if the firmware is a debug build; False if it is not.

### Firmware.Backup.Date

**JSONPath**: `/Oem/Hp/Firmware/Backup/Date` (read only string)

The build date of the firmware.

### Firmware.Current.MajorVersion

**JSONPath**: `/Oem/Hp/Firmware/Current/MajorVersion` (read only integer)

The major version of the firmware.

### Firmware.Pending.Time

**JSONPath**: `/Oem/Hp/Firmware/Pending/Time` (read only string)

The build time of the firmware.

### Firmware.definitions.HpFWVersion.BuildNumberString

**JSONPath**: `/Oem/Hp/Firmware/definitions/HpFWVersion/BuildNumberString` (read only string)

The string version of the build number of the firmware.

### Firmware.Bootblock.Date

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/Date` (read only string)

The build date of the firmware.

### Firmware.Bootblock.BuildNumber

**JSONPath**: `/Oem/Hp/Firmware/Bootblock/BuildNumber` (read only integer)

The build number of the firmware.

## ManagerAccount
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/accountservice/accounts/{item}`

### Privileges.VirtualPowerAndResetPriv

**JSONPath**: `/Oem/Hp/Privileges/VirtualPowerAndResetPriv` (PATCHable boolean)

This privilege enables a user to power-cycle or reset the host system. These activities interrupt system availability. A user with this privilege can diagnose the system by using the Generate NMI to System button.

> example PATCH: {"Oem": {"Hp": {"Privileges": {"VirtualPowerAndResetPriv": true}}}}

### LoginName

**JSONPath**: `/Oem/Hp/LoginName` (PATCHable string)

Descriptive login name that helps to easily identify the owner of each user name. The login name does not have to be the same as the user name and must use printable characters. The maximum length for a user name is 39 characters.

> example PATCH: {"Oem": {"Hp": {"LoginName": "&lt;string-value&gt;"}}}

### Password

**JSONPath**: `/Password` (PATCHable string)

The password used to log in to the management processor. The maximum length for a password is 39 characters. The minimum length for a password is specified in the MinPasswordLength property of the AccountService schema.

> example PATCH: {"Password": "&lt;string-value&gt;"}

### Privileges.LoginPriv

**JSONPath**: `/Oem/Hp/Privileges/LoginPriv` (PATCHable boolean)

This privilege enables a user to log in to management processor. All local accounts have the login privilege. This privilege is added automatically if it is not specified.

> example PATCH: {"Oem": {"Hp": {"Privileges": {"LoginPriv": true}}}}

### UserName

**JSONPath**: `/UserName` (PATCHable string)

The name used to log in to the management processor. The user name does not have to be the same as the login name. The maximum length for the user name is 39 characters. The user name must use printable characters.

> example PATCH: {"UserName": "&lt;string-value&gt;"}

### Privileges.UserConfigPriv

**JSONPath**: `/Oem/Hp/Privileges/UserConfigPriv` (PATCHable boolean)

This privilege enables a user to add, edit, and delete local management processor user accounts. A user with this privilege can change privileges for all users.

> example PATCH: {"Oem": {"Hp": {"Privileges": {"UserConfigPriv": true}}}}

### Privileges.RemoteConsolePriv

**JSONPath**: `/Oem/Hp/Privileges/RemoteConsolePriv` (PATCHable boolean)

This privilege enables a user to remotely access the host system Remote Console, including video, keyboard, and mouse control.

> example PATCH: {"Oem": {"Hp": {"Privileges": {"RemoteConsolePriv": true}}}}

### Privileges.iLOConfigPriv

**JSONPath**: `/Oem/Hp/Privileges/iLOConfigPriv` (PATCHable boolean)

This privilege enables a user to configure most management processor settings, including security settings, and to remotely update the management processor firmware. This privilege does not enable local user account administration.

> example PATCH: {"Oem": {"Hp": {"Privileges": {"iLOConfigPriv": true}}}}

### Privileges.VirtualMediaPriv

**JSONPath**: `/Oem/Hp/Privileges/VirtualMediaPriv` (PATCHable boolean)

This privilege enables a user to use the Virtual Media feature on the host system.

> example PATCH: {"Oem": {"Hp": {"Privileges": {"VirtualMediaPriv": true}}}}

## ManagerNetworkService
This resource is used to obtain or modify the network services managed by this manager.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/networkservice`

### HPSystemManagementHomepageAddress

**JSONPath**: `/Oem/Hp/HPSystemManagementHomepageAddress` (PATCHable string)

The IP address or FQDN of the HP System Management Homepage (HP SMH) server.

> example PATCH: {"Oem": {"Hp": {"HPSystemManagementHomepageAddress": "&lt;string-value&gt;"}}}

### SNMP.Enabled

**JSONPath**: `/SNMP/Enabled` (PATCHable boolean)

Indicates whether SNMP is enabled for the manager.

> example PATCH: {"SNMP": {"Enabled": true}}

### IPMI.Port

**JSONPath**: `/IPMI/Port` (read only integer)

The IPMI over LAN port number.

### SSH.Enabled

**JSONPath**: `/SSH/Enabled` (PATCHable boolean)

Indicates whether SSH is enabled for the manager.  NOTE: When this field is modified, the Manager will reset automatically.

> example PATCH: {"SSH": {"Enabled": true}}

### SSDP.Port

**JSONPath**: `/SSDP/Port` (read only integer)

The SSDP port number.

### SSH.Port

**JSONPath**: `/SSH/Port` (PATCHable integer)

The SSH port number.  NOTE: When this field is modified, the Manager will reset automatically.

> example PATCH: {"SSH": {"Port": &lt;integer-value&gt;}}

### ConfigurationSettings

**JSONPath**: `/Oem/Hp/ConfigurationSettings` (read only enumeration)

State of the currently displayed configuration settings.

**Defined values**:

* `Current`

* `SomePendingReset`

### IPMI.Enabled

**JSONPath**: `/IPMI/Enabled` (PATCHable boolean)

Indicates whether IPMI over LAN is enabled for the manager.

> example PATCH: {"IPMI": {"Enabled": true}}

### EnforceAES3DESEncryption

**JSONPath**: `/Oem/Hp/EnforceAES3DESEncryption` (PATCHable boolean)

Indicates whether AES/3DES encryption is enforced for the management processor.  When enabled, the management processor accepts only those connections that use AES or 3DES ciphers. The management processor will automatically reset when this field is modified.

> example PATCH: {"Oem": {"Hp": {"EnforceAES3DESEncryption": true}}}

### SessionTimeoutMinutes

**JSONPath**: `/SessionTimeoutMinutes` (PATCHable integer)

The session timeout (minutes). A zero value indicates infinite timeout.

> example PATCH: {"SessionTimeoutMinutes": &lt;integer-value&gt;}

### FederationEnabled

**JSONPath**: `/Oem/Hp/FederationEnabled` (PATCHable boolean)

Indicates whether management processor federation management is enabled or disabled.

> example PATCH: {"Oem": {"Hp": {"FederationEnabled": true}}}

### AlertMailSenderDomain

**JSONPath**: `/Oem/Hp/AlertMailSenderDomain` (PATCHable string)

The domain name for the sender email address.

> example PATCH: {"Oem": {"Hp": {"AlertMailSenderDomain": "&lt;string-value&gt;"}}}

### SSDP.NotifyMulticastIntervalSeconds

**JSONPath**: `/SSDP/NotifyMulticastIntervalSeconds` (PATCHable integer)

Indicates how often multicast is performed for SSDP.

> example PATCH: {"SSDP": {"NotifyMulticastIntervalSeconds": &lt;integer-value&gt;}}

### RemoteSyslogServer

**JSONPath**: `/Oem/Hp/RemoteSyslogServer` (PATCHable string)

The IP address, FQDN, IPv6 name, or short name of the server running the Syslog service.

> example PATCH: {"Oem": {"Hp": {"RemoteSyslogServer": "&lt;string-value&gt;"}}}

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### AlertMailSMTPServer

**JSONPath**: `/Oem/Hp/AlertMailSMTPServer` (PATCHable string)

The IP address or DNS name of the SMTP server or the Mail Submission Agent (MSA).

> example PATCH: {"Oem": {"Hp": {"AlertMailSMTPServer": "&lt;string-value&gt;"}}}

### HTTP.Enabled

**JSONPath**: `/HTTP/Enabled` (read only boolean)

Indicates whether HTTP is enabled or disabled.

### FederationSupported

**JSONPath**: `/Oem/Hp/FederationSupported` (read only boolean)

Indicates whether management processor federation is supported.

### VirtualMedia.Port

**JSONPath**: `/VirtualMedia/Port` (PATCHable integer)

The Virtual Media port number.

> example PATCH: {"VirtualMedia": {"Port": &lt;integer-value&gt;}}

### AlertMailSMTPPort

**JSONPath**: `/Oem/Hp/AlertMailSMTPPort` (PATCHable integer)

The SMTP server port number.

> example PATCH: {"Oem": {"Hp": {"AlertMailSMTPPort": &lt;integer-value&gt;}}}

### XMLResponseEnabled

**JSONPath**: `/Oem/Hp/XMLResponseEnabled` (PATCHable boolean)

Determines whether management processor responds to anonymous XML discovery requests.

> example PATCH: {"Oem": {"Hp": {"XMLResponseEnabled": true}}}

### FQDN

**JSONPath**: `/FQDN` (read only string)

The fully-qualified domain name of the manager that is obtained by DNS and includes the host name and top-level domain name.

### KVMIP.Enabled

**JSONPath**: `/KVMIP/Enabled` (read only boolean)

Indicates whether KVM-IP is enabled for the manager.

### AlertMailEnabled

**JSONPath**: `/Oem/Hp/AlertMailEnabled` (PATCHable boolean)

Indicates whether AlertMail is enabled. This can be enabled only when the properties AlertMailEmail, AlertMailSenderDomain and AlertMailSMTPServer are set or not empty.

> example PATCH: {"Oem": {"Hp": {"AlertMailEnabled": true}}}

### HTTPS.Enabled

**JSONPath**: `/HTTPS/Enabled` (read only boolean)

Indicates whether HTTPS/SSL is enabled or disabled.

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### HostName

**JSONPath**: `/HostName` (PATCHable string)

The host name of the manager that is obtained by DNS and does not include any domain information.

> example PATCH: {"HostName": "&lt;string-value&gt;"}

### SNMP.Port

**JSONPath**: `/SNMP/Port` (PATCHable integer)

The SNMP port number.

> example PATCH: {"SNMP": {"Port": &lt;integer-value&gt;}}

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### RemoteSyslogEnabled

**JSONPath**: `/Oem/Hp/RemoteSyslogEnabled` (PATCHable boolean)

Indicates whether Remote Syslog is enabled. When enabled, management processor sends notification messages to the specified Syslog server. This can be enabled only when the property RemoteSyslogServer is set or not empty.

> example PATCH: {"Oem": {"Hp": {"RemoteSyslogEnabled": true}}}

### SSDP.NotifyIPv6Scope

**JSONPath**: `/SSDP/NotifyIPv6Scope` (PATCHable enumeration)

The scope for IPv6 Notify messages for SSDP.

> example PATCH: {"SSDP": {"NotifyIPv6Scope": "Site"}}

**Defined values**:

* `Link`

* `Site`

* `Organization`

### SSDP.NotifyTTL

**JSONPath**: `/SSDP/NotifyTTL` (PATCHable integer)

The Time to Live (TTL) hop count for SSDP Notify messages.

> example PATCH: {"SSDP": {"NotifyTTL": &lt;integer-value&gt;}}

### HTTP.Port

**JSONPath**: `/HTTP/Port` (PATCHable integer)

The HTTP port number.  NOTE: When this field is modified, the Manager will reset automatically.

> example PATCH: {"HTTP": {"Port": &lt;integer-value&gt;}}

### KVMIP.Port

**JSONPath**: `/KVMIP/Port` (PATCHable integer)

The KVM-IP port number.

> example PATCH: {"KVMIP": {"Port": &lt;integer-value&gt;}}

### SSDP.Enabled

**JSONPath**: `/SSDP/Enabled` (PATCHable boolean)

Indicates whether SSDP is enabled for the manager.

> example PATCH: {"SSDP": {"Enabled": true}}

### AlertMailEmail

**JSONPath**: `/Oem/Hp/AlertMailEmail` (PATCHable string)

The destination email address for email alerts.

> example PATCH: {"Oem": {"Hp": {"AlertMailEmail": "&lt;string-value&gt;"}}}

### SNMPTrapPort

**JSONPath**: `/Oem/Hp/SNMPTrapPort` (PATCHable integer)

The SNMP trap port number.

> example PATCH: {"Oem": {"Hp": {"SNMPTrapPort": &lt;integer-value&gt;}}}

### HTTPS.Port

**JSONPath**: `/HTTPS/Port` (PATCHable integer)

The HTTPS/SSL port number.  NOTE: When this field is modified, the Manager will reset automatically.

> example PATCH: {"HTTPS": {"Port": &lt;integer-value&gt;}}

### VirtualMedia.Enabled

**JSONPath**: `/VirtualMedia/Enabled` (read only boolean)

Indicates whether Virtual Media is enabled for the manager.

### SerialOverLanLogging

**JSONPath**: `/Oem/Hp/SerialOverLanLogging` (PATCHable boolean)

Indicates whether Serial Over LAN (SOL) or Virtual Serial Port (VSP) logging is enabled.

> example PATCH: {"Oem": {"Hp": {"SerialOverLanLogging": true}}}

### RemoteSyslogPort

**JSONPath**: `/Oem/Hp/RemoteSyslogPort` (PATCHable integer)

The port number through which the Syslog server is listening.

> example PATCH: {"Oem": {"Hp": {"RemoteSyslogPort": &lt;integer-value&gt;}}}

## PowerMetrics
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/chassis/{item}/power`

### PowerLimit.CorrectionInMs

**JSONPath**: `/PowerLimit/CorrectionInMs` (read only integer)

Time in milliseconds that it takes for the limiting process to react and correct the power consumption below the limit.

### PowerSupplies[array-item].Oem.Hp.iPDU.MacAddress

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/iPDU/MacAddress` (read only string)

The Ethernet MAC address of the iPDU connected to this power supply.

### PowerSupplies[array-item].Oem.Hp.iPDU.SerialNumber

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/iPDU/SerialNumber` (read only string)

The serial number of the iPDU connected to this power supply.

### PowerSupplies[array-item].Oem.Hp.Mismatched

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/Mismatched` (read only boolean)

If true, this power supply is mismatched with others in the system.

### PowerSupplies[array-item].Status.HealthRollUp

**JSONPath**: `/PowerSupplies/(array index)/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### PowerCapacityWatts

**JSONPath**: `/PowerCapacityWatts` (read only integer)

The total power (Watts) available to the chassis from all power supplies (adjusting for redundancy settings).

### PowerConsumedWatts

**JSONPath**: `/PowerConsumedWatts` (read only integer)

The latest observed power (Watts) being drawn by this chassis. The update interval may vary depending upon implementation but is usually measured in seconds.

### PowerAllocatedWatts

**JSONPath**: `/PowerAllocatedWatts` (read only integer)

The total power (Watts) allocated to the chassis.

### PowerSupplies[array-item].Oem.Hp.iPDU.IPAddress

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/iPDU/IPAddress` (read only string)

The IP address of the iPDU connected to this power supply.

### PowerSupplies[array-item].FirmwareVersion

**JSONPath**: `/PowerSupplies/(array index)/FirmwareVersion` (read only string)

The power supply firmware version.

### PowerSupplies[array-item].Oem.Hp.iPDU.Model

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/iPDU/Model` (read only string)

The model number of the iPDU connected to this power supply.

### PowerMetrics.AverageConsumedWatts

**JSONPath**: `/PowerMetrics/AverageConsumedWatts` (read only integer)

The average power consumed during the interval specified by 'IntervalInMin'.

### PowerSupplies[array-item].CorrelatableID

**JSONPath**: `/PowerSupplies/(array index)/CorrelatableID` (read only string)

CorrelatableID for this power supply.

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### PowerLimit.CorrelatableID

**JSONPath**: `/PowerLimit/CorrelatableID` (read only string)

The value of this property shall represent a reference to the resource that is being limited.

### PowerSupplies[array-item].Model

**JSONPath**: `/PowerSupplies/(array index)/Model` (read only string)

The power supply model name.

### PowerMetrics.MinConsumedWatts

**JSONPath**: `/PowerMetrics/MinConsumedWatts` (read only integer)

The minimum power consumed during the interval specified by 'IntervalInMin'.

### PowerMetrics.IntervalInMin

**JSONPath**: `/PowerMetrics/IntervalInMin` (read only integer)

The interval between power metric evaluation in minutes.

### PowerSupplies[array-item].PowerSupplyType

**JSONPath**: `/PowerSupplies/(array index)/PowerSupplyType` (read only enumeration)

The power supply type: AC, DC, or Unknown.

**Defined values**:

* `Unknown`

* `AC`

* `DC`

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

### PowerLimit.LimitException

**JSONPath**: `/PowerLimit/LimitException` (PATCHable enumeration)

Action that is taken if the power cannot be maintained below the LimitInWatts.

> example PATCH: {"PowerLimit": {"LimitException": "LogEventOnly"}}

**Defined values**:

* `NoAction`

* `HardPowerOff`

* `LogEventOnly`

* `Oem`

### PowerLimit.LimitInWatts

**JSONPath**: `/PowerLimit/LimitInWatts` (PATCHable integer)

The Power (Watts) limit (also known as 'Power Cap'). Set to null to disable the power cap.

> example PATCH: {"PowerLimit": {"LimitInWatts": &lt;integer-value&gt;}}

### PowerSupplies[array-item].SparePartNumber

**JSONPath**: `/PowerSupplies/(array index)/SparePartNumber` (read only string)

The power supply spare part number.

### PowerAvailableWatts

**JSONPath**: `/PowerAvailableWatts` (read only integer)

Amount of power (Watts) not already budgeted and therefore available for additional allocation. (PowerCapacity - PowerAllocated).  This indicates how much reserve power capacity is left.

### SNMPPowerThresholdAlert.Trigger

**JSONPath**: `/Oem/Hp/SNMPPowerThresholdAlert/Trigger` (PATCHable enumeration)

Trigger determines whether alerts are based on peak power consumption, average power consumption, or if they are disabled. Trigger property can only be enabled if the ThresholdWatts and DurationInMin values are specified/configured.

> example PATCH: {"Oem": {"Hp": {"SNMPPowerThresholdAlert": {"Trigger": "AveragePowerConsumption"}}}}

**Defined values**:

* `Disabled`

* `AveragePowerConsumption`

* `PeakPowerConsumption`

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### PowerSupplies[array-item].LineInputVoltageType

**JSONPath**: `/PowerSupplies/(array index)/LineInputVoltageType` (read only enumeration)

Line voltage type: ACLowLine, ACMidLine, ACHighLine, DCNeg48V, DC420V, or Unknown.

**Defined values**:

* `Unknown`

* `ACLowLine`

* `ACMidLine`

* `ACHighLine`

* `DCNeg48V`

* `HighVoltageDC`

### PowerSupplies[array-item].Oem.Hp.iPDUCapable

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/iPDUCapable` (read only boolean)

If true, this power supply is capable of being connected to an iPDUs.

### PowerSupplies[array-item].SerialNumber

**JSONPath**: `/PowerSupplies/(array index)/SerialNumber` (read only string)

The power supply serial number.

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### PowerSupplies[array-item].Oem.Hp.MaxPowerOutputWatts

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/MaxPowerOutputWatts` (read only integer)

The latest observed maximum output power being drawn by the power supply (Watts). This is usually updated every 10 seconds but the period can vary in some circumstances.

### PowerSupplies[array-item].PartNumber

**JSONPath**: `/PowerSupplies/(array index)/PartNumber` (read only string)

The power supply part number.

### PowerSupplies[array-item].Status.Health

**JSONPath**: `/PowerSupplies/(array index)/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### PowerSupplies[array-item].PowerCapacityWatts

**JSONPath**: `/PowerSupplies/(array index)/PowerCapacityWatts` (read only integer)

The power capacity of the power supply, in Watts.

### SNMPPowerThresholdAlert.DurationInMin

**JSONPath**: `/Oem/Hp/SNMPPowerThresholdAlert/DurationInMin` (PATCHable integer)

Sets the length of time, in minutes, that power consumption must remain above the warning threshold before an SNMP alert is triggered. The maximum duration is 240 minutes, and the duration must be a multiple of 5.

> example PATCH: {"Oem": {"Hp": {"SNMPPowerThresholdAlert": {"DurationInMin": &lt;integer-value&gt;}}}}

### PowerRequestedWatts

**JSONPath**: `/PowerRequestedWatts` (read only integer)

Potential power (Watts) that the chassis is requesting that might be higher than the current level being consumed. This is because the requested power includes budget that the chassis has reserved for future use.

### PowerSupplies[array-item].Status.State

**JSONPath**: `/PowerSupplies/(array index)/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### PowerSupplies[array-item].LastPowerOutputWatts

**JSONPath**: `/PowerSupplies/(array index)/LastPowerOutputWatts` (read only integer)

The average power (Watts) consumed.

### SNMPPowerThresholdAlert.ThresholdWatts

**JSONPath**: `/Oem/Hp/SNMPPowerThresholdAlert/ThresholdWatts` (PATCHable integer)

Sets the power consumption threshold (watts). If power consumption exceeds this value for the specified time duration, an SNMP alert is triggered.

> example PATCH: {"Oem": {"Hp": {"SNMPPowerThresholdAlert": {"ThresholdWatts": &lt;integer-value&gt;}}}}

### PowerMetrics.MaxConsumedWatts

**JSONPath**: `/PowerMetrics/MaxConsumedWatts` (read only integer)

The maximum power consumed during the interval specified by 'IntervalInMin'.

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

### PowerSupplies[array-item].Oem.Hp.BayNumber

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/BayNumber` (read only integer)

The power supply bay number.

### PowerSupplies[array-item].Oem.Hp.AveragePowerOutputWatts

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/AveragePowerOutputWatts` (read only integer)

The latest observed average power being drawn by the power supply (Watts). This is usually updated every 10 seconds but the period can vary in some circumstances.

### PowerSupplies[array-item].Oem.Hp.HotplugCapable

**JSONPath**: `/PowerSupplies/(array index)/Oem/Hp/HotplugCapable` (read only boolean)

If true, this power supply (and power supply bay) is capable of being hot-plugged.

### PowerSupplies[array-item].LineInputVoltage

**JSONPath**: `/PowerSupplies/(array index)/LineInputVoltage` (read only integer)

Line input voltage at which the power supply is operating at this moment (in Volts).

## ServiceRoot
This object represents the HP RESTful API root service.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1`

### Sessions.LoginHint.HintPOSTData.UserName

**JSONPath**: `/Oem/Hp/Sessions/LoginHint/HintPOSTData/UserName` (read only string)

The user name for logging in to the management processor.

### Time

**JSONPath**: `/Time` (read only string)

The current web service time.

### Manager[array-item].HostName

**JSONPath**: `/Oem/Hp/Manager/(array index)/HostName` (read only string)

The name of management processor.

### Sessions.KerberosEnabled

**JSONPath**: `/Oem/Hp/Sessions/KerberosEnabled` (read only boolean)

Specifies whether Kerberos login is enabled.

### Manager[array-item].FQDN

**JSONPath**: `/Oem/Hp/Manager/(array index)/FQDN` (read only string)

Fully qualified domain name of the management processor.

### Sessions.CertCommonName

**JSONPath**: `/Oem/Hp/Sessions/CertCommonName` (read only string)

The name of the management processor as it appears in the digital certificate when a secure web GUI session is established to the management processor.

### Manager[array-item].ManagerFirmwareVersion

**JSONPath**: `/Oem/Hp/Manager/(array index)/ManagerFirmwareVersion` (read only string)

The major and minor management processor version numbers.

### ServiceVersion

**JSONPath**: `/ServiceVersion` (read only enumeration)

The web service version. This is different from the version of the data model.

**Defined values**:

* `0.9.5`

* `0.91.0`

### Sessions.LoginHint.Hint

**JSONPath**: `/Oem/Hp/Sessions/LoginHint/Hint` (read only string)

The information on how to log in to the management processor.

### Manager[array-item].ManagerType

**JSONPath**: `/Oem/Hp/Manager/(array index)/ManagerType` (read only string)

The type of the service manager.

### Manager[array-item].Blade.RackName

**JSONPath**: `/Oem/Hp/Manager/(array index)/Blade/RackName` (read only string)

Specifies the name of the rack in which the enclosure is present.

### Manager[array-item].Blade.EnclosureName

**JSONPath**: `/Oem/Hp/Manager/(array index)/Blade/EnclosureName` (read only string)

Specifies the name of the enclosure in which the blade is present.

### Manager[array-item].IPManager

**JSONPath**: `/Oem/Hp/Manager/(array index)/IPManager` (read only object)

### Manager[array-item].Languages[array-item].Version

**JSONPath**: `/Oem/Hp/Manager/(array index)/Languages/(array index)/Version` (read only string)

Specifies the version of the management processor in the respective language.

### Sessions.LoginFailureDelay

**JSONPath**: `/Oem/Hp/Sessions/LoginFailureDelay` (read only integer)

The delay (seconds) when a management processor login attempt has failed.

### Sessions.LDAPAuthLicenced

**JSONPath**: `/Oem/Hp/Sessions/LDAPAuthLicenced` (read only boolean)

Specifies whether a valid license is installed for LDAP use.

### Sessions.LocalLoginEnabled

**JSONPath**: `/Oem/Hp/Sessions/LocalLoginEnabled` (read only boolean)

Specifies whether local users can log in.

### Manager[array-item].Languages[array-item].Language

**JSONPath**: `/Oem/Hp/Manager/(array index)/Languages/(array index)/Language` (read only string)

Specifies one of the languages supported by the management processor.

### Sessions.SecurityOverride

**JSONPath**: `/Oem/Hp/Sessions/SecurityOverride` (read only boolean)

Specifies whether the security override switch is enabled.

### Sessions.LDAPEnabled

**JSONPath**: `/Oem/Hp/Sessions/LDAPEnabled` (read only boolean)

Specifies whether LDAP login is enabled.

### Sessions.LoginHint.HintPOSTData.Password

**JSONPath**: `/Oem/Hp/Sessions/LoginHint/HintPOSTData/Password` (read only string)

The password for logging in to the management processor.

### UUID

**JSONPath**: `/UUID` (read only string)

Unique identifier for a service instance.  This value should be an exact match of the UUID value returned in a 200OK from an SSDP M-SEARCH request during discovery.

### Sessions.ServerName

**JSONPath**: `/Oem/Hp/Sessions/ServerName` (read only string)

The name of the server that this management processor is managing.

### Manager[array-item].Languages[array-item].TranslationName

**JSONPath**: `/Oem/Hp/Manager/(array index)/Languages/(array index)/TranslationName` (read only string)

Specifies one of the languages supported by the management processor.

### Manager[array-item].Blade.BayNumber

**JSONPath**: `/Oem/Hp/Manager/(array index)/Blade/BayNumber` (read only string)

Specifies the location of the blade in the enclosure.

### Sessions.SecurityMessage

**JSONPath**: `/Oem/Hp/Sessions/SecurityMessage` (read only string)

The login security banner message that is displayed on the management processor Login page.

### Manager[array-item].DefaultLanguage

**JSONPath**: `/Oem/Hp/Manager/(array index)/DefaultLanguage` (read only string)

Default language used for the Web interface.

### Manager[array-item].ManagerFirmwareVersionPass

**JSONPath**: `/Oem/Hp/Manager/(array index)/ManagerFirmwareVersionPass` (read only string)

The build or pass number of the management processor version.

## Session
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/sessionservice/sessions/{item}`

### Privileges.VirtualPowerAndResetPriv

**JSONPath**: `/Oem/Hp/Privileges/VirtualPowerAndResetPriv` (read only boolean)

This privilege enables a user to power-cycle or reset the host system. These activities interrupt system availability. A user with this privilege can diagnose the system by using the Generate NMI to System button.

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

### UserExpires

**JSONPath**: `/Oem/Hp/UserExpires` (read only string)

User session expire time

### UserAccount

**JSONPath**: `/Oem/Hp/UserAccount` (read only string)

Login details of the user

### Privileges.LoginPriv

**JSONPath**: `/Oem/Hp/Privileges/LoginPriv` (read only boolean)

This privilege enables a user to log in to the management processor. All local accounts have the login privilege. This privilege is added automatically if it is not specified.

### UserIP

**JSONPath**: `/Oem/Hp/UserIP` (read only string)

IP address of the user

### UserName

**JSONPath**: `/UserName` (read only string)

Name to use to log in to the management processor.

### Privileges.UserConfigPriv

**JSONPath**: `/Oem/Hp/Privileges/UserConfigPriv` (read only boolean)

This privilege enables a user to add, edit, and delete local management processor user accounts. A user with this privilege can change privileges for all users.

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

### UserDistinguishedName

**JSONPath**: `/Oem/Hp/UserDistinguishedName` (read only string)

LDAP user is identified by its distinguished name (DN).

### Privileges.RemoteConsolePriv

**JSONPath**: `/Oem/Hp/Privileges/RemoteConsolePriv` (read only boolean)

This privilege enables a user to remotely access the host system Remote Console, including video, keyboard, and mouse control.

### Privileges.iLOConfigPriv

**JSONPath**: `/Oem/Hp/Privileges/iLOConfigPriv` (read only boolean)

This privilege enables a user to configure most management processor settings, including security settings, and to remotely update the management processor firmware. This privilege does not enable local user account administration.

### Privileges.VirtualMediaPriv

**JSONPath**: `/Oem/Hp/Privileges/VirtualMediaPriv` (read only boolean)

This privilege enables a user to use the Virtual Media feature on the host system.

### MySession

**JSONPath**: `/Oem/Hp/MySession` (read only boolean)

Indicates whether this is a session I own.

### AccessTime

**JSONPath**: `/Oem/Hp/AccessTime` (read only string)

User session last-access time

### LoginTime

**JSONPath**: `/Oem/Hp/LoginTime` (read only string)

User session login time

## SnmpService
**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/snmpservice`

### RoleDetail

**JSONPath**: `/RoleDetail` (PATCHable string)

The string of up to 512 characters that describes specific tasks that the server might perform.

> example PATCH: {"RoleDetail": "&lt;string-value&gt;"}

### AlertsEnabled

**JSONPath**: `/AlertsEnabled` (PATCHable boolean)

The alert conditions that the management processor detects independently of the host operating system can be sent to specified SNMP alert destinations, such as HP SIM.

> example PATCH: {"AlertsEnabled": true}

### Users[array-item].SecurityName

**JSONPath**: `/Users/(array index)/SecurityName` (PATCHable string)

The user profile name. Enter an alphanumeric string of 1 to 32 characters.

> example PATCH: {"Users": [{"SecurityName": "&lt;string-value&gt;"}|null, ...]}

### Mode

**JSONPath**: `/Mode` (PATCHable enumeration)

Agentless Management Mode (default): Use SNMP agents running on the management processor to manage the server. SNMP Pass-thru Mode: Use SNMP agents running on the host operating system to manage the server. This setting does not affect alerts.

> example PATCH: {"Mode": "Passthru"}

**Defined values**:

* `Agentless`

* `Passthru`

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### SNMPv1Traps

**JSONPath**: `/SNMPv1Traps` (PATCHable boolean)

When enabled, SNMPv1 traps are sent to the remote management systems configured in the SNMP Alert Destination(s) boxes.

> example PATCH: {"SNMPv1Traps": true}

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Role

**JSONPath**: `/Role` (PATCHable string)

The string of up to 64 characters that describes the server role or function.

> example PATCH: {"Role": "&lt;string-value&gt;"}

### Users[array-item].PrivacyProtocol

**JSONPath**: `/Users/(array index)/PrivacyProtocol` (PATCHable enumeration)

Sets the encryption algorithm to use for encoding the privacy passphrase. A portion of an SNMP message is encrypted before transmission. Select AES (Advanced Encryption Standard) or DES (Data Encryption Standard).

> example PATCH: {"Users": [{"PrivacyProtocol": "AES"}|null, ...]}

**Defined values**:

* `DES`

* `AES`

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

### SNMPColdStartTrapBroadcast

**JSONPath**: `/Oem/Hp/SNMPColdStartTrapBroadcast` (PATCHable boolean)

If set to true, the Cold Start Trap will be enabled. The Cold Start Trap is broadcast to a subnet broadcast address if there are no trap destinations configured in the SNMP Alert Destination(s) boxes.

> example PATCH: {"Oem": {"Hp": {"SNMPColdStartTrapBroadcast": true}}}

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### SNMPv3EngineID

**JSONPath**: `/SNMPv3EngineID` (PATCHable string)

The SNMPv3 Engine ID is the unique identifier of an SNMP engine that belongs to an SNMP agent entity. This value must be a hexadecimal string with an even number of 6 to 32 characters, excluding the first two characters, 0x (for example, 0x01020304abcdef).

> example PATCH: {"SNMPv3EngineID": "&lt;string-value&gt;"}

### Users[array-item].AuthProtocol

**JSONPath**: `/Users/(array index)/AuthProtocol` (PATCHable enumeration)

Sets the message digest algorithm to use for encoding the authorization passphrase. The message digest is calculated over an appropriate portion of an SNMP message, and is included as part of the message sent to the recipient. Select MD5 (Message Digest) or SHA (Secure Hash Algorithm).

> example PATCH: {"Users": [{"AuthProtocol": "SHA"}|null, ...]}

**Defined values**:

* `MD5`

* `SHA`

### SNMPForwardInsightManagerAgentAlerts

**JSONPath**: `/Oem/Hp/SNMPForwardInsightManagerAgentAlerts` (PATCHable boolean)

If set to true, the alert conditions detected by the host management agents are forwarded to SNMP alert destinations through the management processor. These alerts are generated by the Insight Management Agents, which are available for each supported operating system. Insight Management Agents must be installed on the host server to receive these alerts.

> example PATCH: {"Oem": {"Hp": {"SNMPForwardInsightManagerAgentAlerts": true}}}

### Users[array-item].PrivacyPassphrase

**JSONPath**: `/Users/(array index)/PrivacyPassphrase` (PATCHable string)

Sets the passphrase to use for encrypt operations. Enter a value of 8 to 49 characters.

> example PATCH: {"Users": [{"PrivacyPassphrase": "&lt;string-value&gt;"}|null, ...]}

### Location

**JSONPath**: `/Location` (PATCHable string)

The string of up to 49 characters that specifies the physical location of the server.

> example PATCH: {"Location": "&lt;string-value&gt;"}

### Contact

**JSONPath**: `/Contact` (PATCHable string)

The string of up to 49 characters that specifies the system administrator or server owner. The string can include a name, email address, or phone number.

> example PATCH: {"Contact": "&lt;string-value&gt;"}

## ThermalMetrics
The schema definition for the Thermal Metrics. It represents the properties for temperature and cooling.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/chassis/{item}/thermal`

### Temperatures[array-item].MaximumValue

**JSONPath**: `/Temperatures/(array index)/MaximumValue` (read only integer)

Maximum value for CurrentReading.

### Fans[array-item].CorrelatableID

**JSONPath**: `/Fans/(array index)/CorrelatableID` (read only string)

The CorrelatableID for this fan.

### Temperatures[array-item].MinimumValue

**JSONPath**: `/Temperatures/(array index)/MinimumValue` (read only integer)

Minimum value for CurrentReading.

### Fans[array-item].UpperThresholdCritical

**JSONPath**: `/Fans/(array index)/UpperThresholdCritical` (read only integer)

Above normal range but not yet fatal.

### Temperatures[array-item].UpperThresholdFatal

**JSONPath**: `/Temperatures/(array index)/UpperThresholdFatal` (read only integer)

Above normal range and is fatal.

### Temperatures[array-item].Status.State

**JSONPath**: `/Temperatures/(array index)/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Temperatures[array-item].Oem.Hp.LocationYmm

**JSONPath**: `/Temperatures/(array index)/Oem/Hp/LocationYmm` (read only integer)

The location of the sensor, in millimeters, along the Y axis from the logical reference point.

### Fans[array-item].MaximumValue

**JSONPath**: `/Fans/(array index)/MaximumValue` (read only integer)

Maximum value for CurrentReading.

### Temperatures[array-item].LowerThresholdFatal

**JSONPath**: `/Temperatures/(array index)/LowerThresholdFatal` (read only integer)

Below normal range and is fatal.

### Status.HealthRollUp

**JSONPath**: `/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Fans[array-item].Units

**JSONPath**: `/Fans/(array index)/Units` (read only enumeration)

Units for the CurrentReading.

**Defined values**:

* `RPM`

* `Percent`

### Fans[array-item].Status.Health

**JSONPath**: `/Fans/(array index)/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

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

### Fans[array-item].LowerThresholdCritical

**JSONPath**: `/Fans/(array index)/LowerThresholdCritical` (read only integer)

Below normal range but not yet fatal.

### Temperatures[array-item].Status.Health

**JSONPath**: `/Temperatures/(array index)/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Temperatures[array-item].Oem.Hp.LocationXmm

**JSONPath**: `/Temperatures/(array index)/Oem/Hp/LocationXmm` (read only integer)

The location of the sensor, in millimeters, along the X axis from the logical reference point.

### Fans[array-item].UpperThresholdFatal

**JSONPath**: `/Fans/(array index)/UpperThresholdFatal` (read only integer)

Above normal range and is fatal.

### Temperatures[array-item].Units

**JSONPath**: `/Temperatures/(array index)/Units` (read only enumeration)

The temperature sensor's units.

**Defined values**:

* `Celsius`

* `Fahrenheit`

### Fans[array-item].LowerThresholdFatal

**JSONPath**: `/Fans/(array index)/LowerThresholdFatal` (read only integer)

Below normal range and is fatal.

### Status.Health

**JSONPath**: `/Status/Health` (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Fans[array-item].UpperThresholdNonCritical

**JSONPath**: `/Fans/(array index)/UpperThresholdNonCritical` (read only integer)

Above normal range.

### Fans[array-item].FanName

**JSONPath**: `/Fans/(array index)/FanName` (read only string)

The name of the fan sensor.

### Temperatures[array-item].LowerThresholdNonCritical

**JSONPath**: `/Temperatures/(array index)/LowerThresholdNonCritical` (read only integer)

Below normal range.

### Fans[array-item].Status.HealthRollUp

**JSONPath**: `/Fans/(array index)/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Fans[array-item].Status.State

**JSONPath**: `/Fans/(array index)/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Status.State

**JSONPath**: `/Status/State` (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

**Defined values**:

* `Enabled`

* `Disabled`

* `Offline`

* `InTest`

* `Starting`

* `Absent`

### Temperatures[array-item].Number

**JSONPath**: `/Temperatures/(array index)/Number` (read only integer)

A numerical identifier to represent the temperature sensor.

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

### Fans[array-item].LowerThresholdNonCritical

**JSONPath**: `/Fans/(array index)/LowerThresholdNonCritical` (read only integer)

Below normal range.

### Temperatures[array-item].CurrentReading

**JSONPath**: `/Temperatures/(array index)/CurrentReading` (read only integer)

The current reading of the temperature sensor.

### Temperatures[array-item].LowerThresholdCritical

**JSONPath**: `/Temperatures/(array index)/LowerThresholdCritical` (read only integer)

Below normal range but not yet fatal.

### Fans[array-item].CurrentReading

**JSONPath**: `/Fans/(array index)/CurrentReading` (read only integer)

The current speed of the fan.

### Temperatures[array-item].CorrelatableID

**JSONPath**: `/Temperatures/(array index)/CorrelatableID` (read only string)

The CorrelatableID for this temperature sensor.

### Temperatures[array-item].Status.HealthRollUp

**JSONPath**: `/Temperatures/(array index)/Status/HealthRollUp` (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

**Defined values**:

* `OK`

* `Warning`

* `Critical`

### Temperatures[array-item].UpperThresholdCritical

**JSONPath**: `/Temperatures/(array index)/UpperThresholdCritical` (read only integer)

Above normal range but not yet fatal.

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

### Temperatures[array-item].UpperThresholdNonCritical

**JSONPath**: `/Temperatures/(array index)/UpperThresholdNonCritical` (read only integer)

The noncritical temperature threshold.

## VirtualMedia
This is the schema definition for the Virtual Media service.

**Properties**

> **Resource Instances of this Type**:  

> * `https://{iLO}/redfish/v1/managers/{item}/virtualmedia/{item}`

### ImageName

**JSONPath**: `/ImageName` (read only string)

The name of the image that is mounted on this server. This is usually provided when a URL image is mounted through scripted virtual media.

### WriteProtected

**JSONPath**: `/WriteProtected` (read only boolean)

Indicates whether the virtual media is protected against write operations.

### Inserted

**JSONPath**: `/Inserted` (read only boolean)

Indicates whether the virtual media is mounted on the server.

### ConnectedVia

**JSONPath**: `/ConnectedVia` (read only enumeration)

Specifies how the virtual media is connected to the server.

**Defined values**:

* `NotConnected`

* `URI`

* `Applet`

### Image

**JSONPath**: `/Image` (PATCHable string)

The valid URI indicating the image that is mounted on this server. A null value indicates that no image exists.

> example PATCH: {"Image": "&lt;string-value&gt;"}

### BootOnNextServerReset

**JSONPath**: `/Oem/Hp/BootOnNextServerReset` (PATCHable boolean)

If set to true, the server will boot to this image on the next server reboot. The image will be ejected automatically on the second server reboot so that the server does not boot to this image twice.

> example PATCH: {"Oem": {"Hp": {"BootOnNextServerReset": true}}}

