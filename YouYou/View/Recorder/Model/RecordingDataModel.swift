//
//  RecordingDataModel.swift
//  YouYou
//
//  Created by Jonathan Duong on 23/03/2021.
//

import Foundation

struct Recording {
    let fileURL: URL
    let createdAt: Date
    let user: [Profil]
}
