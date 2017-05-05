# Events

## Event types

Name                      | Payload                   
------------------------- | -------------------------
`verification`            | `{ status: 'confirmed' }`
`verification`            | `{ status: 'needs_confirmation', code: token }`
`order.created`           | `{ id: order_id }`       
`order.canceled`          | `{ id: order_id }`       
`order.shipment.updated`  | `{ id: shipment_id, order_id: order_id, tracking_status: status, tracking_url: url, eta: eta }`
