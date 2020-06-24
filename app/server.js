// path: /app/server.js

const http = require("http");

const route = require(__dirname + "/routes/all");

const server = http.createServer();

server.on("request", async (req, res) => {
  res.write(route(req, res));
  res.end();
});

module.exports = () => {
  server.listen(8080);
};
