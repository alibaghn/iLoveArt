//
//  ModelController.swift
//  SpaceExplorer
//
//  Created by Ali Bagherinia on 11/18/22.
//

import UIKit

class ModelController {
    static let shared = ModelController()
    var searchWord: String!
    var artIds: [Int] = []
    var imageData: [ArtImageData] = []
    var images: [UIImage] = []
    

    func reset() {
        searchWord = nil
        artIds = []
        imageData = []
        images = []
    }

    func fetchArts() async {
        let url = URL(string: "https://api.artic.edu/api/v1/artworks/search?q=\(searchWord!)&fields=id&limit=25")!
        let urlRequest = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
            let arts = try JSONDecoder().decode(Arts.self, from: data)
            artIds =
                arts.data.map { artPieceData in
                    artPieceData.id
                }

        } catch {
            print(error)
        }

        for id in artIds {
            do {
                let url = URL(string: "https://api.artic.edu/api/v1/artworks/\(id)?fields=title,artist_display,date_display,style_title,image_id")!
                let urlRequest = URLRequest(url: url)
                let (data, response) = try await URLSession.shared.data(for: urlRequest)
                guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
                let artImages = try JSONDecoder().decode(ArtImages.self, from: data)
                imageData.append(artImages.data)
            } catch {
                print(error)
            }
        }
    }

    func loadImages() async {
        for item in imageData {
            let url = URL(string: "https://www.artic.edu/iiif/2/\(item.image_id)/full/843,/0/default.jpg")!
            do {
                let urlRequest = URLRequest(url: url)
                let (data, response) = try await URLSession.shared.data(for: urlRequest)
                guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
                if let newImage = UIImage(data: data) {
                    images.append(newImage)
                }

            } catch {
                print("error: \(error)")
            }
        }
    }
}
