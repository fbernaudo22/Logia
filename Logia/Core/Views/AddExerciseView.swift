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
    @State var category: String
    var body: some View {
        VStack{
            Form{
                Section{
                    TextField("name", text: $name)
                }
                Section{
                    Picker("category", selection: $category){
                        Text(categories[0]).tag(categories[0])
                        Text(categories[1]).tag(categories[1])
                        Text(categories[2]).tag(categories[2])
                        Text(categories[3])
                            .tag(categories[3])
                    }
                }
            }
                Button("create", action: {exercisesStore.addNewExercise(exercise: name , category: category)})
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
