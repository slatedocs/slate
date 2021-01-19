const express = require('express');
const server = express();
server.set('PORT', process.env.PORT || 8600);

server.use(express.static('build'));
server.listen(server.get('PORT'), () => console.log(`> Ready on http://localhost:${server.get('PORT')}`));
