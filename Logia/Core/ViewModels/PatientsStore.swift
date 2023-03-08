//
//  PatientsStore.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import Foundation
import CoreData
import SwiftUI

class PatientsStore: ObservableObject {
    
    @Published var patients: [Patient] = []
    
    init() {
        fetchPatients()
    }
    
    func fetchPatients() {
        let request = NSFetchRequest<Patient>(entityName: "Patient")
        
        do {
            patients = try PersistenceController.shared.container.viewContext.fetch(request)
        } catch {
            print("Error fetching. \(error)")
        }
        
        
    }
    
    func addNewPatient(name: String, surname: String) {
        let newPatient = Patient(context: PersistenceController.shared.container.viewContext)
        newPatient.id = UUID()
        newPatient.name = name
        newPatient.surname = surname
        saveChanges()
        fetchPatients()
    }
    
    func updatePatientGeneralities(name: String, surname: String, age: String, address: String, phoneNumber: String, patient: Patient) {
        patient.name = name
        patient.surname = surname
        patient.age = age
        patient.address = address
        patient.phoneNumber = phoneNumber
        saveChanges()
        fetchPatients()
    }
    
    func deletePatient(patient: Patient) {
        PersistenceController.shared.container.viewContext.delete(patient)
        saveChanges()
        fetchPatients()
    }
    
    func deletePatientFromList(offsets: IndexSet) {
        offsets.map { patients[$0] }.forEach(PersistenceController.shared.container.viewContext.delete)
        saveChanges()
        fetchPatients()
    }
    
    func deleteAllPatient(patients: [Patient]){
        for patient in patients {
            PersistenceController.shared.container.viewContext.delete(patient)
            fetchPatients()
        }
    }
    
    func saveChanges() {
        PersistenceController.shared.save()
        }
    }
