//
//  CircleGridView.swift
//  HuliPizza
//
//  Created by Steven Lipton on 11/17/22.
//

import SwiftUI

struct FavoriteTileView: View {
    var menuItem:MenuItem
    var body: some View{
        VStack{
             Group{
                if let image = UIImage(named:"\(menuItem.id)_sm"){
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                } else {
                    Image("surfboard_lg")
                        .resizable()
                        .scaledToFit()
                        
                        
                }
            }
             .clipShape(Capsule())
             .shadow(radius: 3,x: 2,y: 2)
            Text(menuItem.name).font(.caption2)
                .padding(5)
                .background(.regularMaterial)
        }
        
       
    }
}

struct FavoriteTileView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteTileView(menuItem: testMenuItem)
    }
}
