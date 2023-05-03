//
//  PokemonImageView.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/04.
//

import SwiftUI

struct PokemonImageView: View {
    let imageUrl: URL?

      var body: some View {
          if let imageUrl = imageUrl,
                let imageData = try? Data(contentsOf: imageUrl) {
              return Image(uiImage: UIImage(data: imageData)!)
                  .resizable()
                  .aspectRatio(contentMode: .fit)
          } else {
              return Image(systemName: "questionmark.circle")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
          }
      }
}

struct PokemonImageView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImageView(imageUrl: nil)
    }
}
