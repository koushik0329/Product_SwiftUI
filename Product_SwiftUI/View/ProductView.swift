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
                        RowView(product : product)
                    }
                }
            }
            .navigationDestination(for: Products.self, destination: { product in
                DetailsView(product : product)
            })
            .task {
                await viewModel.loadData()
            }
            .navigationTitle("Products")
        }
    }
}

struct RowView : View {
    var product: Products
    
    var body: some View {
        HStack{
            ProductCardView(
                title: product.title, price: product.price, description: product.description, imageUrl: product.image, rating: product.rating, imageSize: 80, showFullDescription: false
            )
        }
    }
}

#Preview {
    ProductView(viewModel: ProductViewModel(networkObj: NetworkManager1.shared))
}
