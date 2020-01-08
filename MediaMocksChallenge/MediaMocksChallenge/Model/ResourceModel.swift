//
//  ResourceModel.swift
//  MediaMocksChallenge
//
//  Created by Alejandro De Jesus on 05/01/2020.
//  Copyright © 2020 Alejandro De Jesus. All rights reserved.
//

import Foundation

struct ResourceModelElement: Decodable {
        let userID, id: Int
        let title: String

        enum CodingKeys: String, CodingKey {
            case userID = "userId"
            case id, title
        }
    }
typealias ResourceModel = [ResourceModelElement]
