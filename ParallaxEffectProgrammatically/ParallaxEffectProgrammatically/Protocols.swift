//
//  Protocols.swift
//  ParallaxEffectProgrammatically
//
//  Created by Ana on 16/03/2020.
//  Copyright © 2020 Ana Popilian. All rights reserved.
//

import Foundation

protocol Identifiable {
  
  static var identifier: String { get }
}

extension Identifiable {
  
  static var identifier: String {
    return String(describing: self)
  }
}
