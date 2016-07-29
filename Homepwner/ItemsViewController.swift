//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Giovanni Catania on 01/05/16.
//  Copyright © 2016 Giovanni Catania. All rights reserved.
//

import UIKit

class ItemsViewController : UITableViewController {
    // MARK: - Properties
    var itemStore : ItemStore!
 
    // MARK: - TableView - Datasource methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "low ranked"
        } else {
            return "high ranked"
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
                return itemStore.lowRankedItems.count
        } else {
            return (itemStore.highRankedItems.count) + 1
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 1 && indexPath.row == itemStore.highRankedItems.count {
            return CGFloat(44)
        } else {
            return CGFloat(60)
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
        if indexPath.section == 0 {
            let item = itemStore.lowRankedItems[indexPath.row]
            cell.textLabel?.font = UIFont(name: "Avenir", size: 20)
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "$ \(item.valueInDollars)"
        } else {
            if indexPath.row == itemStore.highRankedItems.count {
                cell.textLabel?.text = "No more items!"
                cell.detailTextLabel?.text = nil
            } else {
                let item = itemStore.highRankedItems[indexPath.row]
                cell.textLabel?.font = UIFont(name: "Avenir", size: 20)
                cell.textLabel?.text = item.name
                cell.detailTextLabel?.text = "$ \(item.valueInDollars)"
            }
        }
        
        return cell
    }
    
    // MARK: - superclass override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the height of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    override func loadView() {
        super.loadView()
        let backgroundImage = UIImage(named: "ckickencell.png")
        if backgroundImage == nil {
            print("nil image!")
        }
        let imageView = UIImageView(image: backgroundImage)
        imageView.contentMode = .ScaleAspectFit
        tableView.backgroundView = imageView
    }
    
}