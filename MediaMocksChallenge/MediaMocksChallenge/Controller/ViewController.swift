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
    
    @IBOutlet weak var L1: UILabel!
    @IBOutlet weak var L2: UILabel!
    @IBOutlet weak var L3: UILabel!
    @IBOutlet weak var L4: UILabel!
    @IBOutlet weak var L5: UILabel!
    @IBOutlet weak var L6: UILabel!
    @IBOutlet weak var L7: UILabel!
    @IBOutlet weak var L8: UILabel!
    @IBOutlet weak var L9: UILabel!
    @IBOutlet weak var L10: UILabel!
    @IBOutlet weak var L11: UILabel!
    @IBOutlet weak var L12: UILabel!
    @IBOutlet weak var L13: UILabel!
    @IBOutlet weak var L14: UILabel!
    @IBOutlet weak var L15: UILabel!
    @IBOutlet weak var L16: UILabel!
    @IBOutlet weak var L17: UILabel!
    @IBOutlet weak var L18: UILabel!
    @IBOutlet weak var L19: UILabel!
    
    var resourceManager = ResourceManager()
        let afsd = ["sddsd","sdsds"]
        override func viewDidLoad() {
            super.viewDidLoad()
            resourceManager.delegate = self
        }

    @IBAction func button(_ sender: UIButton) {
        resourceManager.getResource()
        }
    }

extension ViewController: ResourceManagerDelegate {
    func didUpdateResource(title: [String]) {
        DispatchQueue.main.async {
            self.L1.text = String(title[0])
            self.L2.text = String(title[1])
            self.L3.text = String(title[2])
            self.L4.text = String(title[3])
            self.L5.text = String(title[4])
            self.L6.text = String(title[5])
            self.L7.text = String(title[6])
            self.L8.text = String(title[7])
            self.L9.text = String(title[8])
            self.L10.text = String(title[9])
            self.L11.text = String(title[10])
            self.L12.text = String(title[11])
            self.L13.text = String(title[12])
            self.L14.text = String(title[13])
            self.L15.text = String(title[14])
            self.L16.text = String(title[15])
            self.L17.text = String(title[16])
            self.L18.text = String(title[17])
            self.L19.text = String(title[18])
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
