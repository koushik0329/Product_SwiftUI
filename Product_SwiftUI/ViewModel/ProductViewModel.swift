//
//  ProductViewModel.swift
//  SwiftUI_Oct21
//
//  Created by Koushik Reddy Kambham on 10/22/25.
//
import SwiftUI

class ProductViewModel : ObservableObject {
    
    @Published var products : [Products] = []
//    @Published var image : UIImage?
    
    var networkObj : NetworkManager1
    
    init(networkObj: NetworkManager1) {
        self.networkObj = networkObj
    }
    
    func loadData() async {
        products = await networkObj.fetchData(urlString: ProductConstant.productURL.rawValue)
    }
    
//    func loadImage(from urlString : String) async {
//        image = await networkObj.fetchImage(from: urlString)
//    }
}
