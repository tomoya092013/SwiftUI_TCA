//
//  TodoContent.swift
//  SwiftUI_TCA
//
//  Created by 根岸智也 on 2024/06/22.
//

import SwiftUI

struct TodoContent: View {
  let todoData = TodoData()
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(todoData.todos) { todo in
          ListRow(task: todo.title, isCheck: todo.checked)
        }
      }
      .navigationTitle("Todoリスト")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Text("削除")
        }
      }
    }
  }
}

#Preview {
  TodoContent()
}
