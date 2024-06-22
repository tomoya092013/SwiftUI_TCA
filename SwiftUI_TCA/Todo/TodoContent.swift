//
//  TodoContent.swift
//  SwiftUI_TCA
//
//  Created by 根岸智也 on 2024/06/22.
//

import SwiftUI

struct TodoContent: View {
  @ObservedObject var todoData = TodoData()
  @State var newTodo: String = ""
  
  var body: some View {
    NavigationStack {
      HStack {
        TextField("Todoを入力して下さい", text: $newTodo)
          .textFieldStyle(.roundedBorder)
          .padding()
          .onSubmit {
            todoData.todos.insert(Todo(title: newTodo, checked: false), at: 0)
            newTodo = ""
          }
        Button(action: {
          todoData.todos.insert(Todo(title: newTodo, checked: false), at: 0)
          newTodo = ""
        }, label: {
          Text("追加")
            .padding()
        })
      }
      if (todoData.todos.isEmpty) {
        VStack {
          Text("Todoを追加して下さい")
            .font(.title2)
            .navigationTitle("Todoリスト")
          Spacer()
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
              let filterTodo = todoData.todos.filter{
                $0.checked
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
