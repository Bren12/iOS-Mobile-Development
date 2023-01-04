//
//  HomeView.swift
//  App01-MiPerfil
//
//  Created by Brenda Saucedo on 11/08/22.
//

import SwiftUI

struct HomeView: View {
    
    // Variables
    @State var name: String = "Brenda Saucedo"
    @State var program: String = "ITC"
    @State var age: Double = 16
    @State var date: Date = Date()
    @State var city: String = "Oreo"
    @State var showView: Bool = false
    
    // Date Formatter
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        
        // To adjust the background according to the size of the screen.
        GeometryReader { geo in
            
            ZStack {
                
                // Background
                VStack (spacing: 0) {
                    
                    // Screen 1/3
                    ZStack {
                        
                        // Background
                        Image("ProfileBackground")
                            .resizable()
                            .scaledToFill()
                        
                        // Name
                        VStack {
                            Text(name)
                                .foregroundColor(.white)
                                .font(.custom("Roboto-Italic", size: 40))
                        }
                        
                    }
                    .frame(height: geo.size.height/3)
                    
                    // Screen 2/3
                    VStack {
                        // Background
                        Image("Street")
                            .resizable()
                    }
                    .frame(height: (geo.size.height/3) * 2)
                    
                }
                
                ZStack {
                    
                    // Background Profile Circle
                    VStack {
                        Circle()
                            .padding(.bottom, geo.size.height/3)
                            .foregroundColor(.white)
                            .frame(width: 200)
                    }
                    
                    // Background Profile
                    VStack {
                        Image("Vector_Oreo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .overlay(Circle()
                                .stroke(lineWidth: 6)
                                .foregroundColor(.white)
                            )
                            .padding(.bottom, geo.size.height/3)
                    }
                    
                    // View and Update Data
                    VStack {
                        
                        // Data
                        VStack {
                            TextView(label: "Carrera", value: program)
                            TextView(label: "Edad", value: String(format: "%0.f", age))
                            TextView(label: "Fecha Nacimiento:", value: "\(dateFormat.string(from: date))")
                            TextView(label: "Ciudad:", value: city)
                        }
                        .modifier(TextModifier())
                        .padding(.top, geo.size.height/3 + 100)
                        .padding(.bottom, 60)
                        
                        // Update Data
                        Button {
                            showView.toggle()
                        } label: {
                            Text ("Actualiza Datos")
                                .foregroundColor(.black)
                                .padding()
                                .background(.white)
                                .cornerRadius(20)
                        }
                        .padding()
                        
                    }
                    
                }
                
            }
            .fullScreenCover(isPresented: $showView) {
                DataView(program: $program, age: $age, date: $date, city: $city)
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.portrait)
    }
}
