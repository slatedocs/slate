### Extending Campaigns

```php
<?php
// plugins/HelloWorldBundle/EventListener/CampaignSubscriber.php

namespace MauticPlugin\HelloWorldBundle\Events;

use Mautic\CoreBundle\EventListener\CommonSubscriber;
use Mautic\CampaignBundle\Event as Events;
use Mautic\CampaignBundle\CampaignEvents;
use Mautic\CampaignBundle\Event\CampaignExecutionEvent;

/**
 * Class CampaignSubscriber
 */
class CampaignSubscriber extends CommonSubscriber
{

    /**
     * @return array
     */
    static public function getSubscribedEvents()
    {
        return array(
            CampaignEvents::CAMPAIGN_ON_BUILD => array('onCampaignBuild', 0),
            HelloWorldEvents::BLASTOFF        => array('executeCampaignAction', 0),
            HelloWorldEvents::VALIDATE_VISIT  => array('validateCampaignDecision', 0)
        );
    }

    /**
     * Add campaign decision and actions
     *
     * @param Events\CampaignBuilderEvent $event
     */
    public function onCampaignBuild(Events\CampaignBuilderEvent $event)
    {
        // Register custom action
        $event->addAction(
            'helloworld.send_offworld',
            array(
                'eventName'       => HelloWorldEvents::BLASTOFF,
                'label'           => 'plugin.helloworld.campaign.send_offworld',
                'description'     => 'plugin.helloworld.campaign.send_offworld_descr',
                // Set custom parameters to configure the decision
                'formType'        => 'helloworld_worlds',
                // Set a custom formTheme to customize the layout of elements in formType
                'formTheme'       => 'HelloWorldBundle:FormTheme\SubmitAction',
                // Set custom options to pass to the form type, if applicable
                'formTypeOptions' => array(
                    'world' => 'mars'
                )
            )
        );

        // Register custom decision (executes when a lead "makes a decision" i.e. executes some direct action
        $event->addDecision(
            'helloworld.visits_mars',
            array(
                'eventName'       => HelloWorldEvents::VALIDATE_VISIT,
                'label'           => 'plugin.helloworld.campaign.visits_mars',
                'description'     => 'plugin.helloworld.campaign.visits_mars_descr',
                // Same as registering an action
                'formType'        => false,
                'formTypeOptions' => array()
            )
        );
    }

    /**
     * Execute campaign action
     *
     * @param CampaignExecutionEvent $event
     */
    public function executeCampaignAction (CampaignExecutionEvent $event)
    {
        // Do blastoff

        $event->setResult(true);
    }

    /**
     * Validate campaign decision
     *
     * @param CampaignExecutionEvent $event
     */
    public function validateCampaignDecision (CampaignExecutionEvent $event)
    {
        $valid = ($event->getEventDetails()->getId() === $event->getConfig()['id']);
        $event->setResult($valid);
    }
}
```

Plugins can add their own campaign actions, decisions, or conditions by listening to the `\Mautic\CampaignBundle\CampaignEvents::CAMPAIGN_ON_BUILD` event.  Read more about [listeners and subscribers](#events). 

#### Campaign Actions

To add an action, use the `$event->addAction($identifier, $parameters)` method. `$identifier` must be something unique. The `$parameters` array can contain the following elements:
 
Key|Required|Type|Description
---|--------|----|-----------
**label**|REQUIRED|string|The language string to use for the draggable's label
**eventName**|REQUIRED|string|The name of the event that should be dispatched to handle this action. The plugin will need to also create it's own listener for the event.
**description**|OPTIONAL|string|The language string to use for the draggable's tooltip
**formType**|OPTIONAL|string|The alias of a custom form type used to set config options for the decision
**formTypeOptions**|OPTIONAL|array|Array of options to include into the formType's $options argument
**formTypeCleanMasks**|OPTIONAL|array|Array of input masks to clean a values from formType
**formTypeTheme**|OPTIONAL|string|Theme to customize elements for formType
**associatedDecisions**|OPTIONAL|array|Array of keys registered as decisions that this action can attached to. Defaults to any decision.
**anchorRestrictions**|OPTIONAL|array|Array of anchors (the places on an event in the builder this action can be attached to). The format is eventType.anchorName. Event types can be source, decision, action, or condition. anchorName includes top, bottom, inaction (yes/green), action (no/red) or leadsource. For example, by passing an array with `decision.inaction`, this action will not be attachable to the inaction/red anchor of a decision.
**callback**|DEPRECATED|mixed|Deprecated as of 2.0 and support to be removed in 3.0; use eventName instead. Static callback function that will be called for the action and should contain the logic to execute the custom action

The listener for dispatched event will have the `Mautic\CampaignBundle\Event\CampaignExecutionEvent` injected. To note that the action was successfully executed, use `$event->setResult($result)`. `$result` can be a boolean or an array. Setting false will cause the action to be retried. If an array, it will be stored in the campaign event log's metadata array (useful for displaying information in the contact time-line).

Use `$event->setFailed()` to note that an event failed but should not be retried. Failed events do not appear in a contact's time-line.

#### Campaign Decisions

 ```php
 <?php
 // Trigger configured 'helloworld.visits_mars' decisions
 
 /** @var \Mautic\CampaignBundle\Model\CampaignModel $campaignModel */
 $campaignModel = $this->getModel('campaign.event');
 
 // Can be anything and passed into action callbacks as $eventDetails
 $customPassthrough = array();
 
 // Some optional unique identifier for this specific trigger that is used mainly for debug logging; for example, can be a concatenation of the decision name + lead ID
 $uniqueTriggerId   = 'something_something';
 
 $campaignModel->triggerEvent('helloworld.visits_mars', $customPassthroughToActions, $uniqueTriggerId);
 ```
 
Campaign decisions are registered exactly as a campaign action except it uses the `$event->addDecision($identifier, $parameters)` method. The only difference in the `$parameters` arguments is that the listener for the `eventName` is used to validate the decision rather than execute some action and it accepts a `associatedActions` array instead of `associatedDecisions`. For example, if the decision is configured to only apply to a specific ID chosen by the user (defined in the `formType`), the listener could compare the decision's `$event->getEventDetails()->getId()` (see example) with the event's`$event->getConfig()['id']`. If the decision should execute the actions associated with it, set `$event->setResult(true);`.  Otherwise `$event->setResult(false);` and nothing will be executed or logged.
  
For custom decisions to work, there must be a trigger executed when the lead makes the decision. Thus, where ever is appropriate in the plugin's code logic, add something similar to what's in the example code block. 
 
 The `triggerEvent()` method will pull all the triggered decisions (`helloworld.visits_mars` in the code example) for published campaigns the lead is in, dispatch the decisions event (if configured) for validation, then execute the associated actions if appropriate.
 

#### Campaign Conditions

Campaign conditions are registered with `addCondition()` and accepts the same arguments as `addDecision()`. The listener also receives an instance of `Mautic\CampaignBundle\Event\CampaignExecutionEvent`. To mark a condition as true or false, use `$event->setResult($result);`.
