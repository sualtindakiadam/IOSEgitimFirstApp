//
//  CatchGameViewController.swift
//  firstApp
//
//  Created by Semih Kalaycı on 10.08.2021.
//

import UIKit

class CatchGameViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var bestScoreLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
//test
    
    var gameTimer=Timer()
    var characterTimer=Timer()
    var timerCounter = 0
    var bestScore = 0;
    var score = 0;
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        characterImage.isUserInteractionEnabled=true
        gameAlert(title: "Start", message: "Start if you want to play")
        let gestureRecognizer=UITapGestureRecognizer(target: self, action: #selector(getScore))
        characterImage.addGestureRecognizer(gestureRecognizer)
    }

    func gameAlert(title:String,message:String){
        self.timerCounter = 10
        self.counterLabel.text = "\(timerCounter)"
       
        print("bestScore: \(bestScore)")
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let cancleBtn=UIAlertAction(title: "Cancle", style: UIAlertAction.Style.cancel) { UIAlertAction in
            self.characterTimer.invalidate()
            self.gameTimer.invalidate()
        }
        let startBtn=UIAlertAction(title: "Start", style: UIAlertAction.Style.default) { UIAlertAction in
       
            
            if  UserDefaults.standard.object(forKey: "bestScore") != nil{
                self.bestScore = UserDefaults.standard.object(forKey: "bestScore") as? Int ?? 0
                          }
            else{
                UserDefaults.standard.set(0,forKey: "bestScore")
                self.bestScoreLabel.text = "\(self.bestScore)"

            }
            self.bestScoreLabel.text = "\(self.bestScore)"
            self.characterTimer=Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.moveCharacter), userInfo: nil, repeats: true)
            self.gameTimer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.gamePlay), userInfo: nil, repeats: true)
        

        }
        alert.addAction(startBtn)
        alert.addAction(cancleBtn)
        self.present(alert, animated:true, completion: nil)
        
        
    }
    
    @objc func gamePlay(){
        self.timerCounter -= 1
        self.counterLabel.text = "\(timerCounter)"

        
        if self.timerCounter==0{
            
            if bestScore < score {
                UserDefaults.standard.set(score,forKey: "bestScore")
                self.bestScoreLabel.text="\(score)"
            }
            
            score = 0
            gameTimer.invalidate()
            characterTimer.invalidate()
            gameAlert(title: "Start Again", message: "Start if you want to play again")
        }
        //print(self.timerCounter)
        
    }
    
    @objc func getScore(){
        self.score += 1
        self.scoreLabel.text="\(score)"
    }
    
    @objc func moveCharacter(){
        //print("move")
        
        var widthRandom = Float.random(in: 0..<0.7)
        var heightRandom = Float.random(in: 0.15..<0.85)
        
        characterImage.frame=CGRect(x: view.frame.size.width * CGFloat(widthRandom), y: view.frame.size.height * CGFloat(heightRandom), width: self.characterImage.frame.width, height: self.characterImage.frame.height)
    }



}
