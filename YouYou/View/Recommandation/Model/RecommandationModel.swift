//
//  RecommandationModel.swift
//  YouYou
//
//  Created by Jonathan Duong on 17/03/2021.
//

import Foundation

struct Recommandation: Identifiable {
    var id = UUID()
    var theme: String
    var capsulesFavoriLocal: [CapsuleAudio]
    var capsulesFavoriWorld: [CapsuleAudio]
    var capsulesFavoriCountry: [CapsuleAudio]
}
