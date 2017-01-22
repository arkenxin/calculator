//
//  AllowedCharsTextField.swift
//  calculator1
//
//  Created by jinikuadmin on 1/19/17.
//  Copyright © 2017 xin. All rights reserved.
//

import Foundation

class AllowedCharsTextField: MaxLengthTextField {
    
    //
    @IBInspectable var allowedChars: String = ""
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
        //
        autocorrectionType = .no
    }
    
    // 
    override func allowedIntoTextField(text: String) -> Bool {
        return super.allowedIntoTextField(text: text) &&
            text.containsOnlyCharactersIn(matchCharacters: allowedChars)
    }
    
}




//
private extension String {
    
    // Returns true if the string contains only characters found in matchCharacters.
    func containsOnlyCharactersIn(matchCharacters: String) -> Bool {
        let disallowedCharacterSet = CharacterSet(charactersIn: matchCharacters).inverted
        return self.rangeOfCharacter(from: disallowedCharacterSet) == nil
}
}
