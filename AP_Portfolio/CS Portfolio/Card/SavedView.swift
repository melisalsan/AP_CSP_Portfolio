//
//  SavedView.swift
//  CS Portfolio
//


import SwiftUI

struct SavedView: View {
    @EnvironmentObject var designData: DesignData


    
    @State var isFaceUp: Bool = true
    let shape = RoundedRectangle(cornerRadius: 30)
    
    var body: some View {
    
        
        NavigationView {
            
            VStack {
                
                Spacer()
                
                ZStack {
                    
                    if isFaceUp {
                        
                        shape
                            .foregroundColor(Color.gray.opacity(0.5))
                            .frame(width: 350, height: 360)
                            .overlay(
                                
                                Image("\(designData.added[designData.indeks]["color"]!)front")
                                    .resizable()
                                    .frame(width: 280, height: 400)
                                
                                
                            )
                        
                    } else {
                        shape
                            .foregroundColor(Color.gray.opacity(0.5))
                            .frame(width: 350, height: 360)
                        
                            .overlay(
                            // the data on the list is displayed on the view as it is accessed through the designData class
                                
                                Image("\(designData.added[designData.indeks]["color"]!)back")
                                    .resizable()
                                    .frame(width: 280, height: 400)
                                
                            )
                    }
                    
                    if isFaceUp {
                        Image(systemName: "\(designData.added[designData.indeks]["icon"]!)")
                            .resizable()
                            .scaleEffect(0.1)
                            .foregroundColor(Color.black.opacity(0.7))
                    } else {
                        
                        Image(systemName: "\(designData.added[designData.indeks]["icon"]!)")
                            .resizable()
                            .scaleEffect(0.2)
                            .offset(y: 25)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    
                    
                    
                    
                    
                }
                .onTapGesture {
                    withAnimation {
                        self.isFaceUp.toggle()
                    }
                    
                }
                
                
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 350, height: 300)
                    .foregroundColor(Color.gray.opacity(0.5))
                    .overlay(
                        VStack (alignment: .leading){
                        
                            Text("Name:  \(designData.added[designData.indeks]["name"]!)")
                            Text("Color:   \(designData.added[designData.indeks]["color"]!)")
                            Text("Icon:     \(designData.added[designData.indeks]["icon"]!)")
                            
                        }
                            .font(.system(size: 30))
                    )
                
                Spacer()
                
                NavigationLink(destination:
                                ContentView()
                               
                ) { Text("Back to Home")  }
                

             //
            } // vstack 
        }  .environmentObject(designData)
            .navigationBarBackButtonHidden(true)
        
    } // nav view
    
}

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
          
           
        
    }
}

