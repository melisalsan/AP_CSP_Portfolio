//
//  CButton.swift
//  CS Portfolio
//
//  Created by Melis Alsan on 15.03.2023.
//

import SwiftUI



struct CButton: View {
    @State var c: String
    @State var isClickedC = false
    
    var body: some View {
        
        
        ZStack {
            Circle()
                .scaleEffect(0.74)
                .foregroundColor(Color.white)
            
            Button(action: {
                isClickedC.toggle() }) {
                    Circle()
                        .scaleEffect(0.7)
                        .foregroundColor(Color.purple)
                }
           
            
                        Text("\(c)")
        }
        
        
        
    }
    
  
}
struct CButton_Previews: PreviewProvider {
    static var previews: some View {
        CButton(c: "white")
    }
}
