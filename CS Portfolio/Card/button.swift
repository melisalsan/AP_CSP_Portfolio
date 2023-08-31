//
//  Button.swift
//  CS Portfolio
//
//  Created by Melis Alsan on 16.03.2023.
//

import SwiftUI

struct LoginButton: View {
    
    typealias ActionHandler = () -> Void
    
    let title: String
    let background: Color
    let foreground: Color
    let border: Color
    let handler: ActionHandler
    
    private let cornerRadius: CGFloat = 10
    
    internal init(title: String,
                  background: Color = .indigo,
                  foreground: Color = .white,
                  border: Color = .clear,
                  handler: @escaping LoginButton.ActionHandler) {
        self.title = title
        self.background = background
        self.foreground = foreground
        self.border = border
        self.handler = handler
    }
    
    var body: some View {
        Button(action: handler, label: {
            Text(title)
                .frame(maxWidth: .infinity,
                       maxHeight: 50)
        })
        .background(background)
        .foregroundColor(foreground)
        .font(.system(size: 16, weight: .bold))
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(border, lineWidth: 2)
        )
    }
    
    
}


struct PreviewLayoutModifiersLogin: ViewModifier {
    
    let name: String
    
    func body(content: Content) -> some View{
    content
            .previewLayout(.sizeThatFits)
            .previewDisplayName(name)
            .padding()
        
    }
    
}

extension View {
    func preview(with name: String) -> some View {
        self.modifier(PreviewLayoutModifiersLogin(name: name))
    }
}



struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton(title: "Login") { }
        
        LoginButton(title: "Login",
                    background: .clear,
                    foreground: .indigo,
                    border: .indigo) { }
            .preview(with: "Button View Login" )
          
    }

}

