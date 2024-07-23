//
//  ShirayoView.swift
//
//
//  Created by Apple on 23/07/2024.
//

import Foundation
import SwiftUI

public struct ShirayoView: ViewModifier {
    private var tint: Color
//    private var lightShadow: Color
//    private var darkShadow: Color
    private var size: CGFloat = 40

    public init(tint: Color, lightShadow: Color = .black, darkShadow: Color = .black) {
        self.tint = tint
//        self.lightShadow = lightShadow
//        self.darkShadow = darkShadow
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            content
                .frame(width: size, height: size)
                .offset(x: size * 0.04, y: size * 0.04)
                .blur(radius: size * 0.07)
                .brightness(-0.2)
            
            content
                .frame(width: size, height: size)
                .offset(x: -size * 0.04, y: -size * 0.04)
                .blur(radius: size * 0.07)
                .brightness(0.1)
            
            content
                .frame(width: size, height: size)
        }
    }
}
var color = Color.red
var gray = Color(hex: "#313136")

public extension View {
    func makeNeuromorphic(tint: Color) -> some View {
        modifier(ShirayoView(tint: tint))
    }
}

public extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        print(cleanHexCode)
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}
