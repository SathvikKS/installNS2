const express = require('express')

const app = express()
const PORT = process.env.PORT || 3000

app.get('/', async (req, res) => {
    const file = `${__dirname}\\public\\installNs2.sh`
    res.download(file);
})


app.listen(PORT, () => {
    console.log('Server is running at port ' + PORT)
})