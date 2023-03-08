//
//  ExercisesCategoryMenu.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 06/03/23.
//

import SwiftUI

struct ExercisesCategoryMenu: View {
    @EnvironmentObject var categoryChoiceStore: CategoryChoiceStore
    let categories = ["breathing", "swallowing", "articulation", "muscleGymnastic"]
    var body: some View {
        List{
            ForEach(categories, id: \.self){ category in
                Button(action: {categoryChoiceStore.CategoryChoice = category}, label: {CategoryRowView(exercise: category, color: category == categoryChoiceStore.CategoryChoice ? Color("RowSTextColor") : Color("RowTextColor"))})
                    .listRowBackground(categoryChoiceStore.CategoryChoice == category ? Color("RowSBGColor") : Color("RowBGColor"))
            }
        }
    }
}

struct ExercisesCategoryMenu_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesCategoryMenu()
            .environmentObject(CategoryChoiceStore())
    }
}
