//
//  Utils.swift
//  Myct-Store
//
//  Created by ERASOFT on 20/05/22.
//

import Foundation
import UIKit

class Utils: NSObject {
    
    class func isValidEmailAddress(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    class func setMultiplePlaceHolderToTextFields(textFields: [UITextField], placeHolders: [String]) {
        for i in 0..<textFields.count {
            textFields[i].attributedPlaceholder = NSAttributedString(string: placeHolders[i], attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        }
    }
}
