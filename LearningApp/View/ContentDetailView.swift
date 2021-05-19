//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Darrick_Truong on 5/18/21.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string:Constants.videoHostURL + (lesson?.video ?? ""))
        
        
        VStack {
            // only show video if we get valid url
            if url != nil {
                VideoPlayer(player: AVPlayer(url:url!))
                    .cornerRadius(10)
            }
            
            // TODO: Description
            
            // Next Lesson Button
            if model.hasNextLesson() {
                Button(action: {
                    model.advanceNextLesson()
                }, label: {
                    
                    ZStack {
                        
                        Rectangle()
                            .frame(height: 48)
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIdx+1].title)")
                            .bold()
                            .foregroundColor(.white)
                    }
                })
                
            }
            
        }
            .padding()
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
