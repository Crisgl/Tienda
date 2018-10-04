//
//  CartTableViewCell.swift
//  Tienda
//
//  Created by Cristian Lopez on 04/10/18.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCart: UIImageView!
    @IBOutlet weak var titleCart: UILabel!
    @IBOutlet weak var priceCart: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
