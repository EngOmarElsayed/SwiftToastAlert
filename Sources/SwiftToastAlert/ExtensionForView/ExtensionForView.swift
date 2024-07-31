//
//  ExtensionForView.swift
//
//
//  Created by Eng.Omar Elsayed on 31/07/2024.
//

import SwiftUI

internal extension View {
  func alertFrame<S>(width: CGFloat, height: CGFloat, position: Alignment = .top, background: S) -> some View where S : ShapeStyle {
    self
    .frame(width: width, height: height)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: position)
    .foregroundStyle(background)
  }
  
  func alertPosition(y: CGFloat) -> some View {
    self
    .padding(.horizontal)
    .offset(y: y)
  }
  
  func alertAnimation(isPresented: Bool, isTapped: Bool) -> some View {
    self
    .animation(.easeInOut(duration: 0.45), value: isPresented)
    .animation(.easeInOut(duration: 0.45), value: isTapped)
  }
}
