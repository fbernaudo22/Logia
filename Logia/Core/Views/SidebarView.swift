//
//  SidebarView.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import SwiftUI

struct SidebarView: View {
    @EnvironmentObject var sidebarChoiceStore: SidebarChoiceStore
    
    
    @GestureState private var isDetectingPress = false
    
        
    var body: some View {
        
        List{
            /*Section(header: Label("Dashboard", systemImage: "clock")) {*/
                Button(action: {sidebarChoiceStore.sidebarChoice = SidebarChoices.dashboard}, label: {SidebarRowView(name: String(
                    localized: "dashboard"), imageName: "clock", color: sidebarChoiceStore.sidebarChoice == SidebarChoices.dashboard ? Color("RowSTextColor") : Color("RowTextColor"))})
                .listRowBackground(sidebarChoiceStore.sidebarChoice == SidebarChoices.dashboard ? Color("RowSBGColor") : Color("RowBGColor"))
                Button(action: {sidebarChoiceStore.sidebarChoice = SidebarChoices.patients}, label: {SidebarRowView(name: String(
                    localized: "patients"), imageName: "folder", color: sidebarChoiceStore.sidebarChoice == SidebarChoices.patients ? Color("RowSTextColor") : Color("RowTextColor"))})
                .listRowBackground(sidebarChoiceStore.sidebarChoice == SidebarChoices.patients ? Color("RowSBGColor") : Color("RowBGColor"))
                Button(action: {sidebarChoiceStore.sidebarChoice = SidebarChoices.exercises}, label: {SidebarRowView(name: String(
                    localized: "exercises"), imageName: "mic", color: sidebarChoiceStore.sidebarChoice == SidebarChoices.exercises ? Color("RowSTextColor") : Color("RowTextColor"))})
                .listRowBackground(sidebarChoiceStore.sidebarChoice == SidebarChoices.exercises ? Color("RowSBGColor") : Color("RowBGColor"))
        }
        .navigationTitle("Giulia Mennella")
    
            /*
            Section(header: Label("Tags", systemImage: "tag")){
                //Tags Menu
                
                TagRowView(name: String(
                    localized: "laryngitis"), color: "blue")
                TagRowView(name: String(
                    localized: "deformity"), color: "red")
                TagRowView(name: String(
                    localized: "injury"), color: "green")
                TagRowView(name: String(
                    localized: "dysphonia"), color: "purple")
                
            }
        }*/
        .listStyle(.insetGrouped)
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
            .environmentObject(SidebarChoiceStore())
    }
}
