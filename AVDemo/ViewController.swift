//
//  ViewController.swift
//  AVDemo
//
//  Created by Deepak Sharma on 02/06/17.
//  Copyright © 2017 Deepak Sharma. All rights reserved.
//

struct Song {
    
    let songName: String
    let songPath: String
    
}

import UIKit
import AVFoundation

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, AVAudioPlayerDelegate {
    
    var songs = [Song]()
    var player:AVAudioPlayer?
    
    @IBOutlet weak var songTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func prepareData() {
        let audioFiles = FileReader.readAudioFiles()
        var i = 0
        for audio in audioFiles {
            i = i+1
            self.songs.append(Song(songName: "S0" + String(i+1), songPath: audio))
        }
    }

    
    //MARK:- table view delegates

    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AudioTableViewCell", for: indexPath) as! AudioTableViewCell
        cell.configureCell(song: songs[indexPath.row])
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("You tapped cell number \(indexPath.row).")
    }
    
}

