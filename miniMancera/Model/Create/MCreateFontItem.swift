import UIKit

class MCreateFontItem
{
    let displayName:String
    let fontName:String
    
    init(displayName:String, fontName:String)
    {
        self.displayName = displayName
        self.fontName = fontName
    }
    
    //MARK: public
    
    func font(size:CGFloat) -> UIFont
    {
        let font:UIFont = UIFont(name:fontName, size:size)!
        
        return font
    }
}
