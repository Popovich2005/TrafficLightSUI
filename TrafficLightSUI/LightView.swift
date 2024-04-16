//
//  LightView.swift
//  TrafficLightSUI
//
//  Created by Алексей Попов on 16.04.2024.
//

import SwiftUI

struct LightView: View {
    let color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .frame(width: 120, height: 120)
                .overlay(Circle().stroke(Color.white, lineWidth: 5))
                .shadow(radius: 10)
        }
    }
}

#Preview {
    LightView(color: .blue)
}
