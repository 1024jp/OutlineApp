//
//  ContentView.swift
//  OutlineApp
//
//  Created by 1024jp on 2024-10-27.
//

import SwiftUI

struct ContentView: View {
    
    @State var items: [Item] = Item.sampleItems
    
    
    var body: some View {
        
        Grid {
            GridRow {
                VStack(alignment: .leading) {
                    Text("List")
                        .font(.title3)
                    ListView(items: $items)
                }
                VStack(alignment: .leading) {
                    Text("List – Disclosure")
                        .font(.title3)
                    DisclosureListView(items: $items)
                }
            }
            GridRow {
                VStack(alignment: .leading) {
                    Text("Table")
                        .font(.title3)
                    TableView(items: $items)
                }
                VStack(alignment: .leading) {
                    Text("Table – Disclosure")
                        .font(.title3)
                    DisclosureTableView(items: $items)
                }
            }
        }
        .scenePadding()
    }
}


// MARK: - Preview

#Preview {
    ContentView()
}
