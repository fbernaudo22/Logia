//
//  TagsListView.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import SwiftUI
import CoreData

struct TagsListView: View {
    var diseases: [Disease]
    var body: some View {
        List{
            ForEach(diseases , id: \.self){disease in
                TagRowView(name: disease.disease ?? "", color: disease.color ?? "")
            }
        }
    }

}

struct TagsListView_Previews: PreviewProvider {
    static var dis = DiseasesStore()
    static var previews: some View {
        TagsListView(diseases: dis.diseasesTrial )
            .environmentObject(DiseasesStore())
            
    }
}
