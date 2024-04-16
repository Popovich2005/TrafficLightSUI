//
//  ContentView.swift
//  TrafficLightSUI
//
//  Created by Алексей Попов on 16.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    private let lightIsOn = 1.0
    private let lightIsOff = 0.3
    
    @State private var redOpacity = Double()
    @State private var greenOpacity = Double()
    @State private var yellowOpacity = Double()
    @State private var buttonText = "Start"
    @State private var currentLight = CurrentLight.red
    
    init() {
        _redOpacity = State(initialValue: lightIsOff)
        _greenOpacity = State(initialValue: lightIsOff)
        _yellowOpacity = State(initialValue: lightIsOff)
    }
    
    var body: some View {
        VStack {
            LightView(color: .red.opacity(redOpacity))
            LightView(color: .yellow.opacity(yellowOpacity))
            LightView(color: .green.opacity(greenOpacity))
            
            Spacer()
            
            Button(action: buttonAction) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                    
                    Text(buttonText)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 16)
            }
            .frame(width: 200, height: 60)
        }
        .padding(.top, 16)
    }
    
    private func buttonAction() {
        
        if buttonText == "Start" {
            buttonText = "Next"
        }
        
        switch currentLight {
        case .red:
            greenOpacity = lightIsOff
            redOpacity = lightIsOn
            currentLight = .yellow
        case .yellow:
            redOpacity = lightIsOff
            yellowOpacity = lightIsOn
            currentLight = .green
        case .green:
            greenOpacity = lightIsOn
            yellowOpacity = lightIsOff
            currentLight = .red
        }
    }
}

// MARK: - CurrentLight
extension ContentView {
    private enum CurrentLight {
        case red, yellow, green
    }
}

#Preview {
    ContentView()
}
