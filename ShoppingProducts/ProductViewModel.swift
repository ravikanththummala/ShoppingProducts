//
//  ProductViewModel.swift
//  ShoppingProducts
//
//  Created by Ravikanth  on 12/11/23.
//

import Foundation

class ProductViewModel: ObservableObject {
    
    @Published var products:[Product] = []
    private let manager = APIManager()
    
    func fetchProducts() async{
        
        do {
            let response:[Product] = try await manager.request(url: "https://fakestoreapi.com/products")
            DispatchQueue.main.async {
                self.products = response

            }
       
        } catch{
            print("Fetch Product error:",error)
        }
    }
}
