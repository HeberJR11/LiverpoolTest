//
//  ProductitemView.swift
//  Liverpooltest
//
//  Created by NinoDev on 28/02/24.
//

import SwiftUI

struct ProductitemView: View {
    
    var product: Product?
    
    var body: some View {
        
        if let produc = product {
            
            HStack {
                
                AsyncImage(url: URL(string: produc.xlImage)) { phase in
                    
                    switch phase {
                        
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    case .failure(_):
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    case .empty:
                        ProgressView("Cargando Imagen...")
                            .frame(maxWidth: .infinity)
                            .frame(maxHeight: .infinity)
                        
                    @unknown default:
                        ProgressView("Cargando...")
                            .frame(maxWidth: .infinity)
                            .frame(maxHeight: .infinity)
                    }
                }
                .padding()
                
                VStack(alignment: .leading) {
                    
                    Text(produc.productDisplayName)
                    
                    Text("$\(String(produc.listPrice))")
                        .foregroundStyle(Color.theme.listPriceColor)
                    
                    Text("$\(produc.promoPrice.asNumberString())")
                        .foregroundStyle(Color.theme.promoPriceColor)
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                
            }
        } 
    }
}

#Preview {
    ProductitemView()
}
