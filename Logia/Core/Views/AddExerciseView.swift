//
//  AddExerciseView.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 07/03/23.
//

import SwiftUI

struct AddExerciseView: View {
    @EnvironmentObject var exercisesStore: ExercisesStore
    @State var name: String
    let categories = ["breathing", "swallowing", "articulation", "muscleGymnastic"]
    @State var category: String
    var body: some View {
        VStack{
            Form{
                Section{
                    TextField("Name", text: $name)
                }
                Section{
                    Picker("Category", selection: $category){
                        Text("breathing").tag("breathing")
                        Text("swallowing").tag("swallowing")
                        Text("articulation").tag("articulation")
                        Text("muscleGymnastic")
                            .tag("muscleGymnastic")
                    }
                }
            }
                Button("Create", action: {exercisesStore.addNewExercise(exercise: name , category: category)})
                .buttonStyle(.borderedProminent)
            .padding(.bottom, 20)
        }
    }
}

struct AddExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseView(name: "Zazaza", category: "breathing")
            .environmentObject(ExercisesStore())
    }
}
