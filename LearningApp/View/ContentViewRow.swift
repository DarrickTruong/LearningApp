//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Darrick_Truong on 5/18/21.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model:ContentModel
    var index:Int
    
    var body: some View {
        let lesson = model.currentModule!.content.lessons[index]
        //Lesson Card
        
        ZStack(alignment:.leading) {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height:66)
            
            HStack {
                Text(String(index+1))
                    .font(.headline)
                    .padding(.leading)
                    
                
                VStack(alignment: .leading){
                    Text(lesson.title)
                        .font(.headline)
                    Text(lesson.duration)
                }.padding(.leading, 20)
            }
        }
    }
}

struct ContentViewRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewRow(index: 0)
            .environmentObject(ContentModel())
    }
}
