//
//  ListViewController.swift
//  Playlist
//
//  Created by Austin Hesterly on 4/30/16.
//  Copyright © 2016 Austin Hesterly. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    // MARK: - Actions
    
    @IBAction func addPlaylist(sender: AnyObject) {
        guard let name = namedField.text where !name.isEmpty else {
            return
        }
        PlaylistController.sharedController.createPlaylist(name)
        tableView.reloadData()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let cell = sender as? UITableViewCell,
        indexPath = tableView.indexPathForCell(cell) {
            let playlist = PlaylistController.sharedController.playlists[indexPath.row]
            let vc = segue.destinationViewController as? PlaylistDetailViewController
            vc?.playlist = playlist
        }
        
    }
    
    // Mark: - Outlets
    @IBOutlet var namedField: UITextField!
    @IBOutlet var tableView: UITableView!
}

// MARK: - UITableView DataSource/Delegate
extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistController.sharedController.playlists.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlaylistCell", forIndexPath: indexPath)
        
        let playlists = PlaylistController.sharedController.playlists
        let playlist = playlists[indexPath.row]
        
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\(playlist.songs.count)"
        
        return cell
    }
    
    // Delegate
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My Playlists"
    }
    
}