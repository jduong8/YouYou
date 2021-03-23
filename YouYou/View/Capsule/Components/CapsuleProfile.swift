//
//  CapsuleProfile.swift
//  YouYou
//
//  Created by Chloé Hine on 18/03/2021.
//

import SwiftUI

struct CapsuleProfile: View {
    
    var userNameDeCetteCapsule: String
    var userPictureDeCetteCapsule: String
    var body: some View {
        
        ZStack {
            Button(action: {
                print("do something")
            }, label: {
                RoundedRectangle(cornerRadius: 45.0)
                    .frame(width: 200, height: 60, alignment: .leading)
                    .foregroundColor(Color("youyoubuttonopacity"))
                    .opacity(0.1)
            })
            HStack {
                Image(userPictureDeCetteCapsule)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 70, height: 70, alignment: .leading)
                Text(userNameDeCetteCapsule)
                    .font(.footnote)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding(.leading, -13.0)
                Image(systemName: "checkmark.seal")
                    .foregroundColor(Color("youyoubutton"))
            }
        }
    }
}

struct CapsuleProfile_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleProfile(userNameDeCetteCapsule: "jean du jardin", userPictureDeCetteCapsule: "")
            .previewLayout(.sizeThatFits)
    }
}
