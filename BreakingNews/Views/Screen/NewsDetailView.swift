//
//  NewsDetailView.swift
//  BreakingNews
//
//  Created by Aditya Pathak on 04/07/24.
//

import SwiftUI

struct NewsDetailView: View {
    var selectedNews: Articles
    var body: some View {
        ScrollView {
            
            NewsImage(image: selectedNews.imageURL)
                .offset(y: 0)
                .padding(.bottom, 0)
            
            
            VStack(alignment: .leading) {
                Text(selectedNews.title)
                    .font(.title)
                HStack {
                    Text(selectedNews.author ?? "")
                    Spacer()
                    Text(selectedNews.source.name)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Divider()
                    .foregroundStyle(.blue)
                
                let date = selectedNews.publishedAt
                
                Text(date, style: .date)
                    .font(.title2)
                    .underline()
                
                Text(selectedNews.description ?? "")
                    .font(.title3)
                
                
            }
            .padding()
        }
        .navigationTitle(selectedNews.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

