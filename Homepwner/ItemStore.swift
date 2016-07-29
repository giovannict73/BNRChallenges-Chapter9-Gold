//
//  ItemStore.swift
//  Homepwner
//
//  Created by Giovanni Catania on 01/05/16.
//  Copyright © 2016 Giovanni Catania. All rights reserved.
//

import UIKit

class ItemStore {
    var lowRankedItems = [Item]()
    var highRankedItems = [Item]()
    let rankItem : (Item) -> Bool
    
    func createItem () -> Item {
        let newItem = Item(random: true)
        
        if rankItem(newItem) {
            highRankedItems.append(newItem)
        } else {
            lowRankedItems.append(newItem)
        }
        
        return newItem
    }
    
    init(rankItemFunc: (Item) -> Bool) {
        self.rankItem = rankItemFunc
        for _ in 0..<5 {
            createItem()
        }
    }
}
