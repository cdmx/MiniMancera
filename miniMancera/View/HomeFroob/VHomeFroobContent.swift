import UIKit

class VHomeFroobContent:UIView
{
    private weak var controller:CHomeFroob!
    private weak var labelTitle:UILabel!
    private let kCornerRadius:CGFloat = 15
    private let kActionsHeight:CGFloat = 80
    private let kInfoHeight:CGFloat = 200
    private let kBorderWidth:CGFloat = 2
    
    init(controller:CHomeFroob)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.black
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = kCornerRadius
        layer.borderWidth = kBorderWidth
        layer.borderColor = UIColor.black.cgColor
        self.controller = controller
        
        let viewHeader:VHomeFroobContentHeader = VHomeFroobContentHeader(controller:controller)
        let viewInfo:VHomeFroobContentInfo = VHomeFroobContentInfo(controller:controller)
        let viewActions:VHomeFroobContentActions = VHomeFroobContentActions(controller:controller)
        
        addSubview(viewHeader)
        addSubview(viewInfo)
        addSubview(viewActions)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewActions,
            toView:self)
        NSLayoutConstraint.height(
            view:viewActions,
            constant:kActionsHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewActions,
            toView:self)
        
        NSLayoutConstraint.bottomToTop(
            view:viewInfo,
            toView:viewActions)
        NSLayoutConstraint.height(
            view:viewInfo,
            constant:kInfoHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewInfo,
            toView:self)
        
        NSLayoutConstraint.bottomToTop(
            view:viewHeader,
            toView:viewInfo)
        NSLayoutConstraint.topToTop(
            view:viewHeader,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewHeader,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func printInfo()
    {
        guard
            
            let title:String = controller.option.title
        
        else
        {
            return
        }
        
        let attributesTitle:[String:AnyObject] = [
            NSFontAttributeName:UIFont.bold(size:22),
            NSForegroundColorAttributeName:UIColor.white]
        let attributesSubtitle:[String:AnyObject] = [
            NSFontAttributeName:UIFont.regular(size:15),
            NSForegroundColorAttributeName:UIColor.white]
        let stringTitle:NSAttributedString = NSAttributedString(
            string:title,
            attributes:attributesTitle)
        let stringSubtitle:NSAttributedString = NSAttributedString(
            string:String.localized(key:"VHomeFroobContent_labelSubtitle"),
            attributes:attributesSubtitle)
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.append(stringTitle)
        mutableString.append(stringSubtitle)
        
        labelTitle.attributedText = mutableString
    }
}
