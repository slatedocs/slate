# Build a property from scratch

## Creating an individual property

**WARNING:** Not be confused with creating a property for a *multi*-property accommodation partner (MPP). See [creating a property]().

<table>
  <tr>
    <td>POST https://supply-xml.booking.com/hotels/ota/OTA_HotelDescriptiveContentNotif</td>
  </tr>
</table>

The `POST hotels/ota/OTA_HotelDescriptiveContentNotif` request enables you to create a property for a *single* property accommodation partner (SPO). It contains the *basic* yet essential information necessary to create a property. 

After you have created the property, you can use the same endpoint to add:

  * Details about property facilities and services, see [adding facility and services]().
  * Property policies, see [adding property policies]().
  * Information on the area around the property, see [adding area info]().
  * Details about awards and ratings, see [adding affiliation info]().

**NOTE:** If you want to consolidate all the property information in one request, see [adding all property-level elements]().
 
### Body parameters
```xml
<OTA_HotelDescriptiveContentNotifRQ
  Target="Test">
  <HotelDescriptiveContents>
    <HotelDescriptiveContent
      HotelName="The Best Hotel"
      LanguageCode="en"
      HotelDescriptiveContentNotifType="New">
      <ContactInfos>
        <ContactInfo ContactProfileType="PhysicalLocation">
          <Addresses>
            <Address>
              <AddressLine>1 Street Name</AddressLine>
              <CityName>Prague</CityName>
              <PostalCode>10000</PostalCode>
              <CountryName>CZ</CountryName>
            </Address>
          </Addresses>
        </ContactInfo>
        <ContactInfo ContactProfileType="general">
          <Names>
            <Name Language="en">
              <GivenName>Sam</GivenName>
              <Surname>Xu</Surname>
            </Name>
          </Names>
          <Emails>
            <Email>noreply@booking.com</Email>
          </Emails>
          <Phones>
            <Phone PhoneNumber="+31666666666" PhoneTechType="1" Extension="30" />
          </Phones>
        </ContactInfo>
        <ContactInfo ContactProfileType="invoices">
          <Names>
            <Name Language="en">
              <GivenName>Sam</GivenName>
              <Surname>Xu</Surname>
            </Name>
          </Names>
          <Addresses>
            <Address>
              <AddressLine>Herengracht 597</AddressLine>
              <CityName>Amsterdam</CityName>
              <PostalCode>1017 CE</PostalCode>
              <StateProv StateCode="NH" />
              <CountryName>nl</CountryName>
            </Address>
          </Addresses>
          <Phones>
            <Phone PhoneNumber="+31666666666" PhoneTechType="1" Extension="30" />
          </Phones>
        </ContactInfo>
      </ContactInfos>
      <HotelInfo>
        <CategoryCodes>
          <GuestRoomInfo Quantity="10" />
          <HotelCategory ExistsCode="1" Code="20" />
        </CategoryCodes>
        <Position Latitude="50.0755" Longitude="14.4378" />
      </HotelInfo>
    </HotelDescriptiveContent>
  </HotelDescriptiveContents>
</OTA_HotelDescriptiveContentNotifRQ>
```

The following table describes what elements you must add in the request body and how they are nested.

|Element|Description|Notes|
|---|---|---|
|OTA_HotelDescriptiveContentNotifRQ | The main property object. Set the attribute `Target` to: `Test`, if you want to create a test property. `Production`, if you want to create an actual property.|| 
| __:__ HotelDescriptiveContents | Contains the `HotelDescriptiveContent` elements.|
| __::__ HotelDescriptiveContent | Contains the elements that describe the property. It also contains the following attributes: <br> `HotelName`: Specifies the name of the property. <br>`LanguageCode`: Specifies the language of the request.  <br> `HotelDescriptiveContentNotifType`: Specifies the status  | You can find the Booking.com language codes at [https://connect.booking.com/user_guide/site/en-US/codes-bcl/](https://connect.booking.com/user_guide/site/en-US/codes-bcl/).  |
| __:::__ ContactInfos | Contains the `ContactInfo` elements. | 
| __::::__ ContactInfo | Contains contact information and specifies the `ContactProfileType` attribute to categorise the contact, which accepts the following values: <br> `general`: Primary point of contact for the property. _(required)_ <br> `invoices`: Primary point of contact for accounts payable. _(required)_ <br> `PhysicalLocation`: Address details for the physical location of the property. Does not require the `Names`, `Emails`, and `Phones` subelements. Only `Addresses`. _(required)_ <br> `contract`: Primary point of contact for contract-related matters. _(optional)_ <br> `reservations`: Primary point of contact for reservations-related matters. _(optional)_ `availability`: Primary point of contact for availability-related matters. _(optional)_ <br> `site_content`: Primary point of contact for photos, copy, and other website content. _(optional)_ <br> `parity`: Primary point of contact for pricing and rate-related matters. _(optional)_ <br>`requests`: Primary point of contact for special requests. _(optional)_ <br> `central_reservations`: Primary point of contact for central reservations for properties than manage reservations from another location. _(optional)_  |   
| __:::::__ Names | Contains the `Name` elements.  | 
| __::::::__ Name  | Contains the first and last name of the main point of contact for the property. It contains the `Language` attribute, which specifies what language the name is in.  | You can find the Booking.com language codes at [https://connect.booking.com/user_guide/site/en-US/codes-bcl/](https://connect.booking.com/user_guide/site/en-US/codes-bcl/).|
| __:::::::__ GivenName  | Specifies the first name.  |  
| __:::::::__ SurName  | Specifies the last name.  |  
| __:::::__ Emails | Contains the `Email` elements.  |  
| __:::::::__ Email| Specifies the email address of the main point of contact for the property. |  
| __:::::__ Addresses  | Contains the `Address` elements.  | 
| __::::::__ Address  | Contains the elements specifying the address of the property.|
| __:::::::__ AddressLine  | Specifies the street name.  | 
| __:::::::__ CityName | Specifies the name of the city.  |
| __:::::::__ PostalCode  |  Specifies the postal code (or zip code). |
| __:::::::__ CountryName  | Specifies the two-letter code for the country.|
| __:::::__ Phones  | Contains the `Phone` elements.  |
| __::::::__ Phone  | Contains the following attributes: <br> `PhoneNumber`: Specifies the phone number of the main point of contact for the property. <br> `PhoneTechType`: <br> `Extension`: Specifies the extension of the phone number.  |
| __:::__ HotelInfo  | Contains descriptive information about the property type, number of physical rooms, and position.  |
| __::::__  CategoryCodes | Contains elements that describe the property details.  |
| __:::::__  GuestRoomInfo | Contains the `GuestRoomInfo` attribute, which specifies the quantity of physical room units within the property.  |
| __:::::__ HotelCategory  | Contains the following attributes: <br> `ExistsCode`: Indicates whether the property exists. <br> `Code`: Specifies the property class code.  | You can find the property class codes at [https://connect.booking.com/user_guide/site/en-US/codes-pct/](https://connect.booking.com/user_guide/site/en-US/codes-pct/).  | 
| __:::::__ Position  | Contains the following attributes that specify the property’s geographical position: <br> `Latitude`: Specifies the latitude. <br> `Longitude`: Specifies the longitude.  |  


### Sample request
```curl
curl -X POST \
  https://supply-xml.booking.com/hotels/ota/OTA_HotelDescriptiveContentNotif \
   -d '<?xml version="1.0" encoding="UTF-8"?>
<OTA_HotelDescriptiveContentNotifRQ
  Target="Test">
  <HotelDescriptiveContents>
    <HotelDescriptiveContent
      HotelName="Tech Hotel"
      LanguageCode="en"
      HotelDescriptiveContentNotifType="New">
      <ContactInfos>
        <ContactInfo ContactProfileType="PhysicalLocation">
          <Addresses>
            <Address>
              <AddressLine>1 Street Name</AddressLine>
              <CityName>Prague</CityName>
              <PostalCode>10000</PostalCode>
              <CountryName>cz</CountryName>
            </Address>
          </Addresses>
        </ContactInfo>
        <ContactInfo ContactProfileType="general">
          <Names>
            <Name Language="en">
              <GivenName>Luca</GivenName>
              <Surname>Janssens</Surname>
            </Name>
          </Names>
          <Emails>
            <Email>noreply@booking.com</Email>
          </Emails>
          <Phones>
            <Phone PhoneNumber="+31666666666" PhoneTechType="1" Extension="30" />
          </Phones>
        </ContactInfo>
        <ContactInfo ContactProfileType="invoices">
          <Names>
            <Name Language="en">
              <GivenName>Sam</GivenName>
              <Surname>Xu</Surname>
            </Name>
          </Names>
          <Addresses>
            <Address>
              <AddressLine>Herengracht 597</AddressLine>
              <CityName>Amsterdam</CityName>
              <PostalCode>1017 CE</PostalCode>
              <StateProv StateCode="NH" />
              <CountryName>nl</CountryName>
            </Address>
          </Addresses>
          <Phones>
            <Phone PhoneNumber="+31666666666" PhoneTechType="1" Extension="30" />
          </Phones>
        </ContactInfo>
      </ContactInfos>
      <HotelInfo>
        <CategoryCodes>
          <GuestRoomInfo Quantity="10" />
          <HotelCategory ExistsCode="1" Code="20" />
        </CategoryCodes>
        <Position Latitude="50.0755" Longitude="14.4378" />
      </HotelInfo>
    </HotelDescriptiveContent>
  </HotelDescriptiveContents>
</OTA_HotelDescriptiveContentNotifRQ>'
```
The following is an example of a cURL request to create a property:
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

### Sample response

The following is the response to the sample request. 
You can find the unique id for the property as the value of the ID attribute in the UniqueID tag.

```xml
<OTA_HotelDescriptiveContentNotifRS Target="Test" Version="3.000">
    <UniqueID Type="10" ID="1234567" />
    <Success />
</OTA_HotelDescriptiveContentNotifRS>
```

| Element | Description | 
|---|---|
| OTA_HotelDescriptiveContentNotifRS | Contains the `OTA_HotelDescriptiveContentNotif` response object. |  
| UniqueID | Specifies the unique property id and contains the following attributes: <br> `Type`: <br> `ID`: Specifies the unique id for the created property. |
| Success | Indicates the success of the request. | 