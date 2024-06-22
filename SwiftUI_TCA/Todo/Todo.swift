//
//  Todo.swift
//  SwiftUI_TCA
//
//  Created by 根岸智也 on 2024/06/22.
//

import SwiftUI

struct Todo:Identifiable {
  var id = UUID()
  var title: String
  var checked: Bool
  
  init(title:String, checked:Bool) {
    self.title = title
    self.checked = checked
  }
}
