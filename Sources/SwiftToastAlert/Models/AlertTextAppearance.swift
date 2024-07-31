//
//  AlertTextAppearance.swift
//
//
//  Created by Eng.Omar Elsayed on 31/07/2024.
//

import SwiftUI

public struct AlertTextAppearance {
  public let text: String
  public let color: Color
  public let font: Font
  
  public init(text: String, color: Color, font: Font = .system(size: 16, weight: .bold)) {
    self.text = text
    self.color = color
    self.font = font
  }
}
