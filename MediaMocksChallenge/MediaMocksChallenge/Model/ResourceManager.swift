//
//  ResourceManager.swift
//  MediaMocksChallenge
//
//  Created by Alejandro De Jesus on 06/01/2020.
//  Copyright © 2020 Alejandro De Jesus. All rights reserved.
//

import Foundation

protocol ResourceManagerDelegate {
    func didUpdateResource(title: [ResourceModelElement])
}

struct ResourceManager {
    
    var delegate: ResourceManagerDelegate?
    let baseURL = "https://jsonplaceholder.typicode.com/albums"
       
    func getResource() {        
        if let url = URL(string: baseURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Error en llamada a API")
                    return
                }
                
                if let safeData = data {
                    if let lastResource = self.parseJSON(safeData) {
                        let resource = lastResource
                        self.delegate?.didUpdateResource(title: resource)
                        print("ACA\(resource)")
                    }
                }
            }
            task.resume()
        }
    }

    func parseJSON(_ safeData: Data) -> [ResourceModelElement]? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ResourceModel.self, from: safeData)
            //let titleDecoded = [ResourceModel.title]
            //let cosa = ResourceModelElement.title
            print("Decoded->\(decodedData)")
            return decodedData
            
        } catch {
            print("cannot decode data")
            return nil
        }
    
    
}

}
