const express = require('express')
const app = express()

app.get('/', function (req, res) {
    // console.log("req");
    var message = "Grig ROCKS!<br>";
    message += (process.env.APP_SECRET ? "I have a secret: "+process.env.APP_SECRET : "I don't have any secrets") + "<br>"

    Object.getOwnPropertyNames(process.env).forEach(
        function(val, idx, array){
            message+=val + " = " + process.env[val] + "<br>"
            
        }
    )


    res.send(message)
})

Object.getOwnPropertyNames(process.env).forEach(
    function(val, idx, array){
        console.log(val + " = " + process.env[val])
        
    }
)

    app.listen(3000, () => console.log('Server ready'))
