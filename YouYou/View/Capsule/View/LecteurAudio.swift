//
//  SwiftUIView.swift
//  YouYou
//
//  Created by Chloé Hine on 18/03/2021.
//

import SwiftUI


struct SwiftUIView: View {
    var body: some View {
       
        
        HStack {
            Button(action: {
                       print("backward")
                    }, label: {
                        Image(systemName: "backward.end.fill")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                        
            })
            
            Button(action: {
                       print("play")
                    }, label: {
                        Image(systemName: "play.circle.fill")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
            })
            
            Button(action: {
                       print("forward")
                    }, label: {
                        Image(systemName: "forward.end.fill")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
            })
            
        }
    }
}
    
    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            SwiftUIView()
        }
    }
