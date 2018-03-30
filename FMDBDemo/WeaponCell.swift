//
//  WeaponCell.swift
//  FMDBDemo
//
//  Created by leezb101 on 2018/3/30.
//  Copyright © 2018年 luohe. All rights reserved.
//

import UIKit

class WeaponCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var bulletLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var model: WeaponModel? {
        didSet {
            guard let model = model else { return }
            name = model.name
            distance = model.shootDistance
            bullet = model.bullet
            price = model.price
        }
    }
    
    private var name: String? {
        didSet {
            nameLabel.text = name
        }
    }
    
    private var distance: Double? {
        didSet {
            distanceLabel.text = "\(distance!)"
        }
    }
    
    private var bullet: Double? {
        didSet {
            bulletLabel.text = "\(bullet!)"
        }
    }
    
    private var price: Double? {
        didSet {
            priceLabel.text = "\(price!)"
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
