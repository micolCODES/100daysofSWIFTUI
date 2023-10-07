//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Micol on 07.10.23.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
            .task {
                await loadData() //here is the AWAIT that we need since the function is ASYNC
            }
        }
    }
    //this method might want to go to sleep in order to complete its work. !!!Cannot use the .onAppear!!! -> NEEDS "AWAIT"
    func loadData() async {
        //step 1 create URL
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("invalid URL")
            return
        }
        //step 2: fetch data from URL
        do{
            //return into data is a tuple, data + metadata, so we use an underscore"_" to say "throw out the metadata"
            let (data, _) = try await URLSession.shared.data(from: url)
            //step 3: load data in response struct
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("invalid data")
        }    }
}

#Preview {
    ContentView()
}
