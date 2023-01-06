//
//  Priority.swift
//  App07-Todo-Firebase
//
//  Created by Brenda Saucedo on 24/09/22.
//

import SwiftUI

struct Priority: Identifiable {
    var id: Int
    var priority: Int
    var text: String
    var color: Color
}

extension Priority {

    static let priority = [
        Priority(id: 0, priority: 1, text: "Alta", color: Color(red: 255/255, green: 101/255, blue: 101/255)),
        Priority(id: 1, priority: 2, text: "Moderada", color: Color(red: 255/255, green: 255/255, blue: 101/255)),
        Priority(id: 2, priority: 3, text: "Baja", color: Color(red: 101/255, green: 255/255, blue: 101/255)),
    ]
    
}
