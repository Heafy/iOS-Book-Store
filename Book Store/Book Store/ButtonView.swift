//
//  ButtonView.swift
//  Book Store
//
//  Created by Jorge Martinez on 05/09/21.
//

import SwiftUI

struct ButtonView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .padding()
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Button text")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

