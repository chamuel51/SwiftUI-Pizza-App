//
//  MenuView2.swift
//  HuliPizza
//
//  Created by chamuel castillo on 10/31/23.
//

import SwiftUI

struct MenuView2: View {
    var menu: [MenuItem]
    @State private var selectedItem: MenuItem? = nil
    
    var body: some View {
        NavigationSplitView {
            List(menu, selection: $selectedItem) { item in
                NavigationLink(value: item){
                    MenuRowView(item: item)
                }
            }
        } detail: {
            MenuDetailView(item: $selectedItem)
        }
    }
}

#Preview {
    MenuView2(menu: MenuModel().menu)
}
