//
//  ToDoItemView.swift
//  CoreDataToDo
//
//  Created by abdullah on 27/09/2019.
//  Copyright © 2019 abdullah. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    var title:String = ""
    var createrAt:String = ""
    
    var body: some View{
        ZStack{
            Color(.red).edgesIgnoringSafeArea(.all)
            HStack{
                VStack(alignment: .leading){
                    Text(title).font(.largeTitle)
                    Text(createrAt).font(.title)
                }
            }
        }
        
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(title: "My Great todo", createrAt: "Today")
    }
}
