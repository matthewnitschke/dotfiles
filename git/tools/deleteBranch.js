const { exec } = require('child_process')
const inquirer = require('inquirer')
const chalk = require('chalk')

exec('git branch', async (error, stdout, stderr) => {
    if (error) {
        console.error(`exec error: ${error}`)
        return
    }

    let branches = stdout.trim().split('\n').map(el => {
        return el.trim()
    })

    let answers = await inquirer.prompt([{
        message: `Select Branch to ${chalk.red('Delete')}`,
        name: 'branch',
        type: 'list',
        choices: branches
    }])

    if (/^\*/.test(answers.branch)){
        console.log(chalk.red("You cannot delete a branch that you are currently checked out on"))
        return
    }
    if (answers.branch == "master"){
        console.log(chalk.red("You cannot delete the master branch"))
        return
    }


    let confirmPrompt = await inquirer.prompt([{
        message: `Are you sure you want to delete ${answers.branch}`,
        name: 'confirm',
        type: 'confirm'
    }])

    if (confirmPrompt.confirm) {
        exec(`git branch -d ${answers.branch}`, (error, stdout, stderr) => {
            if (!stderr) {
                return
            }

            if (/error: The branch '.*' is not fully merged./.test(stderr)) {
                console.log(chalk.red(`The branch ${answers.branch} is not fully merged`))
                inquirer.prompt([{
                    message: `Do you want to force delete ${answers.branch}`,
                    name: 'forceDelete',
                    type: 'confirm',
                    default: false
                }]).then(forceDeletePrompt => {
                    if (forceDeletePrompt.forceDelete) {
                        exec(`git branch -D ${answers.branch}`)
                    }
                })
            } else {
                console.log(`${stderr}`)
            }
        })
    }
})

