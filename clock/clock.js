const blessed = require('blessed')
const moment = require('moment')

var screen = blessed.screen({
    warnings: true,
    smartCSR: true,
    dockBorders: true
})

let box = blessed.box({
    parent: screen,
    content: moment().format('h:mma'),
    top: 'center',
    tags: true,
    height: 'shrink',
    width: 'shrink',
    left: 'center'
})

setInterval(() => {
    box.content = moment().format('h:mma')
    screen.render()
}, 10000)

screen.key(['escape', 'q', 'C-c'], function (ch, key) {
    return process.exit(0)
})

screen.render()
