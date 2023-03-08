//
//  DiseasesStore.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import Foundation
import CoreData

class DiseasesStore: ObservableObject {
    
    @Published var diseases: [Disease] = []
    @Published var diseasesTrial: [Disease] = [
        Disease(context: PersistenceController.shared.container.viewContext),
        Disease(context: PersistenceController.shared.container.viewContext),
        Disease(context: PersistenceController.shared.container.viewContext),
        Disease(context: PersistenceController.shared.container.viewContext),
        Disease(context: PersistenceController.shared.container.viewContext),
        Disease(context: PersistenceController.shared.container.viewContext)
        
    ]
    
    init() {
        fetchDiseases()
        for disease in self.diseasesTrial {
            disease.disease = "Malattia prova"
            disease.color = "blue"
        }
    }
    
    func fetchDiseases() {
        let request = NSFetchRequest<Disease>(entityName: "Disease")
        
        do {
            diseases = try PersistenceController.shared.container.viewContext.fetch(request)
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
    
    func deleteDisease(disease: Disease) {
        PersistenceController.shared.container.viewContext.delete(disease)
        saveChanges()
    }
    
    func deleteDisease(offsets: IndexSet) {
        offsets.map { diseases[$0] }.forEach(PersistenceController.shared.container.viewContext.delete)
        saveChanges()
    }
    
    func saveChanges() {
        PersistenceController.shared.save()
        self.fetchDiseases()
    }
}
