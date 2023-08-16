import SwiftUI
import Foundation
import OpenAISwift
import Combine

struct OpenAIResponse: Decodable {
    let choices: [OpenAIChoice]?
}

struct OpenAIChoice: Decodable {
    let text: String?
}

func generateText(using userInput: String, completionHandler: @escaping (Result<String, Error>) -> Void) {
    let apiKey = "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"
    let endpoint = "https://api.openai.com/v1/engines/text-davinci-002/completions"
    
    let prompt = "Is this text message a scam? Give a short description why or why not. User Input: \(userInput)"

    let parameters: [String: Any] = [
        "prompt": prompt,
        "max_tokens": 50
    ]
    
    let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
    
    var request = URLRequest(url: URL(string: endpoint)!)
    request.httpMethod = "POST"
    request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = jsonData
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            completionHandler(.failure(error))
            return
        }
        
        if let data = data {
            if let responseString = String(data: data, encoding: .utf8) {
                print("API Response:", responseString)
            }
            
            if let decodedResponse = try? JSONDecoder().decode(OpenAIResponse.self, from: data),
               let choices = decodedResponse.choices,
               let generatedText = choices.first?.text {
                completionHandler(.success(generatedText))
            } else {
                completionHandler(.failure(NSError(domain: "", code: 0, userInfo: nil)))
            }

        }
    }.resume()
}

struct Analysis: View {
    @Binding var userInput: String
    @State private var generatedText: String?
    var body: some View {
        //NavigationView {
            
            ZStack {
                Spacer()
                Color(red: 0.10, green: 0.39, blue: 0.49)
                    .edgesIgnoringSafeArea(.all)
                
                
                
                VStack {
                    
                    Text("ScamText Analysis")
                        .font(.custom("Arial-Bold", size: 38))
                        .foregroundColor(.white)
                    
                    Text("Generated Text: \(generatedText ?? "")")
                        .frame(width: 300, height: 270, alignment: .center)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .cornerRadius(20)
                        .font(.custom("Arial-Bold", size: 20))
                        .multilineTextAlignment(.center)
                        .padding(50)
                    
                        .onAppear {
                
                           generateText(using: userInput) { result in
                                switch result {
                                case .success(let text):
                                    generatedText = text
                                case .failure(let error):
                                    print("Error:", error)
                                    generatedText = "Error Occurred"
                                }
                            }
                        }
                                        
                    
                    /*NavigationLink(destination: ContentView()) {
                        Text("Home")
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(Color(red: 0.96, green: 0.83, blue:0.37))
                            .foregroundColor(Color(red: 0.10, green: 0.39, blue: 0.49))
                            .cornerRadius(30)
                            .font(.custom("Arial-Bold", size: 30))
                    }*/
                    NavigationLink(destination: Input()) {
                        Text("Go Back")
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(Color(red: 0.96, green: 0.83, blue:0.37))
                            .foregroundColor(Color(red: 0.10, green: 0.39, blue: 0.49))
                            .cornerRadius(30)
                            .font(.custom("Arial-Bold", size: 30))
                    }
                    Spacer()
                    NavigationLink(destination: Help()) {
                
                        Text("?")
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(Color(red: 0.96, green: 0.83, blue:0.37))
                            .foregroundColor(Color(red: 0.10, green: 0.39, blue: 0.49))
                            .cornerRadius(30)
                            .font(.custom("Arial-Bold", size: 30))
                    }
                    
                    
                }
                
                .padding()
            }
        //}
    }
    
    struct Analysis_Previews: PreviewProvider {
        static var previews: some View {
            Analysis(userInput: .constant("Default Text"))
        }
    }
}
