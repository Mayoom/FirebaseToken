//
//  ViewController.swift
//  FirebaseIDToken
//
//  Created by Maryamalmoqbali on 2/25/20.
//  Copyright © 2020 Maryamalmoqbali. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var TextViewToken: UITextView!
    @IBOutlet weak var TextPassword: UITextField!
    @IBOutlet weak var TextEmail: UITextField!
    var dbReference : DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        dbReference = Database.database().reference()
        TextEmail.delegate = self
        TextEmail.delegate = self
        TextEmail.text! = "fatma@hotmail.com"
        TextPassword.text! = "12345678"
        // Do any additional setup after loading the view.
    }


    @IBAction func GetToken(_ sender: Any) {
       

     Auth.auth().signIn(withEmail: TextEmail.text!, password: TextPassword.text!) { (user, error) in
             if error == nil{
//                 let currentUser = Auth.auth().currentUser
//                 currentUser?.getIDToken { idToken, error in
//                     if let error = error {
//                         print(error.localizedDescription)
//                         return;
//                     }
//                     print("Token : \(idToken)")
//                     self.TextViewToken.text = idToken
//                 }
                
                
                let currentUser = Auth.auth().currentUser
                       currentUser?.getIDToken(completion: ){ idToken, error in
                           if error != nil {
                           // Handle error
                               print("error")
                           return;
                         }
                           print("Token : \(idToken!)")
                           self.TextViewToken.text! = idToken!
                         // Send token to your backend via HTTPS
                         // ...
                       }
             }
             else{
                print("error")
             }
         }
     
 }
 
 func showAlert(msg : String, title : String){
     let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
     alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
     self.present(alert, animated: true)
 }
 
}

