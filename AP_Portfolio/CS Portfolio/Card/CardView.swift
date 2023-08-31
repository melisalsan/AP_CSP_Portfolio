//
//  CardView.swift
//  CS Portfolio
//


import SwiftUI



 var isClickedS = 0

// The Class with all the variables and used instances in the application : all are published variables and observable objects so that they are accessible with in the scope of all the program.

class DesignData: ObservableObject {
    @Published var added: [[String: String]] = [[:]]
    
    @Published var c = "white"
    @Published var i = ""
    @Published var n = ""
    
    
    @Published var designs: [[String: String]] = []
    @Published var currentDesign: [String:String] = ["color": "", "icon": "", "name": ""]
    @Published var indeks: Int = 0
    
}


struct CardView: View {
    // creates the class in the view.
    @StateObject var designData = DesignData()
   
    // creates the background of the hoodie design.
    let shape = RoundedRectangle(cornerRadius: 30)

    // boolean values to ease the control of the program.
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
                // Text input from the user is taken to name the new design.
                // $ is since the variable is a static variable that is used within the scope of multiple views.
                TextInput(text: $designData.n,
                          // $ is since the variable is a static variable that is used within the scope of multiple views.
                          placeholder: "Name Your Design",
                          keyboardType: .namePhonePad,
                          sfSymbol: "pencil.tip.crop.circle" )
                .padding()
                .frame(width: 370, height: 50)
            // Prints the value saved in the code above on the screen for the user to view before saving, accessing it through the class: DesignData.
                Text("\(designData.n)")
    
              
                
                VStack {
                    ZStack {
                        
                        // if else statements check conditions to see how the view should be set.
                        
                
                        if isFaceUp {
                        
                            shape
                                .foregroundColor(Color.gray.opacity(0.5))
                                .frame(width: 350, height: 360)
                                .overlay(
                                    Image("\(designData.c)front")
                                        .resizable()
                                        .frame(width: 280, height: 400)   )
                            
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
                
                // The second half of the view.
                
                
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
                                
                                
                                // the program below is for the color change buttons.
                                
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
                                        } // End of ZStack
                                       
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
                                        } // End of ZStack
                                      
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
                                        } // End of ZStack
                                        
                                        
                                    }
                                    
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
                                                        .foregroundColor(Color.yellow)
                                                }
                                        } // End of ZStack
                                    
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
                                        } // End of ZStack
                                 
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
                                        } // End of ZStack
                                        
                                        
                                        
                                        // Else statement's for the isClickedC statement: removes the color from the hoodie if the color selections are tapped on once more, after already selection a color.
                                    } // End of HStack
                                    
                                }  else {
                                    
                                    HStack {
                                        ZStack {
                                            Circle()
                                                .scaleEffect(0.74)
                                                .foregroundColor(Color.white)
                                            
                                            Button(action: {
                                                // The isClickedC var is a bool value allowing us to keep track of the users input and understand whether to add or remove color from the design depending on their previous actions.
                                                
                                                isClickedC.toggle();
                                                // On the users tap, the value of the var c is turned into the color of the circle the users tap onto.
                                                
                                                designData.c = "blue" }) {
                                                    Circle()
                                                        .scaleEffect(0.7)
                                                        .foregroundColor(Color.blue)
                                                }
                                        }
                                       
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
                                        }
                                      
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
                                        }
                                        
                                        
                                    }
                                    
                                    HStack {
                                       
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
                                        }
                                       
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
                                        }
                                      
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
                                        }
                                        
                                    }
                                    
                                    
                                }
                                
                                Divider()
                                
                                VStack(spacing: 5) {
                                    // icons
                                    Text("Select Icon:")
                                        .foregroundColor(Color.black)
                                        .frame(alignment: .topLeading)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 18))
                                        .padding()
                                    
                                    // Program for the icon selection.
                                    
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
                                            
                                        } // HSTACK sonu
                                        
                                    } else {
                                        HStack {
                                            Spacer()
                                            Button(action: {
                                                isClickedI.toggle();
                                                designData.i = "lock" }) {
                                                    Image(systemName: "lock")
                                                        .resizable()
                                                        .frame(width: 22, height: 28)
                                                        .foregroundColor(Color.black)  }
                                            Spacer()
                                            
                                            Button(action: {
                                                isClickedI.toggle();
                                                
                                                // The isClickedI var is a bool value allowing us to keep track of the users input and understand whether to add or remove icon from the design depending on their previous actions.
                                                designData.i = "cloud.bolt" }) {
                                                    // On the users tap, the value of the var c is turned into the color of the circle the users tap onto.
                                                    
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
                                            
                                        } label: {
                                            
                                            Text("Save Design")
                                            
                                        }
                                        .frame(width: 150, height: 45)
                                        .buttonStyle(.bordered)
                                        .controlSize(.large)
                                        .buttonBorderShape(.roundedRectangle(radius: 12))
                                        
                                        
                                    }/// groupla
                                    
                                    
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
        // nav view sonu
    // class

        
    } // body
    
} // struct


//Preview Struct for SwiftUI canvas

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
    let contentView = ContentView()
        CardView()
    }
}
