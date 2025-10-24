//
//  ProductCardView.swift
//  Product_SwiftUI
//
//  Created by Koushik Reddy Kambham on 10/23/25.
//

import SwiftUI
import Kingfisher

struct ProductCardView : View {
    
    var title : String?
    var price : Double?
    var description : String?
    var imageUrl : String?
    var rating: Rating?
    var imageSize: CGFloat = 100
    var showFullDescription: Bool = false
    
    var body: some View {
        HStack(spacing: 8) {
            if let url = URL(string: imageUrl ?? ""){
                KFImage.url(url)
                    .placeholder {
                        ProgressView()
                        .frame(width: imageSize, height: imageSize)
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize, height: imageSize)
                    .cornerRadius(8)
            }
            VStack{
                Text(title ?? "")
                    .font(.headline)
                
                HStack {
                    Text("$\(String(format: "%.2f", price ?? 0.0))")
                        .font(.subheadline)
                    
                    if let rating = rating, let rate = rating.rate {
                        HStack(spacing: 2) {
                            Image(systemName: "star.fill")
                                .font(.caption)
                                .foregroundColor(.yellow)
                            
                            Text(String(format: "%.1f", rate))
                                .font(.caption)
                        }
                    }
                }
                
                Text(description ?? "")
                    .font(.caption)
                    .lineLimit(showFullDescription ? nil : 2)
            }
            .foregroundColor(.black)
        }
    }
}
