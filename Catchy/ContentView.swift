//
//  ContentView.swift
//  Catchy
//
//  Created by Islam on 11/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        VStack {
            Spacer()
            Button("Test Endpoint", action: {
                self.testEndpointMockupAPI()
            })
            .padding()
            .frame(width: UIScreen.main.bounds.width)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.title)
        }
    }
}


extension ContentView {

    func testEndpointMockupAPI() {
        let userService = UserService()
        userService.requestData { (user) in
            guard let user = user else { return }
            print(user)
        } failure: { (error) in
            print(error.localizedDescription)
        }
    }
}

class UserService: NetworkService {

    let service = AuthenticationServices()
    
    func requestData(completion: @escaping(User?) -> Void, failure: @escaping(Error) -> Void) {

        let userInput = User.Signup.Input(name: "Islam", email: "islam@me.com",
                                          password: "12345", passwordConfirmation: "12345",
                                          avatar: "avatar")
        service.signup(input: userInput) { (result) in

            switch result {
            case .success(let output):
                completion(output.user)
            case .failure(let error):
                failure(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
