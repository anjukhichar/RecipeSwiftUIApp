//
//  RecipeService.swift
//  RecipeSwiftUIApp
//
//  Created by Anju Khichar on 10/8/24.
//

import Foundation

actor RecipeService {
    
    var urlString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    
    func copyUrlString(from other: String) {
        urlString = other
    }
    
    func fetchRecipes() async throws -> [Recipe] {
        guard let url = URL(string: urlString) else {
                throw URLError(.badURL)
            }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedRecipes = try JSONDecoder().decode(Recipes.self, from: data)
            return decodedRecipes.recipes
        }
}
