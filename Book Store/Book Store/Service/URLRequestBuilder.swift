//
//  URLRequestBuilder.swift
//  Book Store
//
//  Created by Jorge Martinez on 05/09/21.
//

import Foundation

// Métodos HTTP
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

// Protocolo para asegurar que los Endpoints estan ligados a un URL
protocol URLBuilder {
    var url: URL {get}
}

