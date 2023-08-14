import SwiftUI

struct Input: View {
    var body: some View {
        NavigationView {
            
            ZStack {
                
                Color(red: 0.10, green: 0.39, blue: 0.49)
                    .edgesIgnoringSafeArea(.all)
                
                
                
                VStack {
                    
                    Text("ScamText Disclaimer")
                        .font(.custom("Arial-Bold", size: 38))
                        .foregroundColor(.white)
                    
                    Text("Our app provides analysis and information to best of its abilities but can not guarantee complete accuracy at all times. We advise you to use our app's analysis with caution and your own judgement. \n\nBy clicking below you  acknowledge and release us from any liabilty arising from the use of our app or its analysis.")
                        .frame(width: 300, height: 270, alignment: .center)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .cornerRadius(20)
                        .font(.custom("Arial-Bold", size: 20))
                        .multilineTextAlignment(.center)
                        .padding(50)
                    
                    
                    
                    NavigationLink(destination: ContentView()) {
                        Text("Accept")
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
    
    struct Input_Previews: PreviewProvider {
        static var previews: some View {
            Input()
        }
    }
}
