//
//  AuthenticationViewModel.swift
//  POC_Authentication
//
//  Created by Jonathan Duong on 24/11/2023.
//

import Foundation
import GoogleSignIn

final class AuthenticationViewModel: ObservableObject {

    @Published var state: State

    private var authenticator: GoogleSignInAuthenticator {
      return GoogleSignInAuthenticator(authenticationVM: self)
    }
    
    init() {
        if let user = GIDSignIn.sharedInstance.currentUser {
          self.state = .signedIn(user)
        } else {
          self.state = .signedOut
        }
    }
    
    /// Signs the user in.
    func signIn() {
      authenticator.signIn()
    }

    /// Signs the user out.
    func signOut() {
      authenticator.signOut()
    }

    /// Disconnects the previously granted scope and logs the user out.
    func disconnect() {
      authenticator.disconnect()
    }
}

extension AuthenticationViewModel {
    enum State {
        case signedIn(GIDGoogleUser)
        case signedOut
    }
}
