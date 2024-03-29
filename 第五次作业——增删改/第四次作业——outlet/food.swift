//
//  food.swift
//  第四次作业——outlet
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Mei.class5.edu. All rights reserved.
//

import Foundation
import UIKit

class Food: NSObject,NSCoding{
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name,forKey: "name")
        aCoder.encode(desc,forKey: "desc")
        aCoder.encode(foodAvatar,forKey: "avatar")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as? String
        desc = aDecoder.decodeObject(forKey: "desc") as? String
        foodAvatar = aDecoder.decodeObject(forKey: "avatar") as? UIImage
    }
    
    var name: String?
    var desc: String?
    var foodAvatar: UIImage?
    
    static let DocumentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentDirectory.appendingPathComponent("foodList")
    
    init(name:String?,desc:String?,foodAvatar: UIImage?) {
        self.name = name
        self.desc = desc
        self.foodAvatar = foodAvatar
    }
}
