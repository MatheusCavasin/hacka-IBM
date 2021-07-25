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
        let storyboard1 = UIStoryboard(name: "Store", bundle: nil)
        let storyboard2 = UIStoryboard(name: "Sell", bundle: nil)
        
        
        let firstBookTableVc = storyboard0.instantiateViewController(withIdentifier: "TabJourney")
        let secondBookTableVc = storyboard1.instantiateViewController(withIdentifier: "TabStore")
        let thirdBookTableVc = storyboard2.instantiateViewController(withIdentifier: "TabSell")

        //configure the view controllers here...
        
        viewControllers = [firstBookTableVc, secondBookTableVc, thirdBookTableVc]
        
        tabBar.items?[0].image = UIImage(named: "journeyTab")
        tabBar.items?[1].image = UIImage(named: "storeTab")
        tabBar.items?[2].image = UIImage(named: "sellTab")
        
        tabBar.items?[0].selectedImage = UIImage(named: "journeyTabSelected")
        tabBar.items?[1].selectedImage = UIImage(named: "storeTabSelected")
        tabBar.items?[2].selectedImage = UIImage(named: "sellTabSelected")
        
        tabBar.items?[0].standardAppearance?.selectionIndicatorTintColor = UIColor(cgColor: #colorLiteral(red: 0.3118286431, green: 0.3118879795, blue: 0.3118248582, alpha: 1))
//        tabBar.items?[1].title = "Buy"
//        tabBar.items?[2].title = "Sell"
//
        tabBar.items?[0].title = "Journey"
        tabBar.items?[1].title = "Store"
        tabBar.items?[2].title = "Sell"
    }
}
