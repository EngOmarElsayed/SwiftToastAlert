//
//  AlertTextAppearance.swift
//
//
//  Created by Eng.Omar Elsayed on 31/07/2024.
//

import SwiftUI

/// This represent the text that will be displayed in the alert toast with it's properties.
public struct AlertTextAppearance {
  /// The displayed text in the toast alert.
  public let text: String
  /// The color of the displayed ``text``.
  public let color: Color
  /// The font properties of the displayed text, that contains size, weight and font of the ``text``.
  public let font: Font
  
  public init(text: String, color: Color, font: Font = .system(size: 16, weight: .bold)) {
    self.text = text
    self.color = color
    self.font = font
  }
}
