//
//  CapsuleRaw.swift
//  YouYou
//
//  Created by Chloé Hine on 17/03/2021.
//

import SwiftUI

struct CapsuleRaw2: View {
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                
                .opacity(0.8)
            VStack{
                HStack{
                    IconeView()
                    VStack {
                        HStack {
                            CapsuleName()
                            CapsuleFlag()
                        }
                        FilterHTag(audio: CAPSULELOCAL[0])
                            .padding()
                    }
                }
                
                HStack {
                    CapsuleProfile()
                        .padding(.leading)
                        
                    Spacer()
                    ShareButton()
                        .padding(.trailing, 5.0)
                    
                    LikeButton()
                        .padding(.trailing)
                }
              
                    HStack {
                    CapsuleTimer()
                        .padding()
                    CapsuleLike()
                            .padding(.trailing)
                          
                    CapsuleNumberLike()
                        .padding(.trailing)
                    }
                    
                    
                    
                    
                    
                    
            }
            
            
        } .frame(width: 400, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
    }
}

struct CapsuleRaw2_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleRaw()
    }
}


