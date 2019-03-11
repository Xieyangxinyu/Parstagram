//
//  LoginViewController.swift
//  
//
//  Created by 谢阳欣雨 on 3/10/19.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var UsernameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func OnSignIn(_ sender: Any) {
        let username = UsernameField.text!
        let password = UsernameField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil{
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            }else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func OnSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = UsernameField.text
        user.password = PasswordField.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            }else {
                print("Error: \(error?.localizedDescription)")
            }
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
