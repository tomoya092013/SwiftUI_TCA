//
//  TodoContent.swift
//  SwiftUI_TCA
//
//  Created by 根岸智也 on 2024/06/22.
//

import SwiftUI

struct TodoContent: View {
  @ObservedObject var todoData = TodoData()
  
  var body: some View {
    NavigationStack {
        if (todoData.todos.isEmpty) {
          VStack{
            Text("タスクを追加して下さい")
              .font(.title2)
              .navigationTitle("Todoリスト")
              .padding()
          }
        } else {
          List {
          ForEach(todoData.todos.indices, id: \.self) { index in
            Button(action: {
              todoData.todos[index].checked.toggle()
            })
            {
            ListRow(task: todoData.todos[index].title,
                    isCheck: todoData.todos[index].checked)
            }
            .foregroundColor(.black)
          }
        }
          .navigationTitle("Todoリスト")
          .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
              Button(action: {
                let filterTodo = todoData.todos.filter{todo in
                  todo.checked
                }
                todoData.todos = filterTodo
              })
              {
              Text("削除")
              }
            }
          }
      }
      
    }
  }
}

#Preview {
  TodoContent()
}
