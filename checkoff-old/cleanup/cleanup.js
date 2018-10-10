const config = require(`${require('os').homedir()}/.auth-keys.json`).gist;
const moment = require('moment')
const fs = require('fs')

var Gist = require('gist.js')
var gist = Gist(config.assignments.gistID).token(config.gistToken)

gist.get((err, json) => {
	if (err) {
		throw new Error(err)
	}

	var subjects = json.files[config.assignments.gistFilename].content

	subjects = JSON.parse(subjects).map(subject => {
        subject.assignments = subject.assignments.filter(assignment => {
            return !(
                moment().isAfter(
                    moment(assignment.due, 'MM/DD/YYYY')
                ) && assignment.complete
            )
        })

        return subject
    })

    gist.file(config.assignments.gistFilename).write(JSON.stringify(subjects))
})