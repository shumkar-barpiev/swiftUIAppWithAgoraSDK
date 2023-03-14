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
    @State private var showingPhotoPicker = false
    @State public var avatarImage = Image(systemName: "person.circle.fill")
    
    var body: some View {
        VStack{
            Text("Choose your Avatar:")
                .foregroundColor(Color.white)
                .font(.title)
                .bold()
                .frame(width: UIScreen.main.bounds.width, height: 35, alignment: .leading)
                .padding()
            
            avatarImage
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .foregroundColor(Color.white)
                .padding()
                .clipShape(Circle())
                .onTapGesture {
                    showingPhotoPicker = true
                }
            
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.black)
        .sheet(isPresented: $showingPhotoPicker, onDismiss: nil) {
            PhotoPicker(avatarImage: $avatarImage)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
