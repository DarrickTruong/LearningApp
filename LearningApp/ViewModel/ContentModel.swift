//
//  ContentModel.swift
//  LearningApp
//
//  Created by Darrick_Truong on 5/10/21.
//

import Foundation

class ContentModel: ObservableObject {
    
    // List of modules
    @Published var modules = [Module]()
    
    // current module
    @Published var currentModule:Module?
    var currentModuleIdx = 0
    
    // current lesson
    @Published var currentLesson:Lesson?
    var currentLessonIdx = 0
    
    // current lesson explanation
    @Published var lessonExplanation = NSAttributedString()
    
    var styleData:Data?
    
    
    init() {
        getLocalData()
    }
    
    // MARK: Data Methods
    func getLocalData(){
        // get url to json file
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        
        // read the file into a data object
        do {
            let jsonData = try Data(contentsOf: jsonURL!)
            let jsonDecoder = JSONDecoder()
            
            
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // assign parsed json modules to modules property
            self.modules = modules
            
        } catch {
            print("Couldn't parse json data")
        }
        
        
        // Parse style data
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        
        // read file into data object
        do {
            let styleData = try Data(contentsOf:styleURL!)
            
            self.styleData = styleData
        } catch {
            print("Couldn't parse style data")
        }
        
    }
    
    // MARK: Module Navigation Methods
    func beginModule(_ moduleId:Int) {
        
        // find the index for this module
        for index in 0..<modules.count {
            if modules[index].id == moduleId {
                // found matching module
                
                currentModuleIdx = index
                break
            }
            
        }
        
        // set the current module
        currentModule = modules[currentModuleIdx]
    }
    
    func beginLesson(_ lessonIndex:Int) {
        
        //check that the lesson index is within range of module lessons
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIdx = lessonIndex
        } else {
            currentLessonIdx = 0
        }
        
        // set current lesson
        currentLesson = currentModule!.content.lessons[currentLessonIdx]
        
        // set lesson explanation
        lessonExplanation = addStyling(currentLesson!.explanation)
    }
    
    func hasNextLesson() -> Bool {
        return currentLessonIdx + 1 < currentModule!.content.lessons.count
    }
    
    func advanceNextLesson() {
        // advance the lesson idx
        currentLessonIdx += 1
        
        // check that it is within range
        if currentLessonIdx < currentModule!.content.lessons.count {
            
            // set the current lesson property
            currentLesson = currentModule!.content.lessons[currentLessonIdx]
            lessonExplanation = addStyling(currentLesson!.explanation)
        } else {
            currentLessonIdx = 0
            currentLesson = nil
        }
        
        
        
        
    }
    
    private func addStyling(_ htmlString:String) -> NSAttributedString {
        var resultString = NSAttributedString()
        var data = Data()
        
        // add the styling data
        if styleData != nil{
            data.append(self.styleData!)
        }
        
        // add html data
        data.append(Data(htmlString.utf8))
        
        // convert to attributed string
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            resultString = attributedString
        }
        
        return resultString
        
    }
    
    
}
