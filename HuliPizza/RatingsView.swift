//
//  RatingsView.swift
//  HuliPizza
//
//  Created by chamuel castillo on 10/10/23.
//

import SwiftUI

struct RatingsView: View {
    var rating: Int
    var body: some View {
        HStack{
            ForEach(1...6, id:\.self){circle in
                Image(systemName: circle <= rating ? "fork.knife.circle.fill" : "circle")

            }
        }
    }
}

#Preview {
    RatingsView(rating: 5)
}
