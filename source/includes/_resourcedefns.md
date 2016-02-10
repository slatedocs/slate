### AccountService
This is the schema definition for the Account service. It represents the properties for this service and has links to the list of accounts.

**Instances**:  

* `https://{iLO}/redfish/v1/accountservice`

#### Oem/Hp/AuthFailureLoggingThreshold (integer)

This property enables you to view and configure logging criteria for failed authentications. A failed login log entry is recorded after the configured number of attempts. 0 = feature disabled; 1-3 and 5 are allowable values.

#### Oem/Hp/MinPasswordLength (integer)

This property specifies the minimum number of characters allowed when a user password is set or changed. It must be a value from 0 to 39.

### BaseNetworkAdapter
**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}/networkadapters/{item}`

#### StructuredName (read only string)

PCI device structured name in UTF-8 format (e.g. 'NIC.LOM.1.1' - see PCIDevices in /rest/v1/Systems/x/PCIDevices - this comes from SMBIOS

#### PhysicalPorts[]/MacAddress (read only string)

The port MAC address.

#### PartNumber (read only string)

The device part number.

#### PhysicalPorts[]/Oem/Hp/StructuredName (read only string)

PCI device structured name in UTF-8 format (e.g. 'NIC.LOM.1.1' - see PCIDevices in /rest/v1/Systems/x/PCIDevices - this comes from SMBIOS

#### PhysicalPorts[]/Oem/Hp/GoodTransmits (read only integer)

A count of frames successfully transmitted by the physical adapter.

#### PhysicalPorts[]/Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### PhysicalPorts[]/Oem/Hp/GoodReceives (read only integer)

A count of frames successfully received by the physical adapter.

#### PhysicalPorts[]/Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### PhysicalPorts[]/SpeedMbps (read only integer)

An estimate of the interface's current bandwidth in Megabits per second.  For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made, this object should contain the nominal bandwidth.

#### Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### PhysicalPorts[]/UEFIDevicePath (read only string)

UEFIDevice Path for correlation purposes

#### PhysicalPorts[]/Oem/Hp/BadTransmits (read only integer)

A count of frames that were not transmitted by the adapter because of an error.  This counter is the sum of MIB items cpqNicIfPhysAdapterDeferredTransmissions, cpqNicIfPhysAdapterLateCollisions, cpqNicIfPhysAdapterExcessiveCollisions, cpqNicIfPhysAdapterCarrierSenseErrors, and cpqNicIfPhysAdapterInternalMacTransmitErrors. If this counter increments frequently, check the more detailed error statistics and take appropriate action.

#### PhysicalPorts[]/Oem/Hp/Team (read only string)

If a port is configured for NIC teaming, the name of the configured link between the physical ports that form a logical network adapter. This value is displayed for system NICs only (embedded and stand-up).

#### Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### Firmware/definitions/FWVersion/VersionString (read only string)

This string represents the version of the firmware image.

#### Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### Firmware/Current/VersionString (read only string)

This string represents the version of the firmware image.

#### PhysicalPorts[]/IPv6Addresses[]/Address (read only string)

This is the IPv6 Address.

#### UEFIDevicePath (read only string)

UEFIDevice Path for correlation purposes

#### PhysicalPorts[]/FullDuplex (read only boolean)

Full-duplex data transmission means that data can be transmitted in both directions on a signal carrier at the same time.

#### PhysicalPorts[]/Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### PhysicalPorts[]/Oem/Hp/BadReceives (read only integer)

A count of frames that were received by the adapter but which had an error.  This counter is the sum of mib items cpqNicIfPhysAdapterAlignmentErrors, cpqNicIfPhysAdapterFCSErrors, cpqNicIfPhysAdapterFrameTooLongs, and cpqNicIfPhysAdapterInternalMacReceiveErrors. If this counter increments frequently, check the more detailed error statistics and take appropriate action.

#### PhysicalPorts[]/IPv4Addresses[]/Address (read only string)

This is the IPv4 Address.

### Chassis
The schema definition for the Chassis resource represents the properties for physical components for any system. This object represents racks, rack mount servers, blades, standalone, modular systems, enclosures, and all other containers. The non-CPU/device-centric parts of the schema are accessed either directly or indirectly through this resource.

**Instances**:  

* `https://{iLO}/redfish/v1/chassis/{item}`

#### Oem/Hp/Location/LocationInRack/UPosition (read only integer)

The chassis U position in the rack.

#### Oem/Hp/Location/GeographicLocation/RackName (read only string)

The name of the chassis enclosure.

#### Oem/Hp/Firmware/SASProgrammableLogicDevice/Current/VersionString (read only string)

The firmware version of the SAS controller.

#### PartNumber (read only string)

The chassis part number.

#### Manufacturer (read only string)

The chassis manufacturer.

#### Oem/Hp/Location/LocationInRack/RackLdsProductDescription (read only string)

 The chassis rack product description.

#### Oem/Hp/Firmware/SPSFirmwareVersionData/Current/VersionString (read only string)

The SPS FW Version number, aka ME FW Version, AAAA.BBBB.CCCC.DDDD.E

#### Version (read only string)

The chassis version.

#### Oem/Hp/Location/LocationInRack/RackUUID (read only string)

The chassis rack UUID.

#### AssetTag (string)

The chassis user-assigned asset tag.

#### Oem/Hp/Firmware/PowerManagementControllerBootloader/Current/VersionString (read only string)

The firmware version of the Power Monitor boot loader.

#### Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### Model (read only string)

The chassis model number.

#### Oem/Hp/Location/LocationInRack/TagVersion (read only integer)

The chassis rack tag version.

#### Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### Oem/Hp/Firmware/PlatformDefinitionTable/Current/VersionString (read only string)

The version of the Intelligent Platform Abstraction Data.

#### Oem/Hp/Images/Front/extref (read only string)

The URI of an external resource.

#### Oem/Hp/Firmware/PowerManagementControllerBootloader/Current/Family (read only string)

The family type of the Power Monitor hardware.

#### Oem/Hp/BayNumber (read only integer)

The position of the chassis inside an enclosure.

#### Oem/Hp/Location/LocationOfChassis/UUID (read only string)

The chassis UUID provided by SMBIOS.

#### ChassisType (read only enumeration)

This property indicates the physical form factor type of this resource.

#### Oem/Hp/Location/LocationInRack/RackUHeight (read only integer)

The chassis rack U height.

#### Oem/Hp/Location/LocationInRack/RackLdsPartNumber (read only string)

The chassis rack part number.

#### IndicatorLED (enumeration)

The chassis indicator LED that is used to identify the chassis. The user can manipulate this LED.

#### SKU (read only string)

The chassis SKU.

#### Oem/Hp/PowerAlertMode/Activated (read only boolean)

The power alert mode activation state.

#### Oem/Hp/Firmware/SystemProgrammableLogicDevice/Current/VersionString (read only string)

The firmware version of the CPLD.

#### SerialNumber (read only string)

The chassis serial number.

#### Oem/Hp/Location/LocationInRack/ULocation (read only string)

The chassis rack U location.

#### Oem/Hp/Images/Model/extref (read only string)

The URI of an external resource.

#### Oem/Hp/Firmware/PowerManagementController/Current/VersionString (read only string)

The firmware version of the Power Monitor.

#### Oem/Hp/PowerAlertMode/AlertPowerWatts (read only integer)

The power consumption of the system when operating in alert mode.

### Collection
**Instances**:  

* `https://{iLO}/redfish/v1/systems`

* `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers`

* `https://{iLO}/redfish/v1/systems/{item}/logservices/iml/entries`

* `https://{iLO}/redfish/v1/registries`

* `https://{iLO}/redfish/v1/managers/{item}/virtualmedia`

* `https://{iLO}/redfish/v1/systems/{item}/smartstorage/hostbusadapters`

* `https://{iLO}/redfish/v1/managers/{item}/logservices`

* `https://{iLO}/redfish/v1/managers`

* `https://{iLO}/redfish/v1/managers/{item}/licenseservice`

* `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}/diskdrives`

* `https://{iLO}/redfish/v1/managers/{item}/ethernetinterfaces`

* `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}/logicaldrives`

* `https://{iLO}/redfish/v1/eventservice/eventsubscriptions`

* `https://{iLO}/redfish/v1/managers/{item}/logservices/iel/entries`

* `https://{iLO}/redfish/v1/managers/{item}/federationgroups`

* `https://{iLO}/redfish/v1/schemas`

* `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}/storageenclosures`

* `https://{iLO}/redfish/v1/systems/{item}/pcidevices`

* `https://{iLO}/redfish/v1/accountservice/accounts`

* `https://{iLO}/redfish/v1/systems/{item}/pcislots`

* `https://{iLO}/redfish/v1/chassis`

* `https://{iLO}/redfish/v1/managers/{item}/federationpeers`

* `https://{iLO}/redfish/v1/systems/{item}/logservices`

* `https://{iLO}/redfish/v1/systems/{item}/memory`

* `https://{iLO}/redfish/v1/sessionservice/sessions`

* `https://{iLO}/redfish/v1/systems/{item}/networkadapters`

#### links/FirstPage/1/count (read only integer)

The number of resources represented on the referenced page.

#### links/Member[]/frag (read only string)

A JSON path fragment to a member of the items array.

#### links/PrevPage/1/count (read only integer)

The number of resources represented on the referenced page.

#### Total (read only integer)

The total number of collection members.

#### links/LastPage/0/page (read only integer)

The number of the last page.

#### links/FirstPage/0/page (read only integer)

The number of the first page.

#### links/FirstPage/1/start (read only integer)

The start item index of the first page.

#### links/NextPage/0/page (read only integer)

The number of the next page.

#### links/LastPage/1/start (read only integer)

The start item index of the last page.

#### links/PrevPage/0/page (read only integer)

The number of the previous page.

#### links/PrevPage/0/count (read only integer)

The number of resources represented on the referenced page.

#### links/LastPage/1/count (read only integer)

The number of resources represented on the referenced page.

#### links/NextPage/1/start (read only integer)

The start value can be used in a query on the URI to get the next page.

#### links/Member[]/id (read only string)

The identifier value of the linked resource.

#### links/LastPage/0/count (read only integer)

The number of resources represented on the referenced page.

#### links/NextPage/1/count (read only integer)

The number of items on the next page.

#### links/PrevPage/1/start (read only integer)

The start item index of the previous page.

#### links/NextPage/0/count (read only integer)

The number of resources represented on the referenced page.

#### links/FirstPage/0/count (read only integer)

The number of resources represented on the referenced page.

#### MemberType (read only string)

This property has the type of members in this collection.  All of the members of a collection have the same value for their Type property, thus they are all the same kind of resource.

### ComputerSystem
The schema definition of a computer system and its properties. A computer system represents a physical or virtual machine and the local resources, such as memory, CPU, and other devices that can be accessed from that machine.

**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}`

#### PartNumber (read only string)

The manufacturer's system part number.

#### Oem/Hp/PowerOnDelay (enumeration)

The PowerAutoOn policy delay that can also be found in the HpBios::PowerOnDelay object.

#### Oem/Hp/Bios/Bootblock/BuildNumber (read only integer)

The build number of the firmware.

#### Oem/Hp/IntelligentProvisioningLocation (read only string)

 Location string of Intelligent Provisioning in Firmware Version Table.

#### Processors/ProcessorFamily (read only string)

The processor family for the processors in the system.

#### Oem/Hp/Bios/Backup/BuildNumber (read only integer)

The build number of the firmware.

#### Oem/Hp/Bios/Backup/Time (read only string)

The build time of the firmware.

#### Oem/Hp/Battery[]/ErrorCode (read only integer)

Error Code of battery.

#### Oem/Hp/Bios/Bootblock/Family (read only string)

The family of the firmware.

#### Oem/Hp/PostState (read only enumeration)

The current state of system POST.

#### Oem/Hp/ServerSignature (read only integer)

 The CRC32 of:  All Device Signatures combined together, Blade Slot Location in Enclosure, Enclosure UUID, and OneView Domain IP Address

#### Processors/Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### Oem/Hp/VirtualUUID (read only string)

Used in conjunction with the UUID (Logical) value.

#### Oem/Hp/Bios/Backup/DebugBuild (read only boolean)

True if the firmware is a debug build; False if it is not.

#### Version (read only string)

The manufacturer's system version.

#### Oem/Hp/Bios/Bootblock/MajorVersion (read only integer)

The major version of the firmware.

#### Oem/Hp/Battery[]/SerialNumber (read only string)

Serial Number of battery.

#### Oem/Hp/Bios/Backup/Date (read only string)

The build date of the firmware.

#### Boot/UefiTargetBootSourceOverride (string)

The UEFI device path of the device to boot from when BootSourceOverrideTarget is UefiTarget.

#### Oem/Hp/PostMode (enumeration)

Supported on UEFI based systems only. The manner in which the system will operate durring and at completion of POST.

#### Oem/Hp/Bios/Current/Date (read only string)

The build date of the firmware.

#### Memory/TotalSystemMemoryGB (read only integer)

The total amount of memory (GB) in the system.

#### Memory/Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### Boot/BootSourceOverrideTarget (enumeration)

The current boot source to be used at next boot instead of the normal boot device, if BootSourceOverrideEnabled is not Disabled.

#### Oem/Hp/Bios/Backup/BuildNumberString (read only string)

The string version of the build number of the firmware.

#### AssetTag (string)

A user-definable tag that is used to track this system for inventory or other client purposes.

#### Oem/Hp/Bios/Bootblock/BuildNumberString (read only string)

The string version of the build number of the firmware.

#### Oem/Hp/IntelligentProvisioningVersion (read only string)

 Intelligent Provisioning Version.

#### Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### Oem/Hp/PowerRegulatorMode (read only enumeration)

HP Power Regulator mode.

#### Oem/Hp/Bios/Current/MinorVersion (read only integer)

The minor version of the firmware.

#### HostCorrelation/HostName (read only string)

#### Oem/Hp/Bios/Bootblock/MinorVersion (read only integer)

The minor version of the firmware.

#### Oem/Hp/Bios/Backup/Family (read only string)

The family of the firmware.

#### Oem/Hp/Battery[]/Model (read only string)

Model of battery.

#### Memory/Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### Oem/Hp/PowerAllocationLimit (read only integer)

The total amount of power allocated to the system.

#### Oem/Hp/Bios/Backup/VersionString (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

#### Oem/Hp/Bios/Current/MajorVersion (read only integer)

The major version of the firmware.

#### Model (read only string)

The model information that the manufacturer uses to refer to this system.

#### Bios/Current/VersionString (read only string)

This string represents the version of the firmware image.

#### Oem/Hp/Bios/Backup/MinorVersion (read only integer)

The minor version of the firmware.

#### Oem/Hp/Bios/Bootblock/Date (read only string)

The build date of the firmware.

#### Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### BIOSPOSTCode (read only integer)

The BIOS Power on Self Test code from the last system boot.

#### Oem/Hp/Bios/Bootblock/Time (read only string)

The build time of the firmware.

#### Oem/Hp/Bios/Current/BuildNumberString (read only string)

The string version of the build number of the firmware.

#### Oem/Hp/IntelligentProvisioningIndex (read only integer)

 Index in the Firmware Version Table for Intelligent Provisioning.

#### Oem/Hp/Bios/Current/Family (read only string)

The family of the firmware.

#### Manufacturer (read only string)

The manufacturer or OEM of this system.

#### Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### SystemType (read only enumeration)

The type of computer system that this resource represents.

#### Oem/Hp/Bios/Current/VersionString (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

#### Oem/Hp/Battery[]/Present (read only string)

Presence of battery.

#### UUID (read only string)

The universal unique identifier for this system.

#### VirtualSerialNumber (read only string)

The system virtual serial number.

#### Oem/Hp/Battery[]/Spare (read only string)

Spare of battery.

#### Oem/Hp/Bios/Current/DebugBuild (read only boolean)

True if the firmware is a debug build; False if it is not.

#### Memory/Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### Oem/Hp/Bios/Current/Time (read only string)

The build time of the firmware.

#### Power (read only enumeration)

The current power state of the system.

#### Oem/Hp/Battery[]/MaxCapWatts (read only integer)

Maximum Capacity of battery in watts.

#### Oem/Hp/VirtualProfile (read only enumeration)

The current state of the systems virtual profile.  This profile is the one that, when the server is rebooted, will set the  Virtual properties.  Intent is to use this state to determine whether the server needs to be rebooted so these values are set.  Additional informaiton about the profile will be considered later.

#### Oem/Hp/Bios/Current/BuildNumber (read only integer)

The build number of the firmware.

#### IndicatorLED (enumeration)

The state of the indicator LED.

#### Oem/Hp/Battery[]/Index (read only integer)

Index of battery.

#### Oem/Hp/Battery[]/FirmwareVersion (read only string)

Firmware Version of battery.

#### Oem/Hp/Bios/Backup/MajorVersion (read only integer)

The major version of the firmware.

#### Oem/Hp/TrustedModules[]/Status (read only enumeration)

This property indicates the TPM or TM status.

#### Oem/Hp/PowerAutoOn (enumeration)

Auto Power-On mode defines what occurs when the AC power is applied to the system.

#### SKU (read only string)

SKU for this system.

#### Processors/Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### SerialNumber (read only string)

The system serial number.

#### Processors/Count (read only integer)

The number of processors in the system.

#### Oem/Hp/EndOfPostDelaySeconds (integer)

Supported on UEFI based systems only. The number of seconds to delay before finalizing POST with the Mode action (e.g. delay before shutdown).

#### Processors/Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### Oem/Hp/Battery[]/Condition (read only string)

Condition of battery.

#### Oem/Hp/Bios/Bootblock/VersionString (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

#### Oem/Hp/Bios/Bootblock/DebugBuild (read only boolean)

True if the firmware is a debug build; False if it is not.

#### HostCorrelation/HostFQDN (read only string)

#### Boot/BootSourceOverrideEnabled (enumeration)

BootSourceOverrideTarget must be specified before BootSourceOverrideEnabled can be used.

#### Oem/Hp/Bios/UefiClass (read only integer)

The UEFI BIOS Class value defined in the UEFI specification.

### EthernetNetworkInterface
The schema definition of a simple Ethernet NIC resource.

**Instances**:  

* `https://{iLO}/redfish/v1/managers/{item}/ethernetinterfaces/{item}`

#### LinkTechnology (read only enumeration)

The link technology, such as Ethernet, for this NIC.

#### FactoryMacAddress (read only string)

The MAC address assigned to the NIC at the factory.

#### Oem/Hp/DHCPv4/Enabled (boolean)

Determines whether DHCPv4 is enabled.

#### Oem/Hp/VLANId (integer)

The VLAN ID/tag. Only applies to Shared Network Port.

#### Autosense (boolean)

The autosense speed/duplex enabled or disabled. Autosense can only be disabled if the SpeedMbps and FullDuplex values are specified. Autosense is only applicable and modifiable for a dedicated network port and cannot be modified for blade servers.

#### SettingsResult/Operation (read only enumeration)

Details about the results of applying the settings.

#### Oem/Hp/IPv6/StaticRoutes[]/PrefixLength (integer)

The prefix length of the IPv6 static route destination address.

#### MacAddress (string)

The effective current MAC address. If the assignable MAC address is not supported, this is a read-only alias of FactoryMacAddress.

#### MaxIPv6StaticAddresses (read only integer)

The maximum number of IPv6 static addresses that can be configured on this interface.

#### SettingsResult/Time (read only string)

Time at which the settings were applied.

#### Oem/Hp/SharedNetworkPortOptions/Port (integer)

The network adapter port number that is used for sharing. This feature is only applicable on systems and network adapters that support it.

#### Oem/Hp/DHCPv6/UseRapidCommit (boolean)

Determines whether to use DHCPv6 rapid commit mode. Can only be enabled when DHCPv6 Stateful mode is also enabled; otherwise, this property will be set to false and will be read-only. Do not enable in networks where more than one DHCPv6 server is configured to provide address assignments.

#### Oem/Hp/IPv6/StaticRoutes[]/Destination (string)

The IPv6 static route destination address.

#### Oem/Hp/IPv6/StaticDefaultGateway (string)

The IPv6 static default gateway entry.

#### Oem/Hp/ConfigurationSettings (read only enumeration)

The state of the currently displayed configuration settings.

#### IPv6StaticAddresses[]/PrefixLength (integer)

The Prefix Length of this IPv6 address.

#### FrameSize (integer)

The MAC frame size (bytes).

#### Oem/Hp/PingGatewayOnStartup (boolean)

Determines whether to ping the IPv4 gateway on startup.

#### Oem/Hp/DHCPv4/UseWINSServers (boolean)

Determines whether to use DHCPv4-supplied WINS servers. Can only be enabled when DHCPv4 is also enabled; otherwise, this property will be set to false and will be read-only.

#### IPv6Addresses[]/AddressState (read only enumeration)

The current state of this address as defined in RFC 4862.

#### SettingsResult/Messages[]/Resolution (read only string)

Instructions for resolving the issue that caused the error.

#### Oem/Hp/SupportsLOM (read only boolean)

Indicates whether this system supports LOM. Only applies to Shared Network Port.

#### FullDuplex (boolean)

The connection duplex status. If Autosense is enabled, this property cannot be modified. Autosense is only applicable and modifiable for a dedicated network port and cannot be modified for blade servers.

#### IPv6Addresses[]/PrefixLength (read only integer)

The IPv6 Address Prefix Length.

#### Oem/Hp/DHCPv4/UseNTPServers (boolean)

Determines whether to use DHCPv4-supplied NTP servers. Can only be enabled when DHCPv4 is also enabled; otherwise, this property will be set to false and will be read-only.

#### Oem/Hp/NICSupportsIPv6 (read only boolean)

Indicates whether or not this NIC can support the IPv6 protocol.

#### Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### IPv6Addresses[]/Address (read only string)

The IPv6 Address.

#### Oem/Hp/SupportsFlexibleLOM (read only boolean)

Indicates whether this system supports FlexibleLOM. Only applies to Shared Network Port.

#### Oem/Hp/IPv6/DDNSRegistration (boolean)

Determines whether IPv6 DDNS registration is enabled.

#### Oem/Hp/IPv4/DDNSRegistration (boolean)

Determines whether DDNS registration is enabled.

#### IPv6AddressPolicyTable[]/Label (integer)

The label value for this table entry, as defined in RFC3484 section 2.1.

#### Oem/Hp/DHCPv6/UseDNSServers (boolean)

Determines whether to use DHCPv6-supplied DNS servers. Can only be enabled when DHCPv6 Stateless mode is also enabled; otherwise, this property will be set to false and will be read-only.

#### FQDN (read only string)

The complete, fully qualified domain name obtained by DNS for this NIC.

#### Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### Oem/Hp/IPv6/StaticRoutes[]/Gateway (string)

The IPv6 static route gateway.

#### IPv6Addresses[]/AddressOrigin (read only enumeration)

How the address was determined.

#### VLANId (read only integer)

The VLAN identifier for this NIC. The VLANId is only present when the VLANEnable is used and when the NIC supports only a single VLAN.

#### Oem/Hp/DHCPv4/UseGateway (boolean)

Determines whether to use a DHCPv4-supplied gateway. Can only be enabled when DHCPv4 is also enabled; otherwise, this property will be set to false and will be read-only.

#### Oem/Hp/DHCPv4/UseDNSServers (boolean)

Determines whether to use DHCPv4-supplied DNS servers. Can only be enabled when DHCPv4 is also enabled; otherwise, this property will be set to false and will be read-only.

#### IPv6DefaultGateway (read only string)

The IPv6 default gateway address that is currently in use on this interface.

#### HostName (read only string)

The DNS Host Name, without any domain information.

#### Oem/Hp/NICEnabled (boolean)

Determines whether this NIC is enabled or disabled. Enabling one NIC will disable the others. If no NIC is enabled, this management processor is not accessible over the network.

#### Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### Oem/Hp/DHCPv6/StatelessModeEnabled (boolean)

Determines whether DHCPv6 Stateless mode is enabled.  Always enabled by default whenever DHCPv6 Stateful mode is also enabled.

#### SettingsResult/ETag (read only string)

ETag of this resource after the settings have been applied.

#### Oem/Hp/IPv6/SLAACEnabled (boolean)

Determines whether StateLess Address Auto-Configuration is enabled.

#### IPv6StaticAddresses[]/Address (string)

A valid IPv6 address.

#### Oem/Hp/DHCPv6/UseDomainName (boolean)

Determines whether to use a DHCPv6-supplied domain name. Can only be enabled when DHCPv6 Stateless mode is also enabled; otherwise, this property will be set to false and will be read-only.

#### Oem/Hp/IPv4/StaticRoutes[]/Destination (string)

An IPv4 static route subnet mask. Only writeable when use of DHCPv4-supplied static routes is disabled; otherwise this property is read-only indicating the value is provided by DHCPv4.

#### Oem/Hp/HostName (string)

The management processor host name.

#### IPv6AddressPolicyTable[]/Prefix (string)

The IPv6 Address Prefix for this table entry as defined in RFC3484 section 2.1.

#### Oem/Hp/IPv4/StaticRoutes[]/SubnetMask (string)

An IPv4 static route gateway. Only writeable when use of DHCPv4-supplied static routes is disabled; otherwise this property is read-only indicating the value is provided by DHCPv4.

#### Oem/Hp/DHCPv4/UseDomainName (boolean)

Determines whether to use a DHCPv4-supplied domain name. Can only be enabled when DHCPv4 is also enabled; otherwis,e this property will be set to false and will be read-only.

#### UEFIDevicePath (read only string)

The UEFI device path for this NIC.

#### Oem/Hp/DHCPv4/UseStaticRoutes (boolean)

Determines whether to use DHCPv4-supplied static routes. Can only be enabled when DHCPv4 is also enabled; otherwise, this property will be set to false and will be read-only.

#### SettingsResult/Messages[]/MessageID (read only string)

Key for this message, which is used to look up the message in a message registry. The key is in the format <registry>.<majorver>.<minorver>:<messagekey>.

#### Oem/Hp/DomainName (string)

Domain name of the network to which this management processor belongs. This property can only be modified when the management processor is not configured to use a DHCP supplied domain name; otherwise this property is read-only indicating the value is provided by DHCP.

#### SpeedMbps (integer)

The link speed of the Ethernet interface. If Autosense is enabled, this property cannot be modified. This property can only be modified on a dedicated network port. It cannot be modified for blade servers.

#### IPv4Addresses[]/AddressOrigin (read only enumeration)

How the address was determined.

#### Oem/Hp/DHCPv6/UseNTPServers (boolean)

Determines whether to use DHCPv6-supplied NTP servers. Can only be enabled when DHCPv6 Stateless mode is also enabled; otherwise, this property will be set to false and will be read-only.

#### Oem/Hp/IPv6/StaticRoutes[]/Status (read only enumeration)

Status of this static route entry.

#### IPv6AddressPolicyTable[]/Precedence (integer)

The precedence value for this table entry as defined in RFC3484 section 2.1.

#### SettingsResult/Messages[]/Severity (read only enumeration)

This is the severity of the errors.

#### IPv4Addresses[]/Address (string)

The IPv4 Address.

#### IPv4Addresses[]/SubnetMask (string)

The IPv4 Subnet mask.

#### VLANEnable (read only boolean)

Indicates if VLANs are enabled. If this NIC supports more than one VLAN, this property will not be present and the client should look for VLANs collection in the link section of this resource.

#### Oem/Hp/IPv4/WINSRegistration (boolean)

Determines whether WINS registration is enabled.

#### Oem/Hp/DHCPv6/StatefulModeEnabled (boolean)

Determines whether DHCPv6 Stateful mode is enabled.

#### Oem/Hp/IPv4/StaticRoutes[]/Gateway (string)

Currently configured WINS servers in order of descending preference. Static values when not configured to use DHCPv4-supplied WINS servers; otherwise this property is read-only indicating the values are provided by DHCPv4.

#### Oem/Hp/SharedNetworkPortOptions/NIC (enumeration)

Selects the system NIC that is to be shared with this management processor.

#### Oem/Hp/VLANEnabled (boolean)

Determines whether VLAN is enabled. Only applies to Shared Network Port.

#### SettingsResult/Messages[]/Message (read only string)

Human-readable message.

#### IPv4Addresses[]/Gateway (string)

The IPv4 gateway for this address.

### EventService
This is the schema definition for the Event Service.  It represents the properties for the service itself and has links to the actual list of subscriptions.

**Instances**:  

* `https://{iLO}/redfish/v1/eventservice`

#### Oem/Hp/TTLCountDefault (read only integer)

The default number of TTLUnits until this listener destination subscription expires.  It may be renewed prior to expire to reset the Time to Live counter.  The value 999999 is reserved to mean a perpetual subscription.

#### DeliveryRetryAttempts (read only integer)

This is the number of attempts an event posting is retried before the subscription is terminated.

#### Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### Oem/Hp/RequestedMaxEventsToQueueDefault (read only integer)

This represents the default number of events the service should queue.

#### SubscriptionRemovalTimeIntervalInMinutes (read only integer)

This is the minimum amount of time after the failed events that the service will wait before doing the SubscriptionRemovalAction.

#### Oem/Hp/RetireOldEventInMinutesDefault (read only integer)

This represents the default number of minutes until an event is expired.

#### DeliveryRetryIntervalInSeconds (read only integer)

This represents the number of seconds between retry attempts for sending any given Event

#### Oem/Hp/TTLUnitsDefault (read only enumeration)

The default time unit used to measure the subscription time of this listener destination.  This is the units for TTLCount and is used to express the subscription lifetime of the listener destination.

#### Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### SubscriptionRemovalAction (read only enumeration)

This property indicates what the service will do to an event subscription after the number of delivery retry attempts has been exhausted.

### ExtendedError
This is the schema definition for the Extended Error. Extended errors can be included in the body of REST API operation responses. They augment the HTTP error codes with more meaningful information about why the error occurred.

**Instances**:  

#### Messages[]/Message (read only string)

The human readable message, if provided.

#### Messages[]/MessageID (read only string)

The key for this message that can be used to look up the message in a message registry.

#### Messages[]/Severity (read only enumeration)

The severity of the errors.

#### Messages[]/Resolution (read only string)

Provides suggestions for how to resolve the situation that caused the error.

### HPPowerMeter
**Instances**:  

* `https://{iLO}/redfish/v1/chassis/{item}/power/fastpowermeter`

* `https://{iLO}/redfish/v1/chassis/{item}/power/powermeter`

#### PowerDetail[]/CpuCapLim (read only integer)

CPU cap limit for the power meter.

#### PowerDetail[]/Cap (read only integer)

Overall power cap for the power meter.

#### PowerDetail[]/Minimum (read only integer)

Minimum power over the sample time.

#### Samples (read only integer)

Number of samples in the array.

#### PowerDetail[]/AmbTemp (read only integer)

Ambient temperature, in degrees Celsius.

#### PowerDetail[]/PunCap (read only boolean)

Punitive cap for the power meter.

#### PowerDetail[]/CpuUtil (read only integer)

CPU power utilization.

#### Maximum (read only integer)

Maximum power across all samples, taken from the 24 hour history.

#### Average (read only integer)

Average power across all samples, over the last 24 hours.

#### PowerDetail[]/CpuMax (read only integer)

CPU maximum power consumed by the power meter.

#### PowerDetail[]/Average (read only integer)

Average power over the sample time.

#### PowerDetail[]/PrMode (read only enumeration)

Power regulator mode, which can be OS Control, Static High, Static Low or Dynamic.

#### PowerDetail[]/Time (read only string)

Time at which the power detail was captured.

#### PowerDetail[]/CpuAvgFreq (read only integer)

CPU average frequency of the power supply.

#### PowerDetail[]/UnachCap (read only boolean)

Unachievable cap for the power meter.

#### Minimum (read only integer)

Minimum power across all samples, taken from the 24 hour history.

#### PowerDetail[]/CpuPwrSavLim (read only integer)

CPU power-saving limit for the power meter.

#### PowerDetail[]/Peak (read only integer)

Peak power over the sample time.

### HpBaseConfigs
**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}/bios/boot/baseconfigs`

* `https://{iLO}/redfish/v1/systems/{item}/bios/baseconfigs`

* `https://{iLO}/redfish/v1/systems/{item}/bios/iscsi/baseconfigs`

#### Capabilities/BaseConfig (read only boolean)

True if the provider supports PUT/PATCH of the named BaseConfig.

#### Capabilities/BaseConfigs (read only boolean)

True if the provider supports PUT/PATCH of the named BaseConfigs.

### HpBios
**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}/bios/settings`

* `https://{iLO}/redfish/v1/systems/{item}/bios`

#### SettingsResult/definitions/SettingsResult/ETag (read only string)

ETag of this resource after the settings have been applied.

#### SettingsResult/definitions/SettingsResult/Messages[]/Message (read only string)

Human-readable message.

#### SettingsResult/definitions/SettingsResult/Messages[]/Resolution (read only string)

Instructions for resolving the issue that caused the error.

#### SettingsResult/definitions/SettingsResult/Time (read only string)

Time at which the settings were applied.

#### SettingsResult/definitions/SettingsResult/Messages[]/MessageID (read only string)

Key for this message, which is used to look up the message in a message registry. The key is in the format <registry>.<majorver>.<minorver>:<messagekey>.

#### AttributeRegistry (read only string)

This object represents the type property. It represents the schema used for the resource and indicates the version of the schema in the format <schema>.<majorversion>.<minorversion>.<errataversion>.

#### SettingsResult/definitions/SettingsResult/Messages[]/Severity (read only enumeration)

This is the severity of the errors.

#### SettingsResult/definitions/SettingsResult/Operation (read only enumeration)

Details about the results of applying the settings.

### HpBiosMapping
**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}/bios/mappings`

#### BiosPciSettingsMappings[]/CorrelatableID (read only string)

Contains any CorrelatableIDs that represent this PCI device. The CorrelatableID values can be JSON Pointers or UEFI identifiers.

#### BiosPciSettingsMappings[]/Instance (read only integer)

The instance number of the parent PCI device for this association set.

#### BiosPciSettingsMappings[]/Subinstances[]/Subinstance (read only integer)

The sub-instance number of the child PCI device for this association set.

#### AttributeRegistry (read only string)

This object represents the type property. It represents the schema used for the resource and indicates the version of the schema in the format <schema>.<majorversion>.<minorversion>.<errataversion>.

#### BiosPciSettingsMappings[]/Subinstances[]/CorrelatableID (read only string)

Contains any CorrelatableIDs that represent this PCI device. The CorrelatableID values can be JSON Pointers or UEFI identifiers.

### HpESKM
ESKM (Enterprise Security Key Manager) object enables user to connect to an operational key manager, change redundancy settings, view the key manager connection settings, test the connection, and view key management events.

**Instances**:  

* `https://{iLO}/redfish/v1/managers/{item}/securityservice/eskm`

#### PrimaryKeyServerPort (integer)

Primary key server port number. Set to null to clear the value.

#### ESKMEvents[]/Event (read only string)

ESKM event description.

#### KeyManagerConfig/AccountGroup (string)

Account group on ESKM.

#### KeyManagerConfig/ImportedCertificateIssuer (read only string)

Imported certificate issuer.

#### KeyServerRedundancyReq (boolean)

If true encryption keys will be maintained on both the configured key servers. When this option is disabled, iLO will not verify that encryption keys are copied to both of the configured key servers.

#### KeyManagerConfig/AccountName (read only string)

Account name on ESKM.

#### KeyManagerConfig/LoginName (string)

ESKM administrator account login name. This property always returns null on GET.

#### SecondaryKeyServerPort (integer)

Secondary key server port number. Set to null to clear the value.

#### KeyManagerConfig/ImportedCertificateSubject (read only string)

Imported certificate subject.

#### PrimaryKeyServerAddress (string)

Primary key server IP address or FQDN. Set to null to clear the value.

#### ESKMEvents[]/Timestamp (read only string)

Time of ESKM event.

#### KeyManagerConfig/Password (string)

ESKM administrator account password. This property always returns null on GET.

#### SecondaryKeyServerAddress (string)

Secondary key server IP address or FQDN. Set to null to clear the value.

#### KeyManagerConfig/ESKMLocalCACertificateName (string)

This is the name of Local CA (Certificate Authority) in ESKM that is used to sign the ESKM server certificate. iLO will retrieve this certificate from the ESKM server.

### HpHttpsCert
This is the schema definition for the X509 Certificate.

**Instances**:  

* `https://{iLO}/redfish/v1/managers/{item}/securityservice/httpscert`

#### X509CertificateInformation/ValidNotAfter (read only string)

The date on which the certificate validity period ends.

#### CertificateSigningRequest (read only string)

GenerateCSR action, wait few minutes (upto 10), perform GET operation, fills CSR. Contains a public and private key pair.

#### X509CertificateInformation/SerialNumber (read only string)

The serial number that the Certificate Authority assigned to the certificate.

#### X509CertificateInformation/Subject (read only string)

The entity to which the certificate was issued.

#### X509CertificateInformation/ValidNotBefore (read only string)

The date on which the certificate validity period begins.

#### X509CertificateInformation/Issuer (read only string)

The Certificate Authority that issued the certificate.

### HpMemory
The schema definition for the properties of Memory DIMMs.

**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}/memory/{item}`

#### SocketLocator (read only string)

Identifies the physically labeled socket or board position, where the memory device is located.

#### BankLocator (read only string)

Identifies the physically labeled bank, where the memory device is located.

#### MinimumVoltageVoltsX10 (read only integer)

The minimum DIMM voltage multiplied by 10, for example, 1.2v = 12.

#### TotalWidth (read only integer)

The total width, in bits, of this memory device, including any check or error-correction bits. If there are no error-correction bits, this value should be equal to Data Width. If the width is unknown, the field is set to null.

#### HPMemoryType (read only enumeration)

Indicates whether or not HP SmartMemory is present.

#### Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### MaximumFrequencyMHz (read only integer)

Identifies the maximum, capable speed of the device in megahertz (MHz). If the value is null, the speed is unknown.

#### Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### DIMMTechnology (read only enumeration)

The memory module technology type.

#### PartNumber (read only string)

The part number for this memory device.

#### Manufacturer (read only string)

Identifies the manufacturer of this memory device.

#### SerialNumber (read only string)

The serial number for this memory device.

#### ErrorCorrection (read only enumeration)

The error correction used for this DIMM. If the value is null, the error correction is unknown.

#### AssetTag (read only string)

The asset tag for this memory device.

#### DIMMType (read only enumeration)

The type of memory DIMM used in this system.

#### Rank (read only integer)

Specifies the DIMM rank. A value of null indicates the rank is unknown.

#### Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### DataWidth (read only integer)

The data width, in bits, of this memory device. A Data Width value of 0 and a Total Width value of 8 indicates that the device is being used solely to provide 8 error-correction bits. If the width is unknown, the field is set to null.

#### SizeMB (read only integer)

The size of the memory device in megabytes.

### HpSecureBoot
**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}/secureboot`

#### SecureBootEnable (boolean)

Enable or disable UEFI Secure Boot (takes effect on next boot).

#### SecureBootCurrentState (read only boolean)

Current enabled state of Secure Boot

#### ResetAllKeys (boolean)

If true, clear all Secure Boot keys on next boot.

#### ResetToDefaultKeys (boolean)

If true, reset to default Secure Boot keys on next boot.

### HpSecurityService
**Instances**:  

* `https://{iLO}/redfish/v1/managers/{item}/securityservice`

### HpServerBootSettings
The schema definition of the server UEFI Boot Order.

**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}/bios/boot`

* `https://{iLO}/redfish/v1/systems/{item}/bios/boot/settings`

#### BootSources[]/BootString (string)

User-readable string that describes the UEFI boot option.

#### SettingsResult/definitions/SettingsResult/ETag (read only string)

ETag of this resource after the settings have been applied.

#### DesiredBootDevices[]/CorrelatableID (string)

Standardized text representation of the UEFI device path of the desired boot device, in UTF-8 format. For example 'PciRoot(0x0)/Pci(0x2,0x2)/Pci(0x0,0x0)'

#### BootSources[]/CorrelatableID (string)

Contains any CorrelatableIDs that represent this boot option. The correlatableID values can be JSON Pointers or UEFI identifiers.

#### SettingsResult/definitions/SettingsResult/Messages[]/MessageID (read only string)

Key for this message, which is used to look up the message in a message registry. The key is in the format <registry>.<majorver>.<minorver>:<messagekey>.

#### SettingsResult/definitions/SettingsResult/Messages[]/Message (read only string)

Human-readable message.

#### BootSources[]/StructuredBootString (string)

Uniquely identifies this boot option within the server.

#### SettingsResult/definitions/SettingsResult/Messages[]/Resolution (read only string)

Instructions for resolving the issue that caused the error.

#### SettingsResult/definitions/SettingsResult/Time (read only string)

Time at which the settings were applied.

#### AttributeRegistry (read only string)

This object represents the type property. It represents the schema used for the resource and indicates the version of the schema in the format <schema>.<majorversion>.<minorversion>.<errataversion>.

#### DesiredBootDevices[]/Lun (string)

The Logical Unit Number (LUN) of the desired boot device. This value must be a hexadecimal string with an even number of 2 to 16 characters, excluding the first two characters, 0x (for example, '0x01').

#### DesiredBootDevices[]/iScsiTargetName (string)

The iSCSI node target name of the desired boot device. The value must be a string based on IETF RFC 3270, and can be up to 244 characters in length (for example, 'iqn.1991-05.com.microsoft:iscsitarget-iscsidisk-target').

#### SettingsResult/definitions/SettingsResult/Messages[]/Severity (read only enumeration)

This is the severity of the errors.

#### SettingsResult/definitions/SettingsResult/Operation (read only enumeration)

Details about the results of applying the settings.

#### DesiredBootDevices[]/Wwn (string)

The Fibre Channel World Wide Name (WWN) of the desired boot device. This value must be a hexadecimal string with an even number of 2 to 16 characters, excluding the first two characters, 0x (for example, '0x0001020304050607').

#### BootSources[]/UEFIDevicePath (string)

Standardized text representation of the UEFI device path for this boot option, in UTF-8 format.

### HpServerPCISlot
**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}/pcislots/{item}`

#### Status/OperationalStatus[]/Status (read only string)

Current usage status of the slot: InUse or Empty

#### UEFIDevicePath (read only string)

Standardized text representation of the UEFI device path, in UTF-8 format

#### SupportsHotPlug (read only boolean)

Specifies whether the slot supports hot-plug devices.

#### Length (read only enumeration)

PCI slot length

#### Technology (read only enumeration)

PCI technology

#### Status/EnabledState (read only string)

Specifies whether the slot is enabled or disabled.

#### LinkLanes (read only enumeration)

Bandwidth capacity of the slot, measured by the number of PCI Express Lanes present. Also known as the slot width.

### HpServerPciDevice
**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}/pcidevices/{item}`

#### DeviceType (read only enumeration)

Device type value.

#### StructuredName (read only string)

PCI device structured name in UTF-8 format.

#### EnclosureNumber (read only integer)

Enclosure number value.

#### BayNumber (read only integer)

Bay number value.

#### SubclassCode (read only integer)

PCI sub class code of the endpoint.

#### BusNumber (read only integer)

PCI device bus number value.

#### DeviceSubInstance (read only integer)

PCI device sub-instance value.

#### SubsystemVendorID (read only integer)

PCI subsystem vendor ID of the device.

#### SubsystemDeviceID (read only integer)

PCI subsystem device ID of the device.

#### SegmentNumber (read only integer)

PCI segment group number value.

#### ClassCode (read only integer)

PCI class code of the endpoint.

#### FunctionNumber (read only integer)

PCI device function number value.

#### UEFIDevicePath (read only string)

Standardized text representation of the UEFI device path, in UTF-8 format.

#### DeviceLocation (read only string)

PCI device location.

#### DeviceInstance (read only integer)

PCI device instance value.

#### DeviceNumber (read only integer)

PCI device number value.

#### VendorID (read only integer)

PCI vendor ID of the device.

#### DeviceID (read only integer)

PCI device ID of the device.

### HpSmartStorage
HpSmartStorage

**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}/smartstorage`

#### Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

### HpSmartStorageArrayController
HpSmartStorageArrayController

**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}`

#### PhysicalDriveCount (read only integer)

The number of physical drives attached to this controller

#### BootVolumePrimary (read only string)

The primary boot volume of this controller

#### EncryptionHasLockedVolumesMissingBootPassword (read only boolean)

True if there are locked drives due to a missing boot password, false otherwise

#### Manufacturer (read only string)

The manufacturer of the controller

#### EncryptionStandaloneModeEnabled (read only boolean)

True if the controller manages encryption keys locally, false if a remote key manager is being used

#### EncryptionCryptoOfficerPasswordSet (read only boolean)

True if a password has been set for the Encryption Crypto Officer, false otherwise

#### PowerModeWarningTemperature (read only boolean)

True if the controller has crossed a critical temperature threshold and performance has been reduced to prevent damage to the controller, false otherwise

#### SoftwareRaidHbaModeOptionRomRev (read only string)

The option ROM firmware version used to bootstrap the software RAID stack

#### ArrayCount (read only integer)

The number of arrays configured on this controller

#### OperatingModeAfterReboot (read only enumeration)

The operating mode the controller will be functioning in (RAID versus HBA) after a reboot

#### SparePhysicalDriveCount (read only integer)

he number of physical drives assigned as spare drives attached to this controller

#### DataLogicalDriveCount (read only integer)

The number of data logical drives configured on this controller

#### EncryptionKekSet (read only boolean)

True if the Master Key has been set, false otherwise

#### CacheArrayCount (read only integer)

The number of cache arrays configured on this controller

#### EncryptionUserPasswordSet (read only boolean)

True if a password has been set for the Encryption User, false otherwise.

#### ParallelSurfaceScanSupported (read only boolean)

True if the controller supports scanning multiple disk surfaces

#### EncryptionBootPasswordSet (read only boolean)

True if there is a boot password set, false otherwise

#### FirmwareVersion/definitions/FWVersion/VersionString (read only string)

This string represents the version of the firmware image.

#### DegradedPerformanceOptimization (read only enumeration)

Enables the controller to attempt to improve performance on RAID 5/50/6(ADG)/60 logical drives when one or more physical drives in the logical drive are failed

#### CurrentOperatingMode (read only enumeration)

The current operating mode of the controller.

#### Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### EncryptionPhysicalDriveCount (read only integer)

The number of encrypted physical drives attached to the controller

#### EncryptionLocalKeyCacheEnabled (read only boolean)

True if the controller caches encryption keys locally when a remote key manager is being used, false otherwise

#### PowerModeWarningChangedDrive (read only boolean)

True if the controller's drive configuration has changed while using configuration based power settings, false otherwise

#### CacheMemorySizeMiB (read only integer)

The total cache memory size for the controller in MiB

#### Model (read only string)

The model number for the controller

#### DriveWriteCache (read only enumeration)

Enables or disables the write cache of the physical drives attached to the controller

#### BootVolumeSecondary (read only string)

The secondary boot volume of this controller

#### EncryptionEnabled (read only boolean)

True if encryption is currently enabled for this controller, false otherwise

#### EncryptionRecoveryParamsSet (read only boolean)

True if the encryption password recovery question and answer have been set, false otherwise

#### PowerModeConfigured (read only enumeration)

The current power mode of the controller

#### ElevatorSort (read only enumeration)

Enables the controller to sort requests to a physical drive

#### QueueDepth (read only enumeration)

This sets the maximum number of requests the controller will submit to a drive at any given time

#### PowerModeAfterReboot (read only enumeration)

The power mode of the controller after a reboot

#### FlexibleLatencySchedulerSetting (read only enumeration)

This allows the controller to process certain high-latency requests after a delay that may time out when elevator sorting

#### CurrentParallelSurfaceScanCount (read only integer)

Number of disks the controller is scanning in parallel

#### BackupPowerSourceStatus (read only enumeration)

The current status of the backup power source (battery, capacitor, megacell etc.)

#### SoftwareRaidHbaFirmwareRev (read only string)

The firmware version of the underlying HBA that is being used by the software RAID stack

#### LocationFormat (read only enumeration)

Format for Location Identifier

#### AdapterType (read only enumeration)

Type of Smart controller

#### Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### EncryptionFwLocked (read only boolean)

True if the controller firmware has been locked, preventing firmware updates, false otherwise

#### LogicalDriveCount (read only integer)

The number of logical drives configured on this controller

#### PredictiveSpareRebuild (read only enumeration)

Enables or disables predictive spare rebuild mode

#### Location (read only string)

Location identifier

#### IsBootController (read only boolean)

True if this controller is the OS boot controller, false otherwise

#### UnassignedPhysicalDriveCount (read only integer)

The number of unassigned physical drives attached to this controller

#### MaxParallelSurfaceScanCount (read only integer)

Maximum number of disks that the controller supports scanning in parallel

#### SerialNumber (read only string)

The serial number for this controller

#### RebuildPriority (read only enumeration)

The level of priority that rebuilds have over handling current operating system requests

#### FirmwareVersion/Current/VersionString (read only string)

This string represents the version of the firmware image.

#### EncryptionHasLockedVolumes (read only boolean)

True if the controller has one or more volumes that are locked, false otherwise

#### PowerModeWarningReboot (read only enumeration)

True if a reboot is required to change the active power mode on the controller, false otherwise

#### InconsistencyRepairPolicy (read only enumeration)

Enables the controller to update data on RAID 6(ADG) and 60 volumes based on parity information when an inconsistency is discovered during surface scan

#### HardwareRevision (read only string)

The hardware revision of the controller

#### PowerModeWarningChangedMode (read only boolean)

True if the controller has a new power mode configured, false otherwise

#### EncryptionHasSuspendedVolumes (read only boolean)

True if the controller password has been temporarily suspended, false otherwise

#### CachePhysicalDriveCount (read only integer)

The number of physical drives assigned as cache drives attached to this controller

#### DataPhysicalDriveCount (read only integer)

The number of physical drives assigned as data drives attached to this controller

#### CacheLogicalDriveCount (read only integer)

The number of cache logical drives configured on this controller

#### SurfaceScanAnalysisPriority (read only enumeration)

Priority that the controller takes to find and correct disk surface errors

#### EncryptionMixedVolumesEnabled (read only boolean)

True if the controller will allow plaintext and encrypted volumes to exist simultaneously, false otherwise

#### ExpandPriority (read only enumeration)

The level of priority that transformations have over handling current operating system requests

### HpSmartStorageDiskDrive
HpSmartStorageDiskDrive

**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}/diskdrives/{item}`

#### MediaType (read only enumeration)

Type of disk

#### FirmwareVersion/definitions/FWVersion/VersionString (read only string)

This string represents the version of the firmware image.

#### CapacityMiB (read only integer)

Total capacity of the drive in MiB

#### PhyCount (read only integer)

The number of phys the drive has

#### CurrentTemperatureCelsius (read only integer)

The current temperature of the drive

#### SSDEnduranceUtilizationPercentage (read only integer)

This is the percentage of the drive that has been worn out and can no longer be used. When this values reaches 100%, the drive has 0% usage remaining and is completely  worn out

#### PortCount (read only integer)

The number of ports on the drive. Typically 1 (single-domain) or 2 (dual-domain)

#### Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### InterfaceSpeedGbps (read only integer)

Native interface speed for the device

#### BlockSizeBytes (read only integer)

Block size of the drive in bytes. This is the block size presented by the drive to clients such as the array controller or operating system.

#### ErasePattern (read only string)

The pattern used for erasing the disk drive

#### WWID (read only string)

Unique identifier for the device

#### NativeBlockSizeBytes (read only integer)

Native block size of the drive in bytes. This is the underlying sector size used by the physical drive to store data. For example, an advanced format drive that uses 4K sector sizes to store data will return 4K as the NativeBlockSizeBytes but may return 512 for the BlockSizeBytes when running in 512e (emulation) mode for backward compatibility

#### MaximumTemperatureCelsius (read only integer)

The maximum recommended temperature for the drive

#### Manufacturer (read only string)

Manufacturer of the disk drive

#### RotationalSpeedRpm (read only integer)

The rotational speed of the drive, only applicable on HDDs

#### SerialNumber (read only string)

The serial number of the drive

#### CarrierAuthenticationStatus (read only enumeration)

Authentication status of the drive carrier

#### SpareRebuildMode (read only enumeration)

Method to used activate this drive when another drive fails, this is only applicable if the drive is configured as a spare drive

#### EraseCompletionPercentage (read only integer)

The percent complete for an erase operation currently occurring on the disk drive

#### Model (read only string)

Drive model number

#### Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### TransferSpeedGbps (read only integer)

Effective transfer speed to the device taking into account hardware acceleration such as edge-buffering

#### PowerOnHours (read only integer)

The number of lifetime hours that the drive has been powered on

#### LocationFormat (read only enumeration)

Format for the location property

#### FirmwareVersion/Current/VersionString (read only string)

This string represents the version of the firmware image.

#### InterfaceType (read only enumeration)

The connection interface of the drive

#### EncryptedDrive (read only boolean)

True if encryption is currently enabled on this disk drive, false otherwise

#### Location (read only string)

The location of the drive

#### MinimumGoodFirmwareVersion (read only string)

The minimum recommended firmware revision for the drive

#### CarrierApplicationVersion (read only string)

Carrier PIC firmware version currently running

### HpSmartStorageLogicalDrive
HpSmartStorageLogicalDrive

**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}/logicaldrives/{item}`

#### LogicalDriveEncryption (read only boolean)

True if encryption is currently enabled on this logical drive, false otherwise

#### TransformationCompletionPercentage (read only integer)

The percent complete for any transformations the logical drive may be undergoing such as RAID migration, stripesize migration, capacity expansion etc.

#### Raid (read only enumeration)

The current RAID level configured on the logical drive

#### StripeSizeBytes (read only integer)

The stripe size of the logical drive in bytes

#### StripSizeBytes (read only integer)

The strip size of the logical drive in bytes

#### DriveGeometryCylinders (read only string)

The number of cylinders on the drive

#### LogicalDriveEncryptionDataKeysVolatileBackup (read only boolean)

True if volatile keys are backed up to a remote key manager, false if volatile keys are not backed up

#### DriveGeometryHeads (read only string)

The number of heads on the drive

#### DriveAccessName (read only string)

The access ID of the logical drive given by the OS

#### SmartCacheState (read only enumeration)

The state of the SmartCache cache. This is valid if this drive either is a cache drive, or has a cache drive attached to it

#### PartitionInformation (read only string)

OS partition information for the drive

#### ParityInitializationCompletionPercentage (read only integer)

Parity initialization complete percentage for a parity based logical drive (e.g. RAID 5)

#### Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### LogicalDriveType (read only enumeration)

How the logical drive is being used

#### RebuildCompletionPercentage (read only integer)

The percent complete for a rebuild operation currently occurring on the logical drive

#### LogicalDriveEncryptionDataKeysVolatile (read only boolean)

True if volatile keys are enabled for encryption, false otherwise

#### VolumeUniqueIdentifier (read only string)

An identifier (typically SCSI Inquiry based such as Inquiry VPD Page 0x83 NAA 64 identifier) used to uniquely identify this volume.

#### Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### ParityInitializationType (read only enumeration)

When creating a logical drive with a RAID level that requires parity, parity blocks can be initialized with two different methods

#### DriveGeometrySectors (read only string)

The number of sectors on the drive

#### BlockSizeBytes (read only integer)

The block size of the disk drive in bytes

#### LogicalDriveName (read only string)

Label given to the logical drive

#### LogicalDriveNumber (read only integer)

logical drive number

#### CapacityMiB (read only integer)

Total usable capacity available on this logical drive in MiB units

#### Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### LogicalDriveEncryptionDataKeysVolatileStatus (read only enumeration)

The status of the encryption volatile keys

### HpSmartStorageStorageEnclosure
HpSmartStorageStorageEnclosure

**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}/smartstorage/arraycontrollers/{item}/storageenclosures/{item}`

#### FirmwareVersion/definitions/FWVersion/VersionString (read only string)

This string represents the version of the firmware image.

#### SubEnclosureLocation (read only string)

Location within the chassis if this storage enclosure is part of a larger chassis hosting multiple storage enclosures

#### DriveBayCount (read only integer)

Number of drive bays supported within the storage enclosure

#### Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### PartNumber (read only string)

Part number of this storage enclosure

#### SKU (read only string)

SKU for the storage enclosure

#### Manufacturer (read only string)

The manufacturer of the storage enclosure

#### LocationFormat (read only enumeration)

Format for Location Identifier

#### SerialNumber (read only string)

The serial number for this storage enclosure

#### FirmwareVersion/Current/VersionString (read only string)

This string represents the version of the firmware image.

#### Model (read only string)

The model string for the storage enclosure

#### EnclosureLogicalID (read only string)

Unique ID for the storage enclosure

#### Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### Location (read only string)

Location identifier

### HpiLOActiveHealthSystem
**Instances**:  

* `https://{iLO}/redfish/v1/managers/{item}/activehealthsystem`

#### LocationParameters/contact_name (read only string)

This query parameter may be added to the AHS location URI to insert the contact name into the AHS log header. For example, http://iloname.example.net/ahsdata/HP_xxxxxxxxxx_20140821.ahs?downloadAll=1&&contact_name=JohnDoe.

#### LocationParameters/downloadAll (read only string)

This query parameter should be used to download entire AHS log. For example, http://iloname.example.net/ahsdata/HP_xxxxxxxxxx_20140821.ahs?downloadAll=1.

#### links/AHSLocation/extref (read only string)

The URI of an external resource.

#### LocationParameters/co_name (read only string)

This query parameter may be added to the AHS location URI to insert the company name into the AHS log header. For example, http://iloname.example.net/ahsdata/HP_xxxxxxxxxx_20140821.ahs?downloadAll=1&&co_name=myCompany.

#### LocationParameters/case_no (read only string)

This query parameter may be added to the AHS location URI to insert the case number into the AHS log header. For example, http://iloname.example.net/ahsdata/HP_xxxxxxxxxx_20140821.ahs?downloadAll=1&&case_no=abc123.

#### AHSEnabled (boolean)

Determines whether HP Active Health System logging is enabled or disabled.

#### LocationParameters/from (read only string)

This query parameter may be added with the 'to' query parameter to the AHS location URI to limit the range of data returned. The default range is the last seven days of the log and the format is (yyyy-mm-dd). 'downloadAll' parameter should not be used with this query parameter. For example, http://iloname.example.net/ahsdata/HP_xxxxxxxxxx_20140821.ahs?from=2014-03-01&&to=2014-03-30.

#### LocationParameters/email (read only string)

This query parameter may be added to the AHS location URI to insert the contacts email address into the AHS log header. For example, http://iloname.example.net/ahsdata/HP_xxxxxxxxxx_20140821.ahs?downloadAll=1&&email=abc@xyz.com.

#### LocationParameters/to (read only string)

This query parameter may be added with the 'from' query parameter to the AHS location URI to limit the range of data returned. The default range is the last seven days of the log and the format is (yyyy-mm-dd). 'downloadAll' parameter should not be used with this query parameter. For example, http://iloname.example.net/ahsdata/HP_xxxxxxxxxx_20140821.ahs?from=2014-03-01&&to=2014-03-30.

#### LocationParameters/phone (read only string)

This query parameter may be added to the AHS location URI to insert the contacts phone number into the AHS log header. For example, http://iloname.example.net/ahsdata/HP_xxxxxxxxxx_20140821.ahs?downloadAll=1&&contact_name=JohnDoe&&phone=555-555-5555.

### HpiLODateTime
The management processor date and time.

**Instances**:  

* `https://{iLO}/redfish/v1/managers/{item}/datetime`

#### TimeZoneList[]/Index (read only integer)

The time zone index.

#### ConfigurationSettings (read only enumeration)

The state of the currently displayed configuration settings.

#### TimeZone/Index (integer)

The index of the current time zone. To set a new time zone, specify a different time zone index. This property can be set only when DHCPv4 or DHCPv6 supplied time settings are disabled. Since the time zone list might vary from one firmware version to another (which often leads to differences in time zone indices), setting the time zone by name is recommended over setting by index, for better compatibility.

#### TimeZoneList[]/UtcOffset (read only string)

The UTC offset of the time zone, in the format {+/-}hh:mm

#### TimeZoneList[]/Value (read only string)

The environment variable value.

#### PropagateTimeToHost (boolean)

Determines whether the server time is synchronized with the management processor time during the first POST after AC power is applied.

#### TimeZone/Value (read only string)

The environment variable value.

#### TimeZone/UtcOffset (read only string)

The UTC offset of the current time zone, in the format {+/-}hh:mm

#### DateTime (read only string)

The date and time used by management processor.

### HpiLOEmbeddedMedia
**Instances**:  

* `https://{iLO}/redfish/v1/managers/{item}/embeddedmedia`

#### SDCard/Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### SDCard/WriteCount (read only integer)

The number of writes on the SD card. Rendered only if this is an HP-certified SD card. 

#### SDCard/Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### SDCard/SizeString (read only string)

The size of the SD card present in the server, in a readable format.

#### Controller/Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### Controller/Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### Controller/Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### SDCard/HpCertified (read only boolean)

True if this is an HP-certified SD card.

#### SDCard/Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### Controller/Firmware/Current/VersionString (read only string)

The current version of the embedded media controller.

#### SDCard/LBACount (read only integer)

The LBA count.

### HpiLOFederatedGroupCapping
**Instances**:  

* `https://{iLO}/redfish/v1/chassis/{item}/power/federatedgroupcapping`

#### Throttle (read only string)

High, Med, or Low based on the percentage of power usage.

#### CapacityWatts (read only integer)

The total power supply capacity for all servers in a group.

#### CapWatts (read only integer)

The configured power cap for all servers in a group. This value is 0 if the power cap is not configured.

### HpiLOFederationGroup
**Instances**:  

* `https://{iLO}/redfish/v1/managers/{item}/federationgroups/{item}`

#### Privileges/RemoteConsolePriv (boolean)

Remote console privileges.

#### Key (string)

The password used by the Federation Group.

#### Privileges/UserConfigPriv (boolean)

User configuration privileges.

#### Privileges/LoginPriv (boolean)

Login privileges.

#### Privileges/VirtualMediaPriv (boolean)

Virtual media privileges.

#### Privileges/iLOConfigPriv (boolean)

The management processor configuration privileges.

#### Privileges/VirtualPowerAndResetPriv (boolean)

Virtual power and reset privileges.

### HpiLOFederationPeers
**Instances**:  

* `https://{iLO}/redfish/v1/managers/{item}/federationpeers/{item}`

#### Peers[]/URL (read only string)

URL of the federation peer.

#### Peers[]/UUID (read only string)

UUID peers that are part of the federation group.

#### Peers[]/Time (read only string)

Time when the federation peer was added.

#### Peers[]/ManagerIPAddress (read only string)

Manager IP address of the federation peer.

#### Peers[]/HttpErrorCode (read only integer)

Error code for success or failure.

### HpiLOFirmwareUpdate
**Instances**:  

* `https://{iLO}/redfish/v1/managers/{item}/updateservice`

#### ImageSizeInBytes (read only integer)

The size of the firmware image (including any signatures) in bytes.

#### ProgressPercent (read only integer)

Firmware flash progress.

#### Bootleg (read only string)

Supplied bootleg text, if any, otherwise blank.

#### Details (read only string)

Details about the current firmware flash status.

#### Copyright (read only string)

The copyright date of the firmware image.

#### ImageType (read only enumeration)

Firmware flash image type.

#### links/UpdateUri/extref (read only string)

The URI of an external resource.

#### Flags (read only enumeration)

Other flags.

#### State (read only enumeration)

Current state of the firmware flash.

### HpiLOLicense
**Instances**:  

* `https://{iLO}/redfish/v1/managers/{item}/licenseservice/{item}`

#### License (read only string)

The name of the license installed on this management processor.

#### LicenseKey (read only string)

The license key installed on this management processor. License keys are 25 characters in length and contain both letters and numbers.

#### LicenseExpire (read only string)

The expiration information of the installed management processor license.

#### LicenseType (read only enumeration)

The type of license installed on this management processor.

### HpiLOResourceDirectory
**Instances**:  

* `https://{iLO}/redfish/v1/resourcedirectory`

#### Instances[]/ETag (read only string)

This is the last known etag of the resource. The property is omitted if not known.

#### Instances[]/MemberType (read only string)

This property has the type of members for collection resources.

### HpiLOSSO
This is the schema definition for the HP SSO Trusted Server.

**Instances**:  

* `https://{iLO}/redfish/v1/managers/{item}/securityservice/sso`

#### ManagerTrustedCertificates[]/ServerName (read only string)

The Server name (or certificate subject).

#### SSOsettings/UserPrivilege/iLOConfigPriv (boolean)

iLO Configuration Privileges.

#### SSOsettings/AdminPrivilege/RemoteConsolePriv (boolean)

Remote Console Privileges.

#### SSOsettings/UserPrivilege/UserConfigPriv (boolean)

User Configuration Privileges.

#### SSOsettings/AdminPrivilege/iLOConfigPriv (boolean)

iLO Configuration Privileges.

#### SSOsettings/SSOTrustMode (enumeration)

Represents the SSO Trust Mode.

#### SSOsettings/UserPrivilege/RemoteConsolePriv (boolean)

Remote Console Privileges.

#### SSOsettings/UserPrivilege/PowerandResetPriv (boolean)

Power and Reset Privileges.

#### ManagerTrustedCertificates[]/Certificate (read only string)

Contains PEM formatted X509 certificate (Base64 encoded).

#### SSOsettings/OperatorPrivilege/iLOConfigPriv (boolean)

iLO Configuration Privileges.

#### ManagerTrustedCertificates[]/Status (read only enumeration)

#### ManagerTrustedCertificates[]/SerialNumber (read only integer)

Contains the Serial number for the SSO records.

#### SSOsettings/OperatorPrivilege/PowerandResetPriv (boolean)

Power and Reset Privileges.

#### SSOsettings/OperatorPrivilege/UserConfigPriv (boolean)

User Configuration Privileges.

#### SSOsettings/AdminPrivilege/PowerandResetPriv (boolean)

Power and Reset Privileges.

#### SSOsettings/UserPrivilege/VirtualMediaPriv (boolean)

Virtual Media Privileges.

#### SSOsettings/AdminPrivilege/UserConfigPriv (boolean)

User Configuration Privileges.

#### SSOsettings/OperatorPrivilege/VirtualMediaPriv (boolean)

Virtual Media Privileges.

#### SSOsettings/AdminPrivilege/LoginPriv (boolean)

Login Privileges.

#### SSOsettings/AdminPrivilege/VirtualMediaPriv (boolean)

Power and Reset Privileges.

#### SSOsettings/UserPrivilege/LoginPriv (boolean)

Login Privileges.

#### SSOsettings/OperatorPrivilege/RemoteConsolePriv (boolean)

Remote Console Privileges.

#### SSOsettings/OperatorPrivilege/LoginPriv (boolean)

Login Privileges.

### HpiSCSISoftwareInitiator
The schema definition of UEFI iSCSI Software Initiator boot configuration.

**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}/bios/iscsi`

* `https://{iLO}/redfish/v1/systems/{item}/bios/iscsi/settings`

#### SettingsResult/definitions/SettingsResult/ETag (read only string)

ETag of this resource after the settings have been applied.

#### iSCSIBootSources[]/iSCSIInitiatorNetmask (string)

The subnet mask of the iSCSI Initiator, if not configured via DHCP. The address must be an IPv4.

#### SettingsResult/definitions/SettingsResult/Messages[]/Resolution (read only string)

Instructions for resolving the issue that caused the error.

#### iSCSIBootSources[]/iSCSIBootLUN (string)

The iSCSI boot target Logical Unit Number (LUN), if not obtained from DHCP. This value must follow the SAM-2 spec. E.g. 0001-1234-5678-9ABC. If the digit number is less then 5 characters, a dash character is not required. E.g. 0001. If the lun number is 12345, input 1234-5

#### iSCSIBootSources[]/iSCSIBootAttemptName (string)

Human readable descriptive name for this iSCSI boot attempt configuration

#### iSCSIBootSources[]/iSCSIIpAddressType (enumeration)

The iSCSI IP Address type. If set to Auto, IPv4 will be attempted first, followed by IPv6.

#### iSCSIBootSources[]/iSCSIBootEnable (enumeration)

Enables or Disables iSCSI Boot for a selected iSCSI boot attempt.

#### iSCSIBootSources[]/iSCSIChapType (enumeration)

The CHAP authentication type. This is applicable only when the Authentication Method is set to CHAP.

#### iSCSIBootSources[]/iSCSIBootAttemptInstance (integer)

Uniquely identifies this iSCSI boot attempt within iSCSIBootSources array.

#### iSCSIBootSources[]/iSCSITargetTcpPort (integer)

The iSCSI Target TCP Port number, if not obtained from DHCP.

#### SettingsResult/definitions/SettingsResult/Operation (read only enumeration)

Details about the results of applying the settings.

#### iSCSIBootSources[]/iSCSIInitiatorIpAddress (string)

The IP Address of the iSCSI Initiator, if not configured via DHCP. The address must be an IPv4 or IPv6 address, depending on the IP Address Type.

#### iSCSIBootSources[]/iSCSIChapUsername (string)

The password needed for CHAP authentication. This is applicable only when the Authentication Method is set to CHAP.

#### iSCSIBootSources[]/iSCSITargetIpAddress (string)

The IP Address of the iSCSI Target, if not obtained from DHCP. The address must be an IPv4 or IPv6 address, depending on the IP Address Type.

#### iSCSIBootSources[]/iSCSIReverseChapSecret (string)

The password needed for reverse CHAP authentication (from the target to the initiator). This is applicable only when the Authentication Method is set to CHAP, and the CHAP Type is set to Mutual.

#### SettingsResult/definitions/SettingsResult/Messages[]/Severity (read only enumeration)

This is the severity of the errors.

#### iSCSIBootSources[]/iSCSIInitiatorGateway (string)

The gateway address of the iSCSI Initiator, if not configured via DHCP. The address must be an IPv4 or IPv6 address, depending on the IP Address Type.

#### iSCSIBootSources[]/iSCSINicSource (string)

A BIOS Attribute that describes this selected NIC instance. This must match one of the possible values listed in the iSCSINicSources array.

#### SettingsResult/definitions/SettingsResult/Time (read only string)

Time at which the settings were applied.

#### iSCSIBootSources[]/StructuredBootString (read only string)

Identifies this iSCSI UEFI boot option within the server.

#### SettingsResult/definitions/SettingsResult/Messages[]/MessageID (read only string)

Key for this message, which is used to look up the message in a message registry. The key is in the format <registry>.<majorver>.<minorver>:<messagekey>.

#### SettingsResult/definitions/SettingsResult/Messages[]/Message (read only string)

Human-readable message.

#### iSCSIBootSources[]/UEFIDevicePath (read only string)

Standardized text representation of the UEFI device path for this boot option, in UTF-8 format.

#### iSCSIBootSources[]/iSCSIConnectRetry (integer)

The number of times to retry the iSCSI connection. Zero means no retries.

#### iSCSIBootSources[]/iSCSITargetName (string)

The worldwide unique iSCSI Qualified Name (IQN) of this iSCSI target. Only the IQN format is accepted. EUI format is not supported (for example, 'iqn.1991-05.com.microsoft:iscsitarget-iscsidisk-target').

#### iSCSIBootSources[]/iSCSIReverseChapUsername (string)

User Name for reverse CHAP authentication (from the target to the initiator). This is applicable only when the Authentication Method is set to CHAP, and the CHAP Type is set to Mutual.

#### iSCSIBootSources[]/iSCSIConnectTimeoutMS (integer)

The iSCSI connection timeout value in milliseconds.

#### iSCSIBootSources[]/iSCSITargetInfoViaDHCP (boolean)

If enabled, the iSCSI target information are configured from DHCP. Otherwise, the iSCSI target information must be statically configured.

#### iSCSIBootSources[]/iSCSIAuthenticationMethod (enumeration)

The iSCSI connection authentication method.

#### iSCSIBootSources[]/iSCSIChapSecret (string)

The password needed for CHAP authentication. This is applicable only when the Authentication Method is set to CHAP, and the CHAP Type is set to Mutual.

#### iSCSIBootSources[]/iSCSIInitiatorInfoViaDHCP (boolean)

If enabled, the iSCSI Initiator information is configured from DHCP. Otherwise, the iSCSI initiator information must be statically configured.

#### AttributeRegistry (read only string)

This object represents the type property. It represents the schema used for the resource and indicates the version of the schema in the format <schema>.<majorversion>.<minorversion>.<errataversion>.

#### iSCSIInitiatorName (string)

The worldwide unique iSCSI Qualified Name (IQN) of this iSCSI Initiator. Only IQN format is accepted. EUI format is not supported (for example, 'iqn.1986-03.com.hp:init.sn-123456').

### LogEntry
**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}/logservices/iml/entries/{item}`

* `https://{iLO}/redfish/v1/managers/{item}/logservices/iel/entries/{item}`

#### Created (read only string)

The date and time when the log entry was created, for example, 2014-04-15T00:38:00Z.

#### Oem/Hp/Code (read only integer)

The IML event code.

#### Oem/Hp/Class (read only integer)

The IML event class.

#### OemRecordFormat (read only enumeration)

The format of an OEM record.

#### Number (read only integer)

The number of duplicate log entries, with the possible exception of timestamps, that are not in the collection.

#### RecordId (read only integer)

The log entry ID.

#### Oem/Hp/Updated (read only string)

The date and time of the latest log entry update, for example, 2014-04-15T00:38:00Z.

#### Message (read only string)

The log entry details.

#### Oem/Hp/Repaired (boolean)

The repaired status of the IML event.

#### EntryType (read only enumeration)

The log entry type.

#### Severity (read only enumeration)

The log entry severity.

### LogService
**Instances**:  

* `https://{iLO}/redfish/v1/systems/{item}/logservices/iml`

* `https://{iLO}/redfish/v1/managers/{item}/logservices/iel`

#### OverWritePolicy (read only enumeration)

When the log is full, the overwrite policy is enforced.

#### MaxNumberOfRecords (read only integer)

The maximum number of log entries.

### Manager
This is the schema definition for a manager.  Examples of managers are BMCs, Enclosure Managers, Management Controllers and other subsystems assigned manageability functions.

**Instances**:  

* `https://{iLO}/redfish/v1/managers/{item}`

#### Oem/Hp/SerialCLIStatus (enumeration)

Status of serial command line interface.

#### Redundancy/Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### Oem/Hp/Firmware/Backup/BuildNumber (read only integer)

The build number of the firmware.

#### SerialConsole/MaxConcurrentSessions (read only integer)

This is the maximum number of Serial Console sessions, regardless of protocol, that this manager supports.

#### GraphicalConsole/Enabled (boolean)

Indicates if the Graphical Console service is enabled for this manager.

#### Oem/Hp/Firmware/Bootblock/Family (read only string)

The family of the firmware.

#### Oem/Hp/FederationConfig/MulticastTimeToLive (integer)

The maximum number of switches a multicast announcement will traverse before being discarded.

#### Oem/Hp/Firmware/Backup/Time (read only string)

The build time of the firmware.

#### Oem/Hp/Firmware/Current/BuildNumber (read only integer)

The build number of the firmware.

#### GraphicalConsole/MaxConcurrentSessions (read only integer)

Indicates the maximum number of Graphical Console sessions, regardless of protocol, this manager supports.

#### Oem/Hp/Firmware/Bootblock/DebugBuild (read only boolean)

True if the firmware is a debug build; False if it is not.

#### Oem/Hp/Firmware/Current/MinorVersion (read only integer)

The minor version of the firmware.

#### Oem/Hp/License/LicenseString (read only string)

Describes the type of license installed on management processor.

#### Oem/Hp/iLOSelfTestResults[]/SelfTestName (read only enumeration)

iLO Self Test Name.

#### Oem/Hp/Firmware/definitions/HpFWVersion/BuildNumber (read only integer)

The build number of the firmware.

#### Redundancy/MinNumNeeded (read only integer)

The minimum number of members allowed in the redundancy group for the current redundancy mode to still be fault tolerant.

#### Oem/Hp/Firmware/Current/VersionString (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

#### Oem/Hp/RequiredLoginForiLORBSU (boolean)

Determines whether a user-credential prompt is displayed when a user accesses the iLO RBSU or the iLO 4 Configuration Utility. The following settings are valid: Enabled-A login dialog box opens when a user accesses the iLO RBSU or the iLO 4 Configuration Utility. Disabled (default)-No login is required when a user accesses the iLO RBSU or the iLO 4 Configuration Utility.

#### Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### Oem/Hp/links/VSPLogLocation/extref (read only string)

The URI of an external resource.

#### Oem/Hp/links/FederationDispatch/extref (read only string)

The URI of an external resource.

#### Oem/Hp/Firmware/Pending/MajorVersion (read only integer)

The major version of the firmware.

#### Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### Model (read only string)

Model name of the manager.

#### Oem/Hp/Firmware/Current/Time (read only string)

The build time of the firmware.

#### ManagerType (read only enumeration)

This property is the manager type for this resource.

#### Oem/Hp/FederationConfig/MulticastDiscovery (enumeration)

Enables or Disables Multicast Discovery for the local iLO system.

#### Oem/Hp/License/LicenseKey (read only string)

The installed license key.

#### CommandShell/MaxConcurrentSessions (read only integer)

This is the maximum number of Command Shell sessions, regardless of protocol, that this manager supports.

#### Oem/Hp/iLOSelfTestResults[]/Notes (read only string)

Additional Information (if any) about the Self Test.

#### Oem/Hp/License/LicenseType (read only string)

Indicates whether the license is Perpetual or Evaluation.

#### Oem/Hp/Firmware/definitions/HpFWVersion/Time (read only string)

The build time of the firmware.

#### Oem/Hp/iLOSelfTestResults[]/Status (read only enumeration)

Status of the Self Test.

#### Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### Oem/Hp/Firmware/definitions/HpFWVersion/DebugBuild (read only boolean)

True if the firmware is a debug build; False if it is not.

#### Oem/Hp/Firmware/Pending/BuildNumberString (read only string)

The string version of the build number of the firmware.

#### Oem/Hp/Firmware/Backup/MajorVersion (read only integer)

The major version of the firmware.

#### Oem/Hp/SerialCLISpeed (integer)

Serial command line interface speed in bits/second.

#### Redundancy/MaxNumSupported (read only integer)

The maximum number of members allowed in the redundancy group, including this member.

#### Oem/Hp/Firmware/Bootblock/MajorVersion (read only integer)

The major version of the firmware.

#### Oem/Hp/FederationConfig/MulticastAnnouncementInterval (integer)

The frequency in Seconds at which the iLO system announces itself on the network. A value of 0 disables multicast announcments.

#### Oem/Hp/Firmware/Current/BuildNumberString (read only string)

The string version of the build number of the firmware.

#### CommandShell/Enabled (boolean)

Indicates if the Command Shell service is enabled for this manager.

#### Oem/Hp/Firmware/Bootblock/VersionString (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

#### Oem/Hp/Firmware/Backup/VersionString (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

#### Oem/Hp/Firmware/Pending/BuildNumber (read only integer)

The build number of the firmware.

#### Firmware/definitions/FWVersion/VersionString (read only string)

This string represents the version of the firmware image.

#### Oem/Hp/FederationConfig/iLOFederationManagement (enumeration)

Enables or Disables iLO Federation features for the local iLO system.

#### Oem/Hp/Firmware/Pending/Date (read only string)

The build date of the firmware.

#### Oem/Hp/Firmware/Pending/MinorVersion (read only integer)

The minor version of the firmware.

#### SerialConsole/Enabled (boolean)

Indicates if the Serial Console service is enabled for this manager.

#### Oem/Hp/Firmware/Pending/Family (read only string)

The family of the firmware.

#### Oem/Hp/Firmware/Backup/MinorVersion (read only integer)

The minor version of the firmware.

#### Oem/Hp/Firmware/definitions/HpFWVersion/VersionString (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

#### Firmware/Current/VersionString (read only string)

This string represents the version of the firmware image.

#### Redundancy/Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### Oem/Hp/FederationConfig/IPv6MulticastScope (enumeration)

The IPv6 network scope of multicast announcements.

#### Redundancy/Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### Oem/Hp/Firmware/Current/Family (read only string)

The family of the firmware.

#### UUID (read only string)

This is a universally unique identifier that software (for example, HP SIM) uses to uniquely identify this manager. The UUID is assigned when the system is manufactured.

#### Oem/Hp/Firmware/definitions/HpFWVersion/MinorVersion (read only integer)

The minor version of the firmware.

#### Oem/Hp/Firmware/Backup/BuildNumberString (read only string)

The string version of the build number of the firmware.

#### Oem/Hp/Firmware/Current/DebugBuild (read only boolean)

True if the firmware is a debug build; False if it is not.

#### Oem/Hp/Firmware/Pending/DebugBuild (read only boolean)

True if the firmware is a debug build; False if it is not.

#### Oem/Hp/Firmware/definitions/HpFWVersion/MajorVersion (read only integer)

The major version of the firmware.

#### Oem/Hp/Firmware/definitions/HpFWVersion/Date (read only string)

The build date of the firmware.

#### Oem/Hp/Firmware/Bootblock/MinorVersion (read only integer)

The minor version of the firmware.

#### Oem/Hp/VSPLogDownloadEnabled (boolean)

This property enables or disables download of Virtual Serial Port (VSP) log.

#### Oem/Hp/Firmware/Bootblock/BuildNumberString (read only string)

The string version of the build number of the firmware.

#### Redundancy/Mode (read only enumeration)

This is the redundancy mode of the group.  Failover indicates a master/subordinate type arrangement where status indicates the role of this manager.  N+1 indicates an arrangement where the redundancy set needs MaxNumSupported-1 number of resources in order to be redundant.  Load Balanced indicates all members are active. However, their functionality is not independent of each other. Their functioning is determined by some sort of load balancing algorithm and sparing is implied (i.e. each member can be a spare for the others).  Sparing indicates that all members are active and are aware of each other. However, their functionality is independent until failover. Each member can be a spare for the other(s).  Limited Sparing indicates that all members are active, and they may or may not be aware of each and they are not spares for each other.

#### Oem/Hp/Firmware/Pending/VersionString (read only string)

The version string of the firmware. This value might be null if VersionString is unavailable.

#### Oem/Hp/Firmware/Bootblock/Time (read only string)

The build time of the firmware.

#### Oem/Hp/Firmware/Current/Date (read only string)

The build date of the firmware.

#### Oem/Hp/Firmware/Backup/Family (read only string)

The family of the firmware.

#### Oem/Hp/Firmware/definitions/HpFWVersion/Family (read only string)

The family of the firmware.

#### Oem/Hp/Firmware/Backup/DebugBuild (read only boolean)

True if the firmware is a debug build; False if it is not.

#### Oem/Hp/Firmware/Backup/Date (read only string)

The build date of the firmware.

#### Oem/Hp/Firmware/Current/MajorVersion (read only integer)

The major version of the firmware.

#### Oem/Hp/Firmware/Pending/Time (read only string)

The build time of the firmware.

#### Oem/Hp/Firmware/definitions/HpFWVersion/BuildNumberString (read only string)

The string version of the build number of the firmware.

#### Oem/Hp/Firmware/Bootblock/Date (read only string)

The build date of the firmware.

#### Oem/Hp/Firmware/Bootblock/BuildNumber (read only integer)

The build number of the firmware.

### ManagerAccount
**Instances**:  

* `https://{iLO}/redfish/v1/accountservice/accounts/{item}`

#### Oem/Hp/Privileges/VirtualPowerAndResetPriv (boolean)

This privilege enables a user to power-cycle or reset the host system. These activities interrupt system availability. A user with this privilege can diagnose the system by using the Generate NMI to System button.

#### Oem/Hp/LoginName (string)

Descriptive login name that helps to easily identify the owner of each user name. The login name does not have to be the same as the user name and must use printable characters. The maximum length for a user name is 39 characters.

#### Password (string)

The password used to log in to the management processor. The maximum length for a password is 39 characters. The minimum length for a password is specified in the MinPasswordLength property of the AccountService schema.

#### Oem/Hp/Privileges/LoginPriv (boolean)

This privilege enables a user to log in to management processor. All local accounts have the login privilege. This privilege is added automatically if it is not specified.

#### UserName (string)

The name used to log in to the management processor. The user name does not have to be the same as the login name. The maximum length for the user name is 39 characters. The user name must use printable characters.

#### Oem/Hp/Privileges/UserConfigPriv (boolean)

This privilege enables a user to add, edit, and delete local management processor user accounts. A user with this privilege can change privileges for all users.

#### Oem/Hp/Privileges/RemoteConsolePriv (boolean)

This privilege enables a user to remotely access the host system Remote Console, including video, keyboard, and mouse control.

#### Oem/Hp/Privileges/iLOConfigPriv (boolean)

This privilege enables a user to configure most management processor settings, including security settings, and to remotely update the management processor firmware. This privilege does not enable local user account administration.

#### Oem/Hp/Privileges/VirtualMediaPriv (boolean)

This privilege enables a user to use the Virtual Media feature on the host system.

### ManagerNetworkService
This resource is used to obtain or modify the network services managed by this manager.

**Instances**:  

* `https://{iLO}/redfish/v1/managers/{item}/networkservice`

#### Oem/Hp/HPSystemManagementHomepageAddress (string)

The IP address or FQDN of the HP System Management Homepage (HP SMH) server.

#### SNMP/Enabled (boolean)

Indicates whether SNMP is enabled for the manager.

#### IPMI/Port (read only integer)

The IPMI over LAN port number.

#### SSH/Enabled (boolean)

Indicates whether SSH is enabled for the manager.  NOTE: When this field is modified, the Manager will reset automatically.

#### SSDP/Port (read only integer)

The SSDP port number.

#### SSH/Port (integer)

The SSH port number.  NOTE: When this field is modified, the Manager will reset automatically.

#### Oem/Hp/ConfigurationSettings (read only enumeration)

State of the currently displayed configuration settings.

#### IPMI/Enabled (boolean)

Indicates whether IPMI over LAN is enabled for the manager.

#### Oem/Hp/EnforceAES3DESEncryption (boolean)

Indicates whether AES/3DES encryption is enforced for the management processor.  When enabled, the management processor accepts only those connections that use AES or 3DES ciphers. The management processor will automatically reset when this field is modified.

#### SessionTimeoutMinutes (integer)

The session timeout (minutes). A zero value indicates infinite timeout.

#### Oem/Hp/FederationEnabled (boolean)

Indicates whether management processor federation management is enabled or disabled.

#### Oem/Hp/AlertMailSenderDomain (string)

The domain name for the sender email address.

#### SSDP/NotifyMulticastIntervalSeconds (integer)

Indicates how often multicast is performed for SSDP.

#### Oem/Hp/RemoteSyslogServer (string)

The IP address, FQDN, IPv6 name, or short name of the server running the Syslog service.

#### Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### Oem/Hp/AlertMailSMTPServer (string)

The IP address or DNS name of the SMTP server or the Mail Submission Agent (MSA).

#### HTTP/Enabled (read only boolean)

Indicates whether HTTP is enabled or disabled.

#### Oem/Hp/FederationSupported (read only boolean)

Indicates whether management processor federation is supported.

#### VirtualMedia/Port (integer)

The Virtual Media port number.

#### Oem/Hp/AlertMailSMTPPort (integer)

The SMTP server port number.

#### Oem/Hp/XMLResponseEnabled (boolean)

Determines whether management processor responds to anonymous XML discovery requests.

#### FQDN (read only string)

The fully-qualified domain name of the manager that is obtained by DNS and includes the host name and top-level domain name.

#### KVMIP/Enabled (read only boolean)

Indicates whether KVM-IP is enabled for the manager.

#### Oem/Hp/AlertMailEnabled (boolean)

Indicates whether AlertMail is enabled. This can be enabled only when the properties AlertMailEmail, AlertMailSenderDomain and AlertMailSMTPServer are set or not empty.

#### HTTPS/Enabled (read only boolean)

Indicates whether HTTPS/SSL is enabled or disabled.

#### Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### HostName (string)

The host name of the manager that is obtained by DNS and does not include any domain information.

#### SNMP/Port (integer)

The SNMP port number.

#### Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### Oem/Hp/RemoteSyslogEnabled (boolean)

Indicates whether Remote Syslog is enabled. When enabled, management processor sends notification messages to the specified Syslog server. This can be enabled only when the property RemoteSyslogServer is set or not empty.

#### SSDP/NotifyIPv6Scope (enumeration)

The scope for IPv6 Notify messages for SSDP.

#### SSDP/NotifyTTL (integer)

The Time to Live (TTL) hop count for SSDP Notify messages.

#### HTTP/Port (integer)

The HTTP port number.  NOTE: When this field is modified, the Manager will reset automatically.

#### KVMIP/Port (integer)

The KVM-IP port number.

#### SSDP/Enabled (boolean)

Indicates whether SSDP is enabled for the manager.

#### Oem/Hp/AlertMailEmail (string)

The destination email address for email alerts.

#### Oem/Hp/SNMPTrapPort (integer)

The SNMP trap port number.

#### HTTPS/Port (integer)

The HTTPS/SSL port number.  NOTE: When this field is modified, the Manager will reset automatically.

#### VirtualMedia/Enabled (read only boolean)

Indicates whether Virtual Media is enabled for the manager.

#### Oem/Hp/SerialOverLanLogging (boolean)

Indicates whether Serial Over LAN (SOL) or Virtual Serial Port (VSP) logging is enabled.

#### Oem/Hp/RemoteSyslogPort (integer)

The port number through which the Syslog server is listening.

### PowerMetrics
**Instances**:  

* `https://{iLO}/redfish/v1/chassis/{item}/power`

#### PowerLimit/CorrectionInMs (read only integer)

Time in milliseconds that it takes for the limiting process to react and correct the power consumption below the limit.

#### PowerSupplies[]/Oem/Hp/iPDU/MacAddress (read only string)

The Ethernet MAC address of the iPDU connected to this power supply.

#### PowerSupplies[]/Oem/Hp/iPDU/SerialNumber (read only string)

The serial number of the iPDU connected to this power supply.

#### PowerSupplies[]/Oem/Hp/Mismatched (read only boolean)

If true, this power supply is mismatched with others in the system.

#### PowerSupplies[]/Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### PowerCapacityWatts (read only integer)

The total power (Watts) available to the chassis from all power supplies (adjusting for redundancy settings).

#### PowerConsumedWatts (read only integer)

The latest observed power (Watts) being drawn by this chassis. The update interval may vary depending upon implementation but is usually measured in seconds.

#### PowerAllocatedWatts (read only integer)

The total power (Watts) allocated to the chassis.

#### PowerSupplies[]/Oem/Hp/iPDU/IPAddress (read only string)

The IP address of the iPDU connected to this power supply.

#### PowerSupplies[]/FirmwareVersion (read only string)

The power supply firmware version.

#### PowerSupplies[]/Oem/Hp/iPDU/Model (read only string)

The model number of the iPDU connected to this power supply.

#### PowerMetrics/AverageConsumedWatts (read only integer)

The average power consumed during the interval specified by 'IntervalInMin'.

#### PowerSupplies[]/CorrelatableID (read only string)

CorrelatableID for this power supply.

#### Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### PowerLimit/CorrelatableID (read only string)

The value of this property shall represent a reference to the resource that is being limited.

#### PowerSupplies[]/Model (read only string)

The power supply model name.

#### PowerMetrics/MinConsumedWatts (read only integer)

The minimum power consumed during the interval specified by 'IntervalInMin'.

#### PowerMetrics/IntervalInMin (read only integer)

The interval between power metric evaluation in minutes.

#### PowerSupplies[]/PowerSupplyType (read only enumeration)

The power supply type: AC, DC, or Unknown.

#### PowerSupplies[]/Oem/Hp/PowerSupplyStatus/State (read only enumeration)

Indicates the known state of the resource.

#### PowerLimit/LimitException (enumeration)

Action that is taken if the power cannot be maintained below the LimitInWatts.

#### PowerLimit/LimitInWatts (integer)

The Power (Watts) limit (also known as 'Power Cap'). Set to null to disable the power cap.

#### PowerSupplies[]/SparePartNumber (read only string)

The power supply spare part number.

#### PowerAvailableWatts (read only integer)

Amount of power (Watts) not already budgeted and therefore available for additional allocation. (PowerCapacity - PowerAllocated).  This indicates how much reserve power capacity is left.

#### Oem/Hp/SNMPPowerThresholdAlert/Trigger (enumeration)

Trigger determines whether alerts are based on peak power consumption, average power consumption, or if they are disabled. Trigger property can only be enabled if the ThresholdWatts and DurationInMin values are specified/configured.

#### Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### PowerSupplies[]/LineInputVoltageType (read only enumeration)

Line voltage type: ACLowLine, ACMidLine, ACHighLine, DCNeg48V, DC420V, or Unknown.

#### PowerSupplies[]/Oem/Hp/iPDUCapable (read only boolean)

If true, this power supply is capable of being connected to an iPDUs.

#### PowerSupplies[]/SerialNumber (read only string)

The power supply serial number.

#### Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### PowerSupplies[]/Oem/Hp/MaxPowerOutputWatts (read only integer)

The latest observed maximum output power being drawn by the power supply (Watts). This is usually updated every 10 seconds but the period can vary in some circumstances.

#### PowerSupplies[]/PartNumber (read only string)

The power supply part number.

#### PowerSupplies[]/Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### PowerSupplies[]/PowerCapacityWatts (read only integer)

The power capacity of the power supply, in Watts.

#### Oem/Hp/SNMPPowerThresholdAlert/DurationInMin (integer)

Sets the length of time, in minutes, that power consumption must remain above the warning threshold before an SNMP alert is triggered. The maximum duration is 240 minutes, and the duration must be a multiple of 5.

#### PowerRequestedWatts (read only integer)

Potential power (Watts) that the chassis is requesting that might be higher than the current level being consumed. This is because the requested power includes budget that the chassis has reserved for future use.

#### PowerSupplies[]/Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### PowerSupplies[]/LastPowerOutputWatts (read only integer)

The average power (Watts) consumed.

#### Oem/Hp/SNMPPowerThresholdAlert/ThresholdWatts (integer)

Sets the power consumption threshold (watts). If power consumption exceeds this value for the specified time duration, an SNMP alert is triggered.

#### PowerMetrics/MaxConsumedWatts (read only integer)

The maximum power consumed during the interval specified by 'IntervalInMin'.

#### PowerSupplies[]/Oem/Hp/iPDU/iPDUStatus/State (read only enumeration)

Indicates the known state of the resource.

#### PowerSupplies[]/Oem/Hp/BayNumber (read only integer)

The power supply bay number.

#### PowerSupplies[]/Oem/Hp/AveragePowerOutputWatts (read only integer)

The latest observed average power being drawn by the power supply (Watts). This is usually updated every 10 seconds but the period can vary in some circumstances.

#### PowerSupplies[]/Oem/Hp/HotplugCapable (read only boolean)

If true, this power supply (and power supply bay) is capable of being hot-plugged.

#### PowerSupplies[]/LineInputVoltage (read only integer)

Line input voltage at which the power supply is operating at this moment (in Volts).

### ServiceRoot
This object represents the HP RESTful API root service.

**Instances**:  

* `https://{iLO}/redfish/v1`

#### Oem/Hp/Sessions/LoginHint/HintPOSTData/UserName (read only string)

The user name for logging in to the management processor.

#### Time (read only string)

The current web service time.

#### Oem/Hp/Manager[]/HostName (read only string)

The name of management processor.

#### Oem/Hp/Sessions/KerberosEnabled (read only boolean)

Specifies whether Kerberos login is enabled.

#### Oem/Hp/Manager[]/FQDN (read only string)

Fully qualified domain name of the management processor.

#### Oem/Hp/Sessions/CertCommonName (read only string)

The name of the management processor as it appears in the digital certificate when a secure web GUI session is established to the management processor.

#### Oem/Hp/Manager[]/ManagerFirmwareVersion (read only string)

The major and minor management processor version numbers.

#### ServiceVersion (read only enumeration)

The web service version. This is different from the version of the data model.

#### Oem/Hp/Sessions/LoginHint/Hint (read only string)

The information on how to log in to the management processor.

#### Oem/Hp/Manager[]/ManagerType (read only string)

The type of the service manager.

#### Oem/Hp/Manager[]/Blade/RackName (read only string)

Specifies the name of the rack in which the enclosure is present.

#### Oem/Hp/Manager[]/Blade/EnclosureName (read only string)

Specifies the name of the enclosure in which the blade is present.

#### Oem/Hp/Manager[]/IPManager (read only object)

#### Oem/Hp/Manager[]/Languages[]/Version (read only string)

Specifies the version of the management processor in the respective language.

#### Oem/Hp/Sessions/LoginFailureDelay (read only integer)

The delay (seconds) when a management processor login attempt has failed.

#### Oem/Hp/Sessions/LDAPAuthLicenced (read only boolean)

Specifies whether a valid license is installed for LDAP use.

#### Oem/Hp/Sessions/LocalLoginEnabled (read only boolean)

Specifies whether local users can log in.

#### Oem/Hp/Manager[]/Languages[]/Language (read only string)

Specifies one of the languages supported by the management processor.

#### Oem/Hp/Sessions/SecurityOverride (read only boolean)

Specifies whether the security override switch is enabled.

#### Oem/Hp/Sessions/LDAPEnabled (read only boolean)

Specifies whether LDAP login is enabled.

#### Oem/Hp/Sessions/LoginHint/HintPOSTData/Password (read only string)

The password for logging in to the management processor.

#### UUID (read only string)

Unique identifier for a service instance.  This value should be an exact match of the UUID value returned in a 200OK from an SSDP M-SEARCH request during discovery.

#### Oem/Hp/Sessions/ServerName (read only string)

The name of the server that this management processor is managing.

#### Oem/Hp/Manager[]/Languages[]/TranslationName (read only string)

Specifies one of the languages supported by the management processor.

#### Oem/Hp/Manager[]/Blade/BayNumber (read only string)

Specifies the location of the blade in the enclosure.

#### Oem/Hp/Sessions/SecurityMessage (read only string)

The login security banner message that is displayed on the management processor Login page.

#### Oem/Hp/Manager[]/DefaultLanguage (read only string)

Default language used for the Web interface.

#### Oem/Hp/Manager[]/ManagerFirmwareVersionPass (read only string)

The build or pass number of the management processor version.

### Session
**Instances**:  

* `https://{iLO}/redfish/v1/sessionservice/sessions/{item}`

#### Oem/Hp/Privileges/VirtualPowerAndResetPriv (read only boolean)

This privilege enables a user to power-cycle or reset the host system. These activities interrupt system availability. A user with this privilege can diagnose the system by using the Generate NMI to System button.

#### Oem/Hp/UserType (read only enumeration)

User type

#### Oem/Hp/UserExpires (read only string)

User session expire time

#### Oem/Hp/UserAccount (read only string)

Login details of the user

#### Oem/Hp/Privileges/LoginPriv (read only boolean)

This privilege enables a user to log in to the management processor. All local accounts have the login privilege. This privilege is added automatically if it is not specified.

#### Oem/Hp/UserIP (read only string)

IP address of the user

#### UserName (read only string)

Name to use to log in to the management processor.

#### Oem/Hp/Privileges/UserConfigPriv (read only boolean)

This privilege enables a user to add, edit, and delete local management processor user accounts. A user with this privilege can change privileges for all users.

#### Oem/Hp/UserTag (read only enumeration)

Session source

#### Oem/Hp/UserDistinguishedName (read only string)

LDAP user is identified by its distinguished name (DN).

#### Oem/Hp/Privileges/RemoteConsolePriv (read only boolean)

This privilege enables a user to remotely access the host system Remote Console, including video, keyboard, and mouse control.

#### Oem/Hp/Privileges/iLOConfigPriv (read only boolean)

This privilege enables a user to configure most management processor settings, including security settings, and to remotely update the management processor firmware. This privilege does not enable local user account administration.

#### Oem/Hp/Privileges/VirtualMediaPriv (read only boolean)

This privilege enables a user to use the Virtual Media feature on the host system.

#### Oem/Hp/MySession (read only boolean)

Indicates whether this is a session I own.

#### Oem/Hp/AccessTime (read only string)

User session last-access time

#### Oem/Hp/LoginTime (read only string)

User session login time

### SnmpService
**Instances**:  

* `https://{iLO}/redfish/v1/managers/{item}/snmpservice`

#### RoleDetail (string)

The string of up to 512 characters that describes specific tasks that the server might perform.

#### AlertsEnabled (boolean)

The alert conditions that the management processor detects independently of the host operating system can be sent to specified SNMP alert destinations, such as HP SIM.

#### Users[]/SecurityName (string)

The user profile name. Enter an alphanumeric string of 1 to 32 characters.

#### Mode (enumeration)

Agentless Management Mode (default): Use SNMP agents running on the management processor to manage the server. SNMP Pass-thru Mode: Use SNMP agents running on the host operating system to manage the server. This setting does not affect alerts.

#### Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### SNMPv1Traps (boolean)

When enabled, SNMPv1 traps are sent to the remote management systems configured in the SNMP Alert Destination(s) boxes.

#### Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### Role (string)

The string of up to 64 characters that describes the server role or function.

#### Users[]/PrivacyProtocol (enumeration)

Sets the encryption algorithm to use for encoding the privacy passphrase. A portion of an SNMP message is encrypted before transmission. Select AES (Advanced Encryption Standard) or DES (Data Encryption Standard).

#### TrapSourceHostname (enumeration)

Determines the host name that is used in the SNMP-defined sysName variable when the management processor generates SNMP traps.

#### Users[]/AuthPassphrase (string)

Sets the passphrase to use for sign operations. Enter a value of 8 to 49 characters.

#### Oem/Hp/SNMPColdStartTrapBroadcast (boolean)

If set to true, the Cold Start Trap will be enabled. The Cold Start Trap is broadcast to a subnet broadcast address if there are no trap destinations configured in the SNMP Alert Destination(s) boxes.

#### Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### SNMPv3EngineID (string)

The SNMPv3 Engine ID is the unique identifier of an SNMP engine that belongs to an SNMP agent entity. This value must be a hexadecimal string with an even number of 6 to 32 characters, excluding the first two characters, 0x (for example, 0x01020304abcdef).

#### Users[]/AuthProtocol (enumeration)

Sets the message digest algorithm to use for encoding the authorization passphrase. The message digest is calculated over an appropriate portion of an SNMP message, and is included as part of the message sent to the recipient. Select MD5 (Message Digest) or SHA (Secure Hash Algorithm).

#### Oem/Hp/SNMPForwardInsightManagerAgentAlerts (boolean)

If set to true, the alert conditions detected by the host management agents are forwarded to SNMP alert destinations through the management processor. These alerts are generated by the Insight Management Agents, which are available for each supported operating system. Insight Management Agents must be installed on the host server to receive these alerts.

#### Users[]/PrivacyPassphrase (string)

Sets the passphrase to use for encrypt operations. Enter a value of 8 to 49 characters.

#### Location (string)

The string of up to 49 characters that specifies the physical location of the server.

#### Contact (string)

The string of up to 49 characters that specifies the system administrator or server owner. The string can include a name, email address, or phone number.

### ThermalMetrics
The schema definition for the Thermal Metrics. It represents the properties for temperature and cooling.

**Instances**:  

* `https://{iLO}/redfish/v1/chassis/{item}/thermal`

#### Temperatures[]/MaximumValue (read only integer)

Maximum value for CurrentReading.

#### Fans[]/CorrelatableID (read only string)

The CorrelatableID for this fan.

#### Temperatures[]/MinimumValue (read only integer)

Minimum value for CurrentReading.

#### Fans[]/UpperThresholdCritical (read only integer)

Above normal range but not yet fatal.

#### Temperatures[]/UpperThresholdFatal (read only integer)

Above normal range and is fatal.

#### Temperatures[]/Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### Temperatures[]/Oem/Hp/LocationYmm (read only integer)

The location of the sensor, in millimeters, along the Y axis from the logical reference point.

#### Fans[]/MaximumValue (read only integer)

Maximum value for CurrentReading.

#### Temperatures[]/LowerThresholdFatal (read only integer)

Below normal range and is fatal.

#### Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### Fans[]/Units (read only enumeration)

Units for the CurrentReading.

#### Fans[]/Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### Temperatures[]/Context (read only enumeration)

The area or device to which this temperature measurement applies.

#### Fans[]/LowerThresholdCritical (read only integer)

Below normal range but not yet fatal.

#### Temperatures[]/Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### Temperatures[]/Oem/Hp/LocationXmm (read only integer)

The location of the sensor, in millimeters, along the X axis from the logical reference point.

#### Fans[]/UpperThresholdFatal (read only integer)

Above normal range and is fatal.

#### Temperatures[]/Units (read only enumeration)

The temperature sensor's units.

#### Fans[]/LowerThresholdFatal (read only integer)

Below normal range and is fatal.

#### Status/Health (read only enumeration)

Indicates the health state of this resource without considering its dependent resources.

#### Fans[]/UpperThresholdNonCritical (read only integer)

Above normal range.

#### Fans[]/FanName (read only string)

The name of the fan sensor.

#### Temperatures[]/LowerThresholdNonCritical (read only integer)

Below normal range.

#### Fans[]/Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### Fans[]/Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### Status/State (read only enumeration)

Indicates the known state of this resource (for example, if the resource is enabled). Enabled indicates that the resource is available. Disabled indicates that the resource has been made unavailable intentionally, but it can be enabled. Offline indicates that the resource is unavailable intentionally and requires action to be made available. InTest indicates that the component is undergoing testing. Starting indicates that the resource is on its way to becoming available. Absent indicates that the resource is physically unavailable.

#### Temperatures[]/Number (read only integer)

A numerical identifier to represent the temperature sensor.

#### Fans[]/MinimumValue (read only integer)

Minimum value for CurrentReading.

#### Fans[]/Oem/Hp/Location (read only enumeration)

Indicates the component (i.e. CPU, Memory, and Storage) that the fan is being used to cool.

#### Fans[]/LowerThresholdNonCritical (read only integer)

Below normal range.

#### Temperatures[]/CurrentReading (read only integer)

The current reading of the temperature sensor.

#### Temperatures[]/LowerThresholdCritical (read only integer)

Below normal range but not yet fatal.

#### Fans[]/CurrentReading (read only integer)

The current speed of the fan.

#### Temperatures[]/CorrelatableID (read only string)

The CorrelatableID for this temperature sensor.

#### Temperatures[]/Status/HealthRollUp (read only enumeration)

Indicates the overall health state of this resource and its dependent resources.

#### Temperatures[]/UpperThresholdCritical (read only integer)

Above normal range but not yet fatal.

#### Fans[]/Context (read only enumeration)

The area or device to which this temperature measurement applies.

#### Temperatures[]/UpperThresholdNonCritical (read only integer)

The noncritical temperature threshold.

### VirtualMedia
This is the schema definition for the Virtual Media service.

**Instances**:  

* `https://{iLO}/redfish/v1/managers/{item}/virtualmedia/{item}`

#### ImageName (read only string)

The name of the image that is mounted on this server. This is usually provided when a URL image is mounted through scripted virtual media.

#### WriteProtected (read only boolean)

Indicates whether the virtual media is protected against write operations.

#### Inserted (read only boolean)

Indicates whether the virtual media is mounted on the server.

#### ConnectedVia (read only enumeration)

Specifies how the virtual media is connected to the server.

#### Image (string)

The valid URI indicating the image that is mounted on this server. A null value indicates that no image exists.

#### Oem/Hp/BootOnNextServerReset (boolean)

If set to true, the server will boot to this image on the next server reboot. The image will be ejected automatically on the second server reboot so that the server does not boot to this image twice.

