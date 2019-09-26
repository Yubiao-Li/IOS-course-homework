//
//  ViewController.swift
//  class04
//
//  Created by Apple on 2019/9/17.
//  Copyright © 2019 wyf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var user: UITextField!
    
    
    @IBOutlet weak var code: UITextField!
    
    @IBOutlet weak var hidden: UILabel!
    
    @IBAction func logIn(_ sender: Any) {
        if(user.text == "lxx")&&(code.text == "123456")
        {
            hidden.isHidden = false
            hidden.text = "successfully"
        }
        else{
            hidden.isHidden = false
            hidden.text = "wrong input"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

