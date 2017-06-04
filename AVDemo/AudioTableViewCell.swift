//
//  AudioTableViewCell.swift
//  AVDemo
//
//  Created by Deepak Sharma on 03/06/17.
//  Copyright © 2017 Deepak Sharma. All rights reserved.
//

import UIKit
import AVFoundation

class AudioTableViewCell: UITableViewCell,AVAudioPlayerDelegate {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var songNameLabel: UILabel!
    var player:AVAudioPlayer?

    var selectedSong: Song?
    var updater : CADisplayLink! = nil

    var playSong: ((String?) ->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(song: Song)  {
        selectedSong = song
        self.songNameLabel.text = song.songName
        self.playButton.setTitle("Play", for: .normal)
        progressView.progress = 0.0
    }
    
    
    @IBAction func play(_ sender: Any) {
        playButton.isSelected = !(playButton.isSelected)
        if playButton.isSelected {
            updater = CADisplayLink(target: self, selector: #selector(AudioTableViewCell.trackAudio))
            updater.frameInterval = 1
            updater.add(to: RunLoop.current, forMode: .commonModes)
            let fileURL = NSURL(string: selectedSong!.songPath)
            player = try? AVAudioPlayer(contentsOf: fileURL! as URL)
            player?.numberOfLoops = -1
            player?.prepareToPlay()
            player?.delegate = self
            player?.play()
           
            
            
        } else {
            player?.stop()
        }
    }

    func trackAudio() {
        let normalizedTime = Float(player!.currentTime * 100.0  / player!.duration)
        print("current time\(player!.currentTime)")
        print("duration time\(player!.duration)")

        print(normalizedTime)
        
        progressView.progress = normalizedTime
    }
}
