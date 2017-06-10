import UIKit

class VShareImage:UIView
{
    private let kMarginHorizontal:CGFloat = 40
    
    init(
        modelHomeItem:MHomeItem,
        noteFrame:DNoteFrame,
        scale:CGFloat,
        frame:CGRect)
    {
        let font:UIFont = modelHomeItem.font()
        let fontSize:CGFloat = font.pointSize
        let scaledFont:UIFont = font.withSize(fontSize * scale)
        let marginScaled:CGFloat = kMarginHorizontal * scale
        
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.black
        isUserInteractionEnabled = false
        
        let background:UIView = modelHomeItem.background.view()
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        label.font = scaledFont
        label.text = noteFrame.text
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        
        addSubview(background)
        addSubview(label)
        
        NSLayoutConstraint.equals(
            view:background,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:label,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self,
            margin:marginScaled)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
