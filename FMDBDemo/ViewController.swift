//
//  ViewController.swift
//  FMDBDemo
//
//  Created by leezb101 on 2018/3/30.
//  Copyright © 2018年 luohe. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    lazy var tableView: UITableView = {[unowned self] in
        let result = UITableView(frame: self.view.frame, style: .plain)
        result.delegate = self
        result.dataSource = self
        self.view.addSubview(result)
        return result
    }()
    
    var dataModel: [WeaponModel] = [WeaponModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let resultArr = WeaponDb.queryFromTable(whereString: "")
        for item in resultArr {
            let model = WeaponModel(dict: item)
            dataModel.append(model)
        }
        
        tableView.register(UINib(nibName: "WeaponCell", bundle: Bundle(for: WeaponCell.self)), forCellReuseIdentifier: "wCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wCell", for: indexPath) as! WeaponCell
        let model = dataModel[indexPath.row]
        cell.model = model
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: WeaponCell = tableView.cellForRow(at: indexPath) as! WeaponCell
        guard let model = cell.model else { return }
       
        if WeaponDb.deleteFromTable(key: "id", value: model.id) {
            let newArr = dataModel.filter { (m) -> Bool in
                m.id != model.id
            }
            dataModel = newArr
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

