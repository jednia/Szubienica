//  Created by Kamil Pietrzak on 06/10/2021.
//  Copyright © 2021 Kamil Pietrzak. All rights reserved.

import UIKit

struct Core {
    
    let category: Array = [
        Word(q: "Największy ssak na ziemi", a: "Płetwal błękitny"),
        Word(q: "Niebieska krew bezkręgowców", a: "Hemolimfa"),
        Word(q: "Najmniejszy ocean ziemi", a: "Ocean arktyczny"),
        Word(q: "Aktor który zdobył Oscara", a: "Leonardo DiCaprio"),
        Word(q: "Serial science fiction", a: "Czarne lustro"),
        Word(q: "Biegacz, ping-pong, armia i krewetki w jednym", a: "Forrest Gump"),
        Word(q: "Jedna z marek samochodów", a: "Bentley")
    ]

    var questionAndInfo: String = ""
    var answerGuess: String = ""
    var mask: String = ""
    var images: Array = [#imageLiteral(resourceName: "w0"), #imageLiteral(resourceName: "w1"), #imageLiteral(resourceName: "w2"), #imageLiteral(resourceName: "w3"), #imageLiteral(resourceName: "w4"), #imageLiteral(resourceName: "w5"), #imageLiteral(resourceName: "w6"), #imageLiteral(resourceName: "w7"), #imageLiteral(resourceName: "w8"), #imageLiteral(resourceName: "w9")]
    var imagesIndex: Int = 0
    var actualWord: Int = 0
    var lives: Int = 9
    let loss = "Spróbuj ponownie"
    let win = "Poprawne hasło!"
   
    mutating func getQuestion() -> String {
        questionAndInfo = category[actualWord].question
        return questionAndInfo
    }
    
    // 'getMasking' is responsible for setting all settings to starting point and 'masking' the answer to guess
    mutating func getMasking() -> String {
        lives = 9
        imagesIndex = 0
        answerGuess = category[actualWord].answer
        mask = ""
        for i in 0..<answerGuess.count{
            if answerGuess[answerGuess.index(answerGuess.startIndex, offsetBy: i)] != " " {
                mask.append("-")
            } else {
                mask.append(" ")
            }
        }
        return mask
    }
    mutating func getAnswer() -> String {
        answerGuess = category[actualWord].answer
        return answerGuess
    }
    mutating func getMask() -> String {
        return mask
    }
    mutating func updateMask(maskUpdated: String) {
        mask = maskUpdated
    }
    mutating func getImagesIndex() -> Int {
        return imagesIndex
    }
    mutating func nextWord() {
        actualWord += 1
        print("Pytanie numer: \(actualWord)")
        if actualWord > category.count-1 {
            actualWord = 0
        }
    }
    mutating func calculationLivesAndImagesIndex() {
        lives -= 1
        imagesIndex += 1
    }
    mutating func getLives() -> Int {
        return lives
    }
    func getLoss() -> String{
        return loss
    }
    func getWin() -> String{
        return win
    }
}

