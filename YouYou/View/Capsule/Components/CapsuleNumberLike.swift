//
//  CapsuleNumberLike.swift
//  YouYou
//
//  Created by Chloé Hine on 17/03/2021.
//

import SwiftUI

struct CapsuleNumberLike: View {
    var numberLikeDeCetteCapsule: Int
    var body: some View {
        
        Text("\(numberLikeDeCetteCapsule)")
            
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 50, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .opacity(0.6)
        
    }
}

struct CapsuleNumberLike_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleNumberLike(numberLikeDeCetteCapsule: 56)
    }
}
