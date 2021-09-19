//
//  BookRowView.swift
//  Book Store
//
//  Created by Jorge Martinez on 05/09/21.
//

import SwiftUI

struct BookRowView: View {
    
    var book: Book
    
    var body: some View {
        HStack {
            BookImageView(string: book.img)
            VStack {
                Text(book.title)
                    .font(.headline)
                
                Text(book.author)
                    .font(.subheadline)
            }
            
        }
    }
}

struct BookRowView_Previews: PreviewProvider {
    static var previews: some View {
        BookRowView(book: Book(isbn: "", title: "Title Book", author: "Author Book", description: "Description Book", genre: "Genre Book", img: "IMG Book", imported: true))
    }
}
