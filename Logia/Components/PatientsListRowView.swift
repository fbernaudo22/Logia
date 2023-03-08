//
//  PatientsListRowView.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 05/03/23.
//

import SwiftUI

struct PatientsListRowView: View {
    
    var name: String
    var surname: String
    var color: Color
    
    var body: some View {
        HStack{
        Text("\(surname) \(name)")
            Spacer()
            Image(systemName: "chevron.right")
        }.foregroundColor(color)
    }
}

struct PatientsListRowView_Previews: PreviewProvider {
    static var previews: some View {
        PatientsListRowView(name: "Mario", surname: "Rossi", color: .cyan)
    }
}
