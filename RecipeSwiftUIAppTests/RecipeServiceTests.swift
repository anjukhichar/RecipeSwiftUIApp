//
//  RecipeServiceTests.swift
//  RecipeSwiftUIAppTests
//
//  Created by Anju Khichar on 10/8/24.
//

import XCTest
@testable import RecipeSwiftUIApp

final class RecipeServiceTests: XCTestCase {
    
    var recipeService: RecipeService!
    
    override func setUp() {
        super.setUp()
        recipeService = RecipeService()
    }
    
    override func tearDown() {
        recipeService = nil
        super.tearDown()
    }
    
    
    func testFetchRecipesSuccess() async throws {
        // Assuming you have a valid API key and URL
        do {
            let recipes = try await recipeService.fetchRecipes()
            XCTAssertNotNil(recipes)
            XCTAssertGreaterThan(recipes.count, 0)
        } catch {
            XCTFail("Fetching recipes failed: \(error)")
        }
    }
    
    
    func testFetchRecipesFailure() async {
        
        recipeService = RecipeService()
        
        await recipeService.copyUrlString(from: "https://d3jbb8n5wk0qxi.cloudfront.net/recipe.json")
        do {
            let _ = try await recipeService.fetchRecipes()
            XCTFail("Expected to fail, but succeeded")
        } catch {
            XCTAssertTrue(true, "Failed as expected")
        }
    }
    
    func testFetchReceipesWithMalformed() async throws {
        
        recipeService = RecipeService()
        
        await recipeService.copyUrlString(from: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")
        do {
            let recipes = try await recipeService.fetchRecipes()
            XCTAssertNotNil(recipes)
            XCTAssertGreaterThan(recipes.count, 0)
        } catch {
            XCTFail("Fetching recipes failed: \(error)")
        }
    }
}

