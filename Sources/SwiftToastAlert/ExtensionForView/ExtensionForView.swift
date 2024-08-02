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

internal extension View {
  func alertFrame<S>(width: CGFloat, height: CGFloat, position: Alignment = .top, background: S) -> some View where S : ShapeStyle {
    self
    .frame(width: width, height: height)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: position)
    .foregroundStyle(background)
  }
  
  func alertPosition(y: CGFloat) -> some View {
    self
    .padding(.horizontal)
    .offset(y: y)
  }
  
  func alertAnimation(isPresented: Bool, isTapped: Bool) -> some View {
    self
    .animation(.easeInOut(duration: 0.45), value: isPresented)
    .animation(.easeInOut(duration: 0.45), value: isTapped)
  }
  
  func alertAnimation(isPresented: Bool) -> some View {
    self
    .animation(.easeInOut(duration: 0.45), value: isPresented)
  }
}
