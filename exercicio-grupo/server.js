const app = require('express')();
const http = require('http').createServer(app);
const io = require('socket.io')(http, {
  cors: {
    origin: 'http://localhost:3000', // url aceita pelo cors
    methods: ['GET', 'POST'], // Métodos aceitos pela url
  }});

io.on('connection', socket => {
  socket.on('updateVote', (vote) => {
    const newAmountVote = vote + 1;
    io.emit('updateState', newAmountVote);
  });
});

http.listen(4000, function() {
  console.log('listening on port 4000')
});