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
    
    let posts: [Post] = [
        Post(name: "Post 1", comments: [
            Comment(subject: "Comment 1"),
            Comment(subject: "Comment 2")]
        ),
        Post(name: "Post 2", comments: [
            Comment(subject: "Comment 1"),
            Comment(subject: "Comment 2")]
        )
    ]
    
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
            
            ForEach(posts) { post in
                Text(post.name)
                ForEach(post.comments) { comment in
                    Text(comment.subject)
                        .padding([.leading], 20)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
