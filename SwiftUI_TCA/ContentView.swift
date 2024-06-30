//
//  ContentView.swift
//  SwiftUI_TCA
//
//  Created by 根岸智也 on 2024/06/22.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
  var body: some View {
    NavigationView {
      VStack {
        NavigationLink(destination: TodoContent()) {
          Text("Todoアプリへ")
        }
        NavigationLink(destination: FeatureView(
          store: Store(initialState: Feature.State()) {
            Feature()
          }
        )) {
          Text("FeatureViewへ")
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
