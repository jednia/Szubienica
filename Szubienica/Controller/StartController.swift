//  Created by Kamil Pietrzak on 06/10/2021.
//  Copyright © 2021 Kamil Pietrzak. All rights reserved.

import UIKit

class StartController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                playLook.layer.cornerRadius = 10
        
    }

    @IBOutlet weak var playLook: UIButton!
    
    @IBAction func play(_ sender: UIButton) {
        performSegue(withIdentifier: "goToGame", sender: self)
    }
}
