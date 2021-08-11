//
//  SimpsonsTableDetailViewController.swift
//  firstApp
//
//  Created by Semih Kalaycı on 11.08.2021.
//

import UIKit

class SimpsonsTableDetailViewController: UIViewController {
    
    
    @IBOutlet weak var SimpsonsImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    
    
    var selectedSimpson : Simpsons?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
        SimpsonsImageView.image = selectedSimpson?.image
        
        // Do any additional setup after loading the view.
    }
    



}
