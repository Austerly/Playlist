//
//  Playlist.swift
//  Playlist
//
//  Created by Austin Hesterly on 4/30/16.
//  Copyright © 2016 Austin Hesterly. All rights reserved.
//

import Foundation

class Playlist: Equatable {
    let name: String
    var songs: [Song]
    
    init(name: String, songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }
}

func ==(lhs: Playlist, rhs: Playlist) -> Bool {
    return lhs.name == rhs.name && lhs.songs == rhs.songs
}