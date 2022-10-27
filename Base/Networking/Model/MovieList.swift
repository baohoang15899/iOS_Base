//
//  MovieList.swift
//  Base
//
//  Created by BaoHoang on 14/10/2022.
//

import Foundation

enum PopularMovies : String, CodingKey {
    case results
}

extension MediaList {
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: PopularMovies.self)
        results = try? container?.decodeIfPresent([Media].self, forKey: .results)
    }
}
