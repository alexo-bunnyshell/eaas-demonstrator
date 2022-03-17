const express = require('express')
const app = express()

app.get('/', (req, res) => res.send('Bunnyshell ROCKS!'))
app.listen(3000, () => console.log('Server ready'))