//
//  ViewController.swift
//  第四次作业——outlet
//
//  Created by Apple on 2019/9/24.
//  Copyright © 2019 Mei.class5.edu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userList = ["biao","test","what","emm"]
    var passwordList = ["123","456","789","000"]
    
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwdTextField: UITextField!
    @IBAction func loginButtonClick(_ sender: Any) {
        
        if let user = userNameTextField.text , let pwd = passwdTextField.text{
            if let index = userList.firstIndex(of: user){
                if (pwd == passwordList[index]){
                    hintLabel.text = "Welcome \(user)"
                }else{
                    hintLabel.text = "Login failed, please check your name and password!"
                }
                
            }else{
                hintLabel.text = "Invalid user name"
            }
        }else{
            hintLabel.text = "Enter your userName and password!"
        }

    }
    @IBAction func userNameChange(_ sender: Any) {
        // 限制用户名长度
        userNameTextField.text = String(userNameTextField.text!.prefix(10))
    }
    
    @IBAction func exitToHere(segue:UIStoryboardSegue){
        print("get")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }


}

