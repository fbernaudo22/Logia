//
//  SidebarRowView.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import SwiftUI


struct SidebarRowView: View {
    
    var name: String
    var imageName: String
    var color: Color
    
    var body: some View {
        HStack{
            Image(systemName: imageName)
                .foregroundColor(color)
            Text(name)
                .foregroundColor(color)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(color)
        }
    }
}

struct SidebarRowView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarRowView(name: "Toni o sicc", imageName: "folder", color: .cyan)
    }
}
