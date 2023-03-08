//
//  PatientListView.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import SwiftUI

struct PatientListView: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var patientsStore: PatientsStore
    @EnvironmentObject var patientChoiceStore: PatientChoiceStore
    @State var patientToFind: String = ""
    let s = "ciaokiki"
    var body: some View {
        NavigationStack{
            List{
                ForEach(patientsStore.patients, id: \.id) {patient in
                    Button(action: {patientChoiceStore.patientChoice = patient.id ?? nil}, label: {PatientsListRowView(name: patient.name ?? "", surname: patient.surname ?? "", color: patientChoiceStore.patientChoice == patient.id ? Color("RowSTextColor") : Color("RowTextColor"))}).listRowBackground(patientChoiceStore.patientChoice == patient.id ? Color("RowSBGColor") : Color("RowBGColor"))
                    /*
                     .contextMenu{
                     Button("Delete", action: {patientsStore.deletePatient(patient: patient)
                     })
                     }
                     */
                }
                .onDelete{ indexSet in
                    patientsStore.patients.remove(atOffsets: indexSet)
                }
                
           }
            .listStyle(.insetGrouped)
            .searchable(text: $patientToFind)
            .toolbar{
                Button(action: {patientsStore.addNewPatient(name: "", surname: "")}, label: {Image(systemName: "plus")})
            }
            .navigationTitle("Patients")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct PatientListView_Previews: PreviewProvider {
    static var previews: some View {
        PatientListView()
            .environmentObject(PatientsStore())
            .environmentObject(PatientChoiceStore())
    }
}
