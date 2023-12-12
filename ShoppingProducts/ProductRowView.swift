//
//  ProductRowView.swift
//  ShoppingProducts
//
//  Created by Ravikanth  on 12/11/23.
//

import SwiftUI

struct ProductRowView: View {
    let product:Product
    var body: some View {
        
        HStack(spacing: 8){
            if let url = URL(string: product.image){
                productInage(url: url)
            }
            
            VStack(alignment: .leading,spacing: 8){
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)
                
                HStack {
                
                    Text(product.category)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "star.fill")
                        Text(product.rating.rate.toString())
                    }
                    .fontWeight(.medium)
                    .foregroundStyle(.yellow)
                }
                
                Text(product.description)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
                
               // Price
                
                HStack{
                    Text(product.price.currencyFormatr())
                        .font(.title3)
                        .foregroundStyle(.indigo)
                    
                    Spacer()
                    
                    buyButton
                }
                
                
            }
        }
        .padding()
        
       
    }
    
    func productInage(url:URL) -> some View {
        AsyncImage(url: url) { image in
            image.resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView("Loading")
        }
        .frame(width: 100,height: 100)
    }
    
    var buyButton: some View {
        Button(action: {
            
        }, label: {
            Text("Buy")
                .foregroundStyle(.white)
                .padding(.horizontal)
                .padding(.vertical,8)
                .background(.indigo)
                .clipShape(.capsule)
        })
    }
}

#Preview {
    ProductRowView(product: sampleProduct)
}

let rate = Rate(rate: 3.9, count: 120)

let sampleProduct = Product(id: 1, title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", category: "men's clothing", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", price: 109.95, rating: rate)




