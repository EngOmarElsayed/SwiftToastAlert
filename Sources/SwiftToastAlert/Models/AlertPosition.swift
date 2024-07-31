//
//  AlertPosition.swift
//
//
//  Created by Eng.Omar Elsayed on 31/07/2024.
//

import SwiftUI

/// This enum represent the possible position options for the toast alert.
public enum AlertPosition {
  case topLeading
  case top
  case topTrailing
  
  internal var alignment : Alignment {
    switch self {
    case .topLeading:
        .topLeading
    case .top:
        .top
    case .topTrailing:
        .topTrailing
    }
  }
}
