//
//  GoogleSignInAuthenticator.swift
//  POC_Authentication
//
//  Created by Jonathan Duong on 24/11/2023.
//

import Foundation
import GoogleSignIn

final class GoogleSignInAuthenticator: ObservableObject {

    private var authenticationVM: AuthenticationViewModel
    
    init(authenticationVM: AuthenticationViewModel) {
        self.authenticationVM = authenticationVM
    }
    
    func signIn() {
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
          print("There is no root view controller!")
          return
        }

        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
          guard let signInResult = signInResult else {
            print("Error! \(String(describing: error))")
            return
          }
          self.authenticationVM.state = .signedIn(signInResult.user)
        }
    }

    /// Signs out the current user.
    func signOut() {
      GIDSignIn.sharedInstance.signOut()
        authenticationVM.state = .signedOut
    }
    
    /// Disconnects the previously granted scope and signs the user out.
    func disconnect() {
      GIDSignIn.sharedInstance.disconnect { error in
        if let error = error {
          print("Encountered error disconnecting scope: \(error).")
        }
        self.signOut()
      }
    }
}
