//
//  ViewController.swift
//  Notes
//
//  Created by Alexey Petrenko on 10.05.2018.
//  Copyright © 2018 Alexey Petrenko. All rights reserved.
//

import UIKit
import Firebase

var appUser : User = User(name: "NO_NAME", id: 0)

class LoginViewController: UIViewController {

    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    func displayWarningLabel(withText text: String) {
        warningLabel.text = text
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { [weak self] in self?.warningLabel.alpha = CGFloat(1.0) }) { [weak self] complete in
            self?.warningLabel.alpha = 0
        }
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text, email != "", password != ""
            else {
                displayWarningLabel(withText: "Info is incorrect")
                return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error) in
            if error != nil {
                self?.displayWarningLabel(withText: "Error occured")
                return
            }
            if user != nil {
                self?.performSegue(withIdentifier: "MainMenu", sender: nil)
                return
            }
            self?.displayWarningLabel(withText: "No such user")
        }
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text, email != "", password != ""
            else {
                displayWarningLabel(withText: "Info is incorrect")
                return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil {
                if user != nil {
                    
                } else {
                    print("user is not created")
                }
            } else {
                print(error!.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warningLabel.alpha = 0
        Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            if user != nil {
                self?.performSegue(withIdentifier: "MainMenu", sender: nil)
                if let userData = UserDefaults.standard.data(forKey: "memUser"),
                    let appUser = try? JSONDecoder().decode(User.self, from: userData) {
                }else{
                    var appUser = User(name: (user?.email)!, id: 1)
                if let encoded = try? JSONEncoder().encode(appUser) {
                    UserDefaults.standard.set(encoded, forKey: "kUser")
                }
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
}

