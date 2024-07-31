//
//  AlertDisplayView.swift
//  
//
//  Created by Eng.Omar Elsayed on 31/07/2024.
//

import SwiftUI

struct AlertDisplayView: View {
  @Binding var isTapped: Bool
  let alertTextAppearance: AlertTextAppearance?
  let alertIconAppearance: AlertIconAppearance
  
  init(isTapped: Binding<Bool> = .constant(false), alertTextAppearance: AlertTextAppearance? = nil, alertIconAppearance: AlertIconAppearance) {
    _isTapped = isTapped
    self.alertTextAppearance = alertTextAppearance
    self.alertIconAppearance = alertIconAppearance
  }
  
    var body: some View {
      HStack {
        AlertIconView(tapped: $isTapped, alertIconAppearance: alertIconAppearance)
          .padding(.leading, isTapped ? 20: 0.0)
          .padding(.trailing, isTapped ? 5: 0.0)
        
        if let alertTextAppearance, isTapped {
          AlertTextView(alertTextAppearance: alertTextAppearance)
            .opacity(isTapped ? 1.0: 0.0)
            .animation(.smooth, value: isTapped)
        }
      }
    }
}

