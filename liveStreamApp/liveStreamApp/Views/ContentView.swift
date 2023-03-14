//
//  ContentView.swift
//  liveStreamApp
//
//  Created by Shumkar on 13/3/23.
//

import SwiftUI
import AgoraUIKit
import AgoraRtcKit

struct ContentView: View {
    
    
    var body: some View {
        VStack{
            Text("Select Avatars:")
                .foregroundColor(Color.white)
                .font(.title)
                .bold()
                .frame(width: UIScreen.main.bounds.width, height: 35, alignment: .leading)
                .padding()
                
            AvatarsView()
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
