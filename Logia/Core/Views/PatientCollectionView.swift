//
//  PatientCollectionView.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import SwiftUI
import CoreData

struct PatientsCollectionView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.editMode) var editMode
    @EnvironmentObject var patiensStoreModel: PatientsStore
    @EnvironmentObject var patientChoiceStore: PatientChoiceStore
    
    //Layout fot the grid
    var layout = [
        GridItem(.adaptive(minimum: 120)),
        GridItem(.adaptive(minimum: 120))
    ]
    
    
   
    var body: some View {
        //Grid
            ScrollView(.vertical){
                LazyVGrid(columns: layout){
                    Button(action: {patiensStoreModel.addNewPatient(name: "", surname: "")}, label: {PlusButtonView()})
                        .padding(.bottom, 60)
                    
                    ForEach(patiensStoreModel.patients, id: \.self){ patient in
                        Button(action: {patientChoiceStore.patientChoice = patient.id!}, label: {PatientButtonView(patientName: patient.name ?? "", patientSurname: patient.surname ?? "")})
                            .contextMenu{
                                Button("Delete", action: {
                                    patiensStoreModel.deletePatient(patient: patient)
                                })
                            }
                    }
                }
                .task {
                    patiensStoreModel.fetchPatients()
                }
                .padding(.top, 30)
            }
            .toolbar{
                Button("Delete", action: {patiensStoreModel.deleteAllPatient(patients: patiensStoreModel.patients)})
            }
            .navigationTitle("patients")
            
        }
    }





struct PatientsCollectionView_Previews: PreviewProvider {
    @StateObject static var pat = PatientsStore()
    static var previews: some View {
        PatientsCollectionView()
            .environmentObject(PatientsStore())
            .environmentObject(DiseasesStore())
            .environmentObject(ExercisesStore())
            .environmentObject(AssessmentsStore())
    }
}
