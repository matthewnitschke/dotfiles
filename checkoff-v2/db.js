const Firestore = require('@google-cloud/firestore')

const { FieldValue, Timestamp } = Firestore

const db = new Firestore({
    projectId: 'dash-dc359',
    keyFilename: `${require('os').homedir()}/.auths/dash-firebase-service-account-key.json`,
    timestampsInSnapshots: true
})

let assignmentsRef = db.collection('assignments')


module.exports = {
    getAssignments: async () => {
        let assignmentsSnaps = await assignmentsRef.get()

        let assignments = []
        assignmentsSnaps.forEach(snap => {
            let data = snap.data()
            data['id'] = snap.id
            assignments.push(data)
        })

        return assignments
    },
    addAssignment: async (subjectId, name, due) => {
        await assignmentsRef.doc(subjectId)
            .update({
                assignments: FieldValue.arrayUnion({
                    name: name,
                    due: Timestamp.fromDate(due)
                })
            })
    }
}