//
//  ContentView.swift
//  Drawing
//
//  Created by Waveline Media on 12/8/20.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100

    // How wide to make each petal
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
        .drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount

        if targetHue > 1 {
            targetHue -= 1
        }

        // now send the main path back
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
    @State private var colorCycle = 0.0

    var body: some View {
        VStack(spacing: 0) {
            ColorCyclingRectangle(amount: self.colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
