//
//  FilmModel.swift
//  FMDBDemo
//
//  Created by leezb101 on 2018/3/30.
//  Copyright © 2018年 luohe. All rights reserved.
//

import UIKit

class WeaponModel: NSObject {
    var name: String = ""
    var shootDistance: Double = 0.0
    var price: Double = 0.0
    var rank: Int = 0
    var bullet: Double = 0.0
    var id: Int = 0
    
    init(dict: [String: Any]) {
        self.name = dict["name"] as? String ?? ""
        self.shootDistance = dict["distance"] as? Double ?? 0
        self.price = dict["price"] as? Double ?? 0
        self.bullet = dict["bullet"] as? Double ?? 0
        self.rank = 5
        self.id = dict["id"] as? Int ?? 0
    }
    
    func convertToDict() -> [String: Any] {
        var result = [String: Any]()
        result.updateValue(self.name, forKey: "name")
        result.updateValue(self.shootDistance, forKey: "distance")
        result.updateValue(self.price, forKey: "price")
        result.updateValue(self.rank, forKey: "rank")
        result.updateValue(self.bullet, forKey: "bullet")
        result.updateValue(self.id, forKey: "id")
        return result
    }
}
