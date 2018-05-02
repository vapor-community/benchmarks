const cluster = require('cluster')

if (cluster.isMaster) {
    var cpuCount = require('os').cpus().length
    for (var i = 0; i < cpuCount; i += 1) {
        cluster.fork()
    }
} else {
    const express = require('express')
    const app = express()
    app.get('/ping', (req, res) => res.send('123'))
    app.listen(8000, () => console.log('Example app listening on port 8000!'))
}
