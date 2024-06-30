//
//  FeatureView.swift
//  SwiftUI_TCA
//
//  Created by 根岸智也 on 2024/06/29.
//

import SwiftUI
import ComposableArchitecture

struct FeatureView: View {
  let store: StoreOf<Feature>
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack {
        HStack {
          Button("−") { viewStore.send(.decrementButtonTapped) }
          Text("\(viewStore.count)")
          Button("+") { viewStore.send(.incrementButtonTapped) }
        }
        
        Button("Number fact") { viewStore.send(.numberFactButtonTapped) }
      }
      .alert(
        item: viewStore.binding(
          get: { $0.numberFactAlert.map(FactAlert.init(title:)) },
          send: .factAlertDismissed
        ),
        content: { Alert(title: Text($0.title)) }
      )
    }
  }
}

struct FactAlert: Identifiable {
  var title: String
  var id: String { self.title }
}

#Preview {
  FeatureView(
    store: Store(initialState: Feature.State()) {
      Feature()
    }
  )
}
