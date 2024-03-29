//
//  ViewController.swift
//  Overwatch United
//
//  Created by Johnny Nicholson on 2/14/17.
//  Copyright © 2017 Johnny Nicholson. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class LoginScreenVC: UIViewController
{

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func userNameEntered(_ sender: UITextField)
    {
        sender.resignFirstResponder()
    }
    
    @IBAction func passwordEntered(_ sender: UITextField)
    {
        sender.resignFirstResponder()
    }
    
    @IBAction func onGestureTap(_ sender: UITapGestureRecognizer)
    {
        userNameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
    }
    
    @IBAction func facebookButtonPressed(_ sender: UIButton)
    {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self)
        { (result, error) in
            if error != nil
            {
                print("ERROR: Unable to authenticate with Facebook - \(error)")
            }
            else if result?.isCancelled == true
            {
                print("User cancelled Facebook authentication")
            }
            else
            {
                print("Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential)
    {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil
            {
                print("ERROR: Unable to authenticate with Firebase - \(error)")
            }
            else
            {
                print("Successfully authenticated with Firebase")
            }
        })
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}

