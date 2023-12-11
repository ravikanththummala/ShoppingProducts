//
//  ProductView.swift
//  ShoppingProducts
//
//  Created by Ravikanth  on 12/11/23.
//

import SwiftUI

struct  ProductView: View {
    
    @StateObject var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.products){ product in
                    ProductRowView(product: product)
                }
            }
            .navigationTitle("Products")
            .task {
                await viewModel.fetchProducts()
            }
        }
    }
}

#Preview {
    ProductView()
}
