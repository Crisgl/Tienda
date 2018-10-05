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
    
    
    var cart1 = [Cart]
    var total1 = [Total]
    var intArray = [Int]()
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
        intArray = Total.map { Int($0)!}
        print(intArray)
        var sum = intArray.reduce(0, +)
        print(sum)
        let a:String = String(sum)
        Total0.text = a


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
            var sum = self.intArray.reduce(0, +)
            print("La suma es",sum)
            self.Total0.reloadInputViews()
            let a:String = String(sum)
            self.Total0.text = a
            self.FinalView.reloadData()
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
