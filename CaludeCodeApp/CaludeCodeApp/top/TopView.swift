import SwiftUI

struct TopView: View {
    @Bindable var viewModel = TopViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Image(systemName: "house.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.green)
            
            VStack(spacing: 10) {
                Text("CaludeCode App へようこそ")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("このアプリケーションは\nサンプル機能を提供します。\n下記のオプションを選択してください。")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
            }
            
            Picker("料理の種類を選択", selection: $viewModel.selectedOption) {
                ForEach(viewModel.options, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding(.horizontal, 40)
            
            Button(action: {
                Task {
                    await viewModel.callApis()
                }
            }) {
                HStack {
                    if viewModel.isLoading {
                        ProgressView()
                            .scaleEffect(0.8)
                            .tint(.white)
                    }
                    Text(viewModel.isLoading ? "処理中..." : "API呼び出し")
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(viewModel.isLoading ? Color.gray : Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .disabled(viewModel.isLoading)
            .padding(.horizontal, 40)
            
            Spacer()
        }
        .padding()
        .alert("API呼び出し完了", isPresented: $viewModel.showAlert) {
            Button("OK") { }
        } message: {
            Text("すべてのAPIの呼び出しが完了しました。")
        }
    }
}

#Preview {
    TopView()
}