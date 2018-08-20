//
//  Track.swift
//  HelloWorld
//
//  Created by hnc on 8/20/18.
//  Copyright © 2018 hnc. All rights reserved.
//

import Foundation
import SwiftyJSON

// Query service creates Track objects
class Track {
    
    let name: String
    let artist: String
    let previewURL: URL?
    
    init(name: String, artist: String, previewURL: URL) {
        self.name = name
        self.artist = artist
        self.previewURL = previewURL
    }
    
    init(_ json: JSON) {
        self.name = json["trackName"].stringValue
        self.artist = json["artistName"].stringValue
        self.previewURL = URL(string: json["previewUrl"].stringValue)        
    }
}
