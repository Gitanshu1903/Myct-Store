//
//  loginViewModel.swift
//  Myct-Store
//
//  Created by ERASOFT on 20/05/22.
//

import Foundation

struct ValidationResult {
    var isValidate: Bool
    var message: String
}

class LoginValidation {
    class func validate(userName: String?, password: String?) -> ValidationResult {
        if userName == "" {
            return ValidationResult(isValidate: false, message: "Please Enter Email")
        } else if Utils.isValidEmailAddress(email: userName!) {
            return ValidationResult(isValidate: false, message: "Please Enter Valid email")
        } else if password == "" {
            return ValidationResult(isValidate: false, message: "Please Enter Password")
        }
        return ValidationResult(isValidate: true, message: "")
    }
}
