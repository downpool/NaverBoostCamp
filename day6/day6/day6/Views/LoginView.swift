import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: AppViewModel
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Spacer()
            Text("LOGIN")
                .font(.largeTitle)
                .padding()
            TextField("ID", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            SecureField("PW", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            Button("로그인") {
                viewModel.login()
            }
            .padding()
            Spacer()
        }
        .background(Color.gray.opacity(0.1))
    }
} 