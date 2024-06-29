//
//  ContentView.swift
//  SwiftUI_TCA
//
//  Created by 根岸智也 on 2024/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationView{
        NavigationLink(destination: TodoContent()) {
          Text("Todoアプリへ")
        }
      }
    }
}

#Preview {
    ContentView()
}
