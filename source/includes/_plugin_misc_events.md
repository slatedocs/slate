### Events

```php
<?php
// plugins\HelloWorldBundle\EventListener\LeadSubscriber

namespace MauticPlugin\HelloWorldBundle\EventListener;

use Mautic\LeadBundle\Event as Events;
use Mautic\LeadBundle\LeadEvents;

/**
 * Class LeadSubscriber
 *
 * @package Mautic\LeadBundle\EventListener
 */
class LeadSubscriber extends CommonSubscriber
{

    /**
     * @return array
     */
    static public function getSubscribedEvents()
    {
        return array(
            LeadEvents::LEAD_POST_SAVE     => array('onLeadPostSave', 0),
            LeadEvents::LEAD_POST_DELETE   => array('onLeadDelete', 0)
        );
    }

    public function onLeadPostSave(LeadEvent $event)
    {
        $lead = $event->getLead();
        
        // do something
    }
    
    public function onLeadDelete(LeadEvent $event)
    {
        $lead = $event->getLead();
        
        $deletedId = $lead->deletedId;
        
        // do something
    }
}
```    

Mautic leverages Symfony's EventDispatcher to execute and communicate various actions through Mautic. Plugin's can hook into these to extend the functionality of Mautic. Refer to [Extending Mautic](#extending-mautic) for some of the ways to do this.

#### Subscribers

The easiest way to listen to various events is to use an event subscriber. Read more about subscribers in [Symfony's documentation](http://symfony.com/doc/current/components/event_dispatcher/introduction.html#using-event-subscribers). 

Plugin event subscribers can extend `\Mautic\CoreBundle\EventListener\CommonSubscriber` which gives access to commonly used dependencies and also allows registering the subscriber service through the bundles's config file. But, it does not have to and instead  See [Services](#services) for more information on registering event services. 
    
#### Available Events

There are many events available throughout Mautic. Depending on the desired functionality, look at the core bundle's *Event.php file in the root of the bundle.  For example, Lead related events are defined and described in `app\bundles\LeadBundle\LeadEvents.php`. These final classes provide the names of the events to listen to.  Always use the event constants to ensure future changes to event names will not break the plugin.

<div class="clear-right"></div>

#### Custom Events

A plugin can create and dispatch it's own events. 

Custom events require three things:

```php
<?php
// plugins\HelloWorldBundle\HelloWorldEvents.php

namespace MauticPlugin\HelloWorldBundle;

/**
 * Class HelloWorldEvents
 */
final class HelloWorldEvents
{
    /**
     * The helloworld.armageddon event is dispatched when a world is doomed by a giant meteor
     *
     * The event listener receives a MauticPlugin\HelloWorldBundle\Event\ArmageddonEvent instance.
     *
     * @var string
     */
    const ARMAGEDDON = 'helloworld.armageddon';
}
```

1) Class defining the available events for the plugin using a `final` class with constants

<div class="clear-right"></div>

```php
<?php
// plugins\HelloWorldBundle\Event\ArmageddonEvent.php

namespace MauticPlugin\HelloWorldBundle\Event;

use Symfony\Component\EventDispatcher\Event;
use MauticPlugin\HelloWorldBundle\Entity\World;

class ArmageddonEvent extends Event
{
    /** @var World  */
    protected $world;
    
    /** @var bool  */    
    protected $falseAlarm = false;
     
    public function __construct(World $world)
    {
        $this->world = $world;
    }
    
    public function shouldPanic()
    {
        return ('earth' == $this->world->getName());
    }
    
    public function setIsFalseAlarm()
    {
        $this->falseAlarm = true;
    }
    
    public function getIsFalseAlarm()
    {
        return $this->falseAlarm;
    }
}
```

2) The Event class that is received by the listeners. This class should extend `Symfony\Component\EventDispatcher\Event`. It will be created when the event is dispatched and should have any information listeners need to act on it.

<div class="clear-right"></div>

```php
<?php

$dispatcher = $this->get('event_dispatcher');
if ($dispatcher->hasListeners(HelloWorldEvents::ARMAGEDDON)) {
    $event = $dispatcher->dispatch(HelloWorldEvents::ARMAGEDDON, new ArmageddonEvent($world));
    
    if ($event->shouldPanic()) {
        throw new \Exception("Run for the hills!");
    }
}
```

3) The code that dispatches the event where appropriate using the [`event_dispatcher` service](#event-dispatcher).
