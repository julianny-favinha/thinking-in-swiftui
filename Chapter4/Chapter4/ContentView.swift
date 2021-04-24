//
//  ContentView.swift
//  Chapter4
//
//  Created by Julianny Favinha Donda on 17/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                NavigationLink(destination: CollapsibleHStack()) {
                    Text("Collapsible HStack")
                }

                NavigationLink(destination: TextView()) {
                    Text("Badge View")
                }
            }
            .navigationBarTitle("Chapter 4")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}
