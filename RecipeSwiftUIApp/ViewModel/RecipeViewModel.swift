//
//  RecipeViewModel.swift
//  RecipeSwiftUIApp
//
//  Created by Anju Khichar on 10/8/24.
//

import SwiftUI
import Combine

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    private let recipeService = RecipeService()
    
    func loadRecipes() async {
        do {
            let fetchedRecipes = try await recipeService.fetchRecipes()
            recipes = fetchedRecipes
        } catch {
            print("Error fetching recipes: \(error)")
        }
    }
}
