//
//  ExercisesCategoryMenu.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 06/03/23.
//

import SwiftUI

struct ExercisesCategoryMenu: View {
    @EnvironmentObject var categoryChoiceStore: CategoryChoiceStore
    let categories = [String(localized: "breathing"), String(localized: "swallowing"), String(localized: "articulation"), String(localized: "muscularGymnastics")]
    var body: some View {
        List{
            ForEach(categories, id: \.self){ category in
                Button(action: {categoryChoiceStore.CategoryChoice = category}, label: {CategoryRowView(exercise: category, color: category == categoryChoiceStore.CategoryChoice ? Color("RowSTextColor") : Color("RowTextColor"))})
                    .listRowBackground(categoryChoiceStore.CategoryChoice == category ? Color("RowSBGColor") : Color("RowBGColor"))
            }
        }.listStyle(.insetGrouped)
    }
}

struct ExercisesCategoryMenu_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesCategoryMenu()
            .environmentObject(CategoryChoiceStore())
    }
}
