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

