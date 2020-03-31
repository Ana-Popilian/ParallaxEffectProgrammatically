//
//  MainView.swift
//  ParallaxEffectProgrammatically
//
//  Created by Ana on 16/03/2020.
//  Copyright © 2020 Ana Popilian. All rights reserved.
//

import UIKit

protocol MainViewDelegate where Self: UIViewController {
}

final class MainView: UIView, UIScrollViewDelegate {
  
  private var scrollView: UIScrollView!
  private var imageView: UIImageView!
  private var tableView: UITableView!
  private var container: UIView!
  private weak var delegate: MainViewDelegate?
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private enum ViewTrait {
    static let imgViewHeightConstant: CGFloat = 300
    static let tableViewHeightConstant: CGFloat = 2000
  }
  
  required init(delegate: MainViewDelegate?) {
    self.delegate = delegate
    super.init(frame: .zero)
    
    setupScrollView()
    setupContainer()
    setupHeader()
    setupTableView()
    
    addSubViews()
    setupConstraints()
  }
}


//MARK: - Private Zone
private extension MainView {
  
  func setupScrollView() {
    scrollView = UIScrollView()
    scrollView.delegate = self
    scrollView.alwaysBounceVertical = true
    scrollView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func setupHeader()  {
    imageView = UIImageView()
    imageView.image = UIImage(named: "image")
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func setupTableView()  {
    tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(ParalaxCell.self, forCellReuseIdentifier: ParalaxCell.identifier)
    tableView.isScrollEnabled = false
    tableView.dataSource = self
  }
  
  func setupContainer() {
    container = UIView()
    container.translatesAutoresizingMaskIntoConstraints = false
  }
}


// MARK: - UITableViewDataSource
extension MainView: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    20
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ParalaxCell.identifier, for: indexPath) as! ParalaxCell
    
    return cell
  }
}


// MARK: - Constraints Zone
private extension MainView {
  
  func addSubViews() {
    addSubview(scrollView)
    scrollView.addSubview(container)
    container.addSubview(imageView)
    container.addSubview(tableView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      
      scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      
      container.topAnchor.constraint(equalTo: scrollView.topAnchor),
      container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      container.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
      
      imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
      imageView.heightAnchor.constraint(equalToConstant: ViewTrait.imgViewHeightConstant),
      
      tableView.topAnchor.constraint(equalTo: container.topAnchor, constant: ViewTrait.imgViewHeightConstant),
      tableView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
      tableView.heightAnchor.constraint(equalToConstant: ViewTrait.tableViewHeightConstant),
      tableView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
    ])
  }
}
