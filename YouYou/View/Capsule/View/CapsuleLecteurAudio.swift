//
//  CapsuleLecteurAudio.swift
//  YouYou
//
//  Created by Chloé Hine on 18/03/2021.
//

import SwiftUI

struct CapsuleLecteurAudio: View {
    var body: some View {
        HStack {
            Button(action: {
                       print("backward")
                    }, label: {
                        Image(systemName: "backward.end")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                        
            })
            
            Button(action: {
                       print("play")
                    }, label: {
                        Image(systemName: "play")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
            })
            
            Button(action: {
                       print("forward")
                    }, label: {
                        Image(systemName: "forward.end")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
            })
            
        }
    }
}

struct CapsuleLecteurAudio_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleLecteurAudio()
    }
}
