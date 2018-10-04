//
//  ItemsTableViewCell.swift
//  Tienda
//
//  Created by Cristian Lopez on 04/10/18.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var productTitle: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
