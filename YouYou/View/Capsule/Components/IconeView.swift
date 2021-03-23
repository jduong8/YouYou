//
//  IconeView.swift
//  YouYou
//
//  Created by Chloé Hine on 17/03/2021.
//

import SwiftUI

import SwiftUI

struct IconeView: View {
    
    var iconeName: String
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 15.0)
                .frame(width: 90, height: 100, alignment: .center)
                .foregroundColor(.white)
                .padding()

            Image(systemName: iconeName)
                .resizable()
                .frame(width: 80, height: 80, alignment: .center)
                .foregroundColor(Color("youyoubuttonopacity"))
        }
    }
}

struct IconeView_Previews: PreviewProvider {
    static var previews: some View {
        IconeView(iconeName: "tortoise.fill")
    }
}
