//
//  AudioPlayerManager.swift
//  YouYou
//
//  Created by Jonathan Duong on 23/03/2021.
//

import SwiftUI
import Combine
import AVFoundation
import Foundation


// We need the function audioDidFinishPlayingDelegate...
// This function is part of the AVAudioPlayerDelegate protocol...
// To adapt this delegate protocol, the AudioRecorder must also adapt the NSObject protocol...
class AudioPlayerManager: NSObject, ObservableObject, AVAudioPlayerDelegate {
    
    let objectWillChange = PassthroughSubject<AudioPlayerManager, Never>()
    //An audio player that provides playback of audio data from a file or memory...
    var audioPlayer: AVAudioPlayer!
    var isPlaying: Bool = false {
        didSet {
            objectWillChange.send(self)
        }
    }
//    @State var duration = 0
//    @State var currentTime = 0
    // This function should accept a URL, i.e. a file path for the audio to be played...
    func startPlayback(audio: URL) {
        let playbackSession = AVAudioSession.sharedInstance()
        // By default, sounds are played through the device’s earpiece. However, we want the audio to be played through the loudspeaker...
        do {
            try playbackSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
        } catch {
            // Playing over the device's speakers failed...
            print("Error")
        }
        // We need to set the AudioPlayer itselt as the delegate of AVAudioPlayer...
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audio)
            audioPlayer.delegate = self
            audioPlayer.play()
            isPlaying = true
        } catch {
            // Playback failed...
            print("Error")
        }
    }
    
    func stopPlayback() {
        audioPlayer.stop()
        isPlaying = false
    }
    
    // We add the audioDidFinishPlaying function to you AudioPlayer...
    // If the audio war successfully played, we set the playing properties value back to false...
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            isPlaying = false
        }
    }
}
