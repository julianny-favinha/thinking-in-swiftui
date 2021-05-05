//
//  ContentView.swift
//  Chapter5
//
//  Created by Julianny Favinha Donda on 01/05/21.
//

import SwiftUI


struct ContentView: View {
    var cells = [
        [Text(""), Text("Monday").bold(), Text("Tuesday").bold(), Text("Wednesday").bold()],
        [Text("Berlin").bold(), Text("Cloudy"), Text("Mostly\nSunny"), Text("Sunny")],
        [Text("London").bold(), Text("Heavy Rain"), Text("Cloudy"), Text("Sunny")],
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("Using Matched Geometry Effect")

            MatchedGeometryEffectTable(cells: cells)
                .font(Font.system(.body, design: .serif))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
