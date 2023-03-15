//
//  LiveStreamView.swift
//  liveStreamApp
//
//  Created by Shumkar on 14/3/23.
//

import SwiftUI
import AgoraUIKit


struct LiveStreamView: View {
//    MARK: input text fields
    
    @State var connectedToChannel = false
//    MARK: Agora settings: App ID, Token
    static var agview = AgoraViewer(
        connectionData: AgoraConnectionData(
            appId: "0ac666b981b048288839eb54cd4adc53",
            rtcToken: "007eJxTYLDZdVpIZ7527lnLA4fFD71n+leQmaiy2/uzi0Sw1U7V2HAFBoPEZDMzsyRLC8MkAxMLIwsLC2PL1CRTk+QUk8SUZFPjj3aCKQ2BjAyHTMyZGBkgEMRnYchNzMxjYAAA0s0dVw=="
        ),
        style: .floating
    )
    
    @State private var agoraViewerStyle = 0
    
    
// MARK: View Body
    var body: some View {
        ZStack {
            LiveStreamView.agview
            VStack {
                Picker("Format", selection: $agoraViewerStyle) {
                    Text("Floating").tag(0)
                    Text("Grid").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                .frame(
                    minWidth: 0, idealWidth: 100, maxWidth: 200,
                    minHeight: 0, idealHeight: 40, maxHeight: .infinity, alignment: .topTrailing
                ).onChange(
                    of: agoraViewerStyle,
                    perform: {
                        LiveStreamView.agview.viewer.style = $0 == 0 ? .floating : .grid
                    }
                )
                Spacer()
                HStack {
                    Spacer()
                    Button(
                        action: { connectToAgora() },
                        label: {
                            if connectedToChannel {
                                Text("Disconnect").padding(3.0).background(Color.red).cornerRadius(3.0).hidden()
                            } else {
                                Text("Connect").padding(3.0).background(Color.green).cornerRadius(3.0)
                            }
                        }
                    )
                    Spacer()
                }
                Spacer()
            }
        }
           
    }
    
    
    func connectToAgora() {
        connectedToChannel.toggle()
        if connectedToChannel {
            LiveStreamView.agview.join(channel: "main", with: nil, as: .broadcaster)
        } else {
            LiveStreamView.agview.viewer.leaveChannel()
        }
    }
}

