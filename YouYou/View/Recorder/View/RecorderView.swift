//
//  RecorderView.swift
//  YouYou
//
//  Created by Jonathan Duong on 17/03/2021.
//

import SwiftUI

struct RecorderView: View {
    
    @ObservedObject var audioRecorder: AudioRecorderManager
    @Binding var capsuleAudios: [CapsuleAudio]
    @State var showRecordingList = false
    @State var isPresent = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Touchez pour enregistrer")
                        .font(.title)
                        .foregroundColor(.blue)
                        .bold()
                        .padding(.bottom)
                    Button(action: {
                        isPresent.toggle()
                    }) {
                        Text("Liste d'enregistrement...:")
                            .underline()
                            .padding([.bottom, .leading], 130)
                            .sheet(isPresented: $isPresent, content: {
                                RecordingsListView(audioRecorder: audioRecorder, capsuleAudios: $capsuleAudios)
                            })
                    }
                    VStack {
                        if audioRecorder.recording == false {
                            Button(action: {
                                self.audioRecorder.startRecording()
                            }) {
                                Image(systemName: "mic.circle")
                                    .font(.system(size: 165))
                                    .foregroundColor(.green)
                                    .padding(.bottom, 150)
                            }
                            .sheet(isPresented: $showRecordingList, content: { //modale
                                RecordingsListView(audioRecorder: audioRecorder, capsuleAudios: $capsuleAudios)
                            })
                        } else {
                            Button(action: {
                                self.audioRecorder.stopRecording()
                                showRecordingList = true
                            }) {
                                Image(systemName: "stop.circle")
                                    .font(.system(size: 165))
                                    .foregroundColor(.green)
                                    .padding(.bottom, 150)

                            }
                        }
                        Text("Votre enregistrement entraine la sauvegarde\n automatique d'une nouvelle capsule\n à compléter maintenant ou plus tard.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                        
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 25/255, green: 21/255, blue: 41/255).edgesIgnoringSafeArea(.all))
            }
        }
    }
}

struct RecorderView_Previews: PreviewProvider {
    static var previews: some View {
        RecorderView(audioRecorder: AudioRecorderManager(), capsuleAudios: .constant(getLocations()))
    }
}
