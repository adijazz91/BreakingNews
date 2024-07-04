//
//  Articles.swift
//  BreakingNews
//
//  Created by Aditya Pathak on 04/07/24.
//

import Foundation

struct Articles {
    let source: Source
    let title: String
    let url: String
    let publishedAt: Date
    let author: String?
    let description: String?
    let urlToImage: String?
    var authorText: String {
        author ?? ""
    }
    
    var descriptionText: String {
        description ?? ""
    }
    var articleURL: URL {
        URL (string: url)!
    }
    var imageURL: URL? {
        guard let urlToImage = urlToImage else {
            return nil
        }
        return URL(string: urlToImage)
    }
    var isFavorite: Bool? = false

}
extension Articles: Hashable {
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    public static func == (lhs: Articles, rhs: Articles) -> Bool {
        return lhs.id == rhs.id
    }
}
extension Articles: Codable {}
extension Articles: Equatable {}
extension Articles: Identifiable {
    var id: String { url }
}

struct Source {
    let name: String
}

extension Source: Codable {}
extension Source: Equatable {}
