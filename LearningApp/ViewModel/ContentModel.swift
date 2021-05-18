//
//  ContentModel.swift
//  LearningApp
//
//  Created by Darrick_Truong on 5/10/21.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    var styleData:Data?
    
    init() {
        getLocalData()
    }
    
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
    
    
    
    
}
