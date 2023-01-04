//
//  ColorView.swift
//  App03-Lista
//
//  Created by Brenda Saucedo on 15/08/22.
//

import SwiftUI

struct ContactDetailView: View {
    
    var colour: Colour
    var student: User
    
    var body: some View {
        ZStack {
//            colour.colour
//            VStack {
//                if student.sexF {
//                    Text(student.name)
//                        .foregroundColor(.black)
//                        .font(.system(size: 50, weight: .bold, design: .default))
//                    Text(student.studies)
//                        .foregroundColor(.black)
//                        .font(.title)
//
//                } else {
//                    Text(student.name)
//                        .foregroundColor(.white)
//                        .font(.system(size: 50, weight: .bold, design: .default))
//                    Text(student.studies)
//                        .foregroundColor(.white)
//                        .font(.title)
//                }
//
//            }
        }
        .navigationTitle(student.firstName)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(colour: Colour.FirstDate, student: User(id: 1, userID: "Bren", img: "👾", firstName: "Brenda", lastName: "Elena", career: "ITC", sexF: true, email: "brenda.s.g12@hotmail.com", number: 8781149689, country: "🇲🇽"))
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
