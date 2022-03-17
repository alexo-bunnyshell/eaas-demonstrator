const express = require('express')
const app = express()

app.get('/', function (req, res) {
    // console.log("req");
    var message = "Bunnyshell ROCKS!\n<br>";
    message += (process.env.APP_SECRET ? "I have a secret: "+process.env.APP_SECRET : "I don't have any secrets") 

    res.send(message)
})



    app.listen(3000, () => console.log('Server ready'))