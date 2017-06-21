import UIKit

class VHomeFroobContentActionsStore:UIButton
{
    private weak var controller:CHomeFroob!
    private let kIconWidth:CGFloat = 50
    private let kAlphaSelected:CGFloat = 0.4
    private let kAlphaNotSelected:CGFloat = 1
    
    init(controller:CHomeFroob)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(
            self,
            action:#selector(actions(forTarget:forControlEvent:)),
            for:UIControlEvents.touchUpInside)
        self.controller = controller
        
        let viewGradient:VGradient = VGradient.horizontal(
            colorLeft:UIColor.orange,
            colorRight:UIColor.colourFail)
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.backgroundColor = UIColor.clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.bold(size:18)
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.text = String.localized(key:"VHomeFroobContentActionsStore_label")
        
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = UIViewContentMode.center
        icon.clipsToBounds = true
        icon.image = #imageLiteral(resourceName: "assetGenericStoreWhite")
        
        addSubview(viewGradient)
        addSubview(label)
        addSubview(icon)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:label,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:icon,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:icon,
            toView:self)
        NSLayoutConstraint.width(
            view:icon,
            constant:kIconWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let height:CGFloat = bounds.maxY
        let height_2:CGFloat = height / 2.0
        layer.cornerRadius = height_2
        
        super.layoutSubviews()
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: actions
    
    func actionButton(sender button:UIButton)
    {
        controller.openStore()
    }
    
    //MARK: private
    
    private func hover()
    {
        if isSelected || isHighlighted
        {
            alpha = kAlphaSelected
        }
        else
        {
            alpha = kAlphaNotSelected
        }
    }
}
