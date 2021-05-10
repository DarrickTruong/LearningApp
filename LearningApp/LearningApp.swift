//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Darrick_Truong on 5/10/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
