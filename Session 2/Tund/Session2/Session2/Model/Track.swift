//
//  Track.swift
//  Session2
//
//  Created by admin on 8/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import SwiftyJSON
class Track {
    let name: String
    let artist: String
    let previewURL: URL?
    //
    init(name: String, artist: String, previewURL: URL) {
        self.name = name
        self.artist = artist
        self.previewURL = previewURL
    }
}
