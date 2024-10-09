//
//  Recipe.swift
//  RecipeSwiftUIApp
//
//  Created by Anju Khichar on 10/8/24.
//

import Foundation

struct Recipes : Identifiable, Codable {
    var id = UUID()
    var recipes : [Recipe]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        recipes = try container.decodeIfPresent([Recipe].self, forKey: .recipes) ?? []
    }
}

struct Recipe: Identifiable, Codable {
    var id = UUID()
    var cuisine: String
    var name: String
    var photo_url_large: String
    var photo_url_small: String
    
    enum CodingKeys: String, CodingKey {
            case cuisine, name, photo_url_large, photo_url_small
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            cuisine = try container.decode(String.self, forKey: .cuisine)
            name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
            photo_url_large = try container.decodeIfPresent(String.self, forKey: .photo_url_large) ?? ""
            photo_url_small = try container.decodeIfPresent(String.self, forKey: .photo_url_small) ?? ""  // Default value if key is missing
        }
}
