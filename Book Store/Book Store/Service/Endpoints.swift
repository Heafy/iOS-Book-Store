//
//  Endpoints.swift
//  Book Store
//
//  Created by Jorge Martinez on 05/09/21.
//

import Foundation

enum Endpoints {
    
    case books
    case bestSellers
}

extension Endpoints: URLBuilder {
    
    var url: URL {
        switch self {
        case .books:
            return getURL(from: "https://raw.githubusercontent.com/ejgteja/files/main/books.json")
        case .bestSellers:
            return getURL(from: "https://raw.githubusercontent.com/ejgteja/files/main/best_sellers.json")
        }
        
    }
    
    /// Función para crear un URL a partir de la String recibido
    /// - Parameter path: URL en forma de String
    /// - Returns: Una URL para consumir, fallo en otro caso
    private func getURL(from path: String) -> URL {
        guard let url = URL(string: path) else {
            preconditionFailure("Invalid URL format")
        }
        return url
    }
}
