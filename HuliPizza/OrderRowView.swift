//
//  OrderRowView.swift
//  HuliPizza
//
//  Created by chamuel castillo on 10/5/23.
//

import SwiftUI

struct OrderRowView: View {
    @Binding var order: OrderItem
    var body: some View {
        VStack(alignment:.leading) {
            HStack {
                Text(order.item.name)
                Text("- " + order.preferredCrust.rawValue)
                if order.extraIngredients {
                    Image(systemName: "2.circle")
                }
                Spacer()
                Text(order.name)
            }
            
            HStack(alignment : .firstTextBaseline){
                Text(order.quantity, format: .number)
                Text(order.item.price, format: .currency(code: "USD"))
                Spacer()
                Text(order.extPrice, format: .currency(code: "USD"))
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    OrderRowView(order: .constant(testOrderItem))
}
