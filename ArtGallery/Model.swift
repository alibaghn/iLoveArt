//
//  Model.swift
//  SpaceExplorer
//
//  Created by Ali Bagherinia on 11/19/22.
//

import Foundation

struct Arts: Codable {
    let data: [ArtPieceData]
}

struct ArtPieceData: Codable {
    let id: Int
}

struct ArtImages: Codable {
    let data: ArtImageData
}

struct ArtImageData: Codable {
    let image_id: String
    let title: String
    let artist_display: String
    let date_display: String
    let style_title: String
}
