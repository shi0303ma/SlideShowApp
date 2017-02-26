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
    var images = ["slide_1", "slide_2", "slide_3", "slide_4", "slide_5", "slide_6"]
    var playing = false
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = UIImage(named:"slide_1.png")
        playAndPauseBtn.setTitle("再生", for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let enlargedViewController:EnlargedViewController = segue.destination as! EnlargedViewController
        
        enlargedViewController.imageNum = imageNum + 1
        
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
        imageView.image = UIImage(named: "\(images[imageNum]).png")
    }
    
    // 戻るボタン
    @IBAction func prev(_ sender: Any) {
        if imageNum >= 1 {
            imageNum -= 1
        } else {
            imageNum = images.count - 1
        }
        
        imageView.image = UIImage(named: "\(images[imageNum]).png")
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
        imageView.image = UIImage(named: "\(images[imageNum]).png")
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
}

