//
//  Order.swift
//  Myct-Store
//
//  Created by ERASOFT on 20/05/22.
//

import Foundation

struct OrderAPIResponse: Codable {
    var error: Bool
    var orderArray: [Order]
    
    private enum CodingKeys: String, CodingKey {
        case error
        case orderArray = "data"
    }
}

struct Order: Codable {
    var id: String?
    var displayId: String?
    var totalPrice: String?
    var status: String?
    var venderName: String?
    var dateAndTime: String?
    var venderImageName: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case displayId = "order_id"
        case totalPrice = "tprice"
        case status = "oreder_status"
        case venderName = "vname"
        case dateAndTime = "date_time"
        case venderImageName = "vimage"
    }
}
