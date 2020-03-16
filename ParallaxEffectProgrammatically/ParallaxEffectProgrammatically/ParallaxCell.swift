//
//  ParallaxCell.swift
//  ParallaxEffectProgrammatically
//
//  Created by Ana on 16/03/2020.
//  Copyright © 2020 Ana Popilian. All rights reserved.
//

import UIKit

final class ParalaxCell: UITableViewCell, Identifiable {
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
