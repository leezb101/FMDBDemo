//
//  FilmModel.swift
//  FMDBDemo
//
//  Created by leezb101 on 2018/3/30.
//  Copyright © 2018年 luohe. All rights reserved.
//

import UIKit

class WeaponModel: NSObject {
    @objc var name: String = ""
    @objc var shootDistance: Double = 0.0
    @objc var price: Double = 0.0
    @objc var rank: Int = 0
    @objc var bullet: Double = 0.0
    @objc var id: Int = 0
    
    init(dict: [String: Any]) {
        super.init()
        let pList = WeaponModel.getPropertyList()
        
        for key in pList {
            if key != "shootDistance" {
                self.setValue(dict[key], forKeyPath: key)
            } else {
                self.setValue(dict["distance"], forKey: key)
            }
        }
//        self.name = dict["name"] as? String ?? ""
//        self.shootDistance = dict["distance"] as? Double ?? 0
//        self.price = dict["price"] as? Double ?? 0
//        self.bullet = dict["bullet"] as? Double ?? 0
//        self.rank = 5
//        self.id = dict["id"] as? Int ?? 0
    }
    
    func convertToDict() -> [String: Any] {
        var result = [String: Any]()
        
        let pList = WeaponModel.getPropertyList()
        
        for key in pList {
            let value = self.value(forKey: key)
            if key != "shootDistance" {
                result.updateValue(value, forKey: key)
            } else {
                result.updateValue(value, forKey: "distance")
            }
        }
        
//        result.updateValue(self.name, forKey: "name")
//        result.updateValue(self.shootDistance, forKey: "distance")
//        result.updateValue(self.price, forKey: "price")
//        result.updateValue(self.rank, forKey: "rank")
//        result.updateValue(self.bullet, forKey: "bullet")
//        result.updateValue(self.id, forKey: "id")
        return result
    }
    
    class func getPropertyList() -> [String] {
        var propertyList = [String]()
        var count: UInt32 = 0
        let list = class_copyIvarList(self, &count)
        print("总共有\(count)个属性")
        
        for i in 0..<Int(count) {
            guard let propty = list?[i], let name = String(utf8String: ivar_getName(propty)!) else { continue }
            print(name)
            propertyList.append(name)
        }
        
        return propertyList
    }
}
