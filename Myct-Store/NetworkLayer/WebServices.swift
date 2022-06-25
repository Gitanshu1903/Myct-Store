//
//  WebServices.swift
//  Myct-Store
//
//  Created by ERASOFT on 20/05/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class WebServices: NSObject {
    func requestGetUrl(url: String,
                       method: HTTPMethod,
                       parameters: Parameters,
                       headers: [String: String]?,
                       success: @escaping (Data,Int,JSON) -> Void,
                       failure: @escaping (Error) -> Void) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseString { (responseObject) -> Void in
            if responseObject.result.isSuccess {
                success(responseObject.data!, responseObject.response?.statusCode ?? 0, JSON(responseObject.result.value!))
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
}
