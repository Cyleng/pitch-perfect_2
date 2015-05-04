//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Chuan Yu Leng on 4/28/15.
//  Copyright (c) 2015 MatchVZ. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    var audioPlayer:AVAudioPlayer!
    var receiveAudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    var pitchFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pitchFile = AVAudioFile(forReading: receiveAudio.filePathUrl, error: nil)
        audioEngine = AVAudioEngine()
        audioPlayer = AVAudioPlayer(contentsOfURL: receiveAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func resetPlayer() {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
    }
    
    func playAudioWithVariablePitch(pitch: Float){
        var pitchPlayer = AVAudioPlayerNode()
        audioEngine.attachNode(pitchPlayer)
        
        var pitchTime = AVAudioUnitTimePitch()
        pitchTime.pitch = pitch
        audioEngine.attachNode(pitchTime)
        
        audioEngine.connect(pitchPlayer, to: pitchTime, format: nil)
        audioEngine.connect(pitchTime, to: audioEngine.outputNode, format: nil)
        
        pitchPlayer.scheduleFile(pitchFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        pitchPlayer.play()
    }

    @IBAction func playSlowAudio(sender: UIButton) {
        resetPlayer()
        audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
   
    @IBAction func playFastAudio(sender: UIButton) {
        resetPlayer()
        audioPlayer.rate = 1.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func playChipMunkAudio(sender: UIButton) {
        resetPlayer()
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func playDarthVadarAudio(sender: UIButton) {
        resetPlayer()
        playAudioWithVariablePitch(-1000)
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        resetPlayer()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
