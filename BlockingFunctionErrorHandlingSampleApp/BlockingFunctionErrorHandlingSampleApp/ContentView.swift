import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var text: String = ""
    @State private var password: String = ""
    @State private var isAlertPresenting: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $text)
                .textFieldStyle(.roundedBorder)
            TextField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            Button("SignUp") {
                Task {
                    do {
                        try await Auth.auth().createUser(withEmail: text, password: password)
                        isAlertPresenting = true
                        alertMessage = "Success"
                    } catch {
                        isAlertPresenting = true
                        alertMessage = "\(error)"
                    }
                }
            }
        }
        .alert("ALERT", isPresented: $isAlertPresenting) {
            Button("OK") {}
        } message: {
            Text(alertMessage)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
