//
//  PlaylistController.swift
//  Playlist
//
//  Created by Austin Hesterly on 4/30/16.
//  Copyright © 2016 Austin Hesterly. All rights reserved.
//

import Foundation

class PlaylistController {
    
    static let sharedController = PlaylistController()
    
    var playlists = [Playlist]()
    
    func createPlaylist(name: String) {
        let playlist = Playlist(name: name)
        playlists.append(playlist)
    }
    func removePlaylist(playlist: Playlist) {
        guard let index = playlists.indexOf(playlist)
            else {
                return
            }
        playlists.removeAtIndex(index)
    }
    func addSongToPlaylist(title: String, artist: String, playlist: Playlist) {
        let song = Song(title: title, artist: artist)
        playlist.songs.append(song)
    }
    func removeSongFromPlaylist(song: Song, playlist: Playlist) {
        guard let index = playlist.songs.indexOf(song) else {
            return
        }
        playlist.songs.removeAtIndex(index)
    }
}
