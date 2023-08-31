//
//  CS_PortfolioApp.swift
//  CS Portfolio

import SwiftUI

@main
struct CS_PortfolioApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
CardView()                .navigationBarBackButtonHidden(true)
             // ContentView()
           //   .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
