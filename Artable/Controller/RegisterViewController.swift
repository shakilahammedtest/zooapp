//
//  RegisterViewController.swift
//  Artable
//
//  Created by Ashraf Ahmed on 27/10/19.
//  Copyright © 2019 Shakil Ahammed. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passImg: UIImageView!
    @IBOutlet weak var confirmPassImg: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        setupPasswordMatch()
    }
    
    private func setupPasswordMatch() {
        //password match checking
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        confirmPassTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if(textField == confirmPassTextField && passwordTextField.text != "") {
            if(textField.text == "") {
                passImg.isHidden = true
                confirmPassImg.isHidden = true
            }else {
                passImg.isHidden = false
                confirmPassImg.isHidden = false
                if(textField.text == passwordTextField.text) {
                    passImg.image = UIImage(named: AppImages.GreenCheck)
                    confirmPassImg.image = UIImage(named: AppImages.GreenCheck)
                }else{
                    passImg.image = UIImage(named: AppImages.RedCheck)
                    confirmPassImg.image = UIImage(named: AppImages.RedCheck)
                }
            }
            
        }else{
            passImg.isHidden = true
            confirmPassImg.isHidden = true
            confirmPassTextField.text = ""
        }
    }
    
    @IBAction func registerBtnClicked(_ sender: Any) {
        activityIndicator.startAnimating()
        guard let email = emailTextField.text, email.isNotEmpty, let password = passwordTextField.text, password.isNotEmpty else {return}
        	
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // ...
            if let error = error {
                debugPrint(error)
                return
            }
            
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
