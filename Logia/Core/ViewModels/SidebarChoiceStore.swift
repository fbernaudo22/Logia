//
//  SidebarChoiceStore.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import Foundation
import SwiftUI

enum SidebarChoices {
    case dashboard, patients, exercises
}

class SidebarChoiceStore: ObservableObject {
    @Published var sidebarChoice: SidebarChoices
    
    init(){
        self.sidebarChoice = SidebarChoices.dashboard
    }
}
