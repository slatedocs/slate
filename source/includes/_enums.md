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


## Asset Status

```
[ NotSpecified, StandingInvestment, Land, ResidentialDevelopment, Built, NewConstruction, MajorRenovation, MajorRefurbishment ]
```

Asset status indicates the current state of the asset in relation to its ability to be commercially occupied

| Enumeration | Description                                                  |
| ---------------------- | ------------------------------------------------- |
| NotSpecified           | Not Specified |
| StandingInvestment     | Standing Investment |
| Land                   | Land |
| ResidentialDevelopment | Residential Development |
| Built                  | Built |
| NewConstruction        | New Construction |
| MajorRenovation        | Major Renovation |
| MajorRefurbishment     | Major Refurbishment |

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
[ NotSpecified, Afghanistan, AlandIslands, Albania, Algeria, AmericanSamoa, Andorra, Angola, Anguilla, Antarctica, AntiguaandBarbuda, Argentina, Armenia, Aruba, Australia, Austria, Azerbaijan, Bahamas, Bahrain, Bangladesh, Barbados, Belarus, Belgium, Belize, Benin, Bermuda, Bhutan, Bolivia, BonaireSintEustatiusandSaba, BosniaHerzegovina, Botswana, BouvetIsland, Brazil, BritishIndianOceanTerritory, BruneiDarussalam, Bulgaria, BurkinaFaso, Burundi, CaboVerde, Cambodia, Cameroon, Canada, CaymanIslands, CentralAfricanRepublic, Chad, Chile, China, ChristmasIsland, CocosKeelingIslands, Colombia, Comoros, Congo, CongoDemocraticRepublic, CookIslands, CostaRica, CotedIvoire, Croatia, Cuba, Curacao, Cyprus, Czechia, Denmark, Djibouti, Dominica, DominicanRepublic, Ecuador, Egypt, ElSalvador, EquatorialGuinea, Eritrea, Estonia, Eswatini, Ethiopia, FalklandIslands, FaroeIslands, Fiji, Finland, France, FrenchGuiana, FrenchPolynesia, FrenchSouthernTerritories, Gabon, Gambia, Georgia, Germany, Ghana, Gibraltar, Greece, Greenland, Grenada, Guadeloupe, Guam, Guatemala, Guernsey, Guinea, GuineaBissau, Guyana, Haiti, HeardIslandandMcDonaldIslands, HolySee, Honduras, HongKong, Hungary, Iceland, India, Indonesia, Iran, Iraq, Ireland, IsleofMan, Israel, Italy, Jamaica, Japan, Jersey, Jordan, Kazakhstan, Kenya, Kiribati, KoreaNorth, KoreaSouth, Kuwait, Kyrgyzstan, Lao, Latvia, Lebanon, Lesotho, Liberia, Libya, Liechtenstein, Lithuania, Luxembourg, Macao, Madagascar, Malawi, Malaysia, Maldives, Mali, Malta, Malvinas, MarshallIslands, Martinique, Mauritania, Mauritius, Mayotte, Mexico, Micronesia, Moldova, Monaco, Mongolia, Montenegro, Montserrat, Morocco, Mozambique, Myanmar, Namibia, Nauru, Nepal, Netherlands, NewCaledonia, NewZealand, Nicaragua, Niger, Nigeria, Niue, NorfolkIsland, NorthMacedonia, NorthernMarianaIslands, Norway, Oman, Pakistan, Palau, Palestine, Panama, PapuaNewGuinea, Paraguay, Peru, Philippines, Pitcairn, Poland, Portugal, PuertoRico, Qatar, Reunion, Romania, RussianFederation, Rwanda, SaintBarthelemy, SaintHelenaAscensionandTristandaCunha, SaintKittsandNevis, SaintLucia, SaintMartin, SaintPierreandMiquelon, SaintVincentandtheGrenadines, Samoa, SanMarino, SaoTomeandPrincipe, SaudiArabia, Senegal, Serbia, Seychelles, SierraLeone, Singapore, SintMaarten, Slovakia, Slovenia, SolomonIslands, Somalia, SouthAfrica, SouthGeorgiaandtheSouthSandwichIslands, SouthSudan, Spain, SriLanka, Sudan, Suriname, SvalbardandJanMayen, Sweden, Switzerland, SyrianArabRepublic, Taiwan, Tajikistan, Tanzania, Thailand, TimorLeste, Togo, Tokelau, Tonga, TrinidadandTobago, Tunisia, Turkey, Turkmenistan, TurksandCaicosIslands, Tuvalu, Uganda, Ukraine, UnitedArabEmirates, UnitedKingdom, UnitedStatesMinorOutlyingIslands, UnitedStates, Uruguay, Uzbekistan, Vanuatu, Venezuela, VietNam, VirginIslandsBritish, VirginIslandsUS, WallisandFutuna, WesternSahara, Yemen, Zambia, Zimbabwe ]
```

SIERA uses the [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1) list of country names.

| Enumeration                            | Description                                  |
| -------------------------------------- | -------------------------------------------- |
| NotSpecified                           | NotSpecified                                 |
| Afghanistan                            | Afghanistan                                  |
| AlandIslands                           | Åland Islands                                |
| Albania                                | Albania                                      |
| Algeria                                | Algeria                                      |
| AmericanSamoa                          | American Samoa                               |
| Andorra                                | Andorra                                      |
| Angola                                 | Angola                                       |
| Anguilla                               | Anguilla                                     |
| Antarctica                             | Antarctica                                   |
| AntiguaandBarbuda                      | Antigua and Barbuda                          |
| Argentina                              | Argentina                                    |
| Armenia                                | Armenia                                      |
| Aruba                                  | Aruba                                        |
| Australia                              | Australia                                    |
| Austria                                | Austria                                      |
| Azerbaijan                             | Azerbaijan                                   |
| Bahamas                                | Bahamas                                      |
| Bahrain                                | Bahrain                                      |
| Bangladesh                             | Bangladesh                                   |
| Barbados                               | Barbados                                     |
| Belarus                                | Belarus                                      |
| Belgium                                | Belgium                                      |
| Belize                                 | Belize                                       |
| Benin                                  | Benin                                        |
| Bermuda                                | Bermuda                                      |
| Bhutan                                 | Bhutan                                       |
| Bolivia                                | Bolivia (Plurinational State of)             |
| BonaireSintEustatiusandSaba            | Bonaire, Sint Eustatius and Saba             |
| BosniaHerzegovina                      | Bosnia and Herzegovina                       |
| Botswana                               | Botswana                                     |
| BouvetIsland                           | Bouvet Island                                |
| Brazil                                 | Brazil                                       |
| BritishIndianOceanTerritory            | British Indian Ocean Territory               |
| BruneiDarussalam                       | Brunei Darussalam                            |
| Bulgaria                               | Bulgaria                                     |
| BurkinaFaso                            | Burkina Faso                                 |
| Burundi                                | Burundi                                      |
| CaboVerde                              | Cabo Verde                                   |
| Cambodia                               | Cambodia                                     |
| Cameroon                               | Cameroon                                     |
| Canada                                 | Canada                                       |
| CaymanIslands                          | Cayman Islands                               |
| CentralAfricanRepublic                 | Central African Republic                     |
| Chad                                   | Chad                                         |
| Chile                                  | Chile                                        |
| China                                  | China                                        |
| ChristmasIsland                        | Christmas Island                             |
| CocosKeelingIslands                    | Cocos (Keeling) Islands                      |
| Colombia                               | Colombia                                     |
| Comoros                                | Comoros                                      |
| Congo                                  | Congo                                        |
| CongoDemocraticRepublic                | Congo, Democratic Republic of the            |
| CookIslands                            | Cook Islands                                 |
| CostaRica                              | Costa Rica                                   |
| CotedIvoire                            | Côte d'Ivoire                                |
| Croatia                                | Croatia                                      |
| Cuba                                   | Cuba                                         |
| Curacao                                | Curaçao                                      |
| Cyprus                                 | Cyprus                                       |
| Czechia                                | Czechia                                      |
| Denmark                                | Denmark                                      |
| Djibouti                               | Djibouti                                     |
| Dominica                               | Dominica                                     |
| DominicanRepublic                      | Dominican Republic                           |
| Ecuador                                | Ecuador                                      |
| Egypt                                  | Egypt                                        |
| ElSalvador                             | El Salvador                                  |
| EquatorialGuinea                       | Equatorial Guinea                            |
| Eritrea                                | Eritrea                                      |
| Estonia                                | Estonia                                      |
| Eswatini                               | Eswatini                                     |
| Ethiopia                               | Ethiopia                                     |
| FalklandIslands                        | Falkland Islands (Malvinas)                  |
| FaroeIslands                           | Faroe Islands                                |
| Fiji                                   | Fiji                                         |
| Finland                                | Finland                                      |
| France                                 | France                                       |
| FrenchGuiana                           | French Guiana                                |
| FrenchPolynesia                        | French Polynesia                             |
| FrenchSouthernTerritories              | French Southern Territories                  |
| Gabon                                  | Gabon                                        |
| Gambia                                 | Gambia                                       |
| Georgia                                | Georgia                                      |
| Germany                                | Germany                                      |
| Ghana                                  | Ghana                                        |
| Gibraltar                              | Gibraltar                                    |
| Greece                                 | Greece                                       |
| Greenland                              | Greenland                                    |
| Grenada                                | Grenada                                      |
| Guadeloupe                             | Guadeloupe                                   |
| Guam                                   | Guam                                         |
| Guatemala                              | Guatemala                                    |
| Guernsey                               | Guernsey                                     |
| Guinea                                 | Guinea                                       |
| Guinea-Bissau                          | Guinea-Bissau                                |
| Guyana                                 | Guyana                                       |
| Haiti                                  | Haiti                                        |
| HeardIslandandMcDonaldIslands          | Heard Island and McDonald Islands            |
| HolySee                                | Holy See                                     |
| Honduras                               | Honduras                                     |
| HongKong                               | Hong Kong                                    |
| Hungary                                | Hungary                                      |
| Iceland                                | Iceland                                      |
| India                                  | India                                        |
| Indonesia                              | Indonesia                                    |
| Iran                                   | Iran (Islamic Republic of)                   |
| Iraq                                   | Iraq                                         |
| Ireland                                | Ireland                                      |
| IsleofMan                              | Isle of Man                                  |
| Israel                                 | Israel                                       |
| Italy                                  | Italy                                        |
| Jamaica                                | Jamaica                                      |
| Japan                                  | Japan                                        |
| Jersey                                 | Jersey                                       |
| Jordan                                 | Jordan                                       |
| Kazakhstan                             | Kazakhstan                                   |
| Kenya                                  | Kenya                                        |
| Kiribati                               | Kiribati                                     |
| KoreaNorth                             | Korea (Democratic People's Republic of)      |
| KoreaSouth                             | Korea, Republic of                           |
| Kuwait                                 | Kuwait                                       |
| Kyrgyzstan                             | Kyrgyzstan                                   |
| Lao                                    | Lao People's Democratic Republic             |
| Latvia                                 | Latvia                                       |
| Lebanon                                | Lebanon                                      |
| Lesotho                                | Lesotho                                      |
| Liberia                                | Liberia                                      |
| Libya                                  | Libya                                        |
| Liechtenstein                          | Liechtenstein                                |
| Lithuania                              | Lithuania                                    |
| Luxembourg                             | Luxembourg                                   |
| Macao                                  | Macao                                        |
| Madagascar                             | Madagascar                                   |
| Malawi                                 | Malawi                                       |
| Malaysia                               | Malaysia                                     |
| Maldives                               | Maldives                                     |
| Mali                                   | Mali                                         |
| Malta                                  | Malta                                        |
| Malvinas                               | Malvinas                                     |
| MarshallIslands                        | Marshall Islands                             |
| Martinique                             | Martinique                                   |
| Mauritania                             | Mauritania                                   |
| Mauritius                              | Mauritius                                    |
| Mayotte                                | Mayotte                                      |
| Mexico                                 | Mexico                                       |
| Micronesia                             | Micronesia (Federated States of)             |
| Moldova                                | Moldova, Republic of                         |
| Monaco                                 | Monaco                                       |
| Mongolia                               | Mongolia                                     |
| Montenegro                             | Montenegro                                   |
| Montserrat                             | Montserrat                                   |
| Morocco                                | Morocco                                      |
| Mozambique                             | Mozambique                                   |
| Myanmar                                | Myanmar                                      |
| Namibia                                | Namibia                                      |
| Nauru                                  | Nauru                                        |
| Nepal                                  | Nepal                                        |
| Netherlands                            | Netherlands                                  |
| NewCaledonia                           | New Caledonia                                |
| NewZealand                             | New Zealand                                  |
| Nicaragua                              | Nicaragua                                    |
| Niger                                  | Niger                                        |
| Nigeria                                | Nigeria                                      |
| Niue                                   | Niue                                         |
| NorfolkIsland                          | Norfolk Island                               |
| NorthMacedonia                         | North Macedonia                              |
| NorthernMarianaIslands                 | Northern Mariana Islands                     |
| Norway                                 | Norway                                       |
| Oman                                   | Oman                                         |
| Pakistan                               | Pakistan                                     |
| Palau                                  | Palau                                        |
| Palestine                              | Palestine, State of                          |
| Panama                                 | Panama                                       |
| PapuaNewGuinea                         | Papua New Guinea                             |
| Paraguay                               | Paraguay                                     |
| Peru                                   | Peru                                         |
| Philippines                            | Philippines                                  |
| Pitcairn                               | Pitcairn                                     |
| Poland                                 | Poland                                       |
| Portugal                               | Portugal                                     |
| PuertoRico                             | Puerto Rico                                  |
| Qatar                                  | Qatar                                        |
| Reunion                                | Réunion                                      |
| Romania                                | Romania                                      |
| RussianFederation                      | Russian Federation                           |
| Rwanda                                 | Rwanda                                       |
| SaintBarthelemy                        | Saint Barthélemy                             |
| SaintHelenaAscensionandTristandaCunha  | Saint Helena, Ascension and Tristan da Cunha |
| SaintKittsandNevis                     | Saint Kitts and Nevis                        |
| SaintLucia                             | Saint Lucia                                  |
| SaintMartin                            | Saint Martin (French part)                   |
| SaintPierreandMiquelon                 | Saint Pierre and Miquelon                    |
| SaintVincentandtheGrenadines           | Saint Vincent and the Grenadines             |
| Samoa                                  | Samoa                                        |
| SanMarino                              | San Marino                                   |
| SaoTomeandPrincipe                     | Sao Tome and Principe                        |
| SaudiArabia                            | Saudi Arabia                                 |
| Senegal                                | Senegal                                      |
| Serbia                                 | Serbia                                       |
| Seychelles                             | Seychelles                                   |
| SierraLeone                            | Sierra Leone                                 |
| Singapore                              | Singapore                                    |
| SintMaarten                            | Sint Maarten (Dutch part)                    |
| Slovakia                               | Slovakia                                     |
| Slovenia                               | Slovenia                                     |
| SolomonIslands                         | Solomon Islands                              |
| Somalia                                | Somalia                                      |
| SouthAfrica                            | South Africa                                 |
| SouthGeorgiaandtheSouthSandwichIslands | South Georgia and the South Sandwich Islands |
| SouthSudan                             | South Sudan                                  |
| Spain                                  | Spain                                        |
| SriLanka                               | Sri Lanka                                    |
| Sudan                                  | Sudan                                        |
| Suriname                               | Suriname                                     |
| SvalbardandJanMayen                    | Svalbard and Jan Mayen                       |
| Sweden                                 | Sweden                                       |
| Switzerland                            | Switzerland                                  |
| SyrianArabRepublic                     | Syrian Arab Republic                         |
| Taiwan                                 | Taiwan, Province of China                    |
| Tajikistan                             | Tajikistan                                   |
| Tanzania                               | Tanzania, United Republic of                 |
| Thailand                               | Thailand                                     |
| TimorLeste                             | Timor-Leste                                  |
| Togo                                   | Togo                                         |
| Tokelau                                | Tokelau                                      |
| Tonga                                  | Tonga                                        |
| TrinidadandTobago                      | Trinidad and Tobago                          |
| Tunisia                                | Tunisia                                      |
| Turkey                                 | Turkey                                       |
| Turkmenistan                           | Turkmenistan                                 |
| TurksandCaicosIslands                  | Turks and Caicos Islands                     |
| Tuvalu                                 | Tuvalu                                       |
| Uganda                                 | Uganda                                       |
| Ukraine                                | Ukraine                                      |
| UnitedArabEmirates                     | United Arab Emirates                         |
| UnitedKingdom                          | United Kingdom                               |
| UnitedStatesMinorOutlyingIslands       | United States Minor Outlying Islands         |
| UnitedStates                           | United States                                |
| Uruguay                                | Uruguay                                      |
| Uzbekistan                             | Uzbekistan                                   |
| Vanuatu                                | Vanuatu                                      |
| Venezuela                              | Venezuela (Bolivarian Republic of)           |
| VietNam                                | Viet Nam                                     |
| VirginIslandsBritish                   | Virgin Islands (British)                     |
| VirginIslandsUS                        | Virgin Islands (U.S.)                        |
| WallisandFutuna                        | Wallis and Futuna                            |
| WesternSahara                          | Western Sahara                               |
| Yemen                                  | Yemen                                        |
| Zambia                                 | Zambia                                       |
| Zimbabwe                               | Zimbabwe                                     |


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


## Gresb Sector

```
[ Other, EducationLibrary, EducationOther, EducationSchool, EducationUniversity, Healthcare, HealthcareCenter, HealthcareOther, HealthcareSeniorHomes, Hotel, IndustrialBusinessParks, IndustrialDistributionWarehouse, IndustrialPark, IndustrialManufacturing, IndustrialOther, LodgingLeisureRecreation, LodgingLeisureRecreationFitnessCenter, LodgingLeisureRecreationIndoorArena, LodgingLeisureRecreationMuseumGallery, LodgingLeisureRecreationOther, LodgingLeisureRecreationPerformingArts, LodgingLeisureRecreationSwimmingCenter, MedicalOffice, MixedUseOfficeIndustrial, MixedUseOfficeResidential, MisedUseOfficeRetail, MixedUseOther, Office, OfficeBusinessPark, OfficeCorporateHighRise, OfficeCorporateLowRise, OfficeCorporateMidRise, OfficeMedical, OfficeOther, OtherParkingIndoors, OtherSelfStorage, ResidentialMultiFamily, ResidentialFamilyHomes, ResidentialMultiFamilyHighRise, ResidentialMultiFamilyLowRise, ResidentialMultiFamilyMidRise, ResidentialOther, ResidentialRetirementLiving, ResidentialStudentHousing, RetailHighStreet, RetailOther, RetailRestaurantsBars, RetailLifestyleCenter, RetailShoppingCenter, RetailCenterStripMall, RetailCenterWarehouse, TechnologyScienceDataCenter, TechnologyScienceLaboratory, TechnologyScienceOther ]
```

| Enumeration                            | Description                                       |
| -------------------------------------- | ------------------------------------------------- |
| Other                                  | Other                                             |
| EducationLibrary                       | Education: Library                                |
| EducationOther                         | Education: Other                                  |
| EducationSchool                        | Education: School                                 |
| EducationUniversity                    | Education: University                             |
| Healthcare                             | Healthcare                                        |
| HealthcareCenter                       | Healthcare: Healthcare Center                     |
| HealthcareOther                        | Healthcare: Other                                 |
| HealthcareSeniorHomes                  | Healthcare: Senior Homes                          |
| Hotel                                  | Hotel                                             |
| IndustrialBusinessParks                | Industrial: Business Parks                        |
| IndustrialDistributionWarehouse        | Industrial: Distribution Warehouse                |
| IndustrialPark                         | Industrial: Industrial Park                       |
| IndustrialManufacturing                | Industrial: Manufacturing                         |
| IndustrialOther                        | Industrial: Other                                 |
| LodgingLeisureRecreation               | Lodging, Leisure & Recreation                     |
| LodgingLeisureRecreationFitnessCenter  | Lodging, Leisure & Recreation: Fitness Center     |
| LodgingLeisureRecreationIndoorArena    | Lodging, Leisure & Recreation: Indoor Arena       |
| LodgingLeisureRecreationMuseumGallery  | Lodging, Leisure & Recreation: Museum/Gallery     |
| LodgingLeisureRecreationOther          | Lodging, Leisure & Recreation: Other              |
| LodgingLeisureRecreationPerformingArts | Lodging, Leisure & Recreation: Performing Arts    |
| LodgingLeisureRecreationSwimmingCenter | Lodging, Leisure & Recreation: Swimming Center    |
| MedicalOffice                          | Medical Office                                    |
| MixedUseOfficeIndustrial               | Mixed Use: Office/Industrial                      |
| MixedUseOfficeResidential              | Mixed Use: Office/Residential                     |
| MisedUseOfficeRetail                   | Mixed Use: Office/Retail                          |
| MixedUseOther                          | Mixed Use: Other                                  |
| Office                                 | Office                                            |  
| OfficeBusinessPark                     | Office: Business Park                             |
| OfficeCorporateHighRise                | Office: Corporate: High-Rise Office               |
| OfficeCorporateLowRise                 | Office: Corporate: Low-Rise Office                |
| OfficeCorporateMidRise                 | Office: Corporate: Mid-Rise Office                |
| OfficeMedical                          | Office: Medical Office                            |
| OfficeOther                            | Office: Other                                     |
| OtherParkingIndoors                    | Other: Parking (Indoors)                          |
| OtherSelfStorage                       | Other: Self-Storage                               |
| ResidentialMultiFamily                 | Residential, Multi-family                         |
| ResidentialFamilyHomes                 | Residential: Family Homes                         |
| ResidentialMultiFamilyHighRise         | Residential: Multi-Family: High-Rise Multi-Family |
| ResidentialMultiFamilyLowRise          | Residential: Multi-Family: Low-Rise Multi-Family  |
| ResidentialMultiFamilyMidRise          | Residential: Multi-Family: Mid-Rise Multi Family  |
| ResidentialOther                       | Residential: Other                                |
| ResidentialRetirementLiving            | Residential: Retirement Living                    |
| ResidentialStudentHousing              | Residential: Student Housing                      |
| RetailHighStreet                       | Retail: High Street                               |
| RetailOther                            | Retail: Other                                     |
| RetailRestaurantsBars                  | Retail: Restaurants/Bars                          |
| RetailLifestyleCenter                  | Retail: Retail Centers: Lifestyle Center          |
| RetailShoppingCenter                   | Retail: Retail Centers: Shopping Center           |
| RetailCenterStripMall                  | Retail: Retail Centers: Strip Mall                |
| RetailCenterWarehouse                  | Retail: Retail Centers: Warehouse                 |
| TechnologyScienceDataCenter            | Technology/Science: Data Center                   |
| TechnologyScienceLaboratory            | Technology/Science: Laboratory/Life Sciences      |
| TechnologyScienceOther                 | Technology/Science: Other                         |


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

## EPC Scope

```
[ NotSpecified, WholeBuilding, Unit ]
```

| Enumeration | Description                                   |
| ------------- | ------------------------------------------- |
| NotSpecified  | Not Specified                               |
| WholeBuilding | Whole Building                              |
| Unit          | Unit                                        |

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
