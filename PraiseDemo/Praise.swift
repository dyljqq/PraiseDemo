//
//  Praise.swift
//  PraiseDemo
//
//  Created by jiqinqiang on 2022/9/14.
//

import Foundation

struct Praise {
  var isPraise: Bool = false
  
  mutating func update(isPraise: Bool) {
    self.isPraise = isPraise
  }
}
