//
//  Item.swift
//  OutlineApp
//
//  Created by 1024jp on 2024-10-27.
//

import Foundation

struct Item: Identifiable {
    
    let id: UUID = .init()
    
    var name: String
    
    var children: [Item]?
    var isExpanded: Bool = false
}


extension Item {
    
    static let sampleItems: [Item] = [
        Item(name: "Dog", children: [
            Item(name: "Beagle"),
            Item(name: "Dackshund", children: [
                Item(name: "Mini. Dackshund"),
            ]),
        ]),
        Item(name: "Cat"),
    ]
}
