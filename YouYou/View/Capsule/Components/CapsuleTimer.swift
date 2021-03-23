//
//  CapsuleTimer.swift
//  YouYou
//
//  Created by Chloé Hine on 17/03/2021.
//

import SwiftUI

struct CapsuleTimer: View {
    
    var timeDeCetteCapsule: Int
    
    func secondsToMinutesAndSeconds(seconds : Int) -> String {
        let minutes = "\((seconds % 3600) / 60)"
        let seconds = "\((seconds % 3600) % 60)"
        let minuteStamps = minutes.count > 1 ? minutes : "0" + minutes
        let secondStamps = seconds.count > 1 ? seconds : "0" + seconds
        
        return "\(minuteStamps) min \(secondStamps) sec"
    }
    
    var body: some View {
        HStack {
            Image(systemName: "headphones")
                .foregroundColor(.white)
                .opacity(0.6)
                .font(.title)
            Text("\(secondsToMinutesAndSeconds(seconds: timeDeCetteCapsule))")
                .foregroundColor(.white)
                .font(.title2)
            Spacer()
        }
    }
}

struct CapsuleTimer_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleTimer(timeDeCetteCapsule: 510)
            .previewLayout(.sizeThatFits)
        
    }
}
