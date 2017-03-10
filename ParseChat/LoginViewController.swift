//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Vivian Pham on 2/23/17.
//  Copyright © 2017 Vivian Pham. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onTouchLogin(_ sender: Any) {
        logIn()
    }
    @IBAction func onTouchSignUp(_ sender: Any) {
        signUp()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func signUp() {
        let user = PFUser()
        user.username = emailField.text
        user.email = emailField.text
        user.password = passwordField.text
        print("Sign up")
        
        user.signUpInBackground(block: {(success, error) -> Void in
            if let error = error {
                // Show the errorString somewhere and let the user try again.
                let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
                // create a cancel action
                let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                    // handle cancel response here. Doing nothing will dismiss the view.
                }
                // add the cancel action to the alertController
                alertController.addAction(cancelAction)
                
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
            } else {
                // Hooray! Let them use the app now.
                print("Sign up successful")
                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
                
            }
        });
    }
    
    func logIn() {
        print("LOGIN")
        PFUser.logInWithUsername(inBackground: emailField.text!, password: passwordField.text!, block: {(success, error) -> Void in
            if let error = error {
                // Show the errorString somewhere and let the user try again.
                let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
                // create a cancel action
                let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                    // handle cancel response here. Doing nothing will dismiss the view.
                }
                // add the cancel action to the alertController
                alertController.addAction(cancelAction)
                
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
            } else {
                // Hooray! Let them use the app now.
                print("SUCCESS")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }

        
        });
    }

    /*
    // MARK: - Navigation
    */
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
