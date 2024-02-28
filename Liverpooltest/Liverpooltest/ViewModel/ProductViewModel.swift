//
//  ProductViewModel.swift
//  Liverpooltest
//
//  Created by NinoDev on 28/02/24.
//

import Foundation
import Combine
import SwiftUI

@MainActor
class ProductViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var image: UIImage?
    
    @Published  var isLoading = false
    
    func getProducts(category: String) async {
        
        self.isLoading = true
        do {
            guard let url = URL(string: "https://shoppapp.liverpool.com.mx/appclienteservices/services/v7/plp/sf?page-number=1&search-string=\(category)&force-plp=false&number-of-items-per-page=40&cleanProductName=false") else {
                print("URL inválida")
                return
            }
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard response == response else { return }

//            print("LA RESPONSE ES: \(response)")
//            guard data == data else {return}
//            print("LA DATA ES: \(data)")
//            
//            if let dataText = String(data: data, encoding: .utf8) {
//                print("La respuesta es: \(dataText)")
//            }
            
            guard let productsResponse = try? JSONDecoder().decode(ResponseModel.self, from: data) else {
                print("Error al decodificar la respuesta de productsResponse ")
                return
            }
            
            self.products = productsResponse.plpResults.records            
        } catch {
            print("Error al hacer post de productsResponse", error.localizedDescription)
        }
        self.isLoading = false
    }
    
//    func downloadImage(from url: String) async {
//        
//        self.isLoading = true
//        do {
//            guard let url = URL(string: url) else {
//                print("URL inválida")
//                return
//            }
//            let (data, response) = try await URLSession.shared.data(from: url)
//            
//            guard response == response else { return }
//            
//            if let image = UIImage(data: data) {
//                
//                self.image = image
//            }
//            
//        } catch {
//            print("Error al hacer post de listar anuncios", error.localizedDescription)
//        }
//        self.isLoading = false
//        print("Ya termine de listar aanuncios")
//    }

}
