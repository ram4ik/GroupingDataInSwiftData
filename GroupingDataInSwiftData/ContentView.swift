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

struct Genre: Identifiable {
    let id = UUID()
    let name: String
    let movies: [Movie]
}

struct Post: Identifiable {
    let id = UUID()
    let name: String
    let comments: [Comment]
}

struct Comment: Identifiable {
    let id = UUID()
    let subject: String
}

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var movies: [Movie]
    
    @State private var name: String = ""
    @State private var genre: String = ""
    
    var genres: [Genre] {
        
        let availableGenres = Array(Set(movies.map { $0.genre }))
        
        return availableGenres.map { genre in
            let moviesByGenre = movies.filter { $0.genre == genre }
            return Genre(name: genre, movies: moviesByGenre)
        }
    }
    
    var body: some View {
        Form {
            TextField("Enter name", text: $name)
            TextField("Enter genre", text: $genre)
            Button("Save") {
                let movie = Movie(name: name, genre: genre)
                context.insert(movie)
            }
            
            ForEach(genres) { genre in
                Text(genre.name)
                ForEach(genre.movies) { movie in
                    Text(movie.name)
                        .padding([.leading], 20)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
