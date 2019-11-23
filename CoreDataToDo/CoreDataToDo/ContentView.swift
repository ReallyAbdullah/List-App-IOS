//
//  ContentView.swift
//  CoreDataToDo
//
//  Created by abdullah on 27/09/2019.
//  Copyright © 2019 abdullah. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toToItems:FetchedResults<ToDoItem>
    @State private var newToDoItem = ""
    
    var body: some View {
        NavigationView{
            List{
                Section(header :Text("Whats next?")){
                    HStack{
                        TextField("New Item", text:self.$newToDoItem)
                        Button(action: {
                            let toDoItem = ToDoItem(context: self.managedObjectContext)
                            toDoItem.title = self.newToDoItem
                            toDoItem.createdAt = Date()
                            
                            do{
                                try self.managedObjectContext.save()
                            }catch{
                                print(error)
                            }
                            
                            self.newToDoItem = ""
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.red).imageScale(.large)
                        }
                    }
                }
                Section(header: Text("To Do's")){
                    ForEach(self.toToItems){toDoItem in
                        ToDoItemView(title: toDoItem.title!, createrAt: "\(toDoItem.createdAt!)")
                    }.onDelete {indexSet in
                        let deleteitem = self.toToItems[indexSet.first!]
                        self.managedObjectContext.delete(deleteitem)
                        
                        do{
                            try self.managedObjectContext.save()
                        }catch{
                            print(error)
                        }
                    }
                }
            }.font(.headline)
                .navigationBarTitle(Text("Data Logger"))
            .navigationBarItems(trailing: EditButton())
                .foregroundColor(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
