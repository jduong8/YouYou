//
//  CapsuleLike.swift
//  YouYou
//
//  Created by Chloé Hine on 17/03/2021.
//

import SwiftUI

struct CapsuleLike: View {
    
    @State var liked: Int = 0
    
    func addLike() {
        self.liked += 1
    }
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(Color("youyoubuttonopacity"))
                .opacity(0.1)
            
            Button(action: {
                addLike()
            }, label: {
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(Color("youyoubutton"))
                    .font(.title)
            })
        }
        
    }
}

struct CapsuleLike_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleLike()
    }
}

