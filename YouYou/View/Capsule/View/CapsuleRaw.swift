//
//  CapsuleRaw.swift
//  YouYou
//
//  Created by Chloé Hine on 17/03/2021.
//

import SwiftUI

struct CapsuleRaw: View {
    
    var cetteCapsule: CapsuleAudio
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("youyoufond"))
            VStack {
                HStack {
                    IconeView(iconeName: cetteCapsule.iconFilter)
                    VStack {
                        HStack {
                            CapsuleName(titreDeCetteCapsule: cetteCapsule.audioName)
                            Capsuleflag(flagDeCetteCapsule: cetteCapsule.flag)
                        }
                        FilterHTag(audio: cetteCapsule)
                            .padding(.top, 0.0)
                    }
                }
                HStack {
                    CapsuleProfile(userNameDeCetteCapsule: cetteCapsule.userName, userPictureDeCetteCapsule: cetteCapsule.userPicture)
                        .padding(.leading)
                    
                    Spacer()
                    ShareButton()
                        .padding(.trailing, 5.0)
                    
                    LikeButton()
                        .padding(.trailing)
                }
                CapsuleSlider(audio: cetteCapsule.fileAudio).frame(width: 350)
                
                HStack {
                    CapsuleTimer(timeDeCetteCapsule: cetteCapsule.timer)
                    //.padding()
                    CapsuleLike()
                    //.padding(.trailing)
                    
                    CapsuleNumberLike(numberLikeDeCetteCapsule: cetteCapsule.numberlike)
                        .padding(.trailing)
                }
            }
        }
        .frame(width: 350, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct CapsuleRaw_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleRaw(cetteCapsule: CAPSULELOCAL[1])
    }
}
