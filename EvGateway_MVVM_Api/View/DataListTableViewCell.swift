//
//  DataListTableViewCell.swift
//  EvGateway_MVVM_Api
//
//  Created by Nanthini on 10/02/24.
//

import UIKit

class DataListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profilenameLbl: UILabel!
    @IBOutlet weak var dateStartLbl: UILabel!
    @IBOutlet weak var dateEndLbl: UILabel!
    @IBOutlet weak var daysLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadCellData(model: DataModel) {
        profilenameLbl.text = "\(model.porfileName ?? "")"
        dateStartLbl.text = "Start Date: \(convertDateString(model.dateStart ?? ""))"
        dateEndLbl.text = "End Date: \(convertDateString(model.dateEnd ?? ""))"
        if let days = model.days {
            daysLbl.text = "Days: \n" + getdays(days: days)
        } else {
            daysLbl.text = ""
        }
    }
    
    func convertDateString(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "dd MMM, yyyy"
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
    
    func getdays(days: [Days]) -> String {
        var str = ""
        for day in days {
            if let dayName = day.day, let prices = day.prices {
                str += "\(dayName) - Prices: "
                
                for (index, price) in prices.enumerated() {
                    if let value = price.price {
                        str += "\(value)"
                        if index < prices.count - 1 {
                            str += ", "
                        }
                    }
                }
                str += "\n"
            }
        }
        return str
    }
}
