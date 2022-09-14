//
//  PraiseCell.swift
//  PraiseDemo
//
//  Created by jiqinqiang on 2022/9/14.
//

import UIKit

class PraiseCell: UITableViewCell {
  
  lazy var button: UIButton = {
    let button = UIButton()
    button.setTitle("未点赞", for: .normal)
    button.backgroundColor = .gray
    button.layer.cornerRadius = 5
    button.addTarget(self, action: #selector(praiseAction), for: .touchUpInside)
    return button
  }()
  
  var praiseClosure: (() -> ())?

  override func awakeFromNib() {
      super.awakeFromNib()
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.backgroundColor = .white
    contentView.addSubview(self.button)
    self.button.frame = CGRect(x: 10, y: 10, width: 100, height: 40)
  }
  
  func render(with praise: Praise) {
    if praise.isPraise {
      self.button.setTitle("已点赞", for: .normal)
      self.button.backgroundColor = .red
    } else {
      self.button.setTitle("未点赞", for: .normal)
      self.button.backgroundColor = .gray
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func praiseAction() {
    praiseClosure?()
  }
  
}
