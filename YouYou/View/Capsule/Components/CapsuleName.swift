//
//  CapsuleName.swift
//  YouYou
//
//  Created by Chloé Hine on 17/03/2021.
//

import SwiftUI

struct CapsuleName: View {
    var titreDeCetteCapsule: String
    
    var body: some View {
        
        ZStack {
            Text(titreDeCetteCapsule)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .frame(width: 220, height: 60)

        }
    }
}

struct CapsuleName_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleName(titreDeCetteCapsule: "Les Gorges du verdon")
        
    }
}
