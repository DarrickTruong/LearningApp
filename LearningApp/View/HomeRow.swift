//
//  HomeRow.swift
//  LearningApp
//
//  Created by Darrick_Truong on 5/18/21.
//

import SwiftUI

struct HomeRow: View {
    
    var image:String
    var title:String
    var description:String
    var count:String
    var time:String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175),
                             contentMode: .fit)
            
            
            HStack{
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                VStack(alignment: .leading, spacing:10) {
                    
                    Text(title)
                        .bold()
                    Text(description)
                        .padding(.bottom, 20)
                        .font(Font.system(size: 12))
                    
                    HStack {
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(count)
                            .font(Font.system(size:10))
                        
                        Spacer()
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(Font.system(size: 10))
                        
                    }
                    
                }
                .padding([.leading])
            }
            .padding([.leading, .trailing])
        }
    }
}

struct HomeRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeRow(image: "swift", title: "Swift Course", description: "Swift Description", count: "10 Lessons", time: "2 hours")
    }
}
