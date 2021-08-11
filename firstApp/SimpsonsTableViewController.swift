//
//  SimpsonsTableViewController.swift
//  firstApp
//
//  Created by Semih Kalaycı on 11.08.2021.
//

import UIKit

class SimpsonsTableViewController: UIViewController, UITableViewDelegate,UITableViewDataSource { // 1 - UITableViewDelegate,UITableViewDataSource eklemeleri yap
    //TableView adımları yorum satırları ile yazılmıştır
    
    @IBOutlet weak var SimpsonsTable: UITableView!
    
    var simpsonsArray = [Simpsons]()
    
    var chosenSimpson : Simpsons?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SimpsonsTable.delegate = self    // 2 - delegate self e eşitle
        SimpsonsTable.dataSource = self  // 3 - dataSource self e eşitle
        
        let homer = Simpsons(initName: "Homer", initJob: "BoşBeleş", initImage: UIImage(named: "Homer.png")!)
        let marge = Simpsons(initName: "Marge", initJob: "EvHanımı", initImage: UIImage(named: "Marge.png")!)
        let bard = Simpsons(initName: "Bard", initJob: "Öğrenci", initImage: UIImage(named: "Bart.png")!)
        
        simpsonsArray = [homer,marge,bard]
        
        print("yazması lazım \(simpsonsArray[2].name)")

        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 4 - sellForRowAt yazınca çıkıyor bu func ekle satırlar için
        let cell = UITableViewCell()
        cell.textLabel?.text = simpsonsArray[indexPath.row].name
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 5 - numberOfRowsInSection yazınca çıkıyor basılacak satır sayısı için
        
        return simpsonsArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {// 6 - didSelectRowAt yazınca çıkıyor. Eğer satıra tıklanınca işlem yapacaksan kullan .
        
        chosenSimpson = simpsonsArray[indexPath.row]
        performSegue(withIdentifier: "simpsonsTableDetailVC", sender: nil)
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // 7 - segue yazınca çıkıyor. Başka sayfaya yönlendirmeden önce bir işlem ya da veri aktarımı gerekiyorsa kullanılır
        if segue.identifier == "simpsonsTableDetailVC" {
            
            let destinationVC = segue.destination as! SimpsonsTableDetailViewController
            
            destinationVC.selectedSimpson = chosenSimpson
            
            
        }
    }
    


}
