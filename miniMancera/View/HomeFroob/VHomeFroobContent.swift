import UIKit

class VHomeFroobContent:UIView
{
    private weak var controller:CHomeFroob!
    private weak var labelTitle:UILabel!
    private let kCornerRadius:CGFloat = 15
    private let kTitleMargin:CGFloat = 25
    private let kTitleHeight:CGFloat = 180
    private let kTitleTop:CGFloat = -35
    private let kButtonsHeight:CGFloat = 62
    
    init(controller:CHomeFroob)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.black
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = kCornerRadius
        self.controller = controller
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.center
        imageView.image = controller.option.thumbnail
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.numberOfLines = 0
        self.labelTitle = labelTitle
        
        let viewButtons:VHomeFroobContentButtons = VHomeFroobContentButtons(
            controller:controller)
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
