//
//  ProfileView.swift
//  POC_Authentication
//
//  Created by Jonathan Duong on 24/11/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var authenticationVM: AuthenticationViewModel
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.largeTitle)
            Button {
                authenticationVM.disconnect()
            } label: {
                Text("Disconnect")
            }
        }
    }
}

#Preview {
    ProfileView()
}
