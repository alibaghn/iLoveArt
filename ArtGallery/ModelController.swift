//
//  ModelController.swift
//  SpaceExplorer
//
//  Created by Ali Bagherinia on 11/18/22.
//

import Foundation

class ModelController {
    static let shared = ModelController()
    var searchCat: SearchCategory?
    var searchWord: String?
    var imageId: String?

    func fetchArts() async {
        var url = URL(string: "https://api.artic.edu/api/v1/artworks/search?q=cats")!
        var urlRequest = URLRequest(url: url)
        do {
            var (data, response) = try await URLSession.shared.data(for: urlRequest)
            print("fetched data")
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
            let arts = try JSONDecoder().decode(Arts.self, from: data)
            print(arts.data[0])
            let id = arts.data[0].id
            url = URL(string: "https://api.artic.edu/api/v1/artworks/\(id)")!
            urlRequest = URLRequest(url: url)
            (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
            let artImages = try JSONDecoder().decode(ArtImages.self, from: data)
            imageId=artImages.data.image_id
        } catch {
            print(error)
        }
    }
}

//    var didImageUpdate: (() -> Void)?
//    var dailyImageUrl: String?
//    {
//        didSet {
//            didImageUpdate?()
//        }
//    }

//    let apiKey = "zjxgMLdpTCYXhyU1iyd6U8evISSSM1YTacmOGUgU"
//
//
//    }
