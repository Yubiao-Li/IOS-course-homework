//
//  DescViewController.swift
//  第四次作业——outlet
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Mei.class5.edu. All rights reserved.
//

import UIKit

class DescViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    
    
    @IBAction func nameChangeAction(_ sender: UITextField) {
        foodForEdit?.name = String(nameTextField.text!)
    }
    
    @IBAction func descChangeAction(_ sender: UITextField) {
        foodForEdit?.desc = String(descTextField.text!)
    }
    
    var foodForEdit: Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if foodForEdit == nil{
            foodForEdit = Food(name: "", desc: "")
        }
        // Do any additional setup after loading the view.
        self.nameTextField.text = foodForEdit?.name
        self.descTextField.text = foodForEdit?.desc
        self.navigationItem.title = foodForEdit?.name
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
