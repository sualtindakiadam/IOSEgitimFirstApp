//
//  ViewController.swift
//  firstApp
//
//  Created by Semih Kalaycı on 6.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var secondNumber: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var savedNameLabel: UILabel!
    @IBOutlet weak var savedBirthdayLabel: UILabel!
    
    @IBOutlet weak var incomingPageNameLabel: UILabel!
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordControlTF: UITextField!
    
    //test
    var incomingName="";
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storedName=UserDefaults.standard.object(forKey: "name")
        let storedBirthday=UserDefaults.standard.object(forKey: "birthday")
        
        //Casting - as? vs as!
        //savedNameLabel.text=storedName as? String //Stored name i çevirebilirsen çevir as! koyarsan kesin çevirirsin
        
        if let savedName=storedName as? String{
            savedNameLabel.text="Name: \(savedName)"
        }
        if let savedBirthday=storedBirthday as? String{
            savedBirthdayLabel.text="Birthday: \(savedBirthday)"
        }
        
        incomingPageNameLabel.text=incomingName;
        
        
        
    }

    @IBAction func plusBtnClick(_ sender: Any) {
        resultLabel.text=String(Int(firstNumber.text!)!+Int(secondNumber.text!)!)
        
    }
    @IBAction func minusBtnClck(_ sender: Any) {
        resultLabel.text=String(Int(firstNumber.text!)!-Int(secondNumber.text!)!)

    }
    @IBAction func multiplicationBtnClick(_ sender: Any) {
        resultLabel.text=String(Int(firstNumber.text!)!*Int(secondNumber.text!)!)

    }
    @IBAction func divisionBtnClick(_ sender: Any) {
        resultLabel.text=String(Int(firstNumber.text!)!/Int(secondNumber.text!)!)

    }
    
    
    
    @IBAction func changeButtonClick(_ sender: Any) {
        
        imageView.image = UIImage(named: "f")
        appTitle.text = "Ferrari"
    }
    @IBAction func nameBirthdaySaveButonClick(_ sender: Any) {
        
        //Butona basılıca tesxtfieldı labela atar direkt
        /*
        savedNameLabel.text="Name: \(nameTextField.text!)"
        savedBirthdayLabel.text="Birthday: \(birthdayTextField.text!)"
        */
        
        //Burada local kaydetme işlemi
        UserDefaults.standard.set(nameTextField.text, forKey:"name")
        UserDefaults.standard.set(birthdayTextField.text, forKey:"birthday")
        //UserDefaults.standard.synchronize()   eskiden bu kullanılırmış ama şuan gerek yk internette karşıma çıkabilir

        
    }
    @IBAction func nameBirthdayDeleteButtonClick(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "name")

        }
        
        if(storedBirthday as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "birthday")
        }
        
    }
    
    func loginAlertFunc(alertTitle:String,alertMessage:String) {
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)//popup burda oluşturulur
        
        let okBtn=UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {//burada alert içerisine ekleyeceğimiz buton tanımlıyoruz
            UIAlertAction in//butona tıklandığında ne yapılacaksa yazıyoruz eğer hiç bir şey yptırmadan kapatacaksak nil yazmak yeterli
            print("buttonclicked")
        }
        alert.addAction(okBtn)// hazırladığımız butonu alertimize ekliyoruz
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func signUpBtnClick(_ sender: Any) {
        
        if usernameTF.text == ""{
            loginAlertFunc(alertTitle: "Error!", alertMessage: "Username not found!")

        }
        else if passwordTF.text == ""{
            loginAlertFunc(alertTitle: "Error!", alertMessage: "Password not found!")
  
        }
        else if passwordControlTF.text == ""{
            loginAlertFunc(alertTitle: "Error!", alertMessage: "PasswordController not found!")
    
        }
        else if passwordTF.text != passwordControlTF.text{
            loginAlertFunc(alertTitle: "Error!", alertMessage: "Password do not matched !")

        }
        else{
            loginAlertFunc(alertTitle: "Success", alertMessage: "Login Success")
        }
      
    }
    
    
    
    
}

