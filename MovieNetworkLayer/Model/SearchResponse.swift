//
//  SearchResponse.swift
//  MoyaExample
//

// MARK: - SearchResponse
struct SearchResponse: Codable {
    let page, totalResults, totalPages: Int?
    let results: [MovieResult]?

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}
