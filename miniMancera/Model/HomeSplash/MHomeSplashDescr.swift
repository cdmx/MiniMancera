import UIKit

class MHomeSplashDescr:MHomeSplashProtocol
{
    let attributedString:NSAttributedString
    let kMargin:CGFloat = 10
    private let margin2:CGFloat
    private let drawingOptions:NSStringDrawingOptions
    private let kMaxHeight:CGFloat = 600
    
    init(model:MHomeOptions)
    {
        margin2 = kMargin + kMargin
        drawingOptions = NSStringDrawingOptions([
            NSStringDrawingOptions.usesFontLeading,
            NSStringDrawingOptions.usesLineFragmentOrigin])
        
        guard
            
            let title:String = model.title,
            let descr:String = model.descr
            
        else
        {
            attributedString = NSAttributedString()
            
            return
        }
        
        let attributesTitle:[String:AnyObject] = [
            NSFontAttributeName:UIFont.bold(size:22),
            NSForegroundColorAttributeName:UIColor.white]
        let attributesDescr:[String:AnyObject] = [
            NSFontAttributeName:UIFont.regular(size:16),
            NSForegroundColorAttributeName:UIColor.white]
        
        let stringTitle:NSAttributedString = NSAttributedString(
            string:title,
            attributes:attributesTitle)
        let stringDescr:NSAttributedString = NSAttributedString(
            string:descr,
            attributes:attributesDescr)
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.append(stringTitle)
        mutableString.append(stringDescr)
        
        attributedString = mutableString
    }
    
    //MARK: splash protocol
    
    var reusableIdentifier:String
    {
        get
        {
            return VHomeSplashCellDescr.reusableIdentifier
        }
    }
    
    func cellHeightFor(width:CGFloat) -> CGFloat
    {
        let usableWidth:CGFloat = width - margin2
        let maxSize:CGSize = CGSize(width:usableWidth, height:kMaxHeight)
        
        let boundingRects:CGRect = attributedString.boundingRect(
            with:maxSize,
            options:drawingOptions,
            context:nil)
        let height:CGFloat = ceil(boundingRects.size.height)
        let heightMargin:CGFloat = height + margin2
        
        return heightMargin
    }
}
