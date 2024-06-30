//
//  Reducer.swift
//  SwiftUI_TCA
//
//  Created by 根岸智也 on 2024/06/29.
//

import Foundation
import ComposableArchitecture

struct Feature: Reducer {
  struct State: Equatable {
    var count = 0
    var numberFactAlert: String?
  }
  
  struct Pokemon: Codable {
    let forms: [Form]
    
    struct Form: Codable {
      let name: String
      let url: URL
    }
  }
  
  enum Action: Equatable {
    case factAlertDismissed
    case decrementButtonTapped
    case incrementButtonTapped
    case numberFactButtonTapped
    case numberFactResponse(TaskResult<String>)
  }
  
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .factAlertDismissed:
      state.numberFactAlert = nil
      return .none
      
    case .decrementButtonTapped:
      state.count -= 1
      return .none
      
    case .incrementButtonTapped:
      state.count += 1
      return .none
      
    case .numberFactButtonTapped:
      return .run { [count = state.count] send in
        do {
          let (data, _) = try await URLSession.shared.data(
            from: URL(string: "https://pokeapi.co/api/v2/pokemon/\(count)/")!
          )
          
          let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
          print(pokemon)
          let pokemonName = pokemon.forms[0].name
          
          await send(
            .numberFactResponse(.success(pokemonName))
          )
          
        } catch {
          await send(
            .numberFactResponse(.failure(error))
          )
        }
      }
      
    case let .numberFactResponse(.success(fact)):
      state.numberFactAlert = fact
      return .none
      
    case .numberFactResponse(.failure):
      state.numberFactAlert = "Could not load a number fact"
      print("失敗")
      return .none
    }
  }
}
