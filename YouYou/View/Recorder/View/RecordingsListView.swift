//
//  RecordingsListView.swift
//  YouYou
//
//  Created by Jonathan Duong on 23/03/2021.
//

import SwiftUI
import MapKit

struct RecordingRow: View {
    
    @ObservedObject var audioPlayer = AudioPlayerManager()
    @ObservedObject var recordManager = AudioRecorderManager()
    @Binding var capsuleAudios: [CapsuleAudio]
    var audioURL: URL
    
    var body: some View {
        
        HStack {
            VStack {
                Text("\(audioURL.lastPathComponent)")
                    .foregroundColor(Color(red: 0, green: 179, blue: 80))
            }
            Spacer()
            if audioPlayer.isPlaying == false {
                Button (action: {
                    self.audioPlayer.startPlayback(audio: self.audioURL)
                    print("Start Playing Audio")
                }) {
                    Image(systemName: "play.circle")
                        .imageScale(.large)
                        .foregroundColor(Color(red: 0, green: 179, blue: 80))
                }.buttonStyle(PlainButtonStyle())
            } else {
                Button (action: {
                    self.audioPlayer.stopPlayback()
                    print("Audio Stopped")
                }) {
                    Image(systemName: "stop.circle")
                        .imageScale(.large)
                        .foregroundColor(Color(red: 0, green: 179, blue: 80))
                }.buttonStyle(PlainButtonStyle())
            }
            Button (action: {
                let newCapsule = CapsuleAudio(fileAudio: audioURL, audioName: "testaudio", localisation: CLLocationCoordinate2D(latitude: 48.9066, longitude: 2.4522), flag: "🇫🇷", userName: "", userPicture: "",Date: "23/03/21", timer: 200, iconFilter: "", hashtag: [""], like: false, numberlike: 1)
                
                capsuleAudios.append(newCapsule)
            }, label: {
                Image(systemName: "plus.circle")
                    .imageScale(.large)
                    .foregroundColor(Color(red: 0, green: 179, blue: 80))
            }).buttonStyle(PlainButtonStyle())
        }
    }
}

struct RecordingsListView: View {
    
    @ObservedObject var audioRecorder: AudioRecorderManager
    @Binding var capsuleAudios: [CapsuleAudio]
    @Environment(\.presentationMode) var presentationMode
    
    func close() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func delete(at offsets: IndexSet) {
        audioRecorder.removeRecording(at: offsets)
    }
    
    func UIColorFromRGB() -> UIColor {
        return UIColor(
            red: 25 / 255.0,
            green: 21 / 255.0,
            blue: 41 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(audioRecorder.recordings, id: \.createdAt) { recording in
                    RecordingRow(capsuleAudios: $capsuleAudios, audioURL: recording.fileURL)
                }
                .onDelete(perform: delete)
                .listRowBackground(Color(red: 25/255, green: 21/255, blue: 41/255))
            }
            .onAppear() {
                UITableView.appearance().backgroundColor = UIColorFromRGB()
            }
            
            .navigationBarItems(leading: closeButton, trailing: EditButton())
        }
    }
    var closeButton: some View {
        Button (action: {
            close()
        }, label: {
            Text("Close")
        })
    }
}

struct RecordingsListView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingsListView(audioRecorder: AudioRecorderManager(), capsuleAudios: .constant(getLocations())) //simulation d'un binding...
    }
}

