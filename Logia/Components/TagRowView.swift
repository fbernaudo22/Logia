//
//  TagRowView.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import SwiftUI

struct TagRowView: View {
    var name: String
    var color: String
    var body: some View {
        HStack{
            Image(systemName: "circlebadge.fill")
                .foregroundColor(Color(color))
            Text(name)
        }
    }
}

struct TagRowView_Previews: PreviewProvider {
    static var previews: some View {
        TagRowView(name: "Disfonia", color: "blue")
    }
}
