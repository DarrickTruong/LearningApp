//
//  ContentView.swift
//  LearningApp
//
//  Created by Darrick_Truong on 5/10/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment:.leading) {
                Text("What would you like to do today?")
                    .padding(.leading, 20)
                ScrollView {
                    
                    
                    LazyVStack {
                        
                        ForEach(model.modules) { module in
                            
                            VStack(spacing:20){
                            // Learning Card
                            HomeRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                            
                            // Test Card
                            HomeRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                            }
                        }
                        
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Get Started")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
