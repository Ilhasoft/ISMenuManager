//
//  ViewController.swift
//  ISMenuManagerSample
//
//  Created by Daniel Amaral on 16/04/17.
//  Copyright © 2017 Ilhasoft. All rights reserved.
//

import UIKit
import ISMenuManager

class ViewController: ISMenuController {

    init() {
        super.init(menuList: [ISMenuItem(icon: #imageLiteral(resourceName: "home"), title: "Home", controller: nil)], controllerNibAndBundle: nil, cellNibAndBundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

}

extension ViewController : ISMenuControllerDelegate {
    func menuItemDidTap(menuController: ISMenuController, menuItem: ISMenuItem, index: Int) {
        
    }
}
