//
//  EleQuestionView.swift
//  DataBinding
//
//  Created by 潘昱任 on 2020/5/3.
//  Copyright © 2020 ntouyujen. All rights reserved.
//

import SwiftUI

struct EleQuestionView: View {
    
    @Binding var showElementaryPage: Bool
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
                        Text("阿姨有19包糖，給了明明和強強各6包後，還有幾包？")
                        .font(.custom("jf-openhuninn-1.1", size: 20))
                        .foregroundColor(.black)
                        .padding()

                    TextField("您的答案", text: self.$answer1)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
                    .frame(width:413)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 3))
                    
                    
                    Text("第二題：")
                    .font(.custom("jf-openhuninn-1.1", size: 20))
                    .foregroundColor(.black)
                        Text("小朋友排隊，從前面數起，小胖排在第6個，他後面還有9個小朋友，一共有幾個小朋友？")
                        .font(.custom("jf-openhuninn-1.1", size: 15))
                        .foregroundColor(.black)
                        .padding()
                    
                    TextField("您的答案", text: self.$answer2)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
                    .frame(width:413)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 3))
                    
                    Text("第三題：")
                    .font(.custom("jf-openhuninn-1.1", size: 20))
                    .foregroundColor(.black)
                Text("星期天小胖和媽媽去超市買了一個30元的小足球和一瓶28元的果汁，媽媽付了3張20元，請問店員會找多少元？")
                                   .font(.custom("jf-openhuninn-1.1", size: 18))
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
                    self.showElementaryPage = false
                }
                    .font(.system(size: 30))
                .offset(y:50)
            }
        }
     
    }
}

struct EleQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        EleQuestionView(showElementaryPage: .constant(true))
    }
}
