//
//  MainView.swift
//  DataBinding
//
//  Created by 潘昱任 on 2020/5/2.
//  Copyright © 2020 ntouyujen. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
            TabView {
                ContentView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("主頁")
                }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("資料")
                }
                QuestionView()
                    .tabItem {
                        Image(systemName: "pencil")
                        Text("測驗")
                    }
            }
        }
    }

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
