//
//  Model.swift
//  SpaceExplorer
//
//  Created by Ali Bagherinia on 11/19/22.
//

import Foundation

enum SearchCategory {
    case Artist, Artworks
}

struct Arts: Codable {
    let data: [ArtPieceData]
}

struct ArtPieceData: Codable {
    let id: Int
}

struct ArtImages:Codable {
    let data: ArtImageData
}

struct ArtImageData:Codable {
    let image_id: String
}
