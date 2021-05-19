//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Darrick_Truong on 5/19/21.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        
        // set attributed text for the lesson
        textView.attributedText = model.lessonExplanation
        
        // scroll to the top
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
}


