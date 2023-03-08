//
//  ContentView.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sidebarChoiceStore: SidebarChoiceStore
    @EnvironmentObject var exercisesStore: ExercisesStore
    var body: some View {
        NavigationStack{
            if sidebarChoiceStore.sidebarChoice == SidebarChoices.dashboard {
                WelcomeView()
            } else if sidebarChoiceStore.sidebarChoice == SidebarChoices.patients {
                PatientListView()
            } else {
                ExercisesCategoryMenu()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SidebarChoiceStore())
    }
}
