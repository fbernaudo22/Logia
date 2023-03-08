//
//  ExercisesStore.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import Foundation
import CoreData

class ExercisesStore: ObservableObject {
    
    @Published var exercises: [Exercise] = []
    
    init() {
        fetchExercises()
    }
    
    func fetchExercises() {
        let request = NSFetchRequest<Exercise>(entityName: "Exercise")
        
        do {
            exercises = try PersistenceController.shared.container.viewContext.fetch(request)
        } catch {
            print("Error fetching. \(error)")
        }
        
        
    }
    
    func addNewExercise(exercise: String, category: String) {
        let newExercise = Exercise(context: PersistenceController.shared.container.viewContext)
        newExercise.exercise = exercise
        newExercise.category = category
        newExercise.id = UUID()
        saveChanges()
    }
     
    
    func updateExercise(exercise: Exercise) {
        //
        saveChanges()
    }
     
     
    
    func deleteExercise(exercise: Exercise) {
        PersistenceController.shared.container.viewContext.delete(exercise)
        saveChanges()
    }
    
    func deleteExerciseFromList(offsets: IndexSet) {
        offsets.map { exercises[$0] }.forEach(PersistenceController.shared.container.viewContext.delete)
        saveChanges()
    }
    
    func saveChanges() {
        PersistenceController.shared.save()
        fetchExercises()
        }
    }
