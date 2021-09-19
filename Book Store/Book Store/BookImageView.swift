//
//  BookImageView.swift
//  Book Store
//
//  Created by Jorge Martinez on 05/09/21.
//

import Kingfisher
import SwiftUI

struct BookImageView: View {
    
    var string: String
    var url: URL? {
        return URL(string: string)
    }
    
    var body: some View {
        if let url = url {
            KFImage(url)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 100)
        } else {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 100)
                .foregroundColor(.accentColor)
        }
    }
}

struct BookImageView_Previews: PreviewProvider {
    static var previews: some View {
        BookImageView(string: "https://raw.githubusercontent.com/ejgteja/files/main/Chanel-%20Collections%20and%20Creations.jpg")
    }
}
