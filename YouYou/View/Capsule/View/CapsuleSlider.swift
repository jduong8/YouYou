//
//  CapsuleSlider.swift
//  YouYou
//
//  Created by Chloé Hine on 18/03/2021.
//

import SwiftUI
import AVFoundation

struct CapsuleSlider: View {
    
    @State private var pourcentage: Double = 1.0
    @State var player : AVAudioPlayer!
    @State var timeAudio: CGFloat = 0
    @State var totalTime = "-:--"
    @State var currentTime = "-:--"
    @State var isPlaying: Bool = false
    var audio: URL
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.player.currentTime -= 10
                    print("gobackward")
                }, label: {
                    Image(systemName: "gobackward.10")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                })
                Button(action: {
                    if player.isPlaying == false {
                        self.player.play()
                    } else {
                        self.player.pause()
                    }
                    isPlaying.toggle()
                    totalTime = toStringFormatterTimeInterval(interval: player.duration) as String
                    currentTime = toStringFormatterTimeInterval(interval: TimeInterval(player.currentTime)) as String
                    
                    DispatchQueue.global(qos: .background).async {
                        while true {
                            let screenWidth = UIScreen.main.bounds.width - 50
                            let currenttime = self.player.currentTime / self.player.duration
                            let timeForLabel = CGFloat(currenttime) * screenWidth
                            self.timeAudio = timeForLabel
                        }
                    }
                }) {
                    Image(systemName: isPlaying ? "pause" : "play")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                }
                Button(action: {
                    self.player.currentTime += 10
                    print("forward")
                }, label: {
                    Image(systemName: "goforward.10")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                })
            }
            ZStack(alignment: .leading, content: {
                Capsule().fill(Color.white.opacity(0.08)).frame(width: 360, height: 6)
                Capsule().fill(Color("youyoubutton")).frame(width: timeAudio, height: 6)
            }).padding(.horizontal, 30)
            
            HStack {
                Text(currentTime)
                Spacer()
                Text(totalTime)
            }
            .frame(width: 350).foregroundColor(.white)
        }
        .onAppear {
            self.player = try! AVAudioPlayer(contentsOf: audio)
            
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (_) in
                if player.isPlaying {
                    currentTime = toStringFormatterTimeInterval(interval: TimeInterval(player.currentTime)) as String
                }
            })
        }
    }
    
    func toStringFormatterTimeInterval(interval : TimeInterval) ->NSString {
        let timeInterval = NSInteger(interval)
        let second = timeInterval % 60
        let minutes = ( timeInterval / 60) % 60
        return NSString(format: "%0.2d:%0.2d", minutes, second)
    }
}

struct CapsuleSlider_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleSlider(timeAudio: 0, audio:  getBundleURL(for: "audiotest"))
    }
}


