//
//  ViewController.swift
//  EvGateway_MVVM_Api
//
//  Created by Nanthini on 10/02/24.
//

import UIKit

class DataListViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    let dataViewModel = DataViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        loadData()
    }
    
    private func configure() {
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(UINib(nibName: "DataListTableViewCell", bundle: nil), forCellReuseIdentifier: "DataListTableViewCell")
    }
    
    private func loadData() {
        dataViewModel.getDataLists {
            DispatchQueue.main.async {
                self.listTableView.reloadData()
            }
        }
    }
}

extension DataListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataViewModel.dataLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = listTableView.dequeueReusableCell(withIdentifier: "DataListTableViewCell") as? DataListTableViewCell {
            cell.loadCellData(model: dataViewModel.dataLists[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

