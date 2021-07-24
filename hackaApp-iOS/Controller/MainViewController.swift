//
//  MainViewController.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 24/07/21.
//

import UIKit

class MainViewController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
    }
    
    func setUp() {
        
        let storyboard0 = UIStoryboard(name: "Journey", bundle: nil)
        let storyboard1 = UIStoryboard(name: "Buy", bundle: nil)
        let storyboard2 = UIStoryboard(name: "Sell", bundle: nil)
        
        
        let firstBookTableVc = storyboard0.instantiateViewController(withIdentifier: "TabJourney")
        let secondBookTableVc = storyboard1.instantiateViewController(withIdentifier: "TabBuy")
        let thirdBookTableVc = storyboard2.instantiateViewController(withIdentifier: "TabSell")

        //configure the view controllers here...
        
        viewControllers = [firstBookTableVc, secondBookTableVc, thirdBookTableVc]
        
//        tabBar.items?[0].image = UIImage(named: "aaaa")
//        tabBar.items?[1].image = UIImage(systemName: "aaaaa")
//        tabBar.items?[2].image = UIImage(named: "aaaaa")
        
        tabBar.items?[0].title = "Journey"
        tabBar.items?[1].title = "Buy"
        tabBar.items?[2].title = "Sell"
    }
}
