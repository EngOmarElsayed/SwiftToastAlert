//
//  AlertIconView.swift
//
//
//  Created by Eng.Omar Elsayed on 31/07/2024.
//

import SwiftUI

struct AlertIconView: View {
  @Binding var tapped: Bool
  let alertIconAppearance: AlertIconAppearance
  
  var body: some View {
    alertIconAppearance.image
      .font(alertIconAppearance.font)
      .foregroundStyle(alertIconAppearance.color ?? .clear)
  }
}
