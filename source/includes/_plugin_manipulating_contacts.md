## Manipulating Contacts (Leads)

```php
<?php

/** @var \Mautic\LeadBundle\Model\LeadModel $leadModel */
$leadModel = $this->getModel('lead');

/** @var \Mautic\LeadBundle\Entity\Lead $currentLead */
$currentLead = $leadModel->getCurrentLead();

// To obtain the tracking ID as well, pass true
list($currentLead, $trackingId, $trackingIdIsNewlyGenerated) = $leadModel->getCurrentLead(true);

// To obtain just the tracking ID; pass true as an argument to force regeneration of the tracking ID and cookies
list($trackingId, $trackingIdIsNewlyGenerated) = $leadModel->getTrackingCookie();

// Set the currently tracked lead and generate tracking cookies
$lead = new Lead();
// ...
$leadModel->setCurrentLead($lead);

// Set a lead for system use purposes (i.e. events that use getCurrentLead()) but without generating tracking cookies
$leadModel->setSystemCurrentLead($lead);

```

<aside class="note">
In Mautic 1.4, Leads were renamed to Contacts. However, much of the code still refers to contacts as leads.
</aside>

Many plugins extending Mautic will be manipulating leads in one way or another. Here is a quick summary of how to obtain the current lead and/or manipulate the leads data.

#### Lead Tracking

Leads are tracked by two cookies. The first cookie notes which ID the lead is tracked under Mautic as. The second is to track the lead's activity for the current session (defaults to 30 minutes and resets during each lead interaction).
  
`mautic_session_id` holds the value of the lead's current session ID.  That value is then name of the cookie that holds the lead's ID. 

Review the sample code on how to obtain the currently tracked lead.

As of Mautic 2.2.0, a cookie is also placed on any domain with mtc.js embedded (that's allowed by Mautic's CORS settings) as `mtc_id`. This will contain the ID of the currently tracked contact.

<div class="clear-right"></div>

#### Creating New Leads
```php
<?php
// Currently tracked lead based on cookies
$leadModel = $this->getModel('lead');
$lead = $leadModel->getCurrentLead();
$leadId = $lead->getId();

// OR generate a completely new lead with
$lead = new Lead();
$lead->setNewlyCreated(true);
$leadId = null;

// IP address of the request
$ipAdddress = $this->get('mautic.helper.ip_lookup')->getIpAddress();

// Updated/new fields
$leadFields = array(
    'firstname' => 'Bob',
    //...
);

// Optionally check for identifier fields to determine if the lead is unique
$uniqueLeadFields    = $this->getModel('lead.field')->getUniqueIdentiferFields();
$uniqueLeadFieldData = array();

// Check if unique identifier fields are included
$inList = array_intersect_key($leadFields, $uniqueLeadFields);
foreach ($inList as $k => $v) {
    if (empty($query[$k])) {
        unset($inList[$k]);
    }

    if (array_key_exists($k, $uniqueLeadFields)) {
        $uniqueLeadFieldData[$k] = $v;
    }
}

// If there are unique identifier fields, check for existing leads based on lead data
if (count($inList) && count($uniqueLeadFieldData)) {
    $existingLeads = $this->getDoctrine()->getManager()->getRepository('MauticLeadBundle:Lead')->getLeadsByUniqueFields(
        $uniqueLeadFieldData,
        $leadId // If a currently tracked lead, ignore this ID when searching for duplicates
    );
    if (!empty($existingLeads)) {
        // Existing found so merge the two leads
        $lead = $leadModel->mergeLeads($lead, $existingLeads[0]);
    }

    // Get the lead's currently associated IPs
    $leadIpAddresses = $lead->getIpAddresses();

    // If the IP is not already associated, do so (the addIpAddress will automatically handle ignoring
    // the IP if it is set to be ignored in the Configuration)
    if (!$leadIpAddresses->contains($ipAddress)) {
        $lead->addIpAddress($ipAddress);
    }
}

// Set the lead's data
$leadModel->setFieldValues($lead, $leadFields);

// Save the entity
$leadModel->saveEntity($lead);

// Set the updated lead
$leadModel->setCurrentLead($lead);
```

To create a new lead, use the `\Mautic\LeadBundle\Entity\Lead` entity. Review the code sample.
