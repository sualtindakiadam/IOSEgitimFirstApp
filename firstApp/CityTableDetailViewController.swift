//
//  CityTableDetailViewController.swift
//  firstApp
//
//  Created by Semih Kalaycı on 11.08.2021.
//

import UIKit

class CityTableDetailViewController: UIViewController {

    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var CityNameLabel: UILabel!
    
    
    var selectedLandmarkName=""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityImage.image = selectedLandmarkImage
        CityNameLabel.text = selectedLandmarkName
        
        navigationItem.title="City Detail"// navigatöre başlık eklemek için

        
        
    }
    



}
