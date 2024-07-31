//
//  AlertTextView.swift
//
//
//  Created by Eng.Omar Elsayed on 31/07/2024.
//

import SwiftUI

struct AlertTextView: View {
  let alertTextAppearance: AlertTextAppearance
  
  var body: some View {
    Text(alertTextAppearance.text)
      .foregroundStyle(alertTextAppearance.color)
      .font(alertTextAppearance.font)
      .lineLimit(2)
      .multilineTextAlignment(.leading)
  }
}
