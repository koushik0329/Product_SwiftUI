//
//  ProductView.swift
//  SwiftUI_Oct21
//
//  Created by Koushik Reddy Kambham on 10/22/25.
//

import SwiftUI

struct ProductView : View {
    
    @ObservedObject var viewModel : ProductViewModel
    
    @State var path = NavigationPath()
    
    init(viewModel: ProductViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List(viewModel.products, id: \.self) { product in
                    Button {
                        path.append(product)
                    } label: {
                        RowView(id: product.id, title: product.title, price: product.price, description: product.description, imageUrl: product.image, rating: product.rating)
                    }
                }
            }
            .navigationDestination(for: Products.self, destination: { product in
                DetailsView(id: product.id, title: product.title, price: product.price, description: product.description, imageUrl: product.image, rating: product.rating)
            })
            .task {
                await viewModel.loadData()
            }
            .navigationTitle("Products")
        }
    }
}

struct RowView : View {
    
    var id : Int?
    var title : String?
    var price : Double?
    var description : String?
    var imageUrl : String?
    var rating: Rating?
    
    @State private var image: UIImage?
    
    var body: some View {
        HStack {
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
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
                    .lineLimit(2)
            }
            .foregroundColor(.black)
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

#Preview {
    ProductView(viewModel: ProductViewModel(networkObj: NetworkManager1.shared))
}
