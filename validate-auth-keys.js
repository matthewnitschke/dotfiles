let actualConfig = require(`${require('os').homedir()}/.auth-keys.json`)
let exampleConfig = require('./auth-keys.example.json')

function clearObjectValues(obj) {
    return Object.keys(obj).reduce((accumulator, key) => {
        if (typeof obj[key] == 'object'){
            accumulator[key] = clearObjectValues(obj[key])
        } else if (typeof obj[key] == 'number') {
            accumulator[key] = 0
        } else if (typeof obj[key] == 'string') {
            accumulator[key] = ""
        } else if (typeof obj[key] == 'boolean') {
            accumulator[key] = false
        }

        return accumulator
    }, {})
}


actualConfig = clearObjectValues(actualConfig)
exampleConfig = clearObjectValues(exampleConfig)

console.log(JSON.stringify(actualConfig) == JSON.stringify(exampleConfig))