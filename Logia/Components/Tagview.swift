//
//  Tagview.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import SwiftUI

struct TagView: View {
    var diseaseName: String
    var tagColor: Color
    
    var body: some View {
        HStack{
            Image(systemName: "tag")
                .foregroundColor(tagColor)
            Text(diseaseName)
            
        }
        
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(diseaseName: "Laryngitys", tagColor: .red)
    }
}
