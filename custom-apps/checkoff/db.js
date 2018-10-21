const Firestore = require('@google-cloud/firestore')

const { FieldValue, Timestamp } = Firestore

const db = new Firestore({
    projectId: 'dash-dc359',
    keyFilename: `${require('os').homedir()}/.dash-firebase-service-account-key.json`,
    timestampsInSnapshots: true
})

let assignmentsRef = db.collection('assignments')

module.exports = {
    getAssignments: async () => {
        let subjectsSnaps = await assignmentsRef.get()

        let subjects = []
        subjectsSnaps.forEach(snap => {
            let data = snap.data()
            data['id'] = snap.id
            subjects.push(data)
        })

        return subjects
    },
    addAssignment: async (subjectId, name, due) => {
        await assignmentsRef.doc(subjectId)
            .update({
                assignments: FieldValue.arrayUnion({
                    name: name,
                    due: Timestamp.fromDate(due)
                })
            })
    },
    updateAssignment: async (subjectId, assignment, updatedValues) => {
        await assignmentsRef.doc(subjectId)
            .update({
                assignments: FieldValue.arrayRemove(assignment)
            })

        assignment = Object.assign(assignment, updatedValues)
        
        await assignmentsRef.doc(subjectId)
            .update({
                assignments: FieldValue.arrayUnion(assignment)
            })
    },
    deleteAssignment: async (subjectId, assignment) => {
        await assignmentsRef.doc(subjectId)
            .update({
                assignments: FieldValue.arrayRemove(assignment)
            })
    }
}