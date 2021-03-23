//
//  MasterView.swift
//  YouYou
//
//  Created by Jonathan Duong on 16/03/2021.
//

import SwiftUI

struct MasterView: View {
    
    @State var capsuleAudios: [CapsuleAudio] = getLocations()
    
    @State var selection = 1
    var body: some View {
        
        TabView(selection: $selection,
                content:  {
                    MapView(capsuleAudios: capsuleAudios)
                        .tabItem{
                        Text("Map")
                        Image(systemName: "globe")
                    }.tag(1)
                    RecommandationView()
                        .tabItem{
                        Text("Explorer")
                        Image(systemName: "helm")
                    }.tag(2)
                    RecorderView(audioRecorder: AudioRecorderManager(), capsuleAudios: .constant(getLocations()))
                        .tabItem {
                        Text("Recorder")
                        Image(systemName: "mic.circle")
                    }.tag(3)
                    FavoriView()
                        .tabItem{
                        Text("Favoris")
                        Image(systemName: "heart")
                    }.tag(4)
                    UserView()
                        .tabItem{
                        Text("Profil")
                        Image(systemName: "person")
                    }.tag(5)
                })
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
