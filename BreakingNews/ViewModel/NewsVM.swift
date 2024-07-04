//
//  NewsVM.swift
//  BreakingNews
//
//  Created by Aditya Pathak on 04/07/24.
//

import Foundation
import SwiftUI

class NewsVM: ObservableObject {
    //@Published private(set) var articles: [Articles] = []
    @Published var articles: [Articles] = []
    @Published var showingFavs = false
    @Published var savedItems: Set<Articles> = []
    
    var filteredItems:[Articles] {
        if showingFavs {
            return articles.filter { news in
                savedItems.contains(news)
            }
        }else {
            return articles
        }
    }
    
    private var db = Database()
    
    init() {
        Task.init {
            await getBreakingNews()
        }
    }
    
    func showFav() {
        self.savedItems = db.load()
        self.articles = self.savedItems.array
    }
    func sortFavs() {
        withAnimation {
            showingFavs.toggle()
        }
    }
    
    func contains(_ item:Articles) -> Bool {
        savedItems.contains(item)
    }
    
    func toggleFav(item: Articles) {
        if contains(item) {
            savedItems.remove(item)//remove
        }else {
            savedItems.insert(item)
        }
        //save
        db.save(items: savedItems)
    }
    
    
    @MainActor
    func getBreakingNews() async {
        do {
            guard let apiUrl = URL(string: "https://newsapi.org/v2/top-headlines?country=in&apiKey=75505e20cfa546efa71211832dd8e9f0") else { fatalError("Missing URL") }
            
            let urlRequest = URLRequest(url: apiUrl)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)

            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                //failure
                fatalError("Error while fetching data")
            }
            //success-decode
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let decodedData = try decoder.decode(NewsAPIResponse.self, from: data)
            
            if let newsList = decodedData.articles{
                self.articles = []
                self.articles.append(contentsOf: newsList)
            }
        }
        catch {
            print("Error fetching data from News org: \(error)")
        }
    }
}

extension Set {
    var array: [Element] {
        return Array(self)
    }
}
