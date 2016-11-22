//
//  ViewController.swift
//  EncDecTest
//
//  Created by Christopher Myers on 11/11/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let encryptString = "Subject ID, Date & Time_started, Time_ended, Instructions, Times_played, Complete_game, Number_completed, Total_correct, Flanker_Item1_arrow, Flanker_Item1_Reactiontime, Flanker_Item1_Score, Flanker_Item2_arrow, Flanker_Item2_Reactiontime, Flanker_Item2_Score, Flanker_Item3_arrow, Flanker_Item3_Reactiontime, Flanker_Item3_Score, Flanker_Item4_arrow, Flanker_Item4_Reactiontime, Flanker_Item4_Score, Flanker_Item5_arrow, Flanker_Item5_Reactiontime, Flanker_Item5_Score,Flanker_Item6_arrow,Flanker_Item6_Reactiontime, Flanker_Item6_Score, Flanker_Item7_arrow, Flanker_Item7_Reactiontime, Flanker_Item7_Score, Flanker_Item8_arrow, Flanker_Item8_Reactiontime, Flanker_Item8_Score, Flanker_Item9_arrow, Flanker_Item9_Reactiontime, Flanker_Item9_Score, Flanker_Item10_arrow, Flanker_Item10_Reactiontime, Flanker_Item10_Score, Flanker_Item11_arrow, Flanker_Item11_Reactiontime, Flanker_Item 11_Score, Flanker_Item12_arrow, Flanker_Itea12_Reactiontime, Flanker_Item12_Score, Flanker_Item13_arrow, Flanker_Item13_Reactiontime, Flanker_Item13_Score, Flanker_Item14_arrow, Flanker_Item14_Reactiontime, Flanker_Item14_Score, Flanker_Item15_arrow, Flanker_Item15_Reactiontime, Flanker_Item15_Score, Flanker_Item16_arrow, Flanker_Item16_Reactiontime, Flanker_Item16_Score, Flanker_Item17_arrow, Flanker_Item17_Reactiontime, Flanker_Item17_Score, Flanker_Item18_arrow, Flanker_Item18_Reactiontime, Flanker_Item18_Score, Flanker_Item19_arrow, Flanker_Item19_Reactiontime, Flanker_Item19_Score, Flanker_Item20_arrow, Flanker_Item20_Reactiontime, Flanker_Item20_Score, Device_software_version, Device_hardware_version, Device_brightness, Device_display_zoom, Device_displayTrueTone, Device_displayTextSize"
    
    var answer : ([UInt8], Int)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //instance of SecureData Class
        let kingInTheNorth = SecureData()
        
        kingInTheNorth.createKeyPair()
        for i in encryptString.characters {
            print(i)

            self.answer = kingInTheNorth.encryptData(stringToEncrypt: String(i))
        }
        
        kingInTheNorth.decryptData(messageEncrypted: (self.answer?.0)!, messageEncryptedSize: (self.answer?.1)!)
    }
}

