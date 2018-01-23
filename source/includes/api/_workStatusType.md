## workStatusType object

workStatusType objects have the following minimal attributes:

####id

A unique identifier for this workStatusType.

####name

A displayable name used to identify this workStatusType.

### workStatusType.get

<span class="tryit" id="workstatustype-get-tryit"></span>
Returns information about a workStatusType.

Parameters:

####id

Required. The unique identifier of the workStatusType for which to return information.

The response results "workStatusType" attribute will be the selected workStatusType object.

### workStatusType.list

<span class="tryit" id="workstatustype-list-tryit"></span>
Returns information about workStatusTypes. Uses [pagination](#pagination).

Parameters: None

The response results "workStatusTypes" attribute will be an array of the current page of selected workStatusTypes. Each element of the array will be an workStatusType object containing basic workStatusType attributes.

