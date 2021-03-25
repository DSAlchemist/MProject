//
//  LoginViewController.swift
//  MProject
//
//  Created by Danil G. on 04.03.2021.
//

import UIKit

class LoginViewController: UIViewController {

  
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = 10
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.black.cgColor
    }
    
}
