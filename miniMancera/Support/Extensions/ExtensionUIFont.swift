import UIKit

extension UIFont
{
    static let kFontRegular:String = "Arial-BoldMT"
    static let kFontBold:String = "Arial-BoldMT"
    
    class func regular(size:CGFloat) -> UIFont
    {
        return UIFont(name:kFontRegular, size:size)!
    }
    
    class func bold(size:CGFloat) -> UIFont
    {
        return UIFont(name:kFontBold, size:size)!
    }
}
