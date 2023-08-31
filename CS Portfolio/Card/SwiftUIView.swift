//
//  SwiftUIView.swift
//  CS Portfolio
//
//  Created by Melis Alsan on 15.03.2023.
//

import SwiftUI

struct SwiftUIView: View {
    
  
        var body: some View {
                VStack {
                    Button("Show Modal") {
                        showModal = true
                    }
                    Text("\(s)")
                }
                .sheet(isPresented: $showModal) {
                    VStack {
                        TextField("Enter a string", text: $s)
                            .padding()
                        Button("Save") {
                            // Save the input string here
                            showModal = false
                        }
                    }
                    .padding()
                }
            
            
            }
    }


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
