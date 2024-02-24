//
//  ContentView.swift
//  GroupingDataInSwiftData
//
//  Created by test on 24.02.2024.
//

import SwiftUI
import SwiftData

@Model
class Movie {
    
    var name: String
    var genre: String
    
    init(name: String, genre: String) {
        self.name = name
        self.genre = genre
    }
}

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var movies: [Movie]
    
    @State private var name: String = ""
    @State private var genre: String = ""
    
    var body: some View {
        Form {
            TextField("Enter name", text: $name)
            TextField("Enter genre", text: $genre)
            Button("Save") {
                let movie = Movie(name: name, genre: genre)
                context.insert(movie)
            }
        }
    }
}

#Preview {
    ContentView()
}
