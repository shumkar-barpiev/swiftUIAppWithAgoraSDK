//
//  AvatarsView.swift
//  liveStreamApp
//
//  Created by Shumkar on 13/3/23.
//

import SwiftUI

struct AvatarsView: View {
    @State private var favoriteColor = 0
    var body: some View {
        HStack{
            Picker("What is your favorite color?", selection: $favoriteColor) {
                Text("Red").tag(0)
                Text("Green").tag(1)
                Text("Blue").tag(2)
            }
            .pickerStyle(.segmented)
            .background(Color.gray)
        }
    }
}

struct AvatarsView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarsView()
    }
}
