//
//  AlertModifier.swift
//
//
//  Created by Eng.Omar Elsayed on 31/07/2024.
//

import SwiftUI

internal struct InteractiveToastAlert<S>: ViewModifier where S : ShapeStyle {
  @State private var isTapped: Bool = false
  private let disappearingYPosition: CGFloat = -200
  private let deviceWidth = UIScreen.main.bounds.size.width
  private let alertHeight: CGFloat = 80
  private var width: CGFloat {
    return deviceWidth-50
  }
  
  @Binding private var isPresented: Bool
  private let position: Alignment
  private let background: S
  private let alertTextAppearance: AlertTextAppearance
  private let alertIconAppearance: AlertIconAppearance
  
  internal init(isPresented: Binding<Bool>, position: Alignment, background: S, alertTextAppearance: AlertTextAppearance, alertIconAppearance: AlertIconAppearance) {
    _isPresented = isPresented
    self.position = position
    self.background = background
    self.alertTextAppearance = alertTextAppearance
    self.alertIconAppearance = alertIconAppearance
  }
  
  public func body(content: Content) -> some View {
    ZStack {
      content
      
      RoundedRectangle(cornerRadius: 20)
        .overlay(alignment: isTapped ? .leading: .center) {
          AlertDisplayView(isTapped: $isTapped, alertTextAppearance: alertTextAppearance, alertIconAppearance: alertIconAppearance)
        }
        .alertFrame(width: isTapped ? width: 50, height: isTapped ? alertHeight: 50, position: position, background: background)
        .alertPosition(y: isPresented ? 0.0: disappearingYPosition)
        .alertAnimation(isPresented: isPresented, isTapped: isTapped)
      
        .onTapGesture {
          isTapped.toggle()
          if !isTapped {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.8) {
              isPresented = false
            }
          }
        }
        .onChange(of: isPresented) { value in
          if value {
            DispatchQueue.main.asyncAfter(deadline: .now()+3.0) {
              if !isTapped {
                isPresented = false
              }
            }
          }
        }
    }
  }
}

public extension View {
  /// `interactiveToastAlert` will display alert toast that represent more info when tapped.
  ///
  ///
  ///
  /// - Parameters:
  ///   - isPresented: A flag that tells when to appear and disappear the toast.
  ///   - position: The position of the alert toast.
  ///   - background: Represent the background view of the toast. Takes what ever the ``foregroundStyle``
  ///   - alertTextAppearance: Represent the text that will be displayed when the alert is tapped.
  ///   - alertIconAppearance: Represent the icon that will be displayed in the alert.
  ///
  /// - Returns: The alert toast view on top of the view it is applied to.
  func interactiveToastAlert<S>(
    isPresented: Binding<Bool>,
    position: AlertPosition,
    background: S,
    alertTextAppearance: () -> AlertTextAppearance,
    alertIconAppearance: () -> AlertIconAppearance
  ) -> some View where S: ShapeStyle {
    self.modifier(
      InteractiveToastAlert(
        isPresented: isPresented,
        position: position.alignment,
        background: background,
        alertTextAppearance: alertTextAppearance(),
        alertIconAppearance: alertIconAppearance()
      )
    )
  }
}
