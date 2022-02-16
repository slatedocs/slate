# Enumerations

The SIERA API uses the following enumerations to limit variables to a range of choices.

## Action Cost Type

```
[ None, RevenueServiceCharge, CapitalNonRecoverable, CapitalRecoverable ]
```

| Enumeration           | Description                                                                                      |
| --------------------- | ------------------------------------------------------------------------------------------------ |
| None                  |                                                                                                  |
| RevenueServiceCharge  | Actions whose costs are claimed back through the tenant service charge                           |
| CapitalNonRecoverable | Actions whose costs are classed as capital non-recoverable through the life of the asset or site |
| CapitalRecoverable    | Actions whose costs are classed as capital recoverable through the life of the asset or site     |


## Action Measure Description

```
[ NotApplicable, SystemsCommissioningOrRetroCommissioning, AutomationSystemUpgradesOrReplacements, ManagementSystemsUpgradesOrReplacements, WallOrRoofInsulation, SmartGridOrSmartBuildingTechnologies, WindowReplacements, InstallationOfHighEfficiencyEquipment, InstallationOfOnSiteRenewableEnergy, OccupierEngagementOrInformationalTechnologies, HighEfficiencyOrDryFixtures, MeteringOfWaterSubsystems, ReuseOfStormWaterOrGreyWater, OnSiteWasteWaterTreatment, CoolingTower, LeakDetectionSystem, DripOrSmartIrrigation, DroughtTolerantOrNativeLandscaping, OngoingWastePerformanceMonitoring, Recycling, WasteManagement, WasteStreamAudit, CompostingLandscapeOrFoodWaste, AMR ]
```

| Enumeration                                   | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| --------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| NotApplicable                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| SystemsCommissioningOrRetroCommissioning      | The process of ensuring that systems are designed, installed, and functionally tested, and that they are capable of being operated and maintained to perform optimally                                                                                                                                                                                                                                                                                                                                                                       |
| AutomationSystemUpgradesOrReplacements        | Refers to the computer-based centralized system installed in buildings that controls and monitors equipment such as ventilation, airconditioning, heating, lighting, alarms and communications  Upgrades and replacements refers to the process of ensuring the building automation system is operating at full capacity, as to achieve optimal management of systems and increase energy efficiency                                                                                                                                         |
| ManagementSystemsUpgradesOrReplacements       | Energy management software solutions, which include functionality to forecast and adjust energy demand in a building                                                                                                                                                                                                                                                                                                                                                                                                                         |
| WallOrRoofInsulation                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| SmartGridOrSmartBuildingTechnologies          | Computer-based control and automation of electricity network systems, to support and manage electricity demand in a sustainable, integrated manner                                                                                                                                                                                                                                                                                                                                                                                           |
| WindowReplacements                            | Windows replacements of any kind on an asset to reduce overall consumption and thermal energy loss                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| InstallationOfHighEfficiencyEquipment         | Specification and purchase of electrical equipment and appliances that minimize the building‘s energy needs  This includes, but it is not limited to: energy efficient lighting upgrades/replacements and HVAC system upgrades/replacements                                                                                                                                                                                                                                                                                                  |
| InstallationOfOnSiteRenewableEnergy           | Renewable energy produced on-site, to meet some or all of the building’s energy requirements                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| OccupierEngagementOrInformationalTechnologies | Communication and information technologies implemented to inform and engage with tenants in regards to their energy use                                                                                                                                                                                                                                                                                                                                                                                                                      |
| HighEfficiencyOrDryFixtures                   | Appliances and plumbing equipment that conserve water without compromising performance (also known as “ultra-low-flow” fixtures) / Fixtures that do not require the use of water, such as composting toilet systems and waterless urinals                                                                                                                                                                                                                                                                                                    |
| MeteringOfWaterSubsystems                     | Installing sub-meters to measure the water consumption of applicable subsystems, such as irrigation, indoor plumbing fixtures, domestic hot water, reclaimed water or other process water uses, which supports effective water management and identifying opportunities for additional water savings                                                                                                                                                                                                                                         |
| ReuseOfStormWaterOrGreyWater                  | Water that collects during precipitation, which can be stored on-site for eventual reuse for non-potable applications  Examples can include, but are not limited to: landscape irrigation and/or flush fixtures                                                                                                                                                                                                                                                                                                                              |
| OnSiteWasteWaterTreatment                     | Process of water decontamination as a consequence of any anthropogenic, industrial or commercial use, before the water is released again into the environment or is re-used                                                                                                                                                                                                                                                                                                                                                                  |
| CoolingTower                                  | A cooling tower is a heat rejection device which extracts waste heat to the atmosphere through the cooling of a water stream to a lower temperature  Reduction of potable water consumption for cooling towers (or evaporative condenser equipment) can be achieved through effective water management, including conducting a water analysis to measure the concentration of at least five control parameters in order to optimize the cooling tower cycles and/or use of non-potable makeup water for a minimum of 20% of the makeup water |
| LeakDetectionSystem                           | Systems that detect water leaks  Examples can include, but are not limited to: condensate water overflow, chiller water leaks, plumbing line cracks, heating/cooling piping leaks and outside seepage                                                                                                                                                                                                                                                                                                                                        |
| DripOrSmartIrrigation                         | Drip irrigation systems save water by irrigating, fertilizing and aerating trees, shrubs, plants and bushes directly at the roots  Smart irrigation systems save water by adjusting the watering schedule and amount of water used for irrigation based on a variety of factors and inputs, including weather, plant species and soil type                                                                                                                                                                                                   |
| DroughtTolerantOrNativeLandscaping            | Adapted or indigenous vegetation that has evolved to the geography, hydrology and climate of a region requiring minimal or no supplemental watering beyond natural rainfall                                                                                                                                                                                                                                                                                                                                                                  |
| OngoingWastePerformanceMonitoring             | Track and measure ongoing waste volumes generated on a minimum quarterly basis, by either weight or volume, to help identify diversion and recycling opportunities within the organization  Conduct a minimum annual review to evaluate performance                                                                                                                                                                                                                                                                                          |
| Recycling                                     | A program for materials that can be locally recycled and contracted with a recycling service provider  Provide appropriately sized recycling collection and storage areas within the entity’s real estate holdings to enable occupants to sort, collect and divert materials from landfill                                                                                                                                                                                                                                                   |
| WasteManagement                               | Hazardous and non-hazardous waste including reuse, recycling, composting, recovery, incineration, landfill, and on-site storage                                                                                                                                                                                                                                                                                                                                                                                                              |
| WasteStreamAudit                              | A formal process used to quantify the type and amount of waste being generated, by weight or volume, to help identify effective waste reduction, separation and recycling opportunities                                                                                                                                                                                                                                                                                                                                                      |
| CompostingLandscapeOrFoodWaste                | Composting is the controlled decomposition of organic material which produces useful soil amendment products  Engage in landscape and/or food waste composting either on-site or by contracting with a composting service provider                                                                                                                                                                                                                                                                                                           |
| AMR                                           | Meter readings taken automatically at predefined frequencies by building management systems or smart metering systems                                                                                                                                                                                                                                                                                                                                                                                                                        |

## Action Scope

```
[ CommonAreas, Exterior, Landlord, TenantServices, WholeBuilding ]
```

| Enumeration    | Description                                                                                                                                                                            |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| CommonAreas    | Actions related to areas shared with other building occupants, including entrance areas, corridors, lifts, staircases,waste storage stores, communal kitchen, breakout facilities, etc |
| Exterior       | Actions related to the outdoor areas of an asset or site                                                                                                                               |
| Landlord       |                                                                                                                                                                                        |
| TenantServices | Actions related to lettable floor area, both vacant and let/leased                                                                                                                     |
| WholeBuilding  | Actions related to the entirety of an asset or site                                                                                                                                    |

## Action Status

```
[ ActionsUnderReview, AgreedActions, Completed, NotApplicable, Applicable ]
```

| Enumeration        | Description                                                                                      |
| ------------------ | ------------------------------------------------------------------------------------------------ |
| ActionsUnderReview | Actions which are being considered but not yet accepted                                          |
| AgreedActions      | Actions which have been agreed to be implemented or planned for implementation                   |
| Completed          | Actions which have been completed                                                                |
| NotApplicable      | Actions which have been considered not applicable for an asset or site                           |
| Applicable         | Actions which have been considered applicable for an asset or site and which are awaiting review |


## Action Utility

```
[ NotApplicable, DistrictCooling, DistrictHeating, Electricity, Gas, Water, Waste, Oil ]
```

| Enumeration     | Description                                                                                                                     |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| NotApplicable   | This enumeration cannot be selected and is only used to identify missing data in SIERA                                          |
| DistrictCooling | Actions relating to reductions in energy from [district cooling](https://en.wikipedia.org/wiki/District_cooling) energy sources |
| DistrictHeating | Actions relating to reductions in energy from [district heating](https://en.wikipedia.org/wiki/District_heating) energy sources |
| Electricity     | Actions relating to reductions in electrical energy usage                                                                       |
| Gas             | Actions relating to reductions in gas energy usage                                                                              |
| Water           | Actions relating to reductions in water usage                                                                                   |
| Waste           | Actions relating to reductions in waste                                                                                         |
| Oil             | Actions relating to meters providing energy as oil, such as flow meters                                                         |


## Area Covered

```
[ All, CommonAreas, SharedServices, WholeBuilding, OutdoorExteriorAreaParking, TenantSpace, NotSet ]
```

Area covered describes where the energy is used with the aim of understanding who is responsible for the energy usage or its reduction

| Enumeration                | Description                                                                                                                                                                        |
| -------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| All                        |                                                                                                                                                                                    |
| CommonAreas                | Energy used by areas shared with other building occupants, including entrance areas, corridors, lifts, staircases,waste storage stores, communal kitchen, breakout facilities, etc |
| SharedServices             | Shared Services/Central Plant is a central source providing energy for the whole building, including common areas and shared services for tenants                                  |
| WholeBuilding              | Energy used by tenants and base building services in both lettable/leasable and common spaces, but is not available or metered separately                                          |
| OutdoorExteriorAreaParking | Energy used in outdoor areas of an asset or site, including any parking spaces                                                                                                     |
| TenantSpace                | Lettable floor area (both vacant and let/leased areas) that is or can be occupied by tenants                                                                                       |
| NotSet                     | This enumeration cannot be selected and is only used to identify missing data in SIERA                                                                                             |

## Asset Control

```
[ Both, Landlord, Tenant ]
```

Asset control indicates who is responsible for the overall energy usage of the asset or site

| Enumeration | Description                                       |
| ----------- | ------------------------------------------------- |
| Both        |                                                   |
| Landlord    | An asset or site which is managed by the landlord |
| Tenant      | An asset or site which is managed by the tenant   |

## Consumption Energy Source

```
[ NationalGridStandard, NationalGridGreen, Renewable, Other ]
```

| Enumeration          | Description                                               |
| -------------------- | --------------------------------------------------------- |
| NationalGridStandard | Energy sourced from the national energy grid of a country |
| NationalGridGreen    | Energy sourced from a 100% renewable energy contract      |
| Renewable            | Energy sourced from renewable sources                     |
| Other                | Energy sourced from an unknown source                     |

## Controlled By

```
[ Unknown, ManagedAsset, IndirectlyManagedAsset ]
```

Controlled by indicates who is responsible for the overall energy usage of the asset or site

| Enumeration            | Description                                                                                                                   |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| Unknown                | An asset or site with unknown control. This enumeration cannot be selected and is only used to identify missing data in SIERA |
| ManagedAsset           | An asset or site which is managed by the landlord                                                                             |
| IndirectlyManagedAsset | An asset or site which is managed by the tenant                                                                               |

## Country

```
[ NotSpecified, Afghanistan, Albania, Algeria, Andorra, Angola, AntiguaAndDeps, Argentina, Armenia, Australia, Austria, Azerbaijan, Bahamas, Bahrain, Bangladesh, Barbados, Belarus, Belgium, Belize, Benin, Bhutan, Bolivia, BosniaHerzegovina, Botswana, Brazil, Brunei, Bulgaria, Burkina, Burundi, Cambodia, Cameroon, Canada, CapeVerde, CentralAfricanRep, Chad, Chile, China, Colombia, Comoros, Congo, CongoDemocraticRep, CostaRica, Croatia, Cuba, Cyprus, CzechRepublic, Denmark, Djibouti, Dominica, DominicanRepublic, EastTimor, Ecuador, Egypt, ElSalvador, EquatorialGuinea, Eritrea, Estonia, Ethiopia, Fiji, Finland, France, Gabon, Gambia, Georgia, Germany, Ghana, Greece, Grenada, Guatemala, Guinea, GuineaBissau, Guyana, Haiti, Honduras, Hungary, Iceland, India, Indonesia, Iran, Iraq, IrelandRepublic, Israel, Italy, IvoryCoast, Jamaica, Japan, Jordan, Kazakhstan, Kenya, Kiribati, KoreaNorth, KoreaSouth, Kosovo, Kuwait, Kyrgyzstan, Laos, Latvia, Lebanon, Lesotho, Liberia, Libya, Liechtenstein, Lithuania, Luxembourg, Macedonia, Madagascar, Malawi, Malaysia, Maldives, Mali, Malta, MarshallIslands, Mauritania, Mauritius, Mexico, Micronesia, Moldova, Monaco, Mongolia, Montenegro, Morocco, Mozambique, MyanmarBurma, Namibia, Nauru, Nepal, Netherlands, NewZealand, Nicaragua, Niger, Nigeria, Norway, Oman, Pakistan, Palau, Panama, PapuaNewGuinea, Paraguay, Peru, Philippines, Poland, Portugal, Qatar, Romania, RussianFederation, Rwanda, StKittsAndNevis, StLucia, SaintVincentAndTheGrenadines, Samoa, SanMarino, SaoTomeAndPrincipe, SaudiArabia, Senegal, Serbia, Seychelles, SierraLeone, Singapore, Slovakia, Slovenia, SolomonIslands, Somalia, SouthAfrica, SouthSudan, Spain, SriLanka, Sudan, Suriname, Swaziland, Sweden, Switzerland, Syria, Taiwan, Tajikistan, Tanzania, Thailand, Togo, Tonga, TrinidadAndTobago, Tunisia, Turkey, Turkmenistan, Tuvalu, Uganda, Ukraine, UnitedArabEmirates, UnitedKingdom, UnitedStates, Uruguay, Uzbekistan, Vanuatu, VaticanCity, Venezuela, Vietnam, Yemen, Zambia, Zimbabwe ]
```

SIERA uses the [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1) list of country names.

| Enumeration                  | Description                      |
| ---------------------------- | -------------------------------- |
| NotSpecified                 | NotSpecified                     |
| Afghanistan                  | Afghanistan                      |
| Albania                      | Albania                          |
| Algeria                      | Algeria                          |
| Andorra                      | Andorra                          |
| Angola                       | Angola                           |
| AntiguaAndDeps               | AntiguaAndDeps                   |
| Argentina                    | Argentina                        |
| Armenia                      | Armenia                          |
| Australia                    | Australia                        |
| Austria                      | Austria                          |
| Azerbaijan                   | Azerbaijan                       |
| Bahamas                      | Bahamas                          |
| Bahrain                      | Bahrain                          |
| Bangladesh                   | Bangladesh                       |
| Barbados                     | Barbados                         |
| Belarus                      | Belarus                          |
| Belgium                      | Belgium                          |
| Belize                       | Belize                           |
| Benin                        | Benin                            |
| Bhutan                       | Bhutan                           |
| Bolivia                      | Bolivia                          |
| BosniaHerzegovina            | Bosnia Herzegovina               |
| Botswana                     | Botswana                         |
| Brazil                       | Brazil                           |
| Brunei                       | Brunei                           |
| Bulgaria                     | Bulgaria                         |
| Burkina                      | Burkina                          |
| Burundi                      | Burundi                          |
| Cambodia                     | Cambodia                         |
| Cameroon                     | Cameroon                         |
| Canada                       | Canada                           |
| CapeVerde                    | CapeVerde                        |
| CentralAfricanRep            | Central African Republic         |
| Chad                         | Chad                             |
| Chile                        | Chile                            |
| China                        | China                            |
| Colombia                     | Colombia                         |
| Comoros                      | Comoros                          |
| Congo                        | Congo                            |
| CongoDemocraticRep           | Democratic Republic of Congo     |
| CostaRica                    | CostaRica                        |
| Croatia                      | Croatia                          |
| Cuba                         | Cuba                             |
| Cyprus                       | Cyprus                           |
| CzechRepublic                | Czech Republic                   |
| Denmark                      | Denmark                          |
| Djibouti                     | Djibouti                         |
| Dominica                     | Dominica                         |
| DominicanRepublic            | Dominican Republic               |
| EastTimor                    | EastTimor                        |
| Ecuador                      | Ecuador                          |
| Egypt                        | Egypt                            |
| ElSalvador                   | ElSalvador                       |
| EquatorialGuinea             | Equatorial Guinea                |
| Eritrea                      | Eritrea                          |
| Estonia                      | Estonia                          |
| Ethiopia                     | Ethiopia                         |
| Fiji                         | Fiji                             |
| Finland                      | Finland                          |
| France                       | France                           |
| Gabon                        | Gabon                            |
| Gambia                       | Gambia                           |
| Georgia                      | Georgia                          |
| Germany                      | Germany                          |
| Ghana                        | Ghana                            |
| Greece                       | Greece                           |
| Grenada                      | Grenada                          |
| Guatemala                    | Guatemala                        |
| Guinea                       | Guinea                           |
| GuineaBissau                 | GuineaBissau                     |
| Guyana                       | Guyana                           |
| Haiti                        | Haiti                            |
| Honduras                     | Honduras                         |
| Hungary                      | Hungary                          |
| Iceland                      | Iceland                          |
| India                        | India                            |
| Indonesia                    | Indonesia                        |
| Iran                         | Iran                             |
| Iraq                         | Iraq                             |
| IrelandRepublic              | IrelandRepublic                  |
| Israel                       | Israel                           |
| Italy                        | Italy                            |
| IvoryCoast                   | IvoryCoast                       |
| Jamaica                      | Jamaica                          |
| Japan                        | Japan                            |
| Jordan                       | Jordan                           |
| Kazakhstan                   | Kazakhstan                       |
| Kenya                        | Kenya                            |
| Kiribati                     | Kiribati                         |
| KoreaNorth                   | KoreaNorth                       |
| KoreaSouth                   | KoreaSouth                       |
| Kosovo                       | Kosovo                           |
| Kuwait                       | Kuwait                           |
| Kyrgyzstan                   | Kyrgyzstan                       |
| Laos                         | Laos                             |
| Latvia                       | Latvia                           |
| Lebanon                      | Lebanon                          |
| Lesotho                      | Lesotho                          |
| Liberia                      | Liberia                          |
| Libya                        | Libya                            |
| Liechtenstein                | Liechtenstein                    |
| Lithuania                    | Lithuania                        |
| Luxembourg                   | Luxembourg                       |
| Macedonia                    | Macedonia                        |
| Madagascar                   | Madagascar                       |
| Malawi                       | Malawi                           |
| Malaysia                     | Malaysia                         |
| Maldives                     | Maldives                         |
| Mali                         | Mali                             |
| Malta                        | Malta                            |
| MarshallIslands              | Marshall Islands                 |
| Mauritania                   | Mauritania                       |
| Mauritius                    | Mauritius                        |
| Mexico                       | Mexico                           |
| Micronesia                   | Micronesia                       |
| Moldova                      | Moldova                          |
| Monaco                       | Monaco                           |
| Mongolia                     | Mongolia                         |
| Montenegro                   | Montenegro                       |
| Morocco                      | Morocco                          |
| Mozambique                   | Mozambique                       |
| MyanmarBurma                 | MyanmarBurma                     |
| Namibia                      | Namibia                          |
| Nauru                        | Nauru                            |
| Nepal                        | Nepal                            |
| Netherlands                  | Netherlands                      |
| NewZealand                   | NewZealand                       |
| Nicaragua                    | Nicaragua                        |
| Niger                        | Niger                            |
| Nigeria                      | Nigeria                          |
| Norway                       | Norway                           |
| Oman                         | Oman                             |
| Pakistan                     | Pakistan                         |
| Palau                        | Palau                            |
| Panama                       | Panama                           |
| PapuaNewGuinea               | PapuaNewGuinea                   |
| Paraguay                     | Paraguay                         |
| Peru                         | Peru                             |
| Philippines                  | Philippines                      |
| Poland                       | Poland                           |
| Portugal                     | Portugal                         |
| Qatar                        | Qatar                            |
| Romania                      | Romania                          |
| RussianFederation            | Russian Federation               |
| Rwanda                       | Rwanda                           |
| StKittsAndNevis              | St Kitts And Nevis               |
| StLucia                      | St Lucia                         |
| SaintVincentAndTheGrenadines | Saint Vincent and the Grenadines |
| Samoa                        | Samoa                            |
| SanMarino                    | San Marino                       |
| SaoTomeAndPrincipe           | Sao Tome and Principe            |
| SaudiArabia                  | Saudi Arabia                     |
| Senegal                      | Senegal                          |
| Serbia                       | Serbia                           |
| Seychelles                   | Seychelles                       |
| SierraLeone                  | Sierra Leone                     |
| Singapore                    | Singapore                        |
| Slovakia                     | Slovakia                         |
| Slovenia                     | Slovenia                         |
| SolomonIslands               | Solomon Islands                  |
| Somalia                      | Somalia                          |
| SouthAfrica                  | SouthAfrica                      |
| SouthSudan                   | SouthSudan                       |
| Spain                        | Spain                            |
| SriLanka                     | SriLanka                         |
| Sudan                        | Sudan                            |
| Suriname                     | Suriname                         |
| Swaziland                    | Swaziland                        |
| Sweden                       | Sweden                           |
| Switzerland                  | Switzerland                      |
| Syria                        | Syria                            |
| Taiwan                       | Taiwan                           |
| Tajikistan                   | Tajikistan                       |
| Tanzania                     | Tanzania                         |
| Thailand                     | Thailand                         |
| Togo                         | Togo                             |
| Tonga                        | Tonga                            |
| TrinidadAndTobago            | Trinidad and Tobago              |
| Tunisia                      | Tunisia                          |
| Turkey                       | Turkey                           |
| Turkmenistan                 | Turkmenistan                     |
| Tuvalu                       | Tuvalu                           |
| Uganda                       | Uganda                           |
| Ukraine                      | Ukraine                          |
| UnitedArabEmirates           | United Arab Emirates             |
| UnitedKingdom                | United Kingdom                   |
| UnitedStates                 | United States                    |
| Uruguay                      | Uruguay                          |
| Uzbekistan                   | Uzbekistan                       |
| Vanuatu                      | Vanuatu                          |
| VaticanCity                  | Vatican City                     |
| Venezuela                    | Venezuela                        |
| Vietnam                      | Vietnam                          |
| Yemen                        | Yemen                            |
| Zambia                       | Zambia                           |
| Zimbabwe                     | Zimbabwe                         |


## Currency

```
[ BritishPound, USDollar, Euros ]
```

| Enumeration  | Description                 |
| ------------ | --------------------------- |
| BritishPound | Great British Pound (GBP £) |
| USDollar     | US Dollar (USD $)           |
| Euros        | Euros (EUR €)               |


## Generation Type

```
[ NotSpecified, NationalGrid, NationalGridGreen, CHP, SelfSupplyRenewables ]
```

| Enumeration          | Description                                                                                                                                                                                            |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| NotSpecified         | This enumeration cannot be selected and is only used to identify missing data in SIERA                                                                                                                 |
| NationalGrid         | Energy sourced from the national energy grid of a country                                                                                                                                              |
| NationalGridGreen    | Energy sourced from a 100% renewable energy contract                                                                                                                                                   |
| CHP                  | Combined heat and power, also known as cogeneration, is the concurrent production of electricity or mechanical power and useful thermal energy (heating and/or cooling) from a single source of energy |
| SelfSupplyRenewables | Energy sourced from on-site renewable consumption                                                                                                                                                      |


## Measurement Unit

```
[ M2, FT2 ]
```

| Enumeration | Description    |
| ----------- | -------------- |
| M2          | Meters squared |
| FT2         | Feet squared   |

## Meter Consumption Type

```
[ Actual, Estimate ]
```

| Enumeration | Description                                              |
| ----------- | -------------------------------------------------------- |
| Actual      | Consumption that was read from the meter                 |
| Estimate    | Consumption that was estimated based upon other readings |

## Meter Control

```
[ Landlord, Tenant ]
```

| Enumeration | Description                                 |
| ----------- | ------------------------------------------- |
| Landlord    | Meter consumption purchased by the landlord |
| Tenant      | Meter consumption purchased by the tenant   |

## Meter Type

```
[ Electricity, Water, Gas, Oil, DistrictHeating, DistrictCooling, Carbon, Waste ]
```

| Enumeration     | Description                                                                                                 |
| --------------- | ----------------------------------------------------------------------------------------------------------- |
| Electricity     | Meters providing electrical energy                                                                          |
| Water           | Meters providing water                                                                                      |
| Gas             | Meters providing gas energy                                                                                 |
| Oil             | Meters providing energy as oil, such as flow meters                                                         |
| DistrictHeating | Meters providing [heating energy from a centralised source](https://en.wikipedia.org/wiki/District_heating) |
| DistrictCooling | Meters providing [cooling from a centralised source](https://en.wikipedia.org/wiki/District_cooling)        |
| Carbon          |                                                                                                             |
| Waste           |                                                                                                             |

## Sector

```
[ Retail, Office, Industrial, Residential, Hotel, LodgingLeisureRecreation, Education, TechnologyScience, Healthcare, MixedUseOffice, Other ]
```

The Sector enumeration defines the different property sectors used by SIERA

| Enumeration              | Description                                                                                                                   |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------------- |
| Retail                   | Any retail site or asset                                                                                                      |
| Office                   | Any office site or asset                                                                                                      |
| Industrial               | Any industrial site or asset                                                                                                  |
| Residential              | Any residential site or asset                                                                                                 |
| Hotel                    | Any hotel, motel, youth hostel, lodging or resort                                                                             |
| LodgingLeisureRecreation | Sites or assets related to leisure and recreation such as (but not limited to) stadiums, fitness centers, museums or theatres |
| Education                | Any school, college, university or library.                                                                                   |
| TechnologyScience        | Sites or assets related to technology or science such as data centres, laboratories or research facilities                    |
| Healthcare               | Sites or assets related to healthcare, medecine or residential care                                                           |
| MixedUseOffice           | Offices containing a mix of one or more other sectors, such as Offices with Retail                                            |
| Other                    | Any site or asset which does not fit another sector                                                                           |

## Tariff Type

```
[ LocationBased, MarketBased ]
```

Tariff Type is used on [carbon factors](#carbon-factors) to indicate whether a carbon emissions factors relates to a location based factor or a factor which reflects the carbon emissions of a specific supplier and a contract

| Enumeration   | Description                                          |
| ------------- | ---------------------------------------------------- |
| LocationBased | Carbon factors based upon a location such as country |
| MarketBased   | Carbon factors based upon a specific energy supplier |

## Waste Destination

```
[ AnaerobicDigestion, Incinerator, Landfill, MRFIncinerator, MRFLandfill, MRFUnknown, Recycled, Compost, Reuse ]
```

The 

| Enumeration        | Description                                                                                                                                                     |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| AnaerobicDigestion | [Anaerobic digestion](https://en.wikipedia.org/wiki/Anaerobic_digestion) is a destination where waste is broken down by microorganisms in teh absence of oxygen |
| Incinerator        | Incinerated waste which has no recyclable, or reusable component                                                                                                |
| Landfill           | Waste which goes to a landfill                                                                                                                                  |
| MRFIncinerator     | A [materials recovery facility](https://en.wikipedia.org/wiki/Materials_recovery_facility) including a incinerator for the waste which cannot be recovered      |
| MRFLandfill        | A [materials recovery facility](https://en.wikipedia.org/wiki/Materials_recovery_facility) including a landfill for the waste which cannot be recovered         |
| MRFUnknown         | A [materials recovery facility](https://en.wikipedia.org/wiki/Materials_recovery_facility) with an unknown destination for the waste which cannot be recovered  |
| Recycled           | Directly recycled waste                                                                                                                                         |
| Compost            | Directly composted waste for later reuse                                                                                                                        |
| Reuse              | Directly reusable waste                                                                                                                                         |

## Waste Stream

```
[ GeneralWaste, MixedRecyclables, Plastics, PaperandCardboard, Glass, MixedMetals, Food, WEEE, FluorescentTubes, InterceptorWaste, PrinterToners ]
```

The waste stream of a [waste destination](#waste-destination) is a categorisation of the waste being disposed of

| Enumeration       | Description                                                                                                                                                 |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| MixedRecyclables  | Mixed recyclables disposed of together such as plastic and paper waste                                                                                      |
| Plastics          | Any plastic waste                                                                                                                                           |
| PaperandCardboard | Any paper or carboard waste                                                                                                                                 |
| Glass             | Glass waste                                                                                                                                                 |
| MixedMetals       | Metal waste of any kind disposed of alone or aggregated                                                                                                     |
| Food              | Food waste or any other byproduct                                                                                                                           |
| WEEE              | [Waste electrical and electronic equipment] (https://ec.europa.eu/environment/topics/waste-and-recycling/waste-electrical-and-electronic-equipment-weee_en) |
| FluorescentTubes  | Flourescent lighting tubes                                                                                                                                  |
| InterceptorWaste  | Materials used as a waste interceptor                                                                                                                       |
| PrinterToners     | Printer toners                                                                                                                                              |
| GeneralWaste      | Waste that does not fit into any other stream type                                                                                                          |
