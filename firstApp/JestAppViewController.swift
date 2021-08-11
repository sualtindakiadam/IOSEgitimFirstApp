//
//  JestAppViewController.swift
//  firstApp
//
//  Created by Semih Kalaycı on 10.08.2021.
//

import UIKit

class JestAppViewController: UIViewController {
    
    var myTimer=Timer()
    var counter=10;

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView1.isUserInteractionEnabled=true
        let gestureRecognizer=UITapGestureRecognizer(target: self, action: #selector(changePic))
        
        imageView1.addGestureRecognizer(gestureRecognizer)
        

    
        myTimer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
     
    }

    @objc func timerFunc(){
        timeLabel.text="Time : \(counter)"
        counter -= 1
        if counter == 0{
            myTimer.invalidate()
            timeLabel.text="Time is over"
        }
    }
        

    
    @objc func changePic(){
        
        
        imageView1.image=UIImage(named:  "p")
    }

    @IBAction func tmeBtnClicked(_ sender: Any) {
        print("button clicked")
    }
    
}
