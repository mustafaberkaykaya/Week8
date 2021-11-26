//
//  APIResponse.swift
//  Week8
//
//  Created by Mustafa Berkay Kaya on 25.11.2021.
//

import Foundation
struct APIResponse: Codable {
    let total: Int
    let totalPages: Int
    let results: [Result]
    
    private enum CodingKeys: String, CodingKey {
          case total,
               totalPages = "total_pages",
               results
      }
}
