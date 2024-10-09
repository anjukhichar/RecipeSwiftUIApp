//
//  ContentView.swift
//  RecipeSwiftUIApp
//
//  Created by Anju Khichar on 10/8/24.
//

import SwiftUI
import Combine
import Kingfisher

struct ContentView: View {
    @StateObject private var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.recipes) { recipe in
                HStack(alignment: .center) {
                    KFImage(URL(string: recipe.photo_url_small))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(Color(.gray), lineWidth: 5)
                                .shadow(radius: 10)
                        }.padding()
                    VStack(alignment: .leading) {
                        Text(recipe.cuisine)
                            .font(.title)
                        Text(recipe.name)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Recipes")
            // Adding pull-to-refresh functionality
            .refreshable {
                await viewModel.loadRecipes()
            }
            .task {
                await viewModel.loadRecipes()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
