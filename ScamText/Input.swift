import SwiftUI

struct Input: View {
    @State var userInput: String = ""
    var body: some View {
        //NavigationView {
            
            ZStack {
                
                Color(red: 0.10, green: 0.39, blue: 0.49)
                    .edgesIgnoringSafeArea(.all)
                
                
                
                VStack {
                    
                    Text("ScamText")
                        .font(.custom("Arial-Bold", size: 38))
                        .foregroundColor(.white)
                    
                    TextField("Paste your suspicious text here.", text: $userInput)
                        .frame(width: 300, height: 270, alignment: .center)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .cornerRadius(20)
                        .font(.custom("Arial-Bold", size: 20))
                        .multilineTextAlignment(.center)
                        .padding(50)
                    
                    NavigationLink(destination: Analysis(userInput: $userInput)) {
                        Text("Analyze Text")
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(Color(red: 0.96, green: 0.83, blue:0.37))
                            .foregroundColor(Color(red: 0.10, green: 0.39, blue: 0.49))
                            .cornerRadius(30)
                            .font(.custom("Arial-Bold", size: 30))
                    }
                    /*NavigationLink(destination: ContentView()) {
                        Text("Go Back")
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(Color(red: 0.96, green: 0.83, blue:0.37))
                            .foregroundColor(Color(red: 0.10, green: 0.39, blue: 0.49))
                            .cornerRadius(30)
                            .font(.custom("Arial-Bold", size: 30))
                    }*/
                    
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
    
    struct Input_Previews: PreviewProvider {
        static var previews: some View {
            Input()
        }
    }
}
