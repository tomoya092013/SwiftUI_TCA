//
//  ListRow.swift
//  SwiftUI_TCA
//
//  Created by 根岸智也 on 2024/06/22.
//

import SwiftUI

struct ListRow: View {
  let task: String
  var isCheck: Bool
  
  var body: some View {
    if isCheck {
      HStack {
        Image(systemName: "checkmark.square")
        Text(self.task)
      }
    } else {
      HStack {
        Image(systemName: "square")
        Text(self.task)
      }
    }
  }
}

#Preview {
    ListRow(task: "プレビュー", isCheck: true)
}
