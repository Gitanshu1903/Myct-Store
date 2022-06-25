//
//  MyOrderViewModel.swift
//  Myct-Store
//
//  Created by ERASOFT on 20/05/22.
//

import Foundation
import UIKit

final class MyOrderViewModel {
    
    private var arrayOrders: [Order] = []
    var webServices: WebServices = WebServices()
    init() {
        
    }
    
    func numberOfSection() -> Int { return arrayOrders.count}
    func getOrderDetailsForm(index: Int) -> Order { return arrayOrders[index]}
    
    func loadMyOrders(completion: @escaping (Bool, String) -> Void) {
        webServices.requestGetUrl(url: "https://myct.store/Mobile_Services/user/v2/index.php/get_order/4", method: .get, parameters: [:], headers: nil) { responseData, responseStatusCode, responseJson in
            if responseStatusCode == 200 {
                completion(true, "")
                let decoder = JSONDecoder()
                do {
                    let responseObject = try decoder.decode(OrderAPIResponse.self, from: responseData)
                    self.arrayOrders = responseObject.orderArray
                    if self.arrayOrders.count != 0 {
                        completion(true, "")
                    } else {
                        completion(false, "No Data Found")
                    }
                } catch {
                    completion(false, "API response decode failed")
                }
            }
        } failure: { error in
            print(error.localizedDescription)
            completion(false, error.localizedDescription)
        }
    }
    
    func cellValidation(status: String, statusButton: UIButton, orderStatus1: UILabel, orderStatus2: UILabel, slashLabel: UILabel) {
        if status == "Pending" {
            statusButton.backgroundColor = .systemOrange
            orderStatus2.text = "Re-Order"
            orderStatus1.text =  "Cancel-Order"
            slashLabel.text = "|"
        } else if status == "Confirmed" {
            statusButton.backgroundColor = .systemGreen
        } else if status == "Delivered" {
            statusButton.backgroundColor = .systemGreen
            orderStatus2.text = "Re-Order"
            orderStatus1.text =  "Rate-It"
            slashLabel.text = "|"
        } else if status == "Cancelled" {
            statusButton.backgroundColor = .systemRed
            orderStatus1.text = "Re-Order"
        }
    }
}
