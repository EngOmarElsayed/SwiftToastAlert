//MIT License
//
//Copyright (c) 2024 Omar Elsayed
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.
//
//  Created by Eng.Omar Elsayed on 31/07/2024.
//

import SwiftUI

internal struct ToastAlert<S>: ViewModifier where S : ShapeStyle {
  private let disappearingYPosition: CGFloat = -200
  private let deviceWidth = UIScreen.main.bounds.size.width
  
  @Binding private var isPresented: Bool
  private let position: Alignment
  private let background: S
  private let alertIconAppearance: AlertIconAppearance
  
  internal init(isPresented: Binding<Bool>, position: Alignment, background: S, alertIconAppearance: AlertIconAppearance) {
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
  /// `toastAlert` will display alert toast that doesn't have tap feature.
  ///
  ///
  ///
  /// - Parameters:
  ///   - isPresented: A flag that tells when to appear and disappear the toast.
  ///   - position: The position of the alert toast.
  ///   - background: Represent the background view of the toast. Takes what ever the ``foregroundStyle``
  ///   - alertIconAppearance: Represent the icon that will be displayed in the alert.
  ///
  /// - Returns: The alert toast view on top of the view it is applied to.
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
