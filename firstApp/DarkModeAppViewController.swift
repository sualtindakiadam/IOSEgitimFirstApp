//
//  DarkModeAppViewController.swift
//  firstApp
//
//  Created by Semih Kalaycı on 19.08.2021.
//

import UIKit

class DarkModeAppViewController: UIViewController {
    
    @IBOutlet weak var darkModeLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light // kullanıcının hangi modda olduğu fark etmeksizin dark ya da light modu kendimiz belirleyebiliriz. Bu sayfa hep belirlediğimiz modda çalışır eğer genel olarak bütün app dark yada light olsun istersek info.plist e girip user interface style eklenir ve orda light ya da dark belitlenir. eğer user interface style çıkmazsa sağ tıkla boş bir yer eve raw keys & value yi seç orada UIUserInterfaceStyle ekle ve onun değerini light ya da dark yap eğer eski haline dösün istersen kullanıcı kendi belirlesin dersen - ile kaldır
  
    }
    
    override func viewWillAppear(_ animated: Bool) { // sayfa her açıldığında
     changeDarkStyle()

    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) { // ark yada light mode geçişlerini algılar değiştiğinde çalışır
            changeDarkStyle()
    }
    
    func changeDarkStyle (){
        let userInterfaceStyle =  traitCollection.userInterfaceStyle
        
        if userInterfaceStyle == .dark {
            
            darkModeLabel.textColor = UIColor.yellow
        }
        else{
            darkModeLabel.textColor = UIColor.blue
        }
        
    }
    
    
    


}
