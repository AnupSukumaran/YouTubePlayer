//
//  ViewController.swift
//  YouTubePlayer
//
//  Created by Abraham VG on 15/11/18.
//  Copyright © 2018 Wis. All rights reserved.
//

import UIKit
import YouTubePlayer

class ViewController: UIViewController {
    
    
    @IBOutlet weak var videoPlayer: YouTubePlayerView!
    @IBOutlet weak var activityIndic: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //https://developers.google.com/youtube/player_parameters - reffer this site to config player like "controls" etc..
        videoPlayer.playerVars = ["controls": 0, "playsinline": 1] as YouTubePlayerView.YouTubePlayerParameters
        videoPlayer.loadVideoID("dM6u5FlZB70")
        
//        let myVideoURL = NSURL(string: "https://www.youtube.com/watch?v=dM6u5FlZB70")
//        videoPlayer.loadVideoURL(myVideoURL! as URL)
       // videoPlayer.accessibilityElementsHidden = true
        activityIndic.startAnimating()
       // videoPlayer.isHidden = true
        videoPlayer.delegate = self
    }
    
    
    @IBAction func playAction(_ sender: Any) {
        
        if videoPlayer.ready {
            if videoPlayer.playerState != YouTubePlayerState.Playing {
           //     videoPlayer.isHidden = true
                print("playing😄")
                
                videoPlayer.play()
                
               // playButton.setTitle("Pause", for: .normal)
            } else {
                videoPlayer.pause()
                print("Notplaying😄")
             //   videoPlayer.isHidden = true
               // playButton.setTitle("Play", for: .normal)
            }
        }
        
    }

}

extension ViewController: YouTubePlayerDelegate {
    
    func playerReady(_ videoPlayer: YouTubePlayerView) {
        if videoPlayer.ready {
             activityIndic.stopAnimating()
            if videoPlayer.playerState != YouTubePlayerState.Playing {
                //     videoPlayer.isHidden = true
                print("playing😄")
                
                videoPlayer.play()
                
                // playButton.setTitle("Pause", for: .normal)
            } else {
                videoPlayer.pause()
                print("Notplaying😄")
                //   videoPlayer.isHidden = true
                // playButton.setTitle("Play", for: .normal)
            }
        }
    }
    
}

