//
//  Database.swift
//  BreakingNews
//
//  Created by Aditya Pathak on 04/07/24.
//

import Foundation

final class Database {
    private let FAV_KEY = "fav_key"
    
    func save(items: Set<Articles>) {
        let array = Array(items)
        if let encoded = try? JSONEncoder().encode(array) {
            UserDefaults.standard.set(encoded, forKey: FAV_KEY)
        }
    }
    
    func load() -> Set<Articles> {
        let array = UserDefaults.standard.array(forKey: FAV_KEY) as? [Articles] ?? []
        return Set(array)
    }
}
