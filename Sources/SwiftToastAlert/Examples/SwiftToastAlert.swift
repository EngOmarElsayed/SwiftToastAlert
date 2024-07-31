//
//  SwiftToastAlert.swift
//
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
      .customInteractiveToastAlert(isPresented: $flag, position: .topTrailing, background: .black) {
        AlertTextAppearance(text: "Replace `var` with `let`", color: .white, font: .system(size: 16, weight: .bold))
      } alertIconAppearance: {
        AlertIconAppearance(image: Image(systemName: "checkmark"), color: .green, size: 16)
      }
  }
}

#Preview {
  SwiftUIView()
}
