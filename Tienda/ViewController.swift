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
    
    @IBOutlet weak var searchBar: UISearchBar!
    

    @IBOutlet weak var productTable: UITableView!
    var products = ["Arduino Uno","Arduino Nano","Arduino Mega", "Arduino Leonardo", "Arduino Due", "Arduino Education Shield", "Arduino MKR ETH Shield"]
    let price = [22.00,19.80,38.50,19.80,38.50,20.00,27.90]
    let descriptions = ["Is a microcontroller board based on the ATmega328P (datasheet). It has 14 digital input/output pins (of which 6 can be used as PWM outputs), 6 analog inputs, a 16 MHz quartz crystal, a USB connection, a power jack, an ICSP header and a reset button.","Arduino Micro is the smallest board of the family, easy to integrate it in everyday objects to make them interactive. ","The MEGA 2560 is designed for more complex projects. With 54 digital I/O pins, 16 analog inputs and a larger space for your sketch it is the recommended board for 3D printers and robotics projects. ","The Arduino Leonardo is a microcontroller board based on the ATmega32u4 (datasheet). It has 20 digital input/output pins (of which 7 can be used as PWM outputs and 12 as analog inputs), a 16 MHz crystal oscillator, a micro USB connection, a power jack, an ICSP header, and a reset button.","The Arduino Due is the first Arduino board based on a 32-bit ARM core microcontroller. With 54 digital input/output pins, 12 analog inputs, it is the perfect board for powerful larger scale Arduino projects.","The Education Shield is a custom-made shield designed by Arduino Education, specially tailored for educational purposes to enable quick and easy learning while building projects.","Are you developing a project for an environment where wireless connections are unavailable or would be inefficient? The MKR ETH shield allows to have a wired Ethernet connection between your MKR board and your network or the Internet."]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "First", for: indexPath) as! FirstTableViewCell
        
        cell.productTitle.text = products[indexPath.row]
        cell.productPrice.text = "$" + "\(price[indexPath.row])" 
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
            destino.vieneDeVistaUno3 = descriptions[(indexPath?.row)!]
            view.backgroundColor = UIColor.orange
        }

    }
    
    @IBAction func unwindSecondView( segue: UIStoryboardSegue){
        
    }

    



}

