//
//  PlaylistDetailViewController.swift
//  Playlist
//
//  Created by Austin Hesterly on 4/30/16.
//  Copyright © 2016 Austin Hesterly. All rights reserved.
//

import UIKit

class PlaylistDetailViewController: UIViewController {

    var playlist: Playlist? {
        didSet {
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    private func updateView() {
        if let playlist = playlist {
            title = playlist.name
        } else {
            title = "No Playlist"
        }
        
        tableView?.reloadData()
    }
    
    @IBAction func addSong(sender: AnyObject) {
        guard let playlist = playlist,
            title = titleField.text,
            artist = artistField.text else {return}
        
        let playlistController = PlaylistController.sharedController
        playlistController.addSongToPlaylist(title, artist: artist, playlist: playlist)
        tableView?.reloadData()
        
    }
    
    //Mark: - Outlets

    @IBOutlet var titleField: UITextField!
    @IBOutlet var artistField: UITextField!
    @IBOutlet var tableView: UITableView!
}
extension PlaylistDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.songs.count ?? 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SongCell", forIndexPath: indexPath)
        guard let songs = playlist?.songs else { return cell }
        
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.title
        cell.detailTextLabel?.text = song.artist
        
        return cell
    }
}