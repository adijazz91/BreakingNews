//
//  NewsImage.swift
//  BreakingNews
//
//  Created by Aditya Pathak on 04/07/24.
//

import SwiftUI

struct NewsImage: View {
    var image: URL?
    var body: some View {
        if let imgurl = image {
            AsyncImage(
                url: imgurl,
                content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .transition(.opacity)
                            .imageScale(.small)
                },
                placeholder: {
                    //ProgressView()
                    HStack {
                        Spacer()
                        PlaceHolderImage(sysimageName: nil, imageName: "noimage")
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100, maxHeight: 60)
                        Spacer()
                    }
                }
            )
        }else {
            HStack {
                Spacer()
                PlaceHolderImage(sysimageName: nil, imageName: "noimage")
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 100, maxHeight: 60)
                Spacer()
            }
        }
    }
}

//#Preview {
//    NewsImage(image: Image("noimage"))
//}
