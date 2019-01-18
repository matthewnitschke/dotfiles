const Firestore = require('@google-cloud/firestore')

const { FieldValue, Timestamp } = Firestore

const db = new Firestore({
    projectId: 'dash-dc359',
    keyFilename: `${require('os').homedir()}/.dash-firebase-service-account-key.json`,
    timestampsInSnapshots: true
})

let tasksRef = db.collection('tasks')

module.exports = {
    getTasks: async () => {
        let tasksSnaps = await tasksRef.get()

        let tasks = []
        tasksSnaps.forEach(snap => {
            let data = snap.data()
            data['id'] = snap.id
            tasks.push(data)
        })

        return tasks
    },
    addTask: async (name) => {
        await tasksRef.add({
            name: name,
            complete: false
        })
    },
    updateTasks: async (taskId, task) => {
        await tasksRef.doc(taskId).update(task)
    },
    deleteTask: async (taskId, task) => {
        await tasksRef.doc(taskId).delete()
    }
}