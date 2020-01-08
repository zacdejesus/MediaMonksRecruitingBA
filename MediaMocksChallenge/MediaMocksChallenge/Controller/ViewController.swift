//
//  ViewController.swift
//  MediaMocksChallenge
//
//  Created by Alejandro De Jesus on 05/01/2020.
//  Copyright © 2020 Alejandro De Jesus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var LabelFInal: UILabel!
    var resourceManager = ResourceManager()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            resourceManager.delegate = self
        }

    @IBAction func button(_ sender: UIButton) {
        resourceManager.getResource()
        func didUpdateResource(title: String?) {
            
            DispatchQueue.main.async {
                self.LabelFInal.text = String(title ?? "")
            }
        }
    }
}
    
extension ViewController: ResourceManagerDelegate {
    func didUpdateResource(title: [String]) {
        
        DispatchQueue.main.async {
            //self.Label.text = title
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return title!.count
      }
      
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return title
      }
}
