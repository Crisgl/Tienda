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
    
    @IBOutlet weak var Total0: UILabel!
    
    
    @IBAction func Pay(_ sender: UIButton) {
        Total.removeAll()
        self.intArray.removeAll()
        Cart.removeAll()
        let sum = intArray.reduce(0, +)
        let a:String = String(sum)
        self.Total0.text = "Total: $" + a
        self.FinalView.reloadData()
        self.Total0.reloadInputViews()
    }

    var intArray = [Double]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cart", for: indexPath) as! CartTableViewCell
        cell.titleCart.text = Cart[indexPath.row]
        cell.priceCart.text = "$" + Total[indexPath.row]
        cell.imageCart.image = UIImage(named: Cart[indexPath.row] + ".jpg")
        cell.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0.95, alpha: 0.5)
        return cell
    }
    
    
    //        Cantidad.text = String(sender.value)


    override func viewDidLoad() {
        super.viewDidLoad()
        intArray = Total.map { Double($0)!}
        let sum = intArray.reduce(0, +)
        let a:String = String(sum)
        Total0.text = "Total: $" + a
        view.backgroundColor = UIColor.yellow
        

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
            self.intArray.remove(at: indexPath.row)
            self.FinalView.reloadData()
            let sum = self.intArray.reduce(0, +)
            self.Total0.reloadInputViews()
            let a:String = String(sum)
            self.Total0.text = "Total: $" + a
            self.FinalView.reloadData()
        }
        
    
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        
        
        return swipeConfiguration
        
    }
}
