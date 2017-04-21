//
//  ISMenuManagerController.swift
//  ISMenuManager
//
//  Created by Daniel Amaral on 15/04/17.
//  Copyright © 2017 Ilhasoft. All rights reserved.
//

import UIKit

public protocol ISMenuControllerDelegate {
    func menuItemDidTap(menuController:ISMenuController, menuItem:ISMenuItem, index:Int)
}

open class ISMenuController: UIViewController {

    @IBOutlet weak public var tableView:UITableView!
    @IBOutlet weak public var topView:UIView?
    @IBOutlet weak public var bottomView:UIView?
    @IBOutlet weak public var bottomViewHeight:NSLayoutConstraint?
    @IBOutlet weak public var topViewHeight:NSLayoutConstraint?
    
    public var menuList = [ISMenuItem]()
    public var delegate:ISMenuControllerDelegate?
    
    var cellNibAndBundle:(nib:String,bundle:Bundle)?
    
    public init(menuList:[ISMenuItem], controllerNibAndBundle:(nib:String,bundle:Bundle)?, cellNibAndBundle:(nib:String,bundle:Bundle)?) {
        self.menuList = menuList
        if let cellNibAndBundle = cellNibAndBundle {
            self.cellNibAndBundle = cellNibAndBundle
        }else {
            self.cellNibAndBundle = (nib:"ISMenuCell",bundle:Bundle(for: ISMenuCell.self))
        }
        if let controllerNibNameAndBundle = controllerNibAndBundle {
            super.init(nibName: controllerNibNameAndBundle.nib, bundle: controllerNibNameAndBundle.bundle)
        }else {
            super.init(nibName: "ISMenuController", bundle: Bundle(for: ISMenuController.self))
        }
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //Public Methods
    
    public func addMenuItem(menuItem:ISMenuItem, atIndex:Int? = nil) {
        if let atIndex = atIndex {
            self.menuList.insert(menuItem, at: atIndex)
        }else {
            self.menuList.append(menuItem)
        }
        self.tableView.reloadData()
    }        
    
    //Class Methods
    
    public func setupTableView() {
        if let cellNibAndBundle = cellNibAndBundle {
            self.tableView.register(UINib(nibName: cellNibAndBundle.nib, bundle: cellNibAndBundle.bundle), forCellReuseIdentifier: NSStringFromClass(ISMenuCell.self))
        }else {
            self.tableView.register(UINib(nibName: "ISMenuCell", bundle: Bundle(for: ISMenuCell.self)), forCellReuseIdentifier: NSStringFromClass(ISMenuCell.self))
        }
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
    
}

extension ISMenuController : UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(ISMenuCell.self), for: indexPath) as! ISMenuCell
        cell.setup(with: menuList[indexPath.row])
        return cell
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuList.count
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.menuItemDidTap(menuController:self, menuItem: self.menuList[indexPath.row], index: indexPath.row)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (self.cellNibAndBundle!.bundle.loadNibNamed(self.cellNibAndBundle!.nib, owner: self, options: nil)!.first as! ISMenuCell).bounds.size.height
    }
}
