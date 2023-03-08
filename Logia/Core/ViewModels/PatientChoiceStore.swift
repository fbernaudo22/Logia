//
//  PatientChoiceStore.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import Foundation
import SwiftUI

class PatientChoiceStore: ObservableObject {
    @Published var patientChoice: UUID?
    
    init(){
        //
    }
}
