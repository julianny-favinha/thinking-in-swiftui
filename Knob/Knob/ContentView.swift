//
//  ContentView.swift
//  Knob
//
//  Created by Chris Eidhof on 05.11.19.
//  Copyright © 2019 Chris Eidhof. All rights reserved.
//

import SwiftUI

struct KnobShape: Shape {
    var pointerSize: CGFloat = 0.1 // these are relative values
    var pointerWidth: CGFloat = 0.1
    func path(in rect: CGRect) -> Path {
        let pointerHeight = rect.height * pointerSize
        let pointerWidth = rect.width * self.pointerWidth
        let circleRect = rect.insetBy(dx: pointerHeight, dy: pointerHeight)
        return Path { p in
            p.addEllipse(in: circleRect)
            p.addRect(CGRect(x: rect.midX - pointerWidth/2, y: 0, width: pointerWidth, height: pointerHeight + 2))
        }
    }
}

struct Knob: View {
    @Binding var value: Double // should be between 0 and 1
    @Binding var shouldUseCustomColor: Bool
    @Binding var hue: CGFloat // shoulb be between 0 and 1
    var pointerSize: CGFloat? = nil
    @Environment(\.knobColor) var envColor
    @Environment(\.knobPointerSize) var envPointerSize
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
         KnobShape(pointerSize: pointerSize ?? envPointerSize)
            .fill(knobColor)
            .saturation(Double(hue))
            .rotationEffect(Angle(degrees: value * 330))
            .onTapGesture {
                withAnimation(.default) {
                    self.value = self.value < 0.5 ? 1 : 0
                }
            }
    }

    var knobColor: Color {
        guard shouldUseCustomColor else {
            return colorScheme == .dark ? .white : .black
        }

        return envColor
    }
}

struct ContentView: View {
    @State var value: Double = 0.5
    @State var knobSize: CGFloat = 0.1
    @State var colorHue: CGFloat = 1.0
    @State var shouldUseCustomColor: Bool = true

    var body: some View {
        VStack {
            Knob(value: $value, shouldUseCustomColor: $shouldUseCustomColor, hue: $colorHue)
                .frame(width: 100, height: 100)
                .knobPointerSize(knobSize)
                .knobColor(.orange)
            HStack {
                Text("Value")
                Slider(value: $value, in: 0...1)
                Button("Toggle", action: {
                    withAnimation(.default) {
                        value = value == 0 ? 1 : 0
                    }
                })
            }

            HStack {
                Text("Knob Size")
                Slider(value: $knobSize, in: 0.1...0.4)
            }

            HStack {
                Text("Color hue")
                Slider(value: $colorHue, in: 0...1)
            }

            Toggle("Custom color", isOn: $shouldUseCustomColor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
