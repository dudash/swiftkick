//
//  StringExtensions.swift
//  SwiftKick
//  https://github.com/dudash/swiftkick
//
//  Created by Jason on 1/24/15.
//
//    The MIT License (MIT)
//
//    Copyright (c) 2015 Jason Dudash
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.
//


// Reference to Swift Strings:
// https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/StringsAndCharacters.html
    
import Foundation

#if !(SK_IGNORE_STRING)
extension String
{
    //-----------------------------------------------------------------------------------------------
    public func encodeForURL() -> String?
    {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }

    //-----------------------------------------------------------------------------------------------
    public func toBase64() -> NSString?
    {
        let utf8string = self.data(using: String.Encoding.utf8, allowLossyConversion:false)
        return utf8string?.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters) as NSString?
    }
    
    //-----------------------------------------------------------------------------------------------
    public func fromBase64() -> NSString?
    {
        let base64data = Data(base64Encoded: self, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
        if base64data == nil { return nil }
        return NSString(data: base64data!, encoding: String.Encoding.utf8.rawValue)
    }
}
#endif //#if SK_IGNORE_STRING
