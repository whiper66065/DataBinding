//
//  QuestionView.swift
//  DataBinding
//
//  Created by 潘昱任 on 2020/5/2.
//  Copyright © 2020 ntouyujen. All rights reserved.
//

import SwiftUI

struct QuestionView: View {
    
    @State private var showElementaryPage = false
    @State private var showJuniorPage = false
    
    var body: some View {
        ZStack {
            Image("pic52_1")
            .resizable()
            .blur(radius: 3)
            VStack {
                Button("我是國小生") {
                    self.showElementaryPage = true
                }
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(50)
                    .shadow(radius: 10)
                    .offset(y:-100)
                    
                .sheet(isPresented: self.$showElementaryPage){
                    EleQuestionView(showElementaryPage: self.$showElementaryPage)
                            
                        
                }
                
                Button("我是國中生") {
                    self.showJuniorPage = true
                }
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(50)
                    .shadow(radius: 10)
                    .offset(y:100)
                    
                .sheet(isPresented: self.$showJuniorPage){
                    JunQuestionView(showJuniorPage: self.$showJuniorPage)
                }
            }
            
        }
        
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
