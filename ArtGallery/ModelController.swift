//
//  ModelController.swift
//  SpaceExplorer
//
//  Created by Ali Bagherinia on 11/18/22.
//

import UIKit

class ModelController {
    static let shared = ModelController()
    var searchCat: SearchCategory?
    var searchWord: String?
    var artIds: [Int] = []
    var imageIds: [String] = []
    var images:[UIImage] = []

    func fetchArts() async {
        let url = URL(string: "https://api.artic.edu/api/v1/artworks/search?q=cats")!
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
                let url = URL(string: "https://api.artic.edu/api/v1/artworks/\(id)")!
                let urlRequest = URLRequest(url: url)
                let (data, response) = try await URLSession.shared.data(for: urlRequest)
                guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
                let artImages = try JSONDecoder().decode(ArtImages.self, from: data)
                imageIds.append(artImages.data.image_id)
                
            }
            catch{
                print(error)
            }
        }
//        print(imageIds)

//        artIds.forEach { id in
//            Task {
//                let url = URL(string: "https://api.artic.edu/api/v1/artworks/\(id)")!
//                let urlRequest = URLRequest(url: url)
//                let (data, response) = try await URLSession.shared.data(for: urlRequest)
//                guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
//                let artImages = try JSONDecoder().decode(ArtImages.self, from: data)
//                imageIds.append(artImages.data.image_id)
//                print(imageIds)
//            }
//        }
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
