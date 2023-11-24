//
//  ContentView.swift
//  POC_Authentication
//
//  Created by Jonathan Duong on 24/11/2023.
//

import SwiftUI
import GoogleSignIn

struct ContentView: View {

  @EnvironmentObject var authViewModel: AuthenticationViewModel

  var body: some View {
    return Group {
      NavigationView {
        switch authViewModel.state {
        case .signedIn:
          ProfileView()
        case .signedOut:
          SignInView()
            .navigationTitle(
              NSLocalizedString(
                "Sign-in with Google",
                comment: "Sign-in navigation title"
              ))
        }
      }
      .navigationViewStyle(StackNavigationViewStyle())
    }
  }
}

#Preview {
    ContentView()
}
