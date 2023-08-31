//
//  CardView2.swift
//  CS Portfolio
//


import SwiftUI

struct CardView2: View {
    @EnvironmentObject var designData: DesignData
  

    
    let shape = RoundedRectangle(cornerRadius: 30)

@State var isClickedC = false
@State var isClickedI = false
@State var isFaceUp: Bool = true


    func action(){
//  the input from the user is stored in a dictionary where it is obvious which data is which with the keys available for them.
        
        if designData.n == "" {
            designData.n = "untitled"
            // if the design has no custom name, titles it as untitled.
        }
        
        if designData.i == "" {
            designData.i = "no icon selected"
            // if no icon has been selected, prints no icon selected on the saved view.
        }
       
        designData.currentDesign = ["color": designData.c, "icon": designData.i, "name": designData.n]
         
//Appends these dictionaries into the array of dictionaries, where infinitely many of these arrays could be stored and retrieved once necessary.
        
        designData.designs.append(designData.currentDesign)

//The array of dictionary "added" was used to transfer each dictionary in the array into the list on the contentView so that a new item could be created on the home screen for each saved design.
        
        designData.added = designData.designs
    }
    
    
    var body: some View {
        
        NavigationView {
            VStack{
                Spacer()
                TextInput(text: $designData.n,
                          placeholder: "Name Your Design",
                          keyboardType: .namePhonePad,
                          sfSymbol: "pencil.tip.crop.circle" )
                .padding()
                .frame(width: 370, height: 50)
                
            
                Text("\(designData.n)")
    
              
                
                VStack {
                    
                    ZStack {
                        
                        if isFaceUp {
                            
                        
                            shape
                                .foregroundColor(Color.gray.opacity(0.5))
                                .frame(width: 350, height: 360)
                                .overlay(
                                    //image hoodie gelecek
                                    Image("\(designData.c)front")
                                    
                                        .resizable()
                                        .frame(width: 280, height: 400)
                                    
                                    
                                )
                            
                    
                            
                        } else {
                            

                        
                            shape
                                .foregroundColor(Color.gray.opacity(0.5))
                                .frame(width: 350, height: 360)
                            
                                .overlay(
                                    Image("\(designData.c)back")
                                        .resizable()
                                        .frame(width: 280, height: 400)
                                    
                                    
                                )
                 
                        }
                        
                        if isFaceUp {
                            Image(systemName: "\(designData.i)")
                                .resizable()
                                .scaleEffect(0.1)
                                .foregroundColor(Color.black.opacity(0.7))
                        } else {
                            
                            Image(systemName: "\(designData.i)")
                                .resizable()
                                .scaleEffect(0.2)
                                .offset(y: 20)
                                .foregroundColor(Color.black.opacity(0.7))
                        }
                        
                        
                        
                        
                        
                    }
                    .onTapGesture {
                        withAnimation {
                            self.isFaceUp.toggle()
                        }
                    }
                }
                
                // 2. dikdörtgenssss
                
                
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 350, height: 300)
                    .foregroundColor(Color.gray.opacity(0.5))
                    .overlay(
                        
                        
                        Group {
                            VStack (spacing: 5){
                                Spacer()
                                Text("Select Background Color:")
                                    .foregroundColor(Color.black)
                                    .frame(alignment: .topLeading)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 18))
                                    .padding(.horizontal)
                                
                                
                                // color buttons
                                
                                if isClickedC {
                                    
                                    
                                    HStack {
                                        
                                        ZStack {
                                            Circle()
                                                .scaleEffect(0.74)
                                                .foregroundColor(Color.white)
                                            
                                            Button(action: {
                                                isClickedC.toggle();
                                                designData.c = "white" }) {
                                                    Circle()
                                                        .scaleEffect(0.7)
                                                        .foregroundColor(Color.blue)
                                                }
                                        } // Z
                                        // color button
                                        ZStack {
                                            Circle()
                                                .scaleEffect(0.74)
                                                .foregroundColor(Color.white)
                                            
                                            Button(action: {
                                                isClickedC.toggle();
                                                designData.c = "white" }) {
                                                    Circle()
                                                        .scaleEffect(0.7)
                                                        .foregroundColor(Color.purple)
                                                }
                                        } // Z
                                        // color button
                                        ZStack {
                                            Circle()
                                                .scaleEffect(0.74)
                                                .foregroundColor(Color.white)
                                            
                                            Button(action: {
                                                isClickedC.toggle();
                                                designData.c = "white" }) {
                                                    Circle()
                                                        .scaleEffect(0.7)
                                                        .foregroundColor(Color.pink)
                                                }
                                        } // Z
                                        
                                        
                                    } // HSTACK
                                    
                                    HStack {
                                        
                                        // color button
                                        ZStack {
                                            Circle()
                                                .scaleEffect(0.74)
                                                .foregroundColor(Color.white)
                                            
                                            Button(action: {
                                                isClickedC.toggle();
                                                designData.c = "white" }) {
                                                    Circle()
                                                        .scaleEffect(0.7)
                                                        .foregroundColor(Color.yellow)
                                                }
                                        } // Z
                                        // color button
                                        ZStack {
                                            Circle()
                                                .scaleEffect(0.74)
                                                .foregroundColor(Color.white)
                                            
                                            Button(action: {
                                                isClickedC.toggle();
                                                designData.c = "white" }) {
                                                    Circle()
                                                        .scaleEffect(0.7)
                                                        .foregroundColor(Color.orange)
                                                }
                                        } // Z
                                        // color button
                                        ZStack {
                                            Circle()
                                                .scaleEffect(0.74)
                                                .foregroundColor(Color.white)
                                            
                                            Button(action: {
                                                isClickedC.toggle();
                                                designData.c = "white" }) {
                                                    Circle()
                                                        .scaleEffect(0.7)
                                                        .foregroundColor(Color.green)
                                                }
                                        } // Z
                                        
                                        
                                        
                                        
                                        // isclickedc - else statement
                                    } // H Sonu
                                    
                                }  else {
                                    
                                    HStack {
                                        ZStack {
                                            Circle()
                                                .scaleEffect(0.74)
                                                .foregroundColor(Color.white)
                                            
                                            Button(action: {
                                                isClickedC.toggle();
                                                designData.c = "blue" }) {
                                                    Circle()
                                                        .scaleEffect(0.7)
                                                        .foregroundColor(Color.blue)
                                                }
                                        } // Z
                                        // color button
                                        ZStack {
                                            Circle()
                                                .scaleEffect(0.74)
                                                .foregroundColor(Color.white)
                                            
                                            Button(action: {
                                                isClickedC.toggle();
                                                designData.c = "purple" }) {
                                                    Circle()
                                                        .scaleEffect(0.7)
                                                        .foregroundColor(Color.purple)
                                                }
                                        } // Z
                                        // color button
                                        ZStack {
                                            Circle()
                                                .scaleEffect(0.74)
                                                .foregroundColor(Color.white)
                                            
                                            Button(action: {
                                                isClickedC.toggle();
                                                designData.c = "pink" }) {
                                                    Circle()
                                                        .scaleEffect(0.7)
                                                        .foregroundColor(Color.pink)
                                                }
                                        } // Z
                                        
                                        
                                    } // HSTACK
                                    
                                    HStack {
                                        
                                        // color button
                                        ZStack {
                                            Circle()
                                                .scaleEffect(0.74)
                                                .foregroundColor(Color.white)
                                            
                                            Button(action: {
                                                isClickedC.toggle();
                                                designData.c = "yellow" }) {
                                                    Circle()
                                                        .scaleEffect(0.7)
                                                        .foregroundColor(Color.yellow)
                                                }
                                        } // Z
                                        // color button
                                        ZStack {
                                            Circle()
                                                .scaleEffect(0.74)
                                                .foregroundColor(Color.white)
                                            
                                            Button(action: {
                                                isClickedC.toggle();
                                                designData.c = "orange" }) {
                                                    Circle()
                                                        .scaleEffect(0.7)
                                                        .foregroundColor(Color.orange)
                                                }
                                        } // Z
                                        // color button
                                        ZStack {
                                            Circle()
                                                .scaleEffect(0.74)
                                                .foregroundColor(Color.white)
                                            
                                            Button(action: {
                                                isClickedC.toggle();
                                                designData.c = "green" }) {
                                                    Circle()
                                                        .scaleEffect(0.7)
                                                        .foregroundColor(Color.green)
                                                }
                                        } // Z
                                        
                                    } //H
                                    
                                    
                                } // else
                                
                                Divider()
                                
                                VStack(spacing: 5) {
                                    // icons
                                    Text("Select Icon:")
                                        .foregroundColor(Color.black)
                                        .frame(alignment: .topLeading)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 18))
                                        .padding()
                                    
                                    
                                    if isClickedI {
                                        HStack {
                                            Spacer()
                                            Button(action: {
                                                isClickedI.toggle();
                                                designData.i = "" }) {
                                                    Image(systemName: "lock")
                                                        .resizable()
                                                        .frame(width: 22, height: 28)
                                                        .foregroundColor(Color.black)
                                                }
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                isClickedI.toggle();
                                                designData.i = "" }) {
                                                    Image(systemName: "cloud.bolt")
                                                        .resizable()
                                                        .frame(width: 25, height: 28)
                                                        .foregroundColor(Color.black)
                                                }
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                isClickedI.toggle();
                                                designData.i = "" }) {
                                                    Image(systemName: "person.fill")
                                                        .resizable()
                                                        .frame(width: 28, height: 28)
                                                        .foregroundColor(Color.black)
                                                }
                                            
                                            Spacer()
                                            
                                        } // HSTACK
                                        
                                    } else {
                                        HStack {
                                            Spacer()
                                            
                                            Button(action: {
                                                isClickedI.toggle();
                                                designData.i = "lock" }) {
                                                    Image(systemName: "lock")
                                                        .resizable()
                                                        .frame(width: 22, height: 28)
                                                        .foregroundColor(Color.black)
                                                }
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                isClickedI.toggle();
                                                designData.i = "cloud.bolt" }) {
                                                    Image(systemName: "cloud.bolt")
                                                        .resizable()
                                                        .frame(width: 25, height: 28)
                                                        .foregroundColor(Color.black)
                                                }
                                            Spacer()
                                            Button(action: {
                                                isClickedI.toggle();
                                                designData.i = "person.fill" }) {
                                                    Image(systemName: "person.fill")
                                                        .resizable()
                                                        .frame(width: 28, height: 28)
                                                        .foregroundColor(Color.black)
                                                }
                                            
                                            Spacer()
                                            
                                        } // HStack
                                        
                                    } // else
                                    
                                    Divider()
                                    
                                    
                                    
                                } // vstack
                              
                                
                                
                                HStack {
                                    
                                    
                                    Group{
                                        Button
                                        {
                                            // label
                                            action()
                                        // Printed the two following data to debug my code and ensure i was clearly taking the right variables and was able to transfer data from the scope of a view to another.
                                            
                                            let _ = print(designData.currentDesign)
                                            let _ = print(designData.designs)
                                            
                                        } label: {
                                            
                                            Text("Save Design")
                                            
                                        }
                                        .frame(width: 150, height: 45)
                                        .buttonStyle(.bordered)
                                        .controlSize(.large)
                                        .buttonBorderShape(.roundedRectangle(radius: 12))
                                        
                                        
                                    }/// groupla
                                    
                                    // navigates the user to the contentview
                                    
                                    Group{
                                        NavigationLink(destination:
                                                      ContentView()
                                                       
                                        ) { Text("Home")  }
                                            .frame(width: 150, height: 45)
                                            .buttonStyle(.bordered)
                                            .controlSize(.large)
                                            .buttonBorderShape(.roundedRectangle(radius: 12))
                                        
                                        
                                    }
                                    
                                }        .padding()
                                    .frame(alignment: .center)

                                
                            }// V
                        } // group
                    ) // overlay
                
            }
            
            
        }.navigationBarBackButtonHidden(true)
        .environmentObject(designData)
        // nav view
    // class

        
    } // body
    
} // struct



//Preview code 
struct CardView2_Previews: PreviewProvider {
    static var previews: some View {
         let contentView = ContentView()
        CardView2()
    }
}
