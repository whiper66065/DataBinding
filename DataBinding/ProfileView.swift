//
//  ProfileView.swift
//  DataBinding
//
//  Created by 潘昱任 on 2020/5/1.
//  Copyright © 2020 ntouyujen. All rights reserved.
//

import SwiftUI

struct sub {
    var name: String
}

struct ProfileView: View {
    
    @State private var name = ""
    @State private var scale: CGFloat = 1
    @State private var brightnessAmount : Double = 0
    @State private var selectDate = Date()
    @State private var meetDate = Date()
    @State private var grade: CGFloat = 1
    @State private var picksub = 0
    @State private var isProfile = false
    @State private var age = 5
    @State private var showAlert = false
    @State private var showQuestionPage = false
       
    let today = Date()
    let startDate = Calendar.current.date(byAdding: .year, value: -9, to: Date())!
    var year: Int {
        Calendar.current.component(.year, from: selectDate)
       }
    
    let roles: [sub] = [
        sub(name: "國語"),
        sub(name: "英文"),
        sub(name: "數學"),
        sub(name: "社會"),
        sub(name: "自然")
    ]
    
    var body: some View {
        GeometryReader { geometry in
        ZStack{
            Rectangle()
                .foregroundColor(.orange)
            VStack {
                Text("學生資料")
                    .font(.custom("jf-openhuninn-1.1", size: 45))
                    .foregroundColor(.blue)
                    .padding()
                    .cornerRadius(50)
//                    .offset(x:0,y:0)
                
                if self.isProfile
                {
                    Image("JH\(self.year)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 200)
                    .clipped()
                    .scaleEffect(self.scale)
                    .brightness(self.brightnessAmount)
                    
                }
                else
                {
                    Image("nopic")
                    .resizable()
                    .scaledToFill()
                    .frame(width:200, height:150)
                    .clipShape(Circle())
                    .offset(x:0,y:-30)
                    //.hidden()
                }
                
                Toggle("是否要輸入資料?", isOn: self.$isProfile)
                .frame(width:200)

                
                Form{
                    if self.isProfile{
                        VStack{
                    TextField("您的名字", text: self.$name)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
                    .frame(width:300)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 3))
                        
                    DatePicker("想用哪時的照片？", selection: self.$selectDate, in: self.startDate...self.today, displayedComponents: .date)
                    
                    
                            BrightnessSlider(brightnessAmount: self.$brightnessAmount )
                            
                    }
                    
                    VStack {
                        Text("您的年齡：")
                            .font(.custom("jf-openhuninn-1.1", size: 20))
                        Stepper(value: self.$age, in: 1...120)
                        {
                            if self.age == 1
                            {
                                Text("\(self.age) 歲")
                                    .font(.custom("jf-openhuninn-1.1", size: 18))
                            }
                            else
                            {
                                Text("\(self.age) 歲")
                                    .font(.custom("jf-openhuninn-1.1", size: 18))
                            }
                        }
                        .frame(width:150)
                        .padding()
                        
                        Text("您的年級：\(Int(self.grade)) 年級")
                            .font(.custom("jf-openhuninn-1.1", size: 20))
                        Slider(value: self.$grade, in: 1...9, step: 1, minimumValueLabel: Image(systemName: "1.circle").imageScale(.large), maximumValueLabel: Image(systemName: "9.circle").imageScale(.large)) {
                           Text("")
                         }
                        HStack{
                            Text("最喜歡的科目：")
                            Text("\(self.roles[self.picksub].name)")
                        }
                            .font(.custom("jf-openhuninn-1.1", size: 20))
                        
                        Picker(selection: self.$picksub, label: Text("")) {
                            ForEach(0 ..< self.roles.count) { i in
                                Text(self.roles[i].name).tag(i)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .background(Color.gray)
                        .border(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 30)
                        .frame(width:200)
                        
                        Button(action:{
                             self.showAlert = true
                         }){
                             
                             Text("送出資料")
                                 .font(.system(size: 20))
                                 .foregroundColor(.black)
                                 .padding()
                                 .background(Color.blue)
                                 .cornerRadius(50)
                                 .shadow(radius: 10)
                             
                         }
                        
                        .alert(isPresented: self.$showAlert) { () -> Alert in
                            
                            return Alert(title: Text("恭喜您！"), message:Text("已完成填寫"), dismissButton: .default(Text("我明白了")))
                             
                         }
                    }
                }
             
                    
            }
                
        }
    }
}
}
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct BrightnessSlider: View {
    
    @Binding var brightnessAmount: Double
    
var body: some View {
    HStack{
        Text("調整照片亮度")
        Slider(value: self.$brightnessAmount, in: 0...1, minimumValueLabel: Image(systemName: "sun.max.fill").imageScale(.small), maximumValueLabel: Image(systemName: "sun.max.fill").imageScale(.large)){
    Text("")
    }
}
}
}
