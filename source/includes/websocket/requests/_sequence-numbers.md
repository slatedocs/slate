# Sequence Numbers

Events received through the WebSocket contain a `sequence` number. This is an integer value that will increase by 1 for each event sent for the duration of your connection.

You can ensure that you're receiving WebSocket messages in the expected order, and without dropped messages, by keeping track of the sequence numbers.

If you observe out of order sequence numbers, or dropped sequence numbers, you may need to disconnect and reconnect.

Each WebSocket connection keeps track of sequence numbers independently, so if you have multiple WebSocket connections open, keep in mind to track sequence numbers separately.