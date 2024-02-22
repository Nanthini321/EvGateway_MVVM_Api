//
//  DataModel.swift
//  EvGateway_MVVM_Api
//
//  Created by Nanthini on 10/02/24.
//

import Foundation

struct Datas: Codable {
    let data: [DataModel]
    let status: String?
}

struct DataModel: Codable {
    let porfileName: String?
    let dateStart: String?
    let dateEnd: String?
    let days:[Days]?
    
}

struct Days: Codable {
    let day: String?
    let prices: [Prices]?
}

struct Prices: Codable {
    let price: Int?
}
