import SwiftUI

struct LoginView: View {
    @Bindable var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Spacer()
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.blue)
                
                Text("CaludeCode Login")
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(spacing: 16) {
                    TextField("User ID", text: $viewModel.userId)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal, 40)
                
                Link("パスワードを忘れた方はこちら", destination: URL(string: "https://example.com")!)
                    .font(.caption)
                    .foregroundColor(.blue)
                
                NavigationLink(destination: TopView(), isActive: $viewModel.isLoggedIn) {
                    Button(action: {
                        viewModel.login()
                    }) {
                        Text("ログイン")
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 40)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}