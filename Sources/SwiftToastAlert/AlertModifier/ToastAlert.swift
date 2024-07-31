//
//  toastAlert.swift
//
//
//  Created by Eng.Omar Elsayed on 31/07/2024.
//

import SwiftUI

public struct ToastAlert<S>: ViewModifier where S : ShapeStyle {
  private let disappearingYPosition: CGFloat = -200
  private let deviceWidth = UIScreen.main.bounds.size.width
  
  @Binding private var isPresented: Bool
  private let position: Alignment
  private let background: S
  private let alertIconAppearance: AlertIconAppearance
  
  public init(isPresented: Binding<Bool>, position: Alignment, background: S, alertIconAppearance: AlertIconAppearance) {
    _isPresented = isPresented
    self.position = position
    self.background = background
    self.alertIconAppearance = alertIconAppearance
  }
  
  public func body(content: Content) -> some View {
    ZStack {
      content
      
      RoundedRectangle(cornerRadius: 20)
        .overlay(alignment: .center) {
          AlertDisplayView(alertIconAppearance: alertIconAppearance)
        }
        .alertFrame(width: 50, height: 50, position: position, background: background)
        .alertPosition(y: isPresented ? 0.0: disappearingYPosition)
        .alertAnimation(isPresented: isPresented)
        .onChange(of: isPresented) { value in
          if value {
            DispatchQueue.main.asyncAfter(deadline: .now()+3.0) {
              isPresented = false
            }
          }
        }
    }
  }
}

public extension View {
  func toastAlert<S>(
    isPresented: Binding<Bool>,
    position: AlertPosition,
    background: S,
    alertIconAppearance: () -> AlertIconAppearance
  ) -> some View where S: ShapeStyle {
    self.modifier(
      ToastAlert(
        isPresented: isPresented,
        position: position.alignment,
        background: background,
        alertIconAppearance: alertIconAppearance()
      )
    )
  }
}
