//
//  Double+String.swift
//  ShoppingProducts
//
//  Created by Ravikanth  on 12/11/23.
//

import Foundation


extension Double {
    func toString() -> String{
        return String(format: "%.1f", self)
    }
}

extension Double {
    func currencyFormatr() -> String{
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? ""
    
    }
}
