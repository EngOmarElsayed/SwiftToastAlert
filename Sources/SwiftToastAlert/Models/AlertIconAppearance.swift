//
//  AlertIconAppearance.swift
//
//
//  Created by Eng.Omar Elsayed on 31/07/2024.
//

import SwiftUI

/// This type represent the icon the will be displayed in the alert and it's properties.
public struct AlertIconAppearance {
  /// This represent the icon that will be displayed in the alert, it can be SF symbol or image from the asset catalog.
  public let image: Image
  /// This is the color of the icon in the alert, it is used for SF symbol only.
  public let color: Color?
  /// The font properties is used to customize the size and weight of the icon if it was SF symbol
  public let font: Font?
  
  /// if you are not using SF symbol, don't init the color or the font property.
  public init(image: Image, color: Color? = nil, font: Font? = nil) {
    self.image = image
    self.color = color
    self.font = font
  }
}
