//
//  CategoryRowView.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 07/03/23.
//

import SwiftUI

struct CategoryRowView: View {
    var exercise: String
    var color: Color
    var body: some View {
        HStack{
        Text(exercise)
            Spacer()
            Image(systemName: "chevron.right")
        }.foregroundColor(color)
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowView(exercise: "2", color: .cyan)
    }
}
