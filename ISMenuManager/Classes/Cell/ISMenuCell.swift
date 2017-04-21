//
//  ISMenuCell.swift
//  ISMenuManager
//
//  Created by Daniel Amaral on 15/04/17.
//  Copyright © 2017 Ilhasoft. All rights reserved.
//

import UIKit

open class ISMenuCell: UITableViewCell {

    @IBOutlet weak var lbTitle:UILabel!
    @IBOutlet weak var imgViewIcon:UIImageView!
    
    var menuItem:ISMenuItem!
    
    override open func awakeFromNib() {
        super.awakeFromNib()
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setup(with menuItem:ISMenuItem) {
        self.menuItem = menuItem
        self.lbTitle.text = menuItem.title
        self.imgViewIcon.image = menuItem.icon
    }
    
}
