//
//  ChildVC.swift
//  SideMenu
//
//  Created by Appinventiv on 23/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ChildVC: UIViewController {
   
    //MARK: properties
    var arrayOfColors = ["Red","Green"] //array of different colors
    
    
    //MARK: IB Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

//MARK: table view delegates and datasources
extension ChildVC: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return arrayOfColors.count
   }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableID", for: indexPath) as! Table
        
        cell.lableOfColors.text = arrayOfColors[indexPath.row]
       // cell.backgroundColor = UIColor.gray
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      let parent = self.parent as! MainVC
        if indexPath.row == 0{
            
            let red = self.storyboard?.instantiateViewController(withIdentifier: "RedVCID") as! RedVC
            parent.main = red
        } else {
            
            let green = self.storyboard?.instantiateViewController(withIdentifier: "GreenVCID") as! GreenVC
            parent.main = green

        }
        
        parent.changeContentVC()

       }
    
}



class Table : UITableViewCell{
    
    
    @IBOutlet weak var lableOfColors: UILabel!
    
}
