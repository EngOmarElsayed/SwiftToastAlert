//
//  AlertTextView.swift
//
//
//  Created by Eng.Omar Elsayed on 31/07/2024.
//

import SwiftUI

struct AlertTextView: View {
  let text: String
  let color: Color
  let size: CGFloat
  let weight: Font.Weight
  
  init(text: String, color: Color, size: CGFloat = 16, weight: Font.Weight = .bold) {
    self.text = text
    self.color = color
    self.size = size
    self.weight = weight
  }
  
  var body: some View {
    Text(text)
      .foregroundStyle(color)
      .font(.system(size: 16, weight: .bold))
      .lineLimit(2)
      .multilineTextAlignment(.leading)
  }
}
