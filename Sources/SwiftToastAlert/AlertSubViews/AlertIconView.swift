//
//  AlertIconView.swift
//
//
//  Created by Eng.Omar Elsayed on 31/07/2024.
//

import SwiftUI

struct AlertIconView: View {
  @Binding var tapped: Bool
  let image: Image
  let color: Color
  
  var body: some View {
    image
      .font(.system(size: 20, weight: .bold))
      .foregroundStyle(color)
  }
}
