//
//  JunQuestionView.swift
//  DataBinding
//
//  Created by 潘昱任 on 2020/5/3.
//  Copyright © 2020 ntouyujen. All rights reserved.
//

import SwiftUI

struct JunQuestionView: View {
    
    @Binding var showJuniorPage: Bool
        @State private var answer1 = ""
        @State private var answer2 = ""
        @State private var answer3 = ""
        @State private var showAlert = false
        
        
        var body: some View {
            
            ZStack {
                Image("pic52_1")
                .resizable()
                .blur(radius: 20)
                VStack {
                    VStack(alignment: .leading){
                        Text("第一題：")
                        .font(.custom("jf-openhuninn-1.1", size: 20))
                        .foregroundColor(.black)
                            Text("34－(50＋25)×6÷15=??")
                            .font(.custom("jf-openhuninn-1.1", size: 34))
                            .foregroundColor(.black)
                            .padding()
                        .offset(x:5)

                        TextField("您的答案", text: self.$answer1)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
                        .frame(width:413)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 3))
                        
                        
                        Text("第二題：")
                        .font(.custom("jf-openhuninn-1.1", size: 20))
                        .foregroundColor(.black)
                            Text("999×567=??")
                            .font(.custom("jf-openhuninn-1.1", size: 38))
                            .foregroundColor(.black)
                            .padding()
                                .offset(x:85)
                        
                        TextField("您的答案", text: self.$answer2)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
                        .frame(width:413)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 3))
                        
                        Text("第三題：")
                        .font(.custom("jf-openhuninn-1.1", size: 20))
                        .foregroundColor(.black)
                    Text("114×119×123×127，所得乘積的個位數字為何？")
                                       .font(.custom("jf-openhuninn-1.1", size: 17))
                                       .foregroundColor(.black)
                                       .padding()
                        
                        TextField("您的答案", text: self.$answer3)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
                        .frame(width:413)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 3))
                        
                    }
                    Button(action:{
                         self.showAlert = true
                     }){
                         
                         Text("提交答案")
                             .font(.system(size: 30))
                             .foregroundColor(.black)
                             .padding()
                             .background(Color.yellow)
                             .cornerRadius(50)
                             .shadow(radius: 10)
                         
                     }
                    
                    .alert(isPresented: self.$showAlert) { () -> Alert in
                        
                        return Alert(title: Text("您最棒！"), message:Text("感謝您耐心作答"), dismissButton: .default(Text("謝謝")))
                         
                     }
                    .padding()
                    
                    
                    Button("回到上一頁"){
                        self.showJuniorPage = false
                    }
                    .font(.system(size: 30))
                    .offset(y:50)
                }
            }
         
        }
    }
                
struct JunQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        JunQuestionView(showJuniorPage: .constant(true))
    }
}
