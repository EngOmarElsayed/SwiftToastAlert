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
      RoundedRectangle(cornerRadius: 20)
        .overlay(alignment: tapped ? .leading: .center) {
          HStack {
            AlertIconView(tapped: $tapped, image: Image(systemName: "exclamationmark.triangle.fill"), color: .yellow)
              .padding(.leading, tapped ? 20: 0.0)
              .padding(.trailing, tapped ? 5: 0.0)
            
            if tapped {
              AlertTextView(text: "Replace `var` with `let`, variable doesn't change", color: .white, size: 16, weight: .bold)
            }
          }
        }
        .frame(width: tapped ? width: 50, height: tapped ? height: 50)
        .foregroundStyle(style)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal)
        .offset(y: flag ? 0.0: disappearingYPosition)
      
      
      
        .animation(.easeInOut(duration: 0.45), value: flag)
        .animation(.easeInOut(duration: 0.45), value: tapped)
        .onTapGesture {
          tapped.toggle()
          if !tapped {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.8) {
              flag = false
            }
          }
        }
      
      Button("Hello, World 🌍") {
        flag.toggle()
      }.foregroundStyle(.black)
    }
    .onChange(of: flag, perform: { value in
      if value {
        DispatchQueue.main.asyncAfter(deadline: .now()+time) {
          if !tapped {
            flag = false
          }
        }
      }
      
    })
  }
}

#Preview {
  SwiftUIView()
}
