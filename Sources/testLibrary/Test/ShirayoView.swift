//
//  ShirayoView.swift
//
//
//  Created by Apple on 23/07/2024.
//

import Foundation
import SwiftUI

public struct ShirayoView: View {
    
    @State private var test: Int = 5
    
    public var body: some View {
        Text("Shirayo \(test)")
            .foregroundStyle(.red)
    }
}
