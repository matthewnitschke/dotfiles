const Git = require("nodegit");
const chalk = require("chalk")
const inquirer = require("inquirer")

const pathToRepo = process.cwd()

async function run() {
    let repo = await Git.Repository.open(pathToRepo)
    
    let statuses = await repo.getStatus()

    let index = await repo.refreshIndex()

    statuses.forEach(status => {
        let statusText = ""
        if (status.isNew()){
            statusText = chalk.green(status.path())
        } else if (status.isModified()){
            statusText = chalk.yellow(status.path())
        } else if (status.isRenamed()){
            statusText = chalk.blue(status.path())
        } else if (status.isIgnored() || status.isDeleted()) {
            statusText = chalk.red(status.path())
        } else {
            statusText = status.path()
        }
        index.addByPath(status.path())
    })
}

run()