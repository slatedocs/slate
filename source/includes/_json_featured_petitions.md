## Get featured petitions

```js
$(document).ready(function(){
  $.ajax({
    url: 'https://demo.controlshiftlabs.com/featured.json',
    dataType: 'jsonp',
  })
  .done(function(data) {
    console.log(data);
  });
});

```

> The above code would display your returned featured petitions data in the console.  The JSON would be structured like this:

```json
[{
  "slug": "release-pro-democracy-youth-activists-in-azerbaijan",
  "title": "Release pro-democracy youth activists in Azerbaijan",
  "url": "http://demo.controlshiftlabs.com/petitions/release-pro-democracy-youth-activists-in-azerbaijan",
  "admin_status": "awesome",
  "image_url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/28870/hero/Screen_Shot_2014-11-14_at_3.57.21_PM.png?1415999011",
  "additional_image_sizes_url": [{
    "style": "form",
    "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/28870/form/Screen_Shot_2014-11-14_at_3.57.21_PM.png?1415999011"
  }, {
    "style": "large",
    "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/28870/large/Screen_Shot_2014-11-14_at_3.57.21_PM.png?1415999011"
  }, {
    "style": "open_graph",
    "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/28870/open_graph/Screen_Shot_2014-11-14_at_3.57.21_PM.png?1415999011"
  }, {
    "style": "original",
    "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/28870/original/Screen_Shot_2014-11-14_at_3.57.21_PM.png?1415999011"
  }],
  "who": "President Ilham Aliyev of Azerbaijan",
  "what": "Immediately release the imprisoned youth activists from the NIDA civic movement.\r\n\r\nShahin Novruzlu, Rashadat Akundov, Mammad Azizov, Bakhtiyar Guliyev, Zaur Gurbanli, Rashad Hasanov, Uzeyir Mammadli and Ilkin Rustamzade were arrested on criminal charges of possessing explosives and intent of public disorder. Human rights organizations believe these charges have been fabricated. The actual reason for their arrest was their criticism of the Azerbaijani authorities and their online activism, calling for peaceful demonstrations.\r\n\r\nShahin Novruzlu, who was only 17 at the time of his arrest, has lost his front teeth as a result of torture in detention. Mammad Azizov and Bakhtiyar Guliyev have complained of torture too.\r\n\r\nFrom 14 May 2014, Azerbaijan is chairing the Committee of Ministers of the Council of Europe. This organization is responsible for promoting and protecting human rights. I am deeply concerned that there are civil society activists in Azerbaijan tortured and imprisoned solely for expressing their views and organizing peaceful protests.\r\n\r\nAzerbaijan must live up to the high expectations of the chair of the Committee of Ministers of the Council of Europe. The NIDA activists must be immediately released.",
  "goal": 200,
  "signature_count": 119,
  "creator_name": "Kristyn Arrighi",
  "created_at": "2014-07-24T20:07:14.607-04:00",
  "updated_at": "2016-02-26T14:30:57.330-05:00",
  "why": "Shahin Novruzlu and fellow youth activists from the pro-democracy movement NIDA campaigned for democracy and against human rights abuses and widespread corruption in Azerbaijan. In February 2013 th..."
}, {
  "slug": "give-us-more-icecream",
  "title": "Give us more icecream",
  "url": "http://demo.controlshiftlabs.com/petitions/give-us-more-icecream",
  "admin_status": "awesome",
  "image_url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/139482/hero/10982478_634745530004482_279346285079955699_n.jpg?1455250695",
  "additional_image_sizes_url": [{
    "style": "form",
    "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/139482/form/10982478_634745530004482_279346285079955699_n.jpg?1455250695"
  }, {
    "style": "large",
    "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/139482/large/10982478_634745530004482_279346285079955699_n.jpg?1455250695"
  }, {
    "style": "open_graph",
    "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/139482/open_graph/10982478_634745530004482_279346285079955699_n.jpg?1455250695"
  }, {
    "style": "original",
    "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/139482/original/10982478_634745530004482_279346285079955699_n.jpg?1455250695"
  }],
  "who": "Cook",
  "what": "Cook and provide more icecream",
  "goal": 100,
  "signature_count": 6,
  "creator_name": "Tudor Bradatan",
  "created_at": "2016-02-11T23:17:42.782-05:00",
  "updated_at": "2016-02-26T14:20:46.987-05:00",
  "why": "Because we like and need it",
  "location": {
    "query": "Cluj",
    "latitude": "46.7712101",
    "longitude": "23.6236353",
    "street": "",
    "postal_code": "",
    "country": "RO",
    "region": "CJ",
    "street_number": "",
    "venue": "",
    "created_at": "2016-02-11T23:17:42.769-05:00"
  }
}, {
  "slug": "turn-back-human-trafficking-faith-leaders",
  "title": "Pledge to TURN BACK human trafficking Now - Faith or Community Leaders",
  "url": "http://demo.controlshiftlabs.com/petitions/turn-back-human-trafficking-faith-leaders",
  "admin_status": "awesome",
  "image_url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/107370/hero/Untitled.png?1433187465",
  "additional_image_sizes_url": [{
    "style": "form",
    "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/107370/form/Untitled.png?1433187465"
  }, {
    "style": "large",
    "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/107370/large/Untitled.png?1433187465"
  }, {
    "style": "open_graph",
    "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/107370/open_graph/Untitled.png?1433187465"
  }, {
    "style": "original",
    "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/107370/original/Untitled.png?1433187465"
  }],
  "who": "President John Dramani Mahama",
  "what": "I know that globally millions of people are trafficked for forced labour and sexual exploitation and that Ghana is a source, transit and destination country for this social evil. The concerns raised by Parliament recently, about men, women, and children who are trafficked and subjected to forced labor and sexual exploitation human points to the need for everyone to take action.\r\n\r\nI hereby pledge to TURN BACK human trafficking. \r\n•\tI will be vigilant of suspicious movement of children and vulnerable people, victims of bonded labour and of children working when they should be in school \r\n•\tI promise to always report my concerns to the appropriate authorities as quickly as possible.\r\n\r\nAs a faith or community leader, I promise to warn my congregation of the dangers of child trafficking, and support them in reporting any suspicions they have.",
  "goal": 100,
  "signature_count": 6,
  "creator_name": "Kristyn Arrighi",
  "created_at": "2015-06-01T15:37:47.621-04:00",
  "updated_at": "2015-10-14T08:45:52.396-04:00",
  "why": "Today there are over 192,000 people trapped in modern slavery in Ghana [1]. Denied of their rights to education and often lacking parental care or support, over 1.8 million Ghanaian children are wo..."
}]
```

This retrieves a JSON array of featured petitions objects.

### HTTP Request

`GET https://demo.controlshiftlabs.com/featured.json`

### Working Example

A working example can be found on [jsbin](#not-implemented).