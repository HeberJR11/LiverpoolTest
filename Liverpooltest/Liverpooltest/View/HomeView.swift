//
//  ContentView.swift
//  Liverpooltest
//
//  Created by NinoDev on 28/02/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = ProductViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                if vm.isLoading {
                    ProgressView("Cargando Datos...")
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity)
                } else {
                    
                    List(vm.products, id: \.productId) { product in
                        
                        ProductitemView(product: product)
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            
            Task {
                await vm.getProducts(category: "electronica")
            }
        }
    }
}


#Preview {
    HomeView()
}
