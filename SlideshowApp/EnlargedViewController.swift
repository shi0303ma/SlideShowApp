//
//  EnlargedViewController.swift
//  SlideshowApp
//
//  Created by 松隈璃奈 on 2017/02/26.
//  Copyright © 2017年 shi0303ma. All rights reserved.
//

import UIKit

class EnlargedViewController: UIViewController {
    
    @IBOutlet weak var enlargedImageView: UIImageView!
    
    var imageNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        enlargedImageView.image = UIImage(named:"slide_\(imageNum).png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
