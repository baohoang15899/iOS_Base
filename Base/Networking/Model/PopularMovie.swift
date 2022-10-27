//
//  PopularMovie.swift
//  Base
//
//  Created by BaoHoang on 14/10/2022.
//

import Foundation

enum PopularMovie : String, CodingKey {
    case id
    case title
    case date = "release_date"
    case backdropPath = "backdrop_path"
    case posterPath = "poster_path"
}

extension Media {
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: PopularMovie.self)
        id = (try? container?.decodeIfPresent(Int.self, forKey: .id)) ?? 0
        title = try? container?.decodeIfPresent(String.self, forKey: .title)
        posterPath = try? container?.decodeIfPresent(String.self, forKey: .posterPath)
        backdropPath = try? container?.decodeIfPresent(String.self, forKey: .backdropPath)
        releaseDate = try? container?.decodeIfPresent(String.self, forKey: .date)
    }
}
