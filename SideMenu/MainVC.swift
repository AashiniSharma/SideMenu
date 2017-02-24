//
//  SideMenuVC.swift
//  SideMenu
//
//  Created by Appinventiv on 23/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    //var child : ChildVC = ChildVC()
    
    //MARK: properties
    var sideMenu = ChildVC()
    var main = UIViewController()

    //MARK: IB Outlets
    @IBOutlet weak var sideMenuButtonOutlet: UIButton!
    
    
        //MARK: View lifw cycle
       override func viewDidLoad() {
        super.viewDidLoad()

        sideMenu = self.storyboard?.instantiateViewController(withIdentifier: "ChildVC") as! ChildVC
        main = self.storyboard?.instantiateViewController(withIdentifier: "MainViewDuplicateVCID") as! MainViewDuplicateVC
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.main.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        self.addChildViewController(main)
        self.view.addSubview(main.view)
        main.didMove(toParentViewController: self)
        
        
        sideMenu.view.frame = CGRect(x: -200, y: 0, width: 200, height: 667)
        
        self.addChildViewController(sideMenu)
        self.view.addSubview(sideMenu.view)
        sideMenu.didMove(toParentViewController: self)
        sideMenuButtonOutlet.isSelected = false

    }
    
    
    //functions
    func changeContentVC()
    {
        main.removeFromParentViewController()
        self.viewWillLayoutSubviews()
        
    }
    
    //MARK: IB Action
    @IBAction func sideMenuButtonTapped(_ sender: UIButton) {
    
        
        if !sideMenuButtonOutlet.isSelected{
        
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {() -> Void in
            
            self.sideMenu.view.frame = CGRect(x: 0, y: 0, width: 200, height: 667)
            
        
            }, completion: nil)
             sideMenuButtonOutlet.isSelected = true
        
            }
        
        else{
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {() -> Void in

            
                     self.sideMenu.view.frame = CGRect(x: -200, y: 0, width: 200, height: 667)
                 }, completion: nil)

             sideMenuButtonOutlet.isSelected = false
            

            }
        
        
        }
    
    
 
   }
