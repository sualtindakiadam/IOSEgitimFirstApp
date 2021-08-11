//
//  CityTableViewController.swift
//  firstApp
//
//  Created by Semih Kalaycı on 11.08.2021.
//

import UIKit

class CityTableViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {//UITableViewDelegate,UITableViewDataSource tablo için eklenir

    @IBOutlet weak var cityTableView: UITableView!
    
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenName = ""
    var chosenImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cityTableView.delegate = self //ViewController a erişmek için
        cityTableView.dataSource = self // bu iki satır table için gerekli
        
       // Landmark Data
        
        landmarkNames.append("Antalya")
        landmarkNames.append("Izmir")
        landmarkNames.append("Bursa")
        
        landmarkImages.append(UIImage(named: "Antalya.jpeg")!)
        landmarkImages.append(UIImage(named: "Izmir.jpeg")!)
        landmarkImages.append(UIImage(named: "Bursa.jpeg")!)
        
        
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {// sıraların içinde gösterilecek hücre
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //kaçtane sıra olacak
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {//cell seçilince yani hücreye tıklandığında
        
        chosenName = landmarkNames[indexPath.row]
        chosenImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "cityTableDetailVC", sender: nil)
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)// data tablolarından sildik
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)//ekrandaki tablodan sildik at : silinecek index with: silerkenki animasyın
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cityTableDetailVC" {
            
            let destinationVC = segue.destination as! CityTableDetailViewController
            
            destinationVC.selectedLandmarkName = chosenName
            destinationVC.selectedLandmarkImage = chosenImage
        }
    }
    



}
