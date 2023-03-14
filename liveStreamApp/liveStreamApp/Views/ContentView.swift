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
    @State var avatarImage = Image(systemName: "person.circle.fill")
    @State var username: String = ""
    @State var roomname: String = ""
    
    var body: some View {
        VStack{
            Text("Choose your Avatar:")
                .foregroundColor(Color.white)
                .font(.title)
                .bold()
                .frame(width: UIScreen.main.bounds.width, height: 35, alignment: .leading)
                .padding(.top, 70)
                .padding(.bottom, 20)
            
            avatarImage
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .foregroundColor(Color.white)
                .clipShape(Circle())
                .padding(5)
                .onTapGesture {
                    showingPhotoPicker = true
                }
            
            TextFieldsView(username: $username, roomname: $roomname)
            
            
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
