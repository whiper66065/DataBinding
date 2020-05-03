//
//  ContentView.swift
//  DataBinding
//
//  Created by 潘昱任 on 2020/5/1.
//  Copyright © 2020 ntouyujen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var show = false
    
    var body: some View {
        
        ZStack {
            Image("pic52_2")
            .resizable()
            .blur(radius: 5)
//            Rectangle()
//                .foregroundColor(.blue)
            
            VStack {
                
                TopicWord()
                    
                VStack {
                    Image("pic52")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 8))
                        .offset(x:0,y:-50)
                        
                    Text("孩子放學後的另一個家")
                    .font(.custom("jf-openhuninn-1.1", size: 35))
                        .foregroundColor(.green)
                        .padding()
//                    .font(.system(size: 30)).fontWeight(.heavy)
//                    .foregroundColor(.yellow)
//                    .padding()
//                    .background(Color.red)
//                    .cornerRadius(10.0)
//                    .offset(x:0,y:50)
                }
                .offset(y: show ? 0 : 2000)
                    .scaleEffect(show ? 1 : 0.5)
                    .opacity(show ? 1 : 0)
                    .animation(.easeInOut(duration: 3))
                    .onAppear {
                        self.show = true
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TopicWord: View {
    var body: some View {
        VStack {
            Text("五 餅 二 魚")
                .font(.custom("Nagurigaki Crayon", size: 65))
                .foregroundColor(.blue)
                .padding()
                .offset(x:0,y:-60)
            Text("家 教 班")
            .font(.custom("Nagurigaki Crayon", size: 35))
            .foregroundColor(.blue)
            .padding()
            .offset(x:0,y:-80)
        }
    }
}
