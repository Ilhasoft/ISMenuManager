# ISMenuManager

![Menu](http://i.imgur.com/uf9EYsu.png)

### Requirements:

iOS 9 +
Swift 3

### Install with Cocoapods:

 pod 'ISMenuManager', :git => 'https://github.com/Ilhasoft/ISMenuManager', :branch => 'master'

 ### How does it work?

1. Create some UIViewController, for example MyMenuController, and subclass ISMenuController with xib option checked.
2. Copy the following code:

```swift
import ISMenuManager

class MyMenuController: ISMenuController {

    var menuItemList = [ISMenuItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    init() {
    	//Create a menuList with icon (UIImage), title(String) and controller (UIViewController)
        menuItemList = [ISMenuItem(icon: UIImage(named:"home"), title: "Home", controller: nil)]
        //Init with menuList and your custom cell and controller xib.
        super.init(menuList: menuItemList,
                   controllerNibAndBundle: (nib:"MyMenuController", bundle: Bundle(for:MyMenuController.self)),
                   cellNibAndBundle: (nib:"MyMenuCell",bundle:Bundle(for: MyMenuCell.self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
}
```

3. On Xib, you must create a UITableView and bind with an outlet that ISMenuController already has.
4. Create your own UITableViewCell and UIViewController for call super.init() of ISMenuController.
5. Your custom cell must subclass ISMenuCell. 


### Adding more MenuItems

```swift
menuController.addMenuItem(menuItem: ISMenuItem(icon: UIImage(named:"Home"), title: "Home \(index)", controller: nil))
```

### Delegate setup

```swift
menuController.delegate = self
```


### Be alerted when menu item did tap

```swift
func menuItemDidTap(menuController: ISMenuController, menuItem: ISMenuItem, index: Int) {

}
```



>It's recomended download the code sample.