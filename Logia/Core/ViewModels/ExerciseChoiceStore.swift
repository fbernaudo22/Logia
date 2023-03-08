//
//  ExerciseChoiceStore.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 05/03/23.
//

import Foundation
import SwiftUI

class ExerciseChoiceStore: ObservableObject {
    @Published var exerciseChoice: UUID?
    
    init(){
        //
    }
}
