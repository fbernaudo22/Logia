//
//  ExerciseDetailView.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 05/03/23.
//

import SwiftUI

struct ExerciseDetailView: View {
    var exerciseName: String
    var body: some View {
        Text(exerciseName)
    }
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailView(exerciseName: "")
    }
}
