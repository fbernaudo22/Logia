//
//  DetailView.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import SwiftUI

struct PatientDetailView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.editMode) private var editMode
    @EnvironmentObject var patientsStore: PatientsStore
    @EnvironmentObject var patientChoiceStore: PatientChoiceStore
    var body: some View {
        NavigationStack{
            ForEach(patientsStore.patients, id: \.self){patient in
                if patient.id == patientChoiceStore.patientChoice {
                    PatientView(patient: patient, patientName: patient.name ?? "", patientSurname: patient.surname ?? "", patientAge: patient.age ?? "", patientAddress: patient.address ?? "", patientPhoneNumber: patient.phoneNumber ?? "")
                }
            }
        }
    }
}

struct PatientDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PatientDetailView()
            .environmentObject(PatientsStore())
            .environmentObject(PatientChoiceStore())
    }
}
