## Get a single petition

```js
$(document).ready(function(){
  var petitionSlug = 'turn-back-human-trafficking-faith-leaders';
  $.ajax({
    url: 'https://demo.controlshiftlabs.com/petitions/'+petitionSlug+'.json',
    dataType: 'jsonp',
  })
  .done(function(data) {
    console.log(data);
  });
});
```

> The above code would display your returned petition data in the console.  The JSON would be structured like this:

```json
{
  "id": 107370,
  "title": "Pledge to TURN BACK human trafficking Now - Faith or Community Leaders",
  "who": "President John Dramani Mahama",
  "why": "Today there are over 192,000 people trapped in modern slavery in Ghana [1]. Denied of their rights to education and often lacking parental care or support, over 1.8 million Ghanaian children are working rather than in school (21.8% of the population). Of these an estimated 1.2 million are forced to undertake hazardous child labour including mining, fishing and domestic slavery [3].\r\n\r\nThe experience of Kwesi is a typical example. Following the death of his father, Kwesi’s mother borrowed money to pay for the funeral. Faced with a debt she was unable to pay her creditor threatened her with jail unless she gave up her son as a labourer.  Kwesi was trafficked to Lake Volta to work as a “fisher boy”. and for the next three years, Kwesi worked for an average of 18 hours per day with little rest, no pay and only enough food to give him the energy for more work. By the time we found Kwesi and rescued him, he had suffered extensive emotional and physical abuse and partially lost sight in his left eye. \r\n\r\nOver 21,000 children like Kwesi, many of them trafficked, are trapped in hazardous labour on Lake Volta in Ghana[2]. We are working hard to bring them home, but want to ensure no one is trafficked in the first place. Please help fulfil the wish made by Kwesi when he gained his freedom: “I want the world to know that no child should be sent into slavery”.\r\n\r\n[1]. http://www.globalslaveryindex.org/ 2014\r\n[2].International Labour Organisation/International Programme on Elimination of Child Labour (ILO/IPEC) Analytical Study on Child Labour In Lake Volta Fishing in Ghana\r\n[3].Ghana Living Standard Survey 6 (GLSS 6): Child Labour Report by Ghana Statistical Services, 2014",
  "what": "I know that globally millions of people are trafficked for forced labour and sexual exploitation and that Ghana is a source, transit and destination country for this social evil. The concerns raised by Parliament recently, about men, women, and children who are trafficked and subjected to forced labor and sexual exploitation human points to the need for everyone to take action.\r\n\r\nI hereby pledge to TURN BACK human trafficking. \r\n•\tI will be vigilant of suspicious movement of children and vulnerable people, victims of bonded labour and of children working when they should be in school \r\n•\tI promise to always report my concerns to the appropriate authorities as quickly as possible.\r\n\r\nAs a faith or community leader, I promise to warn my congregation of the dangers of child trafficking, and support them in reporting any suspicions they have.",
  "created_at": "2015-06-01T15:37:47.621-04:00",
  "updated_at": "2015-10-14T08:45:52.396-04:00",
  "slug": "turn-back-human-trafficking-faith-leaders",
  "delivery_details": null,
  "administered_at": "2015-07-29T09:32:08.258-04:00",
  "source": "",
  "location_id": null,
  "alias": null,
  "bsd_constituent_group_id": null,
  "categories": [{
    "name": "Civil Rights",
    "slug": "civil-rights-1"
  }],
  "goal": 100,
  "effort": null,
  "group": "turn-back-human-trafficking-now",
  "resized_image_url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/107370/hero/Untitled.png?1433187465",
  "image_url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/107370/original/Untitled.png?1433187465",
  "creator_name": "Kristyn Arrighi",
  "signature_count": 6
}
```

This retrieves a single petition object.

### HTTP Request

`GET https://demo.controlshiftlabs.com/petitions/<slug>.json`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
slug | null | string - required - The petition's unique identification slug. If none is provided, you will get a 404 error. Note: submitted as a part of the endpoint path, not as a separate URL parameter

### Working Example

A working example can be found on [jsbin](#not-implemented).
