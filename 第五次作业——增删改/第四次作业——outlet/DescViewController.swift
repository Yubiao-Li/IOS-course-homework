//
//  DescViewController.swift
//  第四次作业——outlet
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Mei.class5.edu. All rights reserved.
//

import UIKit

class DescViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var foodImage: UIImageView!
    
    var foodForEdit: Food?
    

    @IBAction func takePhoto(_ sender: UIBarButtonItem) {
        // 创建一个View
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
//        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.foodImage.image = selectedImage
        foodForEdit?.foodAvatar = selectedImage
        
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func tapPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        //        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func nameChangeAction(_ sender: UITextField) {
        foodForEdit?.name = String(nameTextField.text!)
    }
    
    @IBAction func descChangeAction(_ sender: UITextField) {
        foodForEdit?.desc = String(descTextField.text!)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if foodForEdit == nil{
            foodForEdit = Food(name: "", desc: "",foodAvatar: nil)
        }
        // Do any additional setup after loading the view.
        self.nameTextField.text = foodForEdit?.name
        self.descTextField.text = foodForEdit?.desc
        self.navigationItem.title = foodForEdit?.name
        self.foodImage.image = foodForEdit?.foodAvatar
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
