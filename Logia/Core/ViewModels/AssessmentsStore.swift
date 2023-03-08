//
//  AssessmentsStore.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import Foundation
import CoreData

class AssessmentsStore: ObservableObject {
    
    @Published var assessments: [Assessment] = []
    
    init() {
        fetchAssessments()
    }
    
    func fetchAssessments() {
        let request = NSFetchRequest<Assessment>(entityName: "Assessment")
        
        do {
            assessments = try PersistenceController.shared.container.viewContext.fetch(request)
        } catch {
            print("Error fetching. \(error)")
        }
        
        
    }
    /*
    func addNewAssessment(name: String, surname: String) {
        let newPatient = Patient(context: PersistenceController.shared.container.viewContext)
        newPatient.id = UUID().uuidString
        newPatient.name = name
        newPatient.surname = surname
        saveChanges()
    }
     
    
    func updateAssessment(assessment: Assessment) {
        //
        saveChanges()
    }
     
     */
    
    func deleteAssessment(assessment: Assessment) {
        PersistenceController.shared.container.viewContext.delete(assessment)
        saveChanges()
    }
    
    func deleteAssessment(offsets: IndexSet) {
        offsets.map { assessments[$0] }.forEach(PersistenceController.shared.container.viewContext.delete)
        saveChanges()
    }
    
    func saveChanges() {
        PersistenceController.shared.save()
        self.fetchAssessments()
        }
    }
