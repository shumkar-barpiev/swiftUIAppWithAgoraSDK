//
//  EntranceView.swift
//  liveStreamApp
//
//  Created by Shumkar on 15/3/23.
//

import SwiftUI

struct EntranceView: View {
    //    MARK: input text fields
    @Binding var username: String
    @Binding var roomname: String
    let liveStreamObj = LiveStreamView()
    
    // MARK: View Body
    var body: some View {
        VStack{
            Text("Display Name:")
                .foregroundColor(Color.white)
                .font(.title)
                .bold()
                .frame(width: UIScreen.main.bounds.width, height: 35, alignment: .leading)
                .padding(5)
            
            HStack{
                Image(systemName: "person")
                    .foregroundColor(Color.gray)
                TextField("Enter your Username", text: $username)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .frame(width: UIScreen.main.bounds.width-70, height: 27, alignment: .leading)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .gray, radius: 5, x: 0, y: 10)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 15).stroke(Color.black, lineWidth: 0.5)
            })
            
            Text("Room Name:")
                .foregroundColor(Color.white)
                .font(.title)
                .bold()
                .frame(width: UIScreen.main.bounds.width, height: 35, alignment: .leading)
                .padding(5)
            
            HStack{
                Image(systemName: "square.and.pencil")
                    .foregroundColor(Color.gray)
                TextField("Enter room name", text: $roomname)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .frame(width: UIScreen.main.bounds.width-70, height: 27, alignment: .leading)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .gray, radius: 5, x: 0, y: 10)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 15).stroke(Color.black, lineWidth: 0.5)
            })
            
            
            
            Button {
                liveStreamObj.connectToAgora()
            } label: {
                if liveStreamObj.connectedToChannel {
                    Text("Disconnect").padding(3.0).background(Color.red).cornerRadius(3.0).hidden()
                }else{
                    NavigationLink {
                        LiveStreamView()
                    } label: {
                        HStack{
                            Image(systemName: "plus.circle")
                                .foregroundColor(Color.black)
                            Text("Join")
                                .font(.title2)
                                .foregroundColor(Color.black)
                        }
                        .padding()
                        .frame(width: UIScreen.main.bounds.width-100, height: 55, alignment: .center)
                        .background(Color(.systemGray3))
                        .cornerRadius(15)
                        .shadow(color: .gray, radius: 5, x: 0, y: 10)
                    }
                }
                
            }
            .padding(.top, 50)
        }
    }
    
}

