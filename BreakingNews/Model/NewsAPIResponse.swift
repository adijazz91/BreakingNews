//
//  NewsAPIResponse.swift
//  BreakingNews
//
//  Created by Aditya Pathak on 04/07/24.
//

import Foundation

struct NewsAPIResponse: Decodable {
    let status: String
    let totalResults: Int?
    let articles: [Articles]?
}
