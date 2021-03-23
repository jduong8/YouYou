//
//  LikeButton.swift
//  YouYou
//
//  Created by Chloé Hine on 18/03/2021.
//

import SwiftUI

struct LikeButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(Color("youyoubuttonopacity"))
                .opacity(0.1)
            
            Button(action: {
                print("do something")
            }, label: {
                Image(systemName: "heart")
                    .foregroundColor(Color("youyoubutton"))
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            })
        }
    }
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton()
            .previewLayout(.sizeThatFits)
    }
}
