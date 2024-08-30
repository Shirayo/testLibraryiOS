//
//  File.swift
//  
//
//  Created by Apple on 30/08/2024.
//

import Foundation
import SwiftUI

public extension View {
    func makeSimpleNeuromorphic() -> some View {
        modifier(SimpleNeuromorphicView())
    } 
    func makeNeuromorphic(
        offsetX: CGFloat,
        offsetY: CGFloat,
        blur: CGFloat
    )-> some View {
        modifier(NeuromorphicView(
            offsetX: offsetX,
            offsetY: offsetY,
            blur: blur
        ))
    }
}
