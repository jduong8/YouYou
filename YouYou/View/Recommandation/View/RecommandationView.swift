//
//  RecommandationView.swift
//  YouYou
//
//  Created by Jonathan Duong on 17/03/2021.
//
import SwiftUI

struct RecommandationView: View {
      
    func roundedRectangle(color: Color) -> some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(color)
            .frame(width: 180, height: 160)
    }
    
    var body: some View {
//        List {
//             vue générique qui affiche toutes les données de la capsule + infos capsule
//        }
        ZStack {

            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("youyoufond"))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            //            Fond qui va représenter la carte derière. il faudra faire une modale qui arrive du bas directement de la table view

            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .frame(height: 720, alignment: .bottom)
            VStack {
                VStack {
                    HStack {
                        Text("The Most Visited")
                            .frame(width: 200, alignment: .leading)
                        Button(action: {
                            print("clic")
                        }, label: {
                            Text("see all")
                                .underline()
                                .frame(width: 180, alignment: .trailing)
                        })
                    }
                    ScrollView(.horizontal){
                        HStack {

                            roundedRectangle(color: Color("youyoufondclair"))
                            roundedRectangle(color: Color("youyoufondclair"))
                            roundedRectangle(color: Color("youyoufondclair"))
                            roundedRectangle(color: Color("youyoufondclair"))
                            roundedRectangle(color: Color("youyoufondclair"))
                            roundedRectangle(color: Color("youyoufondclair"))
                        }
                    }

                    HStack {
                        Text("Locales Capsule")
                            .frame(width: 200, alignment: .leading)

                        Button(action: {
                            print("clic")
                        }, label: {
                            Text("see all")
                                .underline()
                                .frame(width: 180, alignment: .trailing)
                        })
                    }
                    VStack {
                        ScrollView(.horizontal){
                            HStack {
                                roundedRectangle(color: Color("youyoufondclair"))
                                roundedRectangle(color: Color("youyoufondclair"))
                                roundedRectangle(color: Color("youyoufondclair"))
                                roundedRectangle(color: Color("youyoufondclair"))
                                roundedRectangle(color: Color("youyoufondclair"))
                                roundedRectangle(color: Color("youyoufondclair"))
                            }
                        }

                        HStack {
                            Text("Country Capsule")
                                .frame(width: 200, alignment: .leading)

                            Button(action: {
                                print("clic")
                            }, label: {
                                Text("see all")
                                    .underline()
                                    .frame(width: 180, alignment: .trailing)
                            })
                        }
                    }
                    VStack {
                        ScrollView(.horizontal){
                            HStack {
                                roundedRectangle(color: Color("youyoufondclair"))
                                roundedRectangle(color: Color("youyoufondclair"))
                                roundedRectangle(color: Color("youyoufondclair"))
                                roundedRectangle(color: Color("youyoufondclair"))
                                roundedRectangle(color: Color("youyoufondclair"))
                                roundedRectangle(color: Color("youyoufondclair"))
                            }
                        }
                    }
                }
            }
        }
    }
}
    struct RecommandationView_Previews: PreviewProvider {
        static var previews: some View {
            RecommandationView()
        }
    }
