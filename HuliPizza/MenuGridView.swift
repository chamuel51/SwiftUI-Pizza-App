//
//  MenuGridView.swift
//  HuliPizza
//
//  Created by chamuel castillo on 10/27/23.
//

import SwiftUI

struct MenuGridView: View {
    func menu(id: Int) -> MenuItem {
        menu.first(where: {$0.id == id}) ?? noMenuItem
    }
    var menu: [MenuItem]
    @State var selectedItem: MenuItem = noMenuItem
    let columnLayout = Array(repeating: GridItem(), count: 3)
    var columnLayout2 = Array(repeating: GridItem(), count: 5)
    @State var favorites: [Int] = [-1]
    @Namespace private var nspace
    var body: some View {
        VStack{
            Text(selectedItem.name)
            LazyVGrid(columns: columnLayout2) {
                ForEach(favorites.sorted(), id: \.self) {
                    item in FavoriteTileView(menuItem: menu(id: item))
                        .matchedGeometryEffect(id: item, in: nspace)
                        .onLongPressGesture {
                            if let index = favorites.firstIndex(where: {$0 == item}) {
                                favorites.remove(at: index)
                            }
                        }
                }
            }
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(menu) {item in
                        if !favorites.contains(item.id){
                            MenuItemTileView(menuItem: item)
                                .animation(.easeOut, value: favorites)
                                .matchedGeometryEffect(id: item.id, in: nspace)
                                .onTapGesture(count: 2) {
                                    if !favorites.contains(item.id) {
                                        withAnimation(.easeInOut) {
                                            favorites.append(item.id)
                                        }
                                    }
                                }
                                .onTapGesture {
                                    
                                    selectedItem = item
                                }
                                .onLongPressGesture {
                                    selectedItem = noMenuItem
                                }
                        }
                    }
                }
            }
        }
        .animation(.easeOut, value: favorites)
    }
}

#Preview {
    MenuGridView(menu: MenuModel().menu)
}
