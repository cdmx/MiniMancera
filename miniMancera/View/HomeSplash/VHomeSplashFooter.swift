import UIKit

class VHomeSplashFooter:UIView
{
    private weak var controller:CHomeSplash!
    private let kLabelMargin:CGFloat = 10
    private let kLabelWidth:CGFloat = 300
    private let kLabelHeight:CGFloat = 500
    
    init(controller:CHomeSplash)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        guard
            
            let title:String = controller.model.title,
            let descr:String = controller.model.descr
        
        else
        {
            return
        }
        
        let attributesTitle:[String:AnyObject] = [
            NSFontAttributeName:UIFont.bold(size:18),
            NSForegroundColorAttributeName:UIColor.white]
        let attributesDescr:[String:AnyObject] = [
            NSFontAttributeName:UIFont.regular(size:18),
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
        
        let maxSize:CGSize = CGSize(width:kLabelWidth, height:kLabelHeight)
        let drawingOptions:NSStringDrawingOptions = NSStringDrawingOptions([
            NSStringDrawingOptions.usesFontLeading,
            NSStringDrawingOptions.usesLineFragmentOrigin])
        
        let boundingRects:CGRect = mutableString.boundingRect(
            with:maxSize,
            options:drawingOptions,
            context:nil)
        let height:CGFloat = ceil(boundingRects.size.height)
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.attributedText = mutableString
        
        addSubview(label)
        
        NSLayoutConstraint.topToTop(
            view:label,
            toView:self,
            constant:kLabelMargin)
        NSLayoutConstraint.leftToLeft(
            view:label,
            toView:self,
            constant:kLabelMargin)
        NSLayoutConstraint.width(
            view:label,
            constant:kLabelWidth)
        NSLayoutConstraint.height(
            view:label,
            constant:height)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        return nil
    }
}
