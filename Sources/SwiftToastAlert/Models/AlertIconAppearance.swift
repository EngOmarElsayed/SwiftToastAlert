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
