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
    let vidRatio:CGFloat = 1080/1920
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string:Constants.videoHostURL + (lesson?.video ?? ""))
        
        GeometryReader { geo in
            
            VStack {
                
                // only show video if we get valid url
                if url != nil {
                    VideoPlayer(player: AVPlayer(url:url!))
                        .cornerRadius(10)
                        .frame(height: geo.size.width * vidRatio)
                }
                
                // TODO: Description
                CodeTextView()
                
                // Next Lesson Button
                if model.hasNextLesson() {
                    Button(action: {
                        model.advanceNextLesson()
                    }, label: {
                        
                        ZStack {
                            
                            RectangleCard(color: Color.green)
                                .frame(height:48)
                            
                            Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIdx+1].title)")
                                .bold()
                                .foregroundColor(.white)
                        }
                    })
                    
                } else {
                    // show complete button at the end of lesson
                    
                    Button(action: {
                        model.currentContentSelected = nil
                    }, label: {
                        
                        ZStack {
                            
                            RectangleCard(color: Color.green)
                                .frame(height: 48)
                                
                            
                            Text("Complete")
                                .bold()
                                .foregroundColor(.white)
                        }
                    })
                }
            }
            .padding()
            .navigationBarTitle(lesson?.title ?? "")
        }
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
