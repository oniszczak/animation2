//
//  ContentView.swift
//  animation2
//
//  Created by ALEKSANDER ONISZCZAK on 2023-01-15.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isSubscribed = false
    @State private var animatingCircle = false
    @State private var animatingButton = false
    
    var body: some View {
        VStack {
            Image(systemName: isSubscribed ? "globe" : "circle")
                .imageScale(.large)
                .foregroundColor(isSubscribed ? .accentColor : .black)
                .scaleEffect(isSubscribed ? 1.25 : 1.0)
                .font(.system(size:54))
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        isSubscribed.toggle()
                    }
                }
            
            Text("Hello, world!")
                .bold()
                .opacity(isSubscribed ? 1.0 : 0.5)
            
            // shape with spring
            Circle()
                .frame(width: 150, height:150)
                .foregroundStyle(.linearGradient(colors: [.cyan, .green], startPoint: .topTrailing, endPoint: .bottomLeading))
                .offset(x: animatingCircle ? 30 : 0, y: animatingCircle ? -100 : 0)
                .scaleEffect(animatingCircle ? 2.0 : 1.0)
                .onTapGesture {
                    //withAnimation(.spring()) {
                    withAnimation(.spring(response: 0.9, dampingFraction: 0.3, blendDuration: 0)) {
                        animatingCircle.toggle()
                    }
                }
            
            // Button Example
            Button {
                // action
                withAnimation(.easeInOut(duration: 1).repeatCount(3)) {
                    animatingButton.toggle()
                }
            } label: {
                // label
                Text("Animate")
                    .bold()
                    .frame(width: 200, height: 50)
                    .foregroundColor(.indigo)
                    .background(LinearGradient(colors: [.mint, .white], startPoint: .bottomLeading, endPoint: .topTrailing))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(radius: 3)
                    .opacity(animatingButton ? 1.0 : 0.3)
                    .scaleEffect(animatingButton ? 1.5 : 1.0)
            }
            .padding()
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
