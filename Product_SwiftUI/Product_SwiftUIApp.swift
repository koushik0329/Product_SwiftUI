//
//  Product_SwiftUIApp.swift
//  Product_SwiftUI
//
//  Created by Koushik Reddy Kambham on 10/22/25.
//

import SwiftUI

@main
struct Product_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ProductView(viewModel: ProductViewModel(networkObj: NetworkManager1.shared))
        }
    }
}
