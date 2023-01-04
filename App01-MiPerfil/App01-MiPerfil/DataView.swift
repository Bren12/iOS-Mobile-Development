//
//  DataView.swift
//  App01-MiPerfil
//
//  Created by Brenda Saucedo on 11/08/22.
//

import SwiftUI

struct DataView: View {
    
    // To close a window
    @Environment(\.presentationMode) var presentationMode
    
    // Variables
    @Binding var program: String
    @Binding var age: Double
    @Binding var date: Date
    @Binding var city: String
    var cities: [String] = ["Oreo", "Dark Night", "Black Stone", "Shadow of War"]
    
    // Variables to change the colors of certain data.
    @State var backgroundColor: Color = .clear
    @State var textColor: Color = .black
    @State var pickerColor: Color = Color(red: 0/255, green: 63/255, blue: 255/255)
    @State var schemeColor: ColorScheme = .light
    
    var body: some View {
        
        // To adjust the background according to the size of the screen.
        GeometryReader { geo in
            
            // Background
            ZStack {
                
                // Image Background
                Image("PastelBackground")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100)
                
                // Shadow Background
                Rectangle()
                    .foregroundColor(changeBackgroundColor(age: age))
                    .ignoresSafeArea()
                
                // Button Regresar (Return)
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Regresar")
                                .foregroundColor(pickerColor)
                        }
                    }
                    .padding(.trailing, 30)
                    Spacer()
                }
                .padding(.top, 50)
                
                // Data
                VStack {
                    
                    // Heading
                    Text("Actualiza los Datos")
                        .font(.custom("Roboto-Italic", size: 50))
                        .foregroundColor(textColor)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    // Career
                    VStack {
                        HStack {
                            Text("Carrera")
                                .foregroundColor(textColor)
                            Spacer()
                                .frame(width: 20)
                            TextField("Carrera", text: $program)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                    .frame(height: 100)
                    
                    Spacer()
                        .frame(height: 30)
                    
                    // Age
                    VStack {
                        Text(String(format: "Edad: %0.f", age))
                            .foregroundColor(textColor)
                        Slider(value: $age, in: 16...60)
                            .accentColor(pickerColor)
                            // Changes the colors of certain data
                            // based on the value of the slider.
                            .onChange(of: age) { newValue in
                                if (age > 38) {
                                    withAnimation(.easeInOut(duration: 1.0)) {
                                        textColor = .white
                                        pickerColor = Color(red: 153/255, green: 255/255, blue: 200/255)
                                        schemeColor = .dark
                                    }
                                }
                                else {
                                    withAnimation(.easeInOut(duration: 1.0)) {
                                        textColor = .black
                                        pickerColor = Color(red: 0/255, green: 63/255, blue: 255/255)
                                        schemeColor = .light
                                    }
                                }
                            }
                    }
                    .frame(height: 100)
                    
                    // Date
                    DatePicker("Fecha de Nacimiento", selection: $date, in: ...Date(), displayedComponents: .date)
                        .frame(height: 100)
                        .accentColor(pickerColor)
                        .foregroundColor(textColor)
                        .colorScheme(schemeColor)
                    
                    // City
                    HStack {
                        Text("Ciudad:")
                            .foregroundColor(textColor)
                        Spacer()
                            .frame(width: 10)
                        Picker("Ciudad", selection: $city) {
                            ForEach(cities, id: \.self) { city in
                                Text(city)
                            }
                        }
                        .accentColor(pickerColor)
                    }
                    .frame(height: 100)
                    
                }
                .padding(.horizontal, 30)
                
            }
            .ignoresSafeArea(.all)
            .onAppear {
                backgroundColor = changeBackgroundColor(age: age)
                textColor = (age > 38) ? .white : .black
                pickerColor = (age > 38) ? Color(red: 153/255, green: 255/255, blue: 200/255) : Color(red: 0/255, green: 63/255, blue: 255/255)
                schemeColor = (age > 38) ? .dark : .light
            }
            
        }
        
    }
    
    func changeBackgroundColor(age: Double) -> Color {
        return Color.black.opacity(age*0.5/44 - (16*0.5/44))
    }
    
}

struct DataView_Previews: PreviewProvider {
    
    @State static var program = "ITC"
    @State static var age = 16.0
    @State static var date: Date = Date()
    @State static var city = "Oreo"
    
    static var previews: some View {
        DataView(program: $program, age: $age, date: $date, city: $city)
    }
}
