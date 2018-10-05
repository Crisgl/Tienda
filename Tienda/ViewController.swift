//
//  ViewController.swift
//  Tienda
//
//  Created by Cristian Lopez on 04/10/18.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(type(of: price))
    }
    
    
    
    @IBOutlet weak var productTable: UITableView!
    let products = ["Arduino Uno","Arduino Nano","Arduino Mega"]
    let price = [30,20,10]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "First", for: indexPath) as! FirstTableViewCell
        cell.productTitle.text = products[indexPath.row]
        cell.productPrice.text = "Precio $" + "\(price[indexPath.row])" + "MX"
        cell.image1.image = UIImage(named: products[indexPath.row] + ".jpg")
        cell.backgroundColor = UIColor.orange
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "descripcion"{
            let indexPath = productTable.indexPathForSelectedRow
            let destino = segue.destination as! SecondViewController
            destino.vieneDeVistaUno = products[(indexPath?.row)!]
            destino.vieneDeVistaUno2 = "\(price[(indexPath?.row)!])"
            destino.newImage = UIImage(named: products[(indexPath?.row)!] + ".jpg")

        }

    }
    
    @IBAction func unwindSecondView( segue: UIStoryboardSegue){
        
    }





}

