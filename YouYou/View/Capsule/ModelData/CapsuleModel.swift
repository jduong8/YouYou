//
//  CapsuleModel.swift
//  YouYou
//
//  Created by Jonathan Duong on 17/03/2021.
//

import Foundation
import MapKit
import SwiftUI

struct CapsuleAudio: Identifiable {
    var id = UUID()
    var fileAudio: URL
    var audioName: String
    var localisation: CLLocationCoordinate2D
    var flag: String
    var userName: String
    var userPicture: String
    var Date: String
    var timer: Int
    var iconFilter: String
    var hashtag: [String]
    var like: Bool
    var numberlike: Int
}



