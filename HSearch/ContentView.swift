//
//  ContentView.swift
//  HSearch
//
//  Created by Roopesh Tripathi on 20/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    let indianCities = ["Varanasi","Mumbai", "Delhi", "Bangalore", "Hyderabad", "Ahmedabad", "Chennai", "Kolkata", "Pune", "Jaipur", "Lucknow", "Kanpur", "Nagpur", "Indore", "Allahabad"]

    var body: some View {
        VStack {
            TextField("Search", text: $searchText)
                .padding()
                .textFieldStyle(.automatic)
                .cornerRadius(8)
                .padding(.horizontal)

            List(indianCities.filter { searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText) },
                 id: \.self) { item in
                SearchResultRow(text: item, searchText: searchText)
            }
        }
    }
}

struct SearchResultRow: View {
    let text: String
    let searchText: String

    var body: some View {
        let highlightedText = highlightText(text: text, searchText: searchText)
        return highlightedText
    }

    private func highlightText(text: String, searchText: String) -> Text {
        guard !searchText.isEmpty else {
            return Text(text)
        }

        if let range = text.range(of: searchText, options: .caseInsensitive) {
            let before = text[..<range.lowerBound]
            let after = text[range.upperBound...]

            return Text(before) + Text(text[range]).bold() + Text(after)
        } else {
            return Text(text)
        }
    }
}

#Preview {
    ContentView()
}
