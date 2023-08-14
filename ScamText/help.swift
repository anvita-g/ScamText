//
//  help.swift
//  ScamText
//
//  Created by Anvita Gollu on 8/14/23.
//



import SwiftUI

struct Help: View {
    var body: some View {
        NavigationView {
            
            ZStack {
                
                Color(red: 0.10, green: 0.39, blue: 0.49)
                    .edgesIgnoringSafeArea(.all)
                
                
                
                VStack {
                    
                    Text("ScamText")
                        .font(.custom("Arial-Bold", size: 38))
                        .foregroundColor(.white)
                    
                    
                    Text("You must accept our terms and conditions before using the app. \n\nPaste suspicious text/websites and click \"Analyze Text\" Button. You will then be led to a screen with an analysis of that text. With a ranking of its safety between [safe, risky, unsafe] \n\nYou can test any format of text(text messages, social media messages, etc)")
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 350, alignment: .center)
                        .padding()
                        .background(Color(.white))
                        .foregroundColor(Color(.black))
                        .cornerRadius(30)
                        .font(.custom("Arial-Bold", size: 20))
                        .padding(50)

                    
                    

                    NavigationLink(destination: ContentView()) {
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
    
    struct Help_Previews: PreviewProvider {
        static var previews: some View {
            Help()
        }
    }
}
