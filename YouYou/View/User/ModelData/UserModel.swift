//
//  UserModel.swift
//  YouYou
//
//  Created by Jonathan Duong on 17/03/2021.
//

import Foundation
import MapKit

struct Profil: Identifiable {
    var id = UUID()
    var name: String
    var age: Int
    var score: Int
    var position: CLLocationCoordinate2D
    var description: String
    var userPicture: String
    var favoris: [CapsuleAudio]
    var socialNetwork: [String]
    var myCapsule: [CapsuleAudio]
}
