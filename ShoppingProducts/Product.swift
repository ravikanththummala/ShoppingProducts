//
//  Product.swift
//  ShoppingProducts
//
//  Created by Ravikanth  on 12/11/23.
//

import Foundation

struct Product: Decodable,Identifiable {
    let id:Int
    let title,description,category,image:String
    let price:Double
    let rating: Rate
}

struct Rate: Decodable {
    let rate:Double
    let count:Int
}

