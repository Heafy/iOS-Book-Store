//
//  BooksView.swift
//  Book Store
//
//  Created by Jorge Martinez on 05/09/21.
//

import SwiftUI

struct BooksView: View {
    
    @ObservedObject var viewModel = BooksViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack {
                    
                    if !viewModel.isShowingAll {
                        Button(action: {
                            viewModel.filterBooks(by: .all)
                        }, label: {
                            ButtonView(text: Genre.all.rawValue)
                        })
                    }
                    
                    Button(action: {
                        viewModel.filterBooks(by: .history)
                    }, label: {
                        ButtonView(text: Genre.history.rawValue)
                    })
                    
                    Button(action: {
                        viewModel.filterBooks(by: .science)
                    }, label: {
                        ButtonView(text: Genre.science.rawValue)
                    })
                    
                    Button(action: {
                        viewModel.filterBooks(by: .history)
                    }, label: {
                        ButtonView(text: Genre.business.rawValue)
                    })
                }
                
                HStack {
                    Text("Best sellers")
                        .font(.title3)
                    Spacer()
                    Text("Books: \(viewModel.selected.count)")
                        .font(.footnote)
                }
                .padding()
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.bestSellers, id: \.self) {
                            i in
                            BookImageView(string: i.img)
                            Divider()
                        }
                    }
                }
                .frame(height: 80)
                .padding()
                
                List {
                    ForEach(viewModel.selected, id: \.self) {
                        book in
                        BookRowView(book: book)
                    } //: ForEach
                } //: List
            } //: VStack
            .onAppear {
                viewModel.requestBooks()
            }
            .navigationBarTitle("Books", displayMode: .automatic)
        } //: NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView()
    }
}
