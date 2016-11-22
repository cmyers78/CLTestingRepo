//
//  ViewController.swift
//  Symmetric Key Generator
//
//  Created by Christopher Myers on 11/22/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit
import CryptoSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iubet igitur nos Pythius Apollo noscere nosmet ipsos. Nihilo beatiorem esse Metellum quam Regulum. Sed tamen enitar et, si minus multa mihi occurrent, non fugiam ista popularia. Tecum optime, deinde etiam cum mediocri amico. Restinguet citius, si ardentem acceperit. Quis, quaeso, illum negat et bonum virum et comem et humanum fuisse? Itaque nostrum est-quod nostrum dico, artis est-ad ea principia, quae accepimus. Duo Reges: constructio interrete. Restinguet citius, si ardentem acceperit. Nam de isto magna dissensio est. Mihi, inquam, qui te id ipsum rogavi? Quis Pullum Numitorium Fregellanum, proditorem, quamquam rei publicae nostrae profuit, non odit? Quicquid enim a sapientia proficiscitur, id continuo debet expletum esse omnibus suis partibus; Hic quoque suus est de summoque bono dissentiens dici vere Peripateticus non potest. Dic in quovis conventu te omnia facere, ne doleas. Universa enim illorum ratione cum tota vestra confligendum puto. Est enim effectrix multarum et magnarum voluptatum. Cupiditates non Epicuri divisione finiebat, sed sua satietate. Quis negat? Illum mallem levares, quo optimum atque humanissimum virum, Cn. Vestri haec verecundius, illi fortasse constantius. Quid nunc honeste dicit? Reguli reiciendam; Quid in isto egregio tuo officio et tanta fide-sic enim existimo-ad corpus refers? Quae diligentissime contra Aristonem dicuntur a Chryippo. Primum in nostrane potestate est, quid meminerimus? Inscite autem medicinae et gubernationis ultimum cum ultimo sapientiae comparatur. Tum ille timide vel potius verecunde: Facio, inquit. Tecum optime, deinde etiam cum mediocri amico. Quia dolori non voluptas contraria est, sed doloris privatio. Aliena dixit in physicis nec ea ipsa, quae tibi probarentur; Sed quid minus probandum quam esse aliquem beatum nec satis beatum? Sed ad illum redeo. Non quam nostram quidem, inquit Pomponius iocans; Si de re disceptari oportet, nulla mihi tecum, Cato, potest esse dissensio. Quamquam id quidem licebit iis existimare, qui legerint. Sed quid attinet de rebus tam apertis plura requirere? Quid nunc honeste dicit? Quam illa ardentis amores excitaret sui! Cur tandem? Sit enim idem caecus, debilis."
        
        do {
            let aes = try AES(key: "passwordpassword", iv: "drowssapdrowssap")
            let ciperText = try aes.encrypt(text.utf8.map({$0}))
            let decrypted = try aes.decrypt(ciperText)
            
            
            print(ciperText)
            print(decrypted)
            let result = String(bytes: decrypted, encoding: .utf8)
            print(result)
            
        } catch { }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }



}

