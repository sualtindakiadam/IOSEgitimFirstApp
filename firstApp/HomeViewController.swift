//
//  HomeViewController.swift
//  firstApp
//
//  Created by Semih Kalaycı on 10.08.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    var userName=""

    @IBOutlet weak var nameText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func firstAppWithDataBtnClick(_ sender: Any) {
        userName=nameText.text!
        performSegue(withIdentifier: "firstAppWithDataVC", sender: nil)// sayfalar arası geçişi sağlanır
    }
    @IBAction func jestAppClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "jestAppPage", sender: nil)
    }
    @IBAction func CatchGameClicked(_ sender: Any) {
        performSegue(withIdentifier: "catchGamePage", sender: nil)
        
    }
    @IBAction func CityTableViewClicked(_ sender: Any) {
        performSegue(withIdentifier: "cityTableVC", sender: nil)
    }
    @IBAction func SimpsonsTableAppClicked(_ sender: Any) {
        performSegue(withIdentifier: "simpsonsTableAppVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {    //segue olmadan heen önce yapılabilecek işlemler yazılır
        
        if segue.identifier=="firstAppWithDataVC"{//balantıya id vermiştik o idyi kontrol ettikki sadece o iddeki bağlantıya gidilirken aşağıdaki işlemler yapılsın çünkü birden fazla sayfayla ya da aynı sayfayla birden fazla bağlantı da olabilir
            
            let destinationVC=segue.destination as! ViewController // gideceğimiz sayfanın controler ı tipinde bir değişken tanımladık
            destinationVC.incomingName=userName// tanımladığımız değişkenden o sayfada atamak istediğimiz değişkene ulaşıp içine veriyi yazdık
        }
    }
    


}
