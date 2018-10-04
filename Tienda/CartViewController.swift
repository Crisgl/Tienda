//
//  CartViewController.swift
//  Tienda
//
//  Created by Cristian Lopez on 04/10/18.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var FinalView: UITableView!
    var cart1 = [Cart]
    var total1 = [Total]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cart", for: indexPath) as! CartTableViewCell
        cell.titleCart.text = Cart[indexPath.row]
        cell.priceCart.text = Total[indexPath.row]
        cell.imageCart.image = UIImage(named: Cart[indexPath.row] + ".jpg")
        return cell
    }
    
    
    //        Cantidad.text = String(sender.value)


    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(cart1)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindSecondView( segue: UIStoryboardSegue){
        
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceview, completionHandler) in
            
            Cart.remove(at: indexPath.row)
            self.FinalView.deleteRows(at: [indexPath], with: .fade )
            completionHandler(true)
            Total.remove(at: indexPath.row)
        }
        
    
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        
        
        return swipeConfiguration
        
    }
    
    /*func agregar(){
        for(i=0,i<10,i++){
            
        }
    }
    */

}
