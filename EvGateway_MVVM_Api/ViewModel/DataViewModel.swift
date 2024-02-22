//
//  DataViewModel.swift
//  EvGateway_MVVM_Api
//
//  Created by Nanthini on 10/02/24.
//

import Foundation

class DataViewModel {
    var dataLists = [DataModel]()
    
    func getDataLists(completion: @escaping () -> Void) {
        let urlString = "http://www.doopdeal.com/test/sample.php"
        
        NetworkManager.fetchData(urlString: urlString) { [weak self] dataLists, error in
            if let error = error {
                print("Error: \(error)")
            } else if let dataLists = dataLists {
                self?.dataLists = dataLists
                print("DataList", dataLists)
                completion()
            }
        }
    }
}
