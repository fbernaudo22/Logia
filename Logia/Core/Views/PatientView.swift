//
//  PatientView.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import SwiftUI
import CoreData

struct PatientView: View {
    //Environment variables
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.editMode) private var editMode
    @EnvironmentObject var patiensStoreModel: PatientsStore
    @EnvironmentObject var diseasesStore: DiseasesStore
    @EnvironmentObject var exercisesStore: ExercisesStore
    //view variables
    @State var patient: Patient
    @State var patientName: String
    @State var patientSurname: String
    @State var patientAge:  String
    @State var patientAddress: String
    @State var patientPhoneNumber: String
    //Patient submenu variables
    @State private var chevronIsRotating: Bool = false
    private var chevronRotation: Double {
        if chevronIsRotating {
            return 90.0
        }
        else {
            return 0.0
        }
    }
    @State private var showTags: Bool = false
    
    var body: some View {
            Form{
                Section("Data"){
                    HStack{
                        Text(patientName + " " + patientSurname)
                        Spacer()
                        Image(systemName: "chevron.forward")
                            .onTapGesture {
                                chevronIsRotating.toggle()
                                showTags.toggle()
                            }
                            .rotationEffect(Angle(degrees: chevronRotation))
                    }
                    if showTags {
                        if editMode?.wrappedValue.isEditing == true {
                            List{
                                TextField(String(localized: "insert") + " " + String(localized: "name"), text: $patientName)
                                TextField(String(localized: "insert") + " " + String(localized: "surname"), text: $patientSurname)
                                TextField(String(localized: "insert") + " " + String(localized: "age"), text: $patientAge)
                                TextField(String(localized: "insert") + " " + String(localized: "address"), text: $patientAddress)
                                TextField(String(localized: "insert") + " " + String(localized: "phone number"), text: $patientPhoneNumber)
                            }
                        }
                        else {
                            List{
                                Text(String(
                                    localized: "name") + ":\t" + patientName)
                                Text(String(
                                    localized: "surname")+":\t" + patientSurname)
                                Text(String(
                                    localized: "age") + ":\t" + patientAge)
                                Text(String(
                                    localized: "address") + ":\t" + patientAddress)
                                Text(String(
                                    localized: "phone number") + ":\t" + patientPhoneNumber)
                            }
                        }
                    }
                }
                Section{
                    NavigationLink(destination: ExercisesView(), label: {
                        HStack{
                            Text("history sheet")
                            Spacer()
                            /*TagView(diseaseName: "lalryngitys", tagColor: .red)
                                .padding(.horizontal)
                             */
                        }
                    })
                    NavigationLink("assessments", destination: WelcomeView())
                }
            }
            .navigationTitle("medical records")
            .toolbar{
                EditButton()
                if editMode?.wrappedValue.isEditing == true {
                    Button("save", action: {patiensStoreModel.updatePatientGeneralities(name: patientName, surname: patientSurname, age: patientAge, address: patientAddress, phoneNumber: patientPhoneNumber, patient: patient)
                    })
                }
            }
        }
    }
    


struct PatientView_Previews: PreviewProvider {
    static var patient = PatientsStore()
    static var previews: some View {
        PatientView(patient: Patient(context: PersistenceController.shared.container.viewContext), patientName: "Mario", patientSurname: "Rossi", patientAge: "45", patientAddress: "ljdf", patientPhoneNumber: "766738839")
            .environmentObject(PatientsStore())
            .environmentObject(DiseasesStore())
            .environmentObject(ExercisesStore())
            .environmentObject(AssessmentsStore())
    }
}
