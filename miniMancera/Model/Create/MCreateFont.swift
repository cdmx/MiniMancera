import UIKit

class MCreateFont
{
    let fonts:[MCreateFontItem]
    var selectedFont:Int
    var fontSize:CGFloat
    private let kResourceName:String = "ResourceFonts"
    private let kResourceExtension:String = "plist"
    private let kKeyName:String = "name"
    private let kKeyFont:String = "font"
    private let kDefaultFontSize:CGFloat = 18
    
    init()
    {
        var fonts:[MCreateFontItem] = []
        selectedFont = 0
        fontSize = kDefaultFontSize
        
        guard
            
            let resourceFont:URL = Bundle.main.url(
                forResource:kResourceName,
                withExtension:kResourceExtension),
            let fontArray:NSArray = NSArray(
                contentsOf:resourceFont),
            let fontList:[Any] = fontArray as? [Any]
            
        else
        {
            self.fonts = fonts
            
            return
        }
        
        for font:Any in fontList
        {
            guard
            
                let fontMap:[String:String] = font as? [String:String],
                let itemName:String = fontMap[kKeyName],
                let itemFont:String = fontMap[kKeyFont]
            
            else
            {
                continue
            }
            
            let item:MCreateFontItem = MCreateFontItem(
                displayName:itemName,
                fontName:itemFont)
            
            fonts.append(item)
        }
        
        fonts.sort
        { (itemA:MCreateFontItem, itemB:MCreateFontItem) -> Bool in
            
            let comparisonResult:ComparisonResult = itemA.displayName.compare(itemB.displayName)
            
            switch comparisonResult
            {
            case ComparisonResult.orderedAscending,
                 ComparisonResult.orderedSame:
                
                return true
                
            case ComparisonResult.orderedDescending:
                
                return false
            }
        }
        
        self.fonts = fonts
    }
    
    //MARK: public
    
    func selectedFontModel() -> MCreateFontItem?
    {
        if fonts.count < 1
        {
            return nil
        }
        
        let fontItem:MCreateFontItem = fonts[selectedFont]
        
        return fontItem
    }
    
    func selectedFontObject() -> UIFont
    {
        guard
        
            let selected:MCreateFontItem = selectedFontModel()
        
        else
        {
            let defaultFont:UIFont = UIFont.regular(size:fontSize)
            
            return defaultFont
        }
        
        let font:UIFont = selected.font(size:fontSize)
        
        return font
    }
}
