//
//  ISMenu.swift
//  ISMenuManager
//
//  Created by Daniel Amaral on 15/04/17.
//  Copyright © 2017 Ilhasoft. All rights reserved.
//

import UIKit

open class ISMenuItem: NSObject {
    public var icon:UIImage!
    public var title:String!
    public var controller:UIViewController?
    
    public init(icon:UIImage!, title:String!, controller:UIViewController?) {
        self.icon = icon
        self.title = title
        self.controller = controller
        super.init()
    }
    
}
