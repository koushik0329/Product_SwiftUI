//
//  DetailsView.swift
//  Product_SwiftUI
//
//  Created by Koushik Reddy Kambham on 10/22/25.
//

import SwiftUI

struct DetailsView: View {
    var product: Products
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ProductCardView(
                    title: product.title,
                    price: product.price,
                    description: product.description,
                    imageUrl: product.image,
                    rating: product.rating,
                    imageSize: 250,
                    showFullDescription: true
                )
            }
            .padding()
        }
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

