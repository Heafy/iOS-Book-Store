//
//  BookFile.swift
//  Book Store
//
//  Created by Jorge Martinez on 05/09/21.
//

import Foundation

struct Book: Decodable, Hashable {
    
    var isbn: String
    var title: String
    var author: String
    var description: String
    var genre: String
    var img: String
    var imported: Bool
}

struct Results: Decodable {
    
    var results: BooksResults
    
}

struct BooksResults: Decodable {
    
    var books: [Book]
}
