//
//  ViewController.swift
//  MediaMocksChallenge
//
//  Created by Alejandro De Jesus on 05/01/2020.
//  Copyright © 2020 Alejandro De Jesus. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {


    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var imageContainer: UIImageView!
 
    var resourceManager = ResourceManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resourceManager.delegate = self
    }
}
    



extension ViewController: ResourceManagerDelegate {
    func didUpdateResource(title: String) {
        
        DispatchQueue.main.async {
            self.Label.text = title
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}