//
//  ProductDetailView.swift
//  ShoppingProducts
//
//  Created by Ravikanth  on 12/12/23.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    
    var body: some View {
        VStack(spacing:16){
            AsyncImageView(imageURL: product.image)
                .scaledToFit()
                .frame(height: 300)
            
            
            Text(product.title)
                .font(.headline)
            
            Text(product.description)
                .font(.footnote)
                .foregroundStyle(.secondary)
            
            
            RatingInfoView(rating: product.rating.rate.toString())

            Spacer()
            
            HStack {
                VStack(alignment: .leading, spacing: 8){
                    Text("Total Price")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Text(product.price.currencyFormatr())
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.indigo)
                }
                .padding(.leading)
                
                Spacer()
                
                HStack {
                    Image(systemName: "cart.fill.badge.plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30,height: 30)
                    
                    Text("Buy Now")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(width: 100)
                }
                .foregroundColor(.white)
                .frame(height: 50)
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 15.0)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(stops: [
                                Gradient.Stop(color: .indigo, location: 0.35),
                                Gradient.Stop(color: .indigo, location: 0.1),
                                Gradient.Stop(color: Color(UIColor.darkGray), location: 0.1),
                                Gradient.Stop(color: Color(UIColor.darkGray), location: 0.5)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing)
                    ))
                .padding(.trailing)
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(.gray.opacity(0.2))
            .clipShape(.buttonBorder)
            
                       
        }
        .padding()
    }
    
   
}

#Preview {
    ProductDetailView(product: sampleProduct)
}

struct RatingInfoView: View {
    
    let rating:String
    
    var body: some View {
        HStack {
            
            HStack{
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                
                Text(rating + " " + "Ratings")
                    .foregroundStyle(.secondary)
            }
            .font(.callout)
            Spacer()
            
            circleImage
            Text("4.6 Reviews")
            Spacer()
            
            circleImage
            Text("46k Sold")
        }
        .foregroundStyle(.secondary)
        .font(.callout)
    }
    
    var circleImage: some View {
        Image(systemName: "circle.fill")
            .resizable()
            .frame(width: 8,height: 8)
    }
}
