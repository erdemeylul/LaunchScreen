//
//  ContentView.swift
//  StartAnimation
//
//  Created by Erdem Senol on 30.07.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = false
    
    
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(0.86)]), startPoint: .leading, endPoint: .trailing)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 40){
                    Image("men")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .offset(x: animate ? 0 : 400)
                        .animation(Animation.interpolatingSpring(stiffness: 40, damping: 5).delay(0.3))
                    
                    Image("manowar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 50)
                        .offset(x: animate ? 0 : -400)
                        .animation(Animation.interpolatingSpring(stiffness: 40, damping: 5).delay(0.3))
                    
                    
                    Text("Start")
                        .font(.title)
                        .foregroundColor(.white)
                        .scaleEffect(animate ? 1 : 0.2)
                        .opacity(animate ? 1 : 0)
                        .animation(Animation.interpolatingSpring(stiffness: 25, damping: 5, initialVelocity: 10).delay(0.9))
                    
                    Text("Other bands play, manowar animates!")
                        .font(.title)
                        .foregroundColor(.white)
                        .scaleEffect(animate ? 1 : 0.2)
                        .opacity(animate ? 1 : 0)
                        .animation(Animation.interpolatingSpring(stiffness: 25, damping: 5).delay(1.3))
                        .multilineTextAlignment(.center)
                    
                }
                
            }.navigationBarHidden(true)
        }.onAppear{
            animate = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
