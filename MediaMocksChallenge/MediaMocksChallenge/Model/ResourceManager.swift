//
//  ResourceManager.swift
//  MediaMocksChallenge
//
//  Created by Alejandro De Jesus on 06/01/2020.
//  Copyright © 2020 Alejandro De Jesus. All rights reserved.
//

import Foundation

protocol ResourceManagerDelegate {
    func didUpdateResource(title: [String])
}

struct ResourceManager {
    
    var delegate: ResourceManagerDelegate?
    //call to API
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
                    }
                }
            }
            task.resume()
        }
    }
    //Parsing JSON
    func parseJSON(_ safeData: Data) -> [String]? {
        var i = 1
        var arrayName = [String]()
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ResourceModel.self, from: safeData)
            while i <= (decodedData.count - 1) {
                let titleDecoded = decodedData[i].title
                arrayName.append(titleDecoded)
                i = i + 1
            }
            return arrayName
        } catch {
            print("cannot decode data")
            return nil
        }
    
    
}

}
