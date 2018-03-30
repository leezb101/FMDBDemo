//
//  WeaponFDMB.swift
//  FMDBDemo
//
//  Created by leezb101 on 2018/3/30.
//  Copyright © 2018年 luohe. All rights reserved.
//

import UIKit
import FMDB

let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!

class WeaponDb {
    
    static let db = FMDatabase(path: path + "/weapon.sqlite")
    
    class private func openDb() -> Bool {
        return db.open()
    }
    
    class func createTable() -> Bool {
        
        if openDb() {
            let sqlString = "CREATE TABLE IF NOT EXISTS t_weapon (id integer primary key autoincrement, name text NOT NULL, distance real NOT NULL, bullet real NOT NULL, price real NOT NULL, rank integer);"
            do {
                try db.executeUpdate(sqlString, values: nil)
                return true
            } catch {
                print(error.localizedDescription)
                return false
            }
        } else {
            return false
        }
        
    }
    
    class func insertToTable(dataDict: NSDictionary) -> Bool {
        
        if openDb() {
            let keys = dataDict.allKeys
            let values = dataDict.allValues
            var sqlPre = "INSERT INTO t_weapon ("
            var sqlSuf = " values ("
            for i in 0..<keys.count {
                if i != keys.count - 1 {
                    sqlPre = sqlPre + "\(keys[i])" + ","
                    sqlSuf = sqlSuf + "?" + ","
                } else {
                    sqlPre = sqlPre + "\(keys[i])" + ")"
                    sqlSuf = sqlSuf + "?)"
                }
            }
            do {
                try db.executeUpdate(sqlPre + sqlSuf, values: values)
                return true
            } catch {
                print(error.localizedDescription)
                return false
            }
        } else {
            return false
        }
        
    }
    
    class func deleteFromTable(key: String, value: Any) -> Bool {
        
        if openDb() {
            let sql = "DELETE FROM t_weapon where " + key + " = ?"
            do {
                try db.executeUpdate(sql, values: [value])
                return true
            } catch {
                print(error.localizedDescription)
                return false
            }
            
        } else {
            return false
        }
    }
    
    class func modifyTableData(dataDict: NSDictionary, conditionKey: String, conditionValue: Any) -> Bool {
        
        if openDb() {
            
            let dictKeys = dataDict.allKeys as! [String]
            var dictValues = dataDict.allValues
            var sql = "UPDATE t_weapon SET "
            for i in 0..<dataDict.count {
                if i != dataDict.count - 1 {
                    sql = sql + dictKeys[i] + " = ?,"
                } else {
                    sql = sql + dictKeys[i] + " = ?"
                }
            }
            dictValues.append(conditionValue)
            sql = sql + " WHERE " + conditionKey + " = ?"
            do {
                try db.executeUpdate(sql, values: dictValues)
                return true
            } catch {
                print(error.localizedDescription)
                return false
            }

        } else {
            return false
        }
    }
    
    class func queryFromTable(whereString: String) -> [[String: Any]] {
        if openDb() {
            var resultArr = [[String: Any]]()
            let sql = "SELECT * FROM t_weapon " + whereString
            do {
                let res = try db.executeQuery(sql, values: nil)
                while res.next() {
                    resultArr.append(res.resultDictionary as! [String : Any])
                }
                db.close()
                return resultArr
            } catch {
                print(error.localizedDescription)
                return [[String: Any]]()
            }
            
        } else {
            return [[String: Any]]()
        }
    }
    
}
