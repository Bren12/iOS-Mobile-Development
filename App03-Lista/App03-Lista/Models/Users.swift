//
//  Users.swift
//  App03-Lista
//
//  Created by Brenda Saucedo on 18/08/22.
//

import SwiftUI

struct User {
    var id: Int
    var userID: String
    var img: String
    var firstName: String
    var lastName: String
    var career: String
    var sexF: Bool
    var email: String
    var number: Int
    var country: String
    var colorFrame: Color
}

extension User {
    
    static let friends: [User] = [
        User(id: 0, userID: "Bren", img: "๐พ", firstName: "Brenda", lastName: "Saucedo", career: "ITC", sexF: true, email: "bren@hotmail.com", number: 5117785623, country: "๐ฒ๐ฝ", colorFrame: .purple),
        User(id: 1, userID: "Ani", img: "๐ง๐ฝ", firstName: "Ana", lastName: "Sofรญa", career: "ITS", sexF: true, email: "anasofi@outlook.es", number: 1127845797, country: "๐บ๐ธ", colorFrame: Colour.Pumkin.colour),
        User(id: 2, userID: "AnaPau", img: "๐ฑ", firstName: "Ana", lastName: "Pau", career: "ITC", sexF: true, email: "anapau@hotmail.com", number: 8413562582, country: "๐ฉ๐ช", colorFrame: Colour.BrightYarrow.colour),
        User(id: 3, userID: "Fridis", img: "๐๐ปโโ๏ธ", firstName: "Frida", lastName: "Analรญa", career: "IIS", sexF: true, email: "fridis@gmail.com", number: 2164552378, country: "๐ฌ๐ง", colorFrame: Colour.SoothingBreeze.colour),
        User(id: 4, userID: "Dani", img: "๐งฌ", firstName: "Daniela", lastName: "Gรณmez", career: "IQ", sexF: true, email: "danigmz@gmail.com", number: 3198345663, country: "๐จ๐ฆ", colorFrame: Colour.DraculaOrchid.colour),
        User(id: 5, userID: "Euni", img: "๐ฉ๐ฝโ๐ฆฑ", firstName: "Eunice", lastName: "Santos", career: "ITC", sexF: true, email: "euni@outlook.es", number: 411902356, country: "๐ซ๐ท", colorFrame: Colour.FirstDate.colour),
        User(id: 6, userID: "Rome", img: "๐๐ฝ", firstName: "Romel", lastName: "Aldair", career: "ITC", sexF: false, email: "rome@outlook.es", number: 611902356, country: "๐ฎ๐น", colorFrame: Colour.ElectronBlue.colour)
    ]
    
}
