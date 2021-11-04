//  Created by Kamil Pietrzak on 06/10/2021.
//  Copyright © 2021 Kamil Pietrzak. All rights reserved.

import UIKit

class GameController: UIViewController {
    
    var core = Core()
    
    // 'start' function sets all settings to starting point
    func start(){
        labelQuestionAndInfo.text = core.getQuestion()
        labelAnswerGuess.text = core.getMasking()
        imageCurrent.image = core.images[core.getImagesIndex()]
        for item in keyboard {
            item.isEnabled = true
            item.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        }
        restartVisibility.isHidden = true
        nextVisibility.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        for item in keyboard {
            item.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet var keyboard: [UIButton]!
    @IBOutlet weak var imageCurrent: UIImageView!
    @IBOutlet weak var labelQuestionAndInfo: UILabel!
    @IBOutlet weak var labelAnswerGuess: UILabel!
    @IBOutlet weak var restartVisibility: UIButton!
    @IBOutlet weak var nextVisibility: UIButton!
    
    @IBAction func restart(_ sender: UIButton) {
        start()
    }
    
    @IBAction func next(_ sender: UIButton) {
        core.nextWord()
        start()
    }
    
    // 'choice' function triggers different actions depending on user's choice (which character he or she chose)
    @IBAction func choice(_ sender: UIButton) {
        sender.isEnabled = false // turns off the possibility of pressing the button again
        var wrongChoice: Bool = true // allows to switch between good and wrong choice
        
        let char = Character(sender.currentTitle!)
        print("Sprawdź literę: \(char)")
        
        let answerGuess = core.getAnswer().uppercased() //takes
        var mask = core.getMask() // takes empty mask
        
        // this loop enters the correct char or switch wrongChoice. It also updates user interface
        for i in 0..<answerGuess.count {
            if char == answerGuess[answerGuess.index(answerGuess.startIndex, offsetBy: i)] {
                sender.setTitleColor(#colorLiteral(red: 0, green: 0.7072307484, blue: 0, alpha: 1), for: .normal)
                
                let maskIndex = mask.index(mask.startIndex, offsetBy: i)
                mask.replaceSubrange(maskIndex...maskIndex, with: "\(char)")
                labelAnswerGuess.text = mask
                core.updateMask(maskUpdated: mask)
                
                wrongChoice = false
            }
        }
        
        // this function makes two buttons visible and makes keyboard inactive
        func buttonsAndKeyboard(){
            restartVisibility.isHidden = false
            nextVisibility.isHidden = false
            for item in keyboard {
                item.isEnabled = false
            }
        }
        
        // 'wrongChoice' updates user interface and reduce lives or ends game
        if wrongChoice {
            sender.setTitleColor(#colorLiteral(red: 0.7523762584, green: 0.7523762584, blue: 0.7523762584, alpha: 1), for: .normal)
            core.calculationLivesAndImagesIndex()
            imageCurrent.image = core.images[core.getImagesIndex()]
            print("Pozostało \(core.getLives()) żyć.")
            
            if core.getLives() == 0 {
                labelQuestionAndInfo.text = core.getLoss()
                buttonsAndKeyboard()
            }
        }
        
        // triggers when user guessed correct word/phrase.
        if answerGuess == mask {
            labelQuestionAndInfo.text = core.win
            buttonsAndKeyboard()
        }
    }
}





