//
//  Capsuleflag.swift
//  YouYou
//
//  Created by Chloé Hine on 17/03/2021.
//

import SwiftUI

struct Capsuleflag: View {
    var flagDeCetteCapsule: String
    var body: some View {
        
        ZStack{
        Rectangle()
            .frame(width: 50, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.clear)
        Text(flagDeCetteCapsule)
            .font(.title)
        }
    }
}

struct Capsuleflag_Previews: PreviewProvider {
    static var previews: some View {
        Capsuleflag(flagDeCetteCapsule: "🇫🇷")
    }
}
