import UIKit

class VSettingsCellSounds:VSettingsCell
{
    private weak var segmented:UISegmentedControl!
    private let kLabelLeft:CGFloat = 10
    private let kLabelWidth:CGFloat = 200
    private let kCheckRight:CGFloat = -10
    private let kCheckTop:CGFloat = 10
    private let kCheckWidth:CGFloat = 100
    private let kCheckHeight:CGFloat = 50
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.font = UIFont.regular(size:15)
        labelTitle.textColor = UIColor.white
        labelTitle.text = NSLocalizedString("VSettingsCellSounds_labelTitle", comment:"")
        
        let check:UISwitch = UISwitch()
        check.translatesAutoresizingMaskIntoConstraints = false
        check.onTintColor = UIColor.colourSuccess
        
        addSubview(labelTitle)
        addSubview(check)
        
        NSLayoutConstraint.equalsVertical(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:kLabelLeft)
        NSLayoutConstraint.width(
            view:labelTitle,
            constant:kLabelWidth)
        
        NSLayoutConstraint.topToTop(
            view:check,
            toView:self,
            constant:kCheckTop)
        NSLayoutConstraint.height(
            view:check,
            constant:kCheckHeight)
        NSLayoutConstraint.rightToRight(
            view:check,
            toView:self,
            constant:kCheckRight)
        NSLayoutConstraint.width(
            view:check,
            constant:kCheckWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
}
