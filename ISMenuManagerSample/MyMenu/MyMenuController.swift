//
//  MyMenuController.swift
//  ISMenuManager
//
//  Created by Daniel Amaral on 16/04/17.
//  Copyright © 2017 Ilhasoft. All rights reserved.
//

import UIKit
import ISMenuManager

class MyMenuController: ISMenuController {

    var menuItemList = [ISMenuItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }

    init() {
        menuItemList = [ISMenuItem(icon: #imageLiteral(resourceName: "home"), title: "Home", controller: nil)]
        super.init(menuList: menuItemList,
                   controllerNibAndBundle: (nib:"MyMenuController", bundle: Bundle(for:MyMenuController.self)),
                   cellNibAndBundle: (nib:"MyMenuCell",bundle:Bundle(for: MyMenuCell.self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        self.tableView.separatorColor = UIColor.clear
    }    
    
}
