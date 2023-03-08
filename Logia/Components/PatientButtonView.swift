//
//  PatientButtonView.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import SwiftUI

struct PatientButtonView: View {
    var patientName: String
    var patientSurname: String
    var body: some View {
        VStack(spacing: 10){
            RoundedRectangle(cornerRadius: 20.0)
                .frame(width: 150, height: 170)
                .foregroundColor(Color.gray)
                .shadow(radius: 10)
            Text(patientSurname + "\n" + patientName)
                .frame(width: 100)
                .foregroundColor(.primary)
                .font(.title3)
        }
    }
}


struct PatientButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PatientButtonView(patientName: "Tonino", patientSurname: "Accollapiecoro")
    }
}
