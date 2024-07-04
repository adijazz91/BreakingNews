//
//  NewsListView.swift
//  BreakingNews
//
//  Created by Aditya Pathak on 04/07/24.
//

import SwiftUI

struct NewsListView: View {
    @StateObject private var viewModel = NewsVM()
    @State private var showFavoritesOnly = false
    var navigationTitle = "Breaking News"

    var body: some View {
        NavigationSplitView {
            VStack {
                List {
                    Toggle("Show Favourite only", isOn: $showFavoritesOnly)
                        .onChange(of: showFavoritesOnly, initial: false) {
                            viewModel.sortFavs()
                        }
                    ForEach(viewModel.filteredItems) { item in
                        NavigationLink {
                            NewsDetailView(selectedNews: item)
                        }label: {
                            HStack {
                                NewsImage(image: item.imageURL)
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .font(.headline)
                                        .lineLimit(2)
                                    Text(item.descriptionText)
                                        .font(.subheadline)
                                        .lineLimit(2)
                                }
                                Spacer()
                                PlaceHolderImage(sysimageName: viewModel.contains(item) ? "heart.fill" : "heart", imageName: nil)
                                    .foregroundColor(.red)
                                    .onTapGesture {
                                        viewModel.toggleFav(item: item)
                                    }
                            }
                        }
                        
                    }
                }
                .presentationCornerRadius(10)
                .animation(.default, value: viewModel.articles)
                .navigationTitle(navigationTitle)
            }
        }detail: {
            Text("News")
        }
        
        
        /*NavigationSplitView {

            List {
                
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Show Favourite only")
                })
                
                ForEach(viewModel.articles) { singlenews in
                    NavigationLink {
                        NewsDetailView(selectedNews: singlenews)
                    } label: {
                        BrowseRow(news: singlenews)
                    }
                }
            }
            .presentationCornerRadius(10)
            .animation(.default, value: viewModel.articles)
            .navigationTitle("News")
        } detail: {
            Text("Select a News")
        }*/
        /*NavigationView {
            List{
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Show Favourite only")
                })
                
                ForEach(filteredNews) { singleNews in
                    NavigationLink {
                        LandmarkDetail(landmark: singleNews)
                    } label: {
                        LandmarkRow(landmark: singleNews)
                    }
                }
            }
//                List(viewModel.articles) { article in
//                    NavigationLink {
//                        NewsDetailView(selectedNews: article)
//                    } label: {
//                        BrowseRow(news: article)
//                    }
//                }
//            .navigationTitle(navigationTitle)
        }*/
    }
}

#Preview {
    NewsListView()
}
