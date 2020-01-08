//
//  ViewController.swift
//  MediaMocksChallenge
//
//  Created by Alejandro De Jesus on 05/01/2020.
//  Copyright © 2020 Alejandro De Jesus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var imageContainer: UIImageView!
        
    var resourceManager = ResourceManager()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            resourceManager.delegate = self
        }

    @IBAction func button(_ sender: UIButton) {
        resourceManager.getResource()
        func didUpdateResource(title: [ResourceModelElement]) {
            
            DispatchQueue.main.async {
                self.Label.text = String(title.count)
            }
        }
    }
}
    
extension ViewController: ResourceManagerDelegate {
    func didUpdateResource(title: [ResourceModelElement]) {
        
        DispatchQueue.main.async {
            self.Label.text = String(title.count)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
//    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//          return 1
//      }
//      
//      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return title!.count
//      }
//      
//      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//          return title![row]
//      }
//}
