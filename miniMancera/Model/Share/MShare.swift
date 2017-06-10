import UIKit

class MShare
{
    static let width:CGFloat = 320
    static let height:CGFloat = 240
    let content:[MShareContentProtocol]
    let scales:[CGFloat] = [1, 2, 3]
    var selectedScale:Int
    
    private class func factoryContent() -> [MShareContentProtocol]
    {
        let contentScale:MShareContentScale = MShareContentScale()
        let contentGif:MShareContentGif = MShareContentGif()
        let contentPng:MShareContentPng = MShareContentPng()
        
        let content:[MShareContentProtocol] = [
            contentScale,
            contentGif,
            contentPng]
        
        return content
    }
    
    class func widthForScale(scale:CGFloat) -> CGFloat
    {
        return width * scale
    }
    
    class func heightForScale(scale:CGFloat) -> CGFloat
    {
        return height * scale
    }
    
    init()
    {
        content = MShare.factoryContent()
        selectedScale = 0
    }
    
    //MARK: public
    
    func currentScale() -> CGFloat
    {
        let scale:CGFloat = scales[selectedScale]
        
        return scale
    }
}
