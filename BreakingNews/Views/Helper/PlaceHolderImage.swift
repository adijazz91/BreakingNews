//
//  PlaceHolderImage.swift
//  BreakingNews
//
//  Created by Aditya Pathak on 04/07/24.
//

import SwiftUI

struct PlaceHolderImage: View {
    var sysimageName: String?
    var imageName: String?
    
    var body: some View {
        if let img = sysimageName{
            Image(systemName: img)
        }
        if let imgasset = imageName{
            Image(imgasset, bundle: nil)
        }
    }
}

//#Preview {
//    PlaceHolderImage(imageName: "noimage")
//}
