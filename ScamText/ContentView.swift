import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            ZStack {
                
                Color(red: 0.10, green: 0.39, blue: 0.49)
                    .edgesIgnoringSafeArea(.all)
                
                
                
                VStack {
                    
                    Text("ScamText")
                        .font(.custom("Arial-Bold", size: 55))
                        .foregroundColor(.white)
                    
                    
                    Image("scampic")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    
                    
                    NavigationLink(destination: Disclaimer()) {
                        Text("Continue")
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(Color(red: 0.96, green: 0.83, blue:0.37))
                            .foregroundColor(Color(red: 0.10, green: 0.39, blue: 0.49))
                            .cornerRadius(30)
                            .font(.custom("Arial-Bold", size: 30))
                    }
                    NavigationLink(destination: Help()) {
                        Text("Help")
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
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
