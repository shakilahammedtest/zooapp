//
//  LoginViewController.swift
//  Artable
//
//  Created by Ashraf Ahmed on 27/10/19.
//  Copyright © 2019 Shakil Ahammed. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  
    
    @IBAction func registerBtnClicked(_ sender: Any) {
        let registerController = UIStoryboard(name: Storyboard.LoginStoryboard, bundle: nil).instantiateViewController(identifier: StoryboardId.RegisterViewController) as! RegisterViewController
        self.navigationController?.pushViewController(registerController, animated: true)
    }
    
    
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        guard let email = emailTextField.text, email.isNotEmpty, let password = passwordTextField.text, password.isNotEmpty else {return}
        activityIndicator.startAnimating()
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            //guard let strongSelf = self else { return }
            
            if let error = error {
                debugPrint(error)
                return
            }
            self?.activityIndicator.stopAnimating()
            self?.dismiss(animated: true, completion: nil)
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

    @IBAction func continueGuestClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func forgotPassClicked(_ sender: Any) {
        let forgotPassVC = ResetPasswordViewController()
        forgotPassVC.modalPresentationStyle = .overCurrentContext
        forgotPassVC.modalTransitionStyle = .crossDissolve
        present(forgotPassVC, animated: true, completion: nil)
    }
    
}
