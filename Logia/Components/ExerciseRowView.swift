//
//  ExerciseRowView.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 05/03/23.
//

import SwiftUI

struct ExerciseRowView: View {
    var exercise: String
    var color: Color
    var body: some View {
        Text(exercise)
    }
}

struct ExerciseRowView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseRowView(exercise: "2", color: .white)
    }
}
