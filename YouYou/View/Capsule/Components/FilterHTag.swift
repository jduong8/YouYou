//
//  FilterHTag.swift
//  YouYou
//
//  Created by Chloé Hine on 17/03/2021.
//

import SwiftUI

struct FilterHTag: View {
    var audio: CapsuleAudio
    
    var body: some View {
       
        VStack {
            ForEach(audio.hashtag, id: \.self) { oneCapsule in
                Text(oneCapsule)
                    .fontWeight(.bold)
                    .foregroundColor(Color("youyoubutton"))
                    .opacity(0.6)
                    .border(Color.green, width: 1)
            }
        }
    }
}


struct FilterHTag_Previews: PreviewProvider {
    static var previews: some View {
        FilterHTag(audio: CAPSULELOCAL[0])
            .previewLayout(.sizeThatFits)
    }
}
