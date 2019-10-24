//
//  CarViewController.swift
//  class04
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 wyf. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {

    var carForEdit: car?
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descTextField: UITextField!
    
    @IBAction func nameChangeAction(_ sender: Any) {
        carForEdit?.name = String(nameTextField.text!)
    }
    
    @IBAction func descChangeAction(_ sender: Any) {
        carForEdit?.desc = String(descTextField.text!)
    }
 //  var carForEdit: car?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if carForEdit == nil
        {
            carForEdit = car(name: "", desc: "")
        }else{
        self.nameTextField.text = carForEdit?.name
        self.descTextField.text = carForEdit?.desc
        // Do any additional setup after loading the view.
            self.navigationItem.title = carForEdit?.name
            
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
      
    }
}
