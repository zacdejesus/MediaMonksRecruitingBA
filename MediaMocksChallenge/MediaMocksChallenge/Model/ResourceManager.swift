//
//  ResourceManager.swift
//  MediaMocksChallenge
//
//  Created by Alejandro De Jesus on 06/01/2020.
//  Copyright © 2020 Alejandro De Jesus. All rights reserved.
//

import Foundation

protocol ResourceManagerDelegate {
    func didUpdateResource(title: String)
    func didFailWithError(error: Error)
}

struct ResourceManager {
    
    var delegate: ResourceManagerDelegate?
    
    let baseURL = "https://jsonplaceholder.typicode.com/posts/1"
    
    func getResource() {
        
        if let url = URL(string: baseURL) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let Resource = self.parseJSON(safeData) {
                        let resourceString = String(format: "%.2f", Resource)
                        self.delegate?.didUpdateResource(title: resourceString)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> String? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ResourceModel.self, from: data)
            let lastResource = decodedData.title
            print("QQQ\(lastResource)")
            return lastResource
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}

