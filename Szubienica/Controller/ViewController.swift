import UIKit
import Foundation

class ViewController: UIViewController {
    
    var rdzeń = Rdzeń()
    
    func start(){
        labelInformacja.text = rdzeń.weźInformację()
        labelHaslo.text = rdzeń.weźMaskownicę()
        stanObrazek.image = rdzeń.stan[rdzeń.weźStanLicznik()]
        for item in znaki {
            item.isEnabled = true
            item.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        }
        restartPokaż.isHidden = true
        dalejPokaż.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        for item in znaki {
            item.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet var znaki: [UIButton]!
    @IBOutlet weak var stanObrazek: UIImageView!
    @IBOutlet weak var labelInformacja: UILabel!
    @IBOutlet weak var labelHaslo: UILabel!
    @IBOutlet weak var restartPokaż: UIButton!
    @IBOutlet weak var dalejPokaż: UIButton!
    @IBAction func restart(_ sender: UIButton) {
        start()
    }
    @IBAction func dalej(_ sender: UIButton) {
        rdzeń.kolejnePytanie()
        start()
    }
    @IBAction func klik(_ sender: UIButton) {
        sender.isEnabled = false
        var błędnyZnak: Bool = true
        
        let znak = Character(sender.currentTitle!)
        print("Sprawdź literę: \(znak)")
        
        let hasło = rdzeń.weźHasło().uppercased()
        var maska = rdzeń.weźMaskę()

        for i in 0..<hasło.count {
            if znak == hasło[hasło.index(hasło.startIndex, offsetBy: i)] {
                sender.setTitleColor(#colorLiteral(red: 0, green: 0.7072307484, blue: 0, alpha: 1), for: .normal)

                let indexMaski = maska.index(maska.startIndex, offsetBy: i)
                maska.replaceSubrange(indexMaski...indexMaski, with: "\(znak)")
                labelHaslo.text = maska
                rdzeń.zaktualizujMaskę(zaktualizowanaMaska: maska)

                błędnyZnak = false
            }
        }
        
        func przyciskiiZnaki(){
            restartPokaż.isHidden = false
            dalejPokaż.isHidden = false
            for item in znaki {
                item.isEnabled = false
            }
        }
        
        if błędnyZnak {
//            sender.backgroundColor = UIColor.gray
            sender.setTitleColor(#colorLiteral(red: 0.7523762584, green: 0.7523762584, blue: 0.7523762584, alpha: 1), for: .normal)
//            sender.setTitleColor(UIColor.gray, for: .normal)
            rdzeń.kalkulacjeŻycieiStanLicznik()
            stanObrazek.image = rdzeń.stan[rdzeń.weźStanLicznik()]
            print("Pozostało \(rdzeń.weżIlośćŻyć()) żyć.")
            
            if rdzeń.weżIlośćŻyć() == 0 {
                labelInformacja.text = rdzeń.weźPrzegrana()
                przyciskiiZnaki()
            }
        }
        
        if hasło == maska {
            labelInformacja.text = rdzeń.wygrana
            przyciskiiZnaki()
        }
    }
}





