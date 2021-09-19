//
//  BooksViewModel.swift
//  Book Store
//
//  Created by Jorge Martinez on 05/09/21.
//

import Combine
import Foundation

class BooksViewModel: ObservableObject {
    
    var all: [Book] = []
    @Published var selected: [Book] = []
    @Published var bestSellers: [Book] = []
    @Published var selectedGenre: Genre = Genre.all
    @Published var isShowingAll: Bool = true
    private var cancellables = Set<AnyCancellable>()
    
    func requestBooks() {
        URLSession.shared.dataTaskPublisher(for: Endpoints.books.url)
        .receive(on: DispatchQueue.main)
        .map { $0.data }
        .decode(type: Results.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
            .sink(receiveCompletion: {
                result in
            }, receiveValue: {
                (response) in
                self.all = response.results.books
                self.selected = response.results.books
                self.requestBestSellers()
            }).store(in: &cancellables)
    }
    
    func requestBestSellers() {
        URLSession.shared.dataTaskPublisher(for: Endpoints.bestSellers.url)
        .receive(on: DispatchQueue.main)
        .map { $0.data }
        .decode(type: BestSellers.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
            .sink(receiveCompletion: {
                result in
            }, receiveValue: {
                (response) in
                var bestSellers: [Book] = []
                for isbn in response.results.best_sellers {
                    let book = self.all.first(where: { $0.isbn == isbn })
                    if let book = book {
                        bestSellers.append(book)
                    }
                }
                self.bestSellers = bestSellers
            }).store(in: &cancellables)
    }
    
    func filterBooks(by genre: Genre) {
        selectedGenre = genre
        if genre == .all {
            isShowingAll = true
            selected = all
        } else {
            isShowingAll = false
            let filtered = all.filter({ $0.genre == genre.rawValue })
            selected = filtered
        }
    }
}
