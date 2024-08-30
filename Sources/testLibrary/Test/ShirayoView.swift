//
//  ShirayoView.swift
//
//
//  Created by Apple on 23/07/2024.
//

import Foundation
import SwiftUI

public struct SimpleNeuromorphicView: ViewModifier {
    
    public func body(content: Content) -> some View {
        GeometryReader(content: { geometry in
            content
                .offset(x: -geometry.size.width * 0.044, y: -geometry.size.width * 0.04)
                .blur(radius: geometry.size.width * 0.05)
                .brightness(0.1)
                .overlay {
                    content
                }
                .background {
                    content
                        .offset(x: geometry.size.width * 0.05, y: geometry.size.width * 0.05)
                        .blur(radius: geometry.size.width * 0.05)
                        .brightness(-0.1)
                }
        })
    }
    
}

public struct NeuromorphicView: ViewModifier {
    
    private var mainColor: Color?
    private var shadowLight: Color?
    private var shadowDark: Color?
    private var radius: CGFloat?
    private var offsetX: CGFloat
    private var offsetY: CGFloat
    private var blur: CGFloat?
    
    
    
    public init(
        offsetX: CGFloat,
        offsetY: CGFloat,
        blur: CGFloat
    ) {
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.blur = blur
    }
    
    public func body(content: Content) -> some View {
        content
            .offset(x: offsetX, y: offsetY)
            .blur(radius: blur ?? 2)
            .brightness(-0.05)
            .overlay {
                content
            }
            .background {
                content
                    .offset(x: -offsetX, y: -offsetY)
                    .blur(radius: blur ?? 2)
                    .brightness(0.05)
            }
    }
}


var color = Color(hex: "#eeeeee")
var gray = Color(hex: "#313136")


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

struct testView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            Spacer()
            
            HStack(spacing: 32) {
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .padding(16)
                        .foregroundStyle(gray)
                        .frame(width: 64, height: 64)
                        .background {
                            Circle()
                                .fill(color)
                                .makeNeuromorphic(
                                    offsetX: 5,
                                    offsetY: 5,
                                    blur: 5
                                )
                        }
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .padding(16)
                        .foregroundStyle(gray)
                        .frame(width: 64, height: 64)
                        .background {
                            Circle()
                                .fill(color)
                                .makeSimpleNeuromorphic()
                        }
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .padding(16)
                        .foregroundStyle(gray)
                        .frame(width: 64, height: 64)
                        .background {
                            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                .fill(color)
                                .makeSimpleNeuromorphic()
                        }
                }

                Spacer()

            }
            .padding()
//            .background(.red)
            
            HStack(spacing: 32) {
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .padding(16)
                        .foregroundStyle(gray)
                        .frame(width: 64, height: 64)
                        .background {
                            Circle()
                                .fill(color)
                                .makeSimpleNeuromorphic()
                        }
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .padding(16)
                        .foregroundStyle(gray)
                        .frame(width: 64, height: 64)
                        .background {
                            Circle()
                                .fill(color)
                                .makeSimpleNeuromorphic()
                        }
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .padding(16)
                        .foregroundStyle(gray)
                        .frame(width: 64, height: 64)
                        .background {
                            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                .fill(color)
                                .makeSimpleNeuromorphic()
                        }
                }

                Spacer()

            }
            .padding()
            
            
        }
        .background(color)
        
    }
}

struct Pathview: View {
    var body: some View {
        ZStack {
            Color.blue.blendMode(.plusDarker)
            Path { path in
                path.move(to: .init(x: 100, y: 100))
                path.addLine(to: .init(x: 100 , y: 300))
//                path.addLine(to: .init(x: 300, y: 300))
//                path.addLine(to: .init(x: 350, y: 300))
                path.addArc(center: .init(x: 100, y: 100), radius: 100, startAngle: .degrees(45), endAngle: .degrees(-45), clockwise: true, transform: .init(translationX: 0, y: 0))
//                        path.closeSubpath()
            }
            .fill(.blue)
            .makeSimpleNeuromorphic()
        }
    }
}

#Preview {
    testView()
//    Pathview()
}
