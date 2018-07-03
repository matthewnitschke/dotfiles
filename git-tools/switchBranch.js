const { exec } = require('child_process')
const inquirer = require('inquirer')
const chalk = require('chalk')

exec('git branch', (error, stdout, stderr) => {
    if (error){
        console.error(`exec error: ${error}`)
        return
    }

    let branches = stdout.trim().split('\n').map(el => {
    	return el.trim()
    })

    inquirer.prompt([{
        message: `Select Branch to ${chalk.yellow('Checkout')}`,
        name: 'branch',
        type: 'list',
        choices: branches
    }]).then(answers => {
        exec(`git checkout ${answers.branch}`)
    })
})

