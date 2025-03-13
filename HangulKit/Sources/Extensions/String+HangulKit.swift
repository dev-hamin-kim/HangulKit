//
//  String+HangulKit.swift
//  HangulKit
//
//  Created by 김하민 on 3/12/25.
//

extension HangulKitWrapper where Base == String {
    
    public func isHangulSyllable() -> Bool {
        let rangeOfHangul = "가"..."힣"
        
        return rangeOfHangul.contains(base)
    }
    
    public func isHangulAlphabet() -> Bool {
        let rangeOfHangulAlphabet = "ㄱ"..."ㅣ"
        
        return rangeOfHangulAlphabet.contains(base)
    }
    
    public func isHangul() -> Bool {
        return base.range(of: "\\p{Hangul}", options: .regularExpression) != nil
    }
    
}
