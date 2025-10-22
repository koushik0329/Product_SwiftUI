//
//  Products.swift
//  SwiftUI_Oct21
//
//  Created by Koushik Reddy Kambham on 10/22/25.
//

//{
//    "id": 1,
//    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
//    "price": 109.95,
//    "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
//    "category": "men's clothing",
//    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
//    "rating": {
//      "rate": 3.9,
//      "count": 120
//    }
//  }

import Foundation

struct Products : Decodable , Hashable {
    var id : Int?
    var title : String?
    var price : Double?
    var description : String?
    var image : String?
    var rating : Rating?
}

struct Rating : Decodable, Hashable {
    var rate : Float?
    var count : Int?
}
