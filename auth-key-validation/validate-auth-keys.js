// checks to see if the users auth-keys and the example auth keys are equal

let actualConfig = require(`${require('os').homedir()}/.auth-keys.json`)
let exampleConfig = require('./auth-keys.example.json')

function equalObjectValues(objA, objB) {
    function hasSameKeysAndTypes(a, b){
        let aKeys = Object.keys(a).sort()
        let bKeys = Object.keys(b).sort()
    
        if (aKeys.length != bKeys.length){
            return false
        }
    
        for (let i = 0; i < aKeys.length; i ++){
            if (!bKeys.includes(aKeys[i])){
                return false
            }
    
            if (!aKeys.includes(bKeys[i])){
                return false
            }
    
            if (typeof a[aKeys[i]] != typeof b[bKeys[i]]){
                return false
            }
        }
    
        return true
    }

    if (!hasSameKeysAndTypes(objA, objB)){
        return false
    }

    let aObjectKeys = Object.keys(objA).filter(item => typeof objA[item] == 'object').sort()
    let bObjectKeys = Object.keys(objB).filter(item => typeof objB[item] == 'object').sort()


    for (let i = 0; i < aObjectKeys.length; i++) {
        if (!equalObjectValues(objA[aObjectKeys[i]], objB[bObjectKeys[i]])){
            return false
        }
    }

    return true
}


if (equalObjectValues(actualConfig, exampleConfig)) {
    console.log('auth-keys.example.json and ~/.auth-keys.json have equal templates')
    process.exit(0)
} else {
    console.error('WARNING: auth-keys.example.json and ~/.auth-keys.json DO NOT have equal templates. Run: "code -d ./auth-keys.example.json ~/.auth-keys.json" to see differences')
    process.exit(1)
}