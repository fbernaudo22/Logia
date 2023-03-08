//
//  ExercisesView.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import SwiftUI

struct ExercisesView: View {
    @EnvironmentObject var exerciseChoiceStore: ExerciseChoiceStore
    @EnvironmentObject var exercisesStore: ExercisesStore
    @EnvironmentObject var categoryChoiceStore: CategoryChoiceStore
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var isShowingSheet: Bool = false
    var body: some View {
        NavigationStack{
            List{
                ForEach(exercisesStore.exercises, id: \.self){exercise in
                    if exercise.category == categoryChoiceStore.CategoryChoice{
                        NavigationLink(destination: WelcomeView(), label: {
                            ExerciseRowView(exercise: exercise.exercise ?? "", color: Color("RowTextColor"))})
                        //.listRowBackground( Color("RowBGColor"))
                        
                        /*
                        Button(action: {exerciseChoiceStore.exerciseChoice = exercise.exercise}, label: {
                            ExerciseRowView(exercise: exercise.exercise ?? "", color: exerciseChoiceStore.exerciseChoice == exercise.exercise ? Color("RowSTextColor") : Color("RowTextColor"))}
                        )
                        .listRowBackground(exerciseChoiceStore.exerciseChoice == exercise.exercise ? Color("RowSBGColor") : Color("RowBGColor"))
                         */
                    }
                }
                .onDelete{ indexSet in
                    exercisesStore.deleteExerciseFromList(offsets: indexSet)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("exercises")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button(action: {isShowingSheet.toggle()}, label: {Image(systemName: "plus")})
            }
            .sheet(isPresented: $isShowingSheet, content: {AddExerciseView(name: "", category: "")})
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
            .environmentObject(PatientsStore())
            .environmentObject(DiseasesStore())
            .environmentObject(ExercisesStore())
            .environmentObject(ExerciseChoiceStore())
            .environmentObject(CategoryChoiceStore())
    }
}
