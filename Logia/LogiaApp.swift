//
//  VoiceCareApp.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import SwiftUI

@main
struct LogiaApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var patiensStore = PatientsStore()
    @StateObject var diseasesStore = DiseasesStore()
    @StateObject var exercisesStore = ExercisesStore()
    @StateObject var assessmentsStore = AssessmentsStore()
    @StateObject var sidebarChoiceStore = SidebarChoiceStore()
    @StateObject var patientChoiceStore = PatientChoiceStore()
    @StateObject var exerciseChoiceStore = ExerciseChoiceStore()
    @StateObject var categorychoiceStore = CategoryChoiceStore()
    @State var columnVisibility: NavigationSplitViewVisibility = .detailOnly

    var body: some Scene {
        WindowGroup {
            NavigationSplitView(columnVisibility: $columnVisibility, sidebar: {SidebarView()}, content: {ContentView()}, detail: {
                if sidebarChoiceStore.sidebarChoice == SidebarChoices.dashboard{
                    WelcomeView()
                } else if sidebarChoiceStore.sidebarChoice == SidebarChoices.patients {
                    PatientDetailView()
                } else {
                    ExercisesView()
                    
                }
            })
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(patiensStore)
                .environmentObject(diseasesStore)
                .environmentObject(exercisesStore)
                .environmentObject(assessmentsStore)
                .environmentObject(patientChoiceStore)
                .environmentObject(sidebarChoiceStore)
                .environmentObject(exerciseChoiceStore)
                .environmentObject(categorychoiceStore)
        }
    }
}
