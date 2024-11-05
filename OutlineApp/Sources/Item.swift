//
//  Item.swift
//  OutlineApp
//
//  Created by 1024jp on 2024-10-27.
//

import Foundation

@Observable final class Item: Identifiable {
    
    let id: UUID = .init()
    
    var name: String
    var children: [Item]?
    var isExpanded: Bool = false
    
    
    init(name: String, children: [Item]? = nil) {
        
        self.name = name
        self.children = children
    }
}


extension Item {
    
    static let sampleItems: [Item] = [
        Item(name: "Dog", children: [
            Item(name: "Beagle"),
            Item(name: "Dachshund", children: [
                Item(name: "Mini. Dachshund"),
            ]),
        ]),
        Item(name: "Cat"),
    ]
}
