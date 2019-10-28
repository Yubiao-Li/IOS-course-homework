//
//  SecondViewController.swift
//  Foodlist
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var foodForEdit: food?
    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if foodForEdit == nil{
            foodForEdit = food(foodName: " ", foodDescription: " ")
        }
        else{
        self.firstText.text = foodForEdit?.foodName
        self.secondText.text = foodForEdit?.foodDescription
        self.navigationItem.title = foodForEdit?.foodName
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nameChange(_ sender: Any) {
         foodForEdit?.foodName = String(self.firstText.text!)    }
    
    
    @IBAction func description(_ sender: Any) {
        foodForEdit?.foodDescription = String(self.secondText.text!)    }
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation*/
  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToList"{
            print("save")
            foodForEdit = food(foodName: self.firstText.text!,foodDescription: self.secondText.text!)
            
        }
        if segue.identifier == "cancelToList"{
            print("cancel")
        }
        
    }*/
    

}
