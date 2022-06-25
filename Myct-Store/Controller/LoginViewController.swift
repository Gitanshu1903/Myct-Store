//
//  LoginViewController.swift
//  Myct-Store
//
//  Created by ERASOFT on 20/05/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var passwordShowButton: UIButton!
    
    var viewModel: LoginValidation = LoginValidation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    func initializeView() {
        
        emailTextField.tintColor = UIColor.systemRed
        passwordTextField.tintColor = UIColor.systemRed
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.masksToBounds = true
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.masksToBounds = true
        signInButton.layer.cornerRadius = 10
        signInButton.layer.masksToBounds = true
        viewContainer.layer.cornerRadius = 16
        Utils.setMultiplePlaceHolderToTextFields(textFields: [emailTextField, passwordTextField], placeHolders: ["Enter Your Email", "Enter Password"])
    //    self.emailTextField.setLeftIconOnTextField(imageName: "email", width: 20, height: 20)
    //    self.passwordTextField.setLeftIconOnTextField(imageName: "padlock", width: 20, height: 20)
        self.passwordTextField.isSecureTextEntry = true
        
    }
    
    @IBAction func signInButtonClick(_ sender: Any) {
        let validationResult = LoginValidation.validate(userName: emailTextField.text, password: passwordTextField.text)
        if validationResult.isValidate {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homeViewController = storyboard.instantiateViewController(withIdentifier: "LoginCompletedViewController") as! LoginCompletedViewController
            navigationController?.pushViewController(homeViewController, animated: true)
        } else {
            print("Alert")
        }
    }
}

extension UITextField {
    func setLeftIconOnTextField(imageName: String, width: CGFloat, height: CGFloat) {
        let leftView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: width+16, height: height))
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .center
        imageView.frame = CGRect(x: 10, y: 0, width: width, height: height)
        imageView.tintColor = UIColor.gray
        imageView.backgroundColor = UIColor.clear
        leftView.addSubview(imageView)
        self.leftViewMode = .always
        self.leftView = leftView
    }
}
