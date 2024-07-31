//
//  AlertIconAppearance.swift
//
//
//  Created by Eng.Omar Elsayed on 31/07/2024.
//

import SwiftUI

public struct AlertIconAppearance {
  public let image: Image
  public let color: Color?
  public let font: Font?
  
  public init(image: Image, color: Color?, font: Font? = nil) {
    self.image = image
    self.color = color
    self.font = font
  }
}
