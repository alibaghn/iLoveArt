//
//  ModelController.swift
//  SpaceExplorer
//
//  Created by Ali Bagherinia on 11/18/22.
//

import Foundation

class ModelController {
    static let shared = ModelController()
//    var didImageUpdate: (() -> Void)?
//    var dailyImageUrl: String?
//    {
//        didSet {
//            didImageUpdate?()
//        }
//    }

//    let apiKey = "zjxgMLdpTCYXhyU1iyd6U8evISSSM1YTacmOGUgU"
//
//    func fetchDailyImage() async {
//        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=\(apiKey)")!
//        let urlRequest = URLRequest(url: url)
//        do {
//            let (data, response) = try await URLSession.shared.data(for: urlRequest)
//            print("fetched data")
//            guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
//            let space = try JSONDecoder().decode(Museum.self, from: data)
//            dailyImageUrl = space.url
//        } catch {
//            print(error)
//        }
//    }
}
