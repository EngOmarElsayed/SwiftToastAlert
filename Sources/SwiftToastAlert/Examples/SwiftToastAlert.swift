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

struct SwiftUIView: View {
  private let style: some ShapeStyle = .black
  private let disappearingYPosition: CGFloat = -200
  private let deviceWidth = UIScreen.main.bounds.size.width
  
  private let time = 3.0
  private let height: CGFloat = 80
  @State private var flag: Bool = false
  @State private var tapped: Bool = false
  
  private var width: CGFloat {
    return deviceWidth-50
  }
  
  var body: some View {
    ZStack {
      Color.red.ignoresSafeArea()
      Button("Hello, World 🌍") {
        flag.toggle()
      }.foregroundStyle(.black)
    }
//    .toastAlert(
//      isPresented: $flag,
//      position: .top,
//      background: .black) {
//        AlertIconAppearance(image: Image(systemName: "checkmark"), color: .green, font: .system(size: 16, weight: .bold))
//      }
      .interactiveToastAlert(isPresented: $flag, position: .topTrailing, background: .black) {
        AlertTextAppearance(text: "Replace `var` with `let`", color: .white, font: .system(size: 16, weight: .bold))
      } alertIconAppearance: {
        AlertIconAppearance(image: Image(systemName: "checkmark"), color: .green, font: .system(size: 16, weight: .bold))
      }
  }
}

#Preview {
  SwiftUIView()
}
