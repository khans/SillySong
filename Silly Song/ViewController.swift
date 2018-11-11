//
//  ViewController.swift
//  Silly Song
//
//  Created by Safa Khan on 11/6/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import UIKit

//Shorten a name, if it begins with consonant, remove the first character
func shortNameFromName(_ name: String)->String{
    var res = name
    res = res.lowercased()
    
    let vowels = CharacterSet(charactersIn: "aeiou")
    if !res.isEmpty{
        let element = UnicodeScalar(String(res[res.startIndex]))!
        
        if (vowels.contains(element)){
            return res
        }
        else{
            res.remove(at: res.startIndex)
        }
    }
    return res
    
}
//Following are two ways to write the template
let template = "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>\nBanana, Fana, Fo F<SHORT_NAME>\nMe My Mo M<SHORT_NAME>\n<FULL_NAME>"
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")
let bT = "HelloWorld!\nMy <FULL_NAME>\n"
//Generate lyrics
func lyricsForName(_ name: String, _ template: String)->String{
    var newLyrics = template
    
    let shortName = shortNameFromName(name)
    
    newLyrics = newLyrics.replacingOccurrences(of: "<FULL_NAME>", with: name)
    newLyrics = newLyrics.replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    
    return newLyrics
}
// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var nameField: UITextField!
    
    
    @IBOutlet weak var lyricsView: UITextView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self

    }

    
    // Just clear the text of the nameField and lyricsView
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    //Take the name entered in the nameField and generate the lyrics
    @IBAction func displayLyrics(_ sender: Any) {
        let input = nameField.text
        if !(input?.isEmpty)!{
            lyricsView.text = lyricsForName((input)!,bananaFanaTemplate)
        }
    }
}

