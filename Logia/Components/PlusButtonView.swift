//
//  PlusButtonView.swift
//  VoiceCare
//
//  Created by Francesco Bernaudo on 28/02/23.
//

import SwiftUI

struct PlusButtonView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20.0)
            .stroke(style: StrokeStyle(dash: [5,10]))
            .frame(width: 150, height: 170)
            .shadow(radius: 20)
            .overlay{
                Image(systemName: "plus")
                    .bold()
                    .foregroundColor(.primary)
            }
    }
}

struct PlusButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlusButtonView()
    }
}
