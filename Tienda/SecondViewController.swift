//
//  SecondViewController.swift
//  Tienda
//
//  Created by Cristian Lopez on 04/10/18.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var cart = [Cart]
    var total = [Total]
    @IBAction func AddToCart(_ sender: UIButton) {
        Cart.append(vieneDeVistaUno)
        Total.append(vieneDeVistaUno2) 

 

    }
    @IBOutlet weak var Title0: UILabel!
    @IBAction func Aumentar(_ sender: UIStepper) {
        Cantidad.text = String(sender.value)
        
    }
    @IBOutlet weak var Cantidad: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var productTitle2: UILabel!
    @IBOutlet weak var productPrice2: UILabel!
    var vieneDeVistaUno: String = ""
    var newImage: UIImage!
    var vieneDeVistaUno2: String = ""
    var vieneDeVistaUno3: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        productPrice2.text = "$" + vieneDeVistaUno2 
        productTitle2.text = vieneDeVistaUno
        image2.image = newImage

        productDescription.text = vieneDeVistaUno3
        view.backgroundColor = UIColor.init(red: 10, green: 1, blue: 0, alpha: 1)
    }


    
}
