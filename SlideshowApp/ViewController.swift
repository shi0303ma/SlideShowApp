//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 松隈璃奈 on 2017/02/25.
//  Copyright © 2017年 shi0303ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playAndPauseBtn: UIButton!
    @IBOutlet weak var prevBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var imageNum = 0
    var images = ["slide_1.png", "slide_2.png", "slide_3.png", "slide_4.png", "slide_5.png", "slide_6.png"]
    var playing = false
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = UIImage(named:"\(images[imageNum])")
        playAndPauseBtn.setTitle("再生", for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let enlargedViewController:EnlargedViewController = segue.destination as! EnlargedViewController
        
        enlargedViewController.enlargedImage = "\(images[imageNum])"
        
        if playing == true {
            // ボタンのタイトルを再生にする
            playAndPauseBtn.setTitle("再生", for: UIControlState.normal)
            nextBtn.isEnabled = true
            prevBtn.isEnabled = true
            // スライドを停止する
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
            }
            playing = false
        }

    }
    
    // 進むボタン
    @IBAction func next(_ sender: Any) {
        if imageNum <= (images.count - 2) {
            imageNum += 1
        } else {
            imageNum = 0
        }
        imageView.image = UIImage(named: "\(images[imageNum])")
    }
    
    // 戻るボタン
    @IBAction func prev(_ sender: Any) {
        if imageNum >= 1 {
            imageNum -= 1
        } else {
            imageNum = images.count - 1
        }
        
        imageView.image = UIImage(named: "\(images[imageNum])")
    }
    
    // 再生停止ボタン
    @IBAction func playAndStop(_ sender: Any) {
        if playing == false {
            // ボタンのタイトルを停止にする
            playAndPauseBtn.setTitle("停止", for: UIControlState.normal)
            nextBtn.isEnabled = false
            prevBtn.isEnabled = false
            // スライドを2秒ごとにめくる
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            }
            playing = true
            
        } else {
            // ボタンのタイトルを再生にする
            playAndPauseBtn.setTitle("再生", for: UIControlState.normal)
            nextBtn.isEnabled = true
            prevBtn.isEnabled = true
            // スライドを停止する
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
            }
            playing = false
            
        }
    }
    
    
    func updateTimer(timer: Timer) {
        if imageNum <= (images.count - 2) {
            imageNum += 1
        } else {
            imageNum = 0
        }
        imageView.image = UIImage(named: "\(images[imageNum])")
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
}

