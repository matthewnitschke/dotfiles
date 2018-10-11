const blessed = require('blessed')
const moment = require('moment')
const request = require('request')
const { exec } = require('child_process')

const db = require('./db.js')

var config = require(`${require('os').homedir()}/.auth-keys.json`).gist

var screen = blessed.screen({
    warnings: true,
    smartCSR: true,
    dockBorders: true
})

var contentBox
var subjectBoxes = []

function generateAssignments(subjectBox, subject) {
    var assignments = subject.assignments

    assignments = assignments.sort((a, b) => {
        if (a.complete && !b.complete) {
            return 1
        } else if (b.complete && !a.complete) {
            return -1
        }

        var dateA = moment(a.due.toDate())
        var dateB = moment(b.due.toDate())

        if (dateA.isSame(dateB)) {
            return 1
        } else {
            if (dateA.isBefore(dateB)) {
                return -1
            } else {
                return 1
            }
        }
    })

    var form = blessed.form({
        parent: subjectBox,
        width: '100%-4',
        height: '100%-4',
        tags: true,
        vi: true,
        mouse: true,
        scrollable: true,
        keys: true,
        alwaysScroll: true,
        scrollbar: {
            ch: ' ',
            inverse: true
        }
    })

    assignments.forEach((assignment, i) => {
        var name = assignment.complete
            ? `{grey-fg}${assignment.name}{/grey-fg}`
            : `${assignment.name} (${moment(assignment.due.toDate()).format('M/D')})`

        var checkbox = blessed.checkbox({
            parent: form,
            tags: true,
            checked: !!assignment.complete,
            mouse: true,
            width: 'shrink',
            height: 1,
            left: 2,
            top: i
        })

        blessed.box({
            parent: form,
            content: name,
            top: i,
            tags: true,
            height: 1,
            width: 'shrink',
            left: 6
        })

        checkbox.on('check', () => {
            db.updateAssignment(subject.id, assignment, {
                complete: true
            })
        })

        checkbox.on('uncheck', () => {
            db.updateAssignment(subject.id, assignment, {
                complete: false
            })
        })

        var deleteButton = blessed.button({
            parent: form,
            content: '∅',
            top: i,
            left: 0,
            width: 1,
            height: 1,
            tags: true,
            mouse: true
        })
        deleteButton.on('press', () => {
            deleteItemPrompt(subject, assignment)
        })
    })
}

var data = []
async function update() {
    data = await db.getAssignments()
    draw()
}

function saveData() {
    draw()
    request({
        method: 'PATCH',
        url: `https://api.github.com/gists/${config.assignments.gistID}`,
        headers: {
            'User-Agent': 'request',
            'Authorization': `token ${config.gistToken}`
        },
        body: JSON.stringify({
            files: {
                [config.assignments.gistFilename]: {
                    "content": JSON.stringify(data)
                }
            }
        })
    }, (error, response, body) => {
        if (error) {
            throw new Error(error)
        } else if (response && response.statusCode && response.statusCode >= 400) {
            throw new Error(body)
        }
    });
}

function addItemPrompt(subjectId) {
    var addItemPrompt = blessed.question({
        parent: screen,
        width: 'shrink',
        height: 9,
        left: 'center',
        top: 'center',
        border: {
            type: 'line'
        }
    })

    var input = blessed.textbox({
        parent: addItemPrompt,
        height: 3,
        top: 4,
        mouse: true,
        width: '100%-2',
        label: ' Name, Due ',
        name: 'name',
        inputOnFocus: true,
        value: '',
        border: {
            type: 'line'
        }
    })

    addItemPrompt.ask('Enter new assignment information', (e, isOkay) => {
        if (isOkay) {
            var splitData = input.value.split(',').map(x => x.trim())
            if (splitData.length == 2) {
                let date = splitData[1]

                let dueDate
                if (date.split("/").length == 2){
                    dueDate = moment(date, "M/D")
                } else if (date.split("/").length == 3) {
                    dueDate = moment(date, "M/D/YY")
                } else {
                    console.error("Invalid date format, must be in 'M/D' or 'M/D/YY'")
                }

                db.addAssignment(subjectId, splitData[0], dueDate.toDate()).then(update)
            }
        }
    })
}

function deleteItemPrompt(subject, assignment) {
    var removeItemPrompt = blessed.question({
        parent: screen,
        width: 'shrink',
        height: 'shrink',
        left: 'center',
        top: 'center',
        border: {
            type: 'line'
        }
    })

    removeItemPrompt.ask(
        `Are you sure you want to delete: ${assignment.name}?`,
        (e, isOkay) => {
            if (isOkay) {
                db.deleteAssignment(subject.id, assignment).then(update)
            }
        }
    )
}

function draw() {
    if (contentBox) {
        screen.remove(contentBox)
    }

    contentBox = blessed.layout({
        parent: screen,
        top: 0,
        left: 1,
        tags: true,
        padding: {
            top: 1
        },
        style: {
            focus: {
                border: {
                    fg: 'blue'
                }
            }
        },
        vi: true
    })

    data.forEach((subject, i) => {
        var subjectBox = blessed.layout({
            parent: contentBox,
            label: `{${subject.color}-fg}${subject.subject}{/${
                subject.color
                }-fg}`,
            width: '100%',
            height: '20%-1',
            tags: true,
            padding: {
                top: 0,
                left: 1,
                right: 1,
                bottom: 0
            },
            border: {
                type: 'line'
            },
            style: {
                border: {
                    fg: subject.color
                },
                scrollbar: {
                    bg: 'blue'
                }
            }
        })

        if (i == 0) {
            subjectBox.focus()
        }

        generateAssignments(subjectBox, subject)

        var addButtonWrapper = blessed.box({
            parent: subjectBox,
            bottom: 0,
            width: '100%-3'
        })

        var addButton = blessed.button({
            parent: addButtonWrapper,
            tags: true,
            mouse: true,
            width: 'shrink',
            height: 'shrink',
            right: 1,
            padding: {
                left: 1,
                right: 1
            },
            style: {
                bg: subject.color,
                fg: 'black'
            },
            content: '+'
        })

        addButton.on('press', () => {
            addItemPrompt(subject.id)
        })
    })

    screen.render()
}

update()

screen.key(['escape', 'q', 'C-c'], function (ch, key) {
    return process.exit(0)
})

screen.render()
