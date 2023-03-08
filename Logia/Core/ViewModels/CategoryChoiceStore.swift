//
//  CategoryChoiceStore.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 06/03/23.
//

import Foundation
import SwiftUI

enum ExerciseCategories {
    case breathing, swallowing, articulation, muscleGymnastic
}

class CategoryChoiceStore: ObservableObject {
    @Published var CategoryChoice: String?
    
    init(){
        //
    }
}
