//
//  ContentView.swift
//  CS Portfolio
//

 
import SwiftUI
import CoreData


struct ContentView: View {

    @EnvironmentObject var designData: DesignData

    
    @Environment(\.managedObjectContext) private var viewContext
    
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    func saveindex(item: Int) {
        designData.indeks = item
    }

    var body: some View {
        NavigationView {
            List {
                
                // indexes each of the items added on the list from the array of dictionaries so that the values within the dictionaries are accessible.
                
                ForEach(designData.added.indices, id: \.self) { item in
                    NavigationLink{
                        
                        // When tapped on to each item on the home page list, navigates to a seperate SavedView of that individual design, allowing the users to view their past designs.
                        
                        SavedView().onAppear {
                            saveindex(item: item)
                        }
                            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                        
                    } label: {
                        
                        // names each item in the list with the input of the user.
                        
                        Text("\(designData.added[item]["name"]! as String)")
                        
                    }
                    
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    
                    NavigationLink(destination:
                                    CardView2()
            // Navigates to the design view to create a new design.
            // Once saved, leads to the main screen.
                                   
                    ) { Text("+")  }
                    
                
                }
            }
     
            
        } .navigationBarBackButtonHidden(true)
            .environmentObject(designData)
        // end of the nav view
    }
    
 
     func addItem() {
         let persistenceController = PersistenceController.shared
         let context = persistenceController.context

            // Create a new instance of the ContentView and set the managedObjectContext environment variable
         
            let contentView = ContentView().environment(\.managedObjectContext, context)
                        
        withAnimation {
            let newItem = Item(context: viewContext)

            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
             
               
                
            }
            
            
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate.
                
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()


// allows the programmer to view the program in SwiftUI canvas

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView( )
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

