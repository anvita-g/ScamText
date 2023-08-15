import SwiftUI

struct Analysis: View {
    @Binding var userInput: String
    var body: some View {
        NavigationView {
            
            ZStack {
                
                Color(red: 0.10, green: 0.39, blue: 0.49)
                    .edgesIgnoringSafeArea(.all)
                
                
                
                VStack {
                    
                    Text("ScamText Analysis")
                        .font(.custom("Arial-Bold", size: 38))
                        .foregroundColor(.white)
                    
                    Text("User Input: \(userInput)")
                        .frame(width: 300, height: 270, alignment: .center)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .cornerRadius(20)
                        .font(.custom("Arial-Bold", size: 20))
                        .multilineTextAlignment(.center)
                        .padding(50)
                    
                    
                    
                    NavigationLink(destination: ContentView()) {
                        Text("Home")
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(Color(red: 0.96, green: 0.83, blue:0.37))
                            .foregroundColor(Color(red: 0.10, green: 0.39, blue: 0.49))
                            .cornerRadius(30)
                            .font(.custom("Arial-Bold", size: 30))
                    }
                    NavigationLink(destination: Input()) {
                        Text("Go Back")
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(Color(red: 0.96, green: 0.83, blue:0.37))
                            .foregroundColor(Color(red: 0.10, green: 0.39, blue: 0.49))
                            .cornerRadius(30)
                            .font(.custom("Arial-Bold", size: 30))
                    }
                    
                }
                
                .padding()
            }
        }
    }
    
    struct Analysis_Previews: PreviewProvider {
        static var previews: some View {
            Analysis(userInput: .constant("Default Text"))
        }
    }
}
