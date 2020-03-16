//
//  ViewController.swift
//  ParallaxEffectProgrammatically
//
//  Created by Ana on 16/03/2020.
//  Copyright © 2020 Ana Popilian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private var mainView: MainView!
  
  override func loadView() {
    
    mainView = MainView(delegate: self)
    view = mainView
  }
}

extension ViewController: MainViewDelegate {
  
}

