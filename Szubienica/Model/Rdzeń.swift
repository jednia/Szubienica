import UIKit
import Foundation

struct Rdzeń {
    
    let pytania: Array = [
        Pytanie(p: "Największy ssak na ziemi", o: "Płetwal błękitny"),
        Pytanie(p: "Niebieska krew bezkręgowców", o: "Hemolimfa"),
        Pytanie(p: "Najmniejszy ocean ziemi", o: "Ocean arktyczny"),
        Pytanie(p: "Aktor który zdobył Oscara", o: "Leonardo DiCaprio"),
        Pytanie(p: "Serial science fiction", o: "Czarne lustro"),
        Pytanie(p: "Biegacz, ping-pong, armia i krewetki w jednym", o: "Forrest Gump"),
        Pytanie(p: "Jedna z marek samochodów", o: "Bentley")
    ]

    var informacja: String = ""
    var hasło: String = ""
    var maska: String = ""
    var stan: Array = [#imageLiteral(resourceName: "w0"), #imageLiteral(resourceName: "w1"), #imageLiteral(resourceName: "w2"), #imageLiteral(resourceName: "w3"), #imageLiteral(resourceName: "w4"), #imageLiteral(resourceName: "w5"), #imageLiteral(resourceName: "w6"), #imageLiteral(resourceName: "w7"), #imageLiteral(resourceName: "w8"), #imageLiteral(resourceName: "w9")]
    var stanLicznik: Int = 0
    var którePytanie: Int = 0
    var życia: Int = 9
    let przegrana = "Spróbuj ponownie"
    let wygrana = "Poprawne hasło!"
   
    mutating func weźInformację() -> String {
        informacja = pytania[którePytanie].pytanie
        return informacja
    }
    mutating func weźMaskownicę() -> String {
        życia = 9
        stanLicznik = 0
        hasło = pytania[którePytanie].odpowiedź
        maska = ""
        for i in 0..<hasło.count{
            if hasło[hasło.index(hasło.startIndex, offsetBy: i)] != " " {
                maska.append("-")
            } else {
                maska.append(" ")
            }
        }
        return maska
    }
    mutating func weźHasło() -> String {
        hasło = pytania[którePytanie].odpowiedź
        return hasło
    }
    mutating func weźMaskę() -> String {
        return maska
    }
    mutating func zaktualizujMaskę(zaktualizowanaMaska: String) {
        maska = zaktualizowanaMaska
    }
    mutating func weźStanLicznik() -> Int {
        return stanLicznik
    }
    mutating func kolejnePytanie() {
        którePytanie += 1
        print("Pytanie numer: \(którePytanie)")
        if którePytanie > pytania.count-1 {
            którePytanie = 0
        }
    }
    mutating func kalkulacjeŻycieiStanLicznik() {
        życia -= 1
        stanLicznik += 1
    }
    mutating func weżIlośćŻyć() -> Int {
        return życia
    }
    func weźPrzegrana() -> String{
        return przegrana
    }
    func weźWygrana() -> String{
        return wygrana
    }
}

