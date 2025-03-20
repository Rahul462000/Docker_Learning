const express = require("express");
var app = express();
app.get("/", function (request, response) {
  response.send("Hello World!");
});
const port = process.env.PORT || 8080;
app.listen(port, () =>
  console.log(
    `app listening on app is running on port that you have mount with container`
  )
);
