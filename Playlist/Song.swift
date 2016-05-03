//
//  Song.swift
//  Playlist
//
//  Created by Austin Hesterly on 4/30/16.
//  Copyright © 2016 Austin Hesterly. All rights reserved.
//

import Foundation

// class Song follows/conforms to the protocol Equatable
class Song: Equatable {
    
    let title: String
    let artist: String
    
    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
}
// lhs -> left hand side, rhs -> right hand side
// if lhs & rhs titles and artists are the same, return true
func ==(lhs: Song, rhs: Song) -> Bool {
    return lhs.title == rhs.title && lhs.artist == rhs.artist
}