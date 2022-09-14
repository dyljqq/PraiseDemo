//
//  ViewController.swift
//  PraiseDemo
//
//  Created by jiqinqiang on 2022/9/14.
//

import UIKit

class ViewController: UIViewController {

  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 60
    tableView.register(PraiseCell.classForCoder(), forCellReuseIdentifier: String(describing: PraiseCell.classForCoder()))
    return tableView;
  }()
  
  var dataSource: [Praise] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUp()
  }
  
  func setUp() {
    self.view.backgroundColor = .white
    
    self.view.addSubview(self.tableView)
    self.tableView.frame = self.view.bounds
    
    dataSource = [
      Praise(isPraise: false),
      Praise(isPraise: true),
      Praise(isPraise: false),
      Praise(isPraise: true),
      Praise(isPraise: false),
    ]
    self.tableView.reloadData()
  }

}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PraiseCell.classForCoder()), for: indexPath) as! PraiseCell
    cell.render(with: dataSource[indexPath.row])
    cell.praiseClosure = { [weak self] in
      guard let strongSelf = self else {
        return
      }
      let praise = strongSelf.dataSource[indexPath.row]
      strongSelf.dataSource[indexPath.row].update(isPraise: !praise.isPraise)
      strongSelf.tableView.reloadData()
    }
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  
}

