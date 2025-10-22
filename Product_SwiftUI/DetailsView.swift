//
//  DetailsView.swift
//  Product_SwiftUI
//
//  Created by Koushik Reddy Kambham on 10/22/25.
//

import SwiftUI

struct DetailsView : View {
    
    var id : Int?
    var title : String?
    var price : Double?
    var description : String?
    var imageUrl : String?
    var rating: Rating?
    
    @State private var image: UIImage?
    
    var body: some View {
        VStack {
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
            }
           
            VStack {
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
            }
            .padding()
        }
        .task {
            await loadImage()
        }
    }
    
    private func loadImage() async {
        guard let urlString = imageUrl, !urlString.isEmpty else
        { return }
        image = await NetworkManager1.shared.fetchImage(from: urlString)
    }
}
