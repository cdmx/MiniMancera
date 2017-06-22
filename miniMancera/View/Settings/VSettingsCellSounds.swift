import UIKit

class VSettingsCellSounds:VSettingsCell
{
    private weak var segmented:UISegmentedControl!
    private let kLabelRight:CGFloat = -15
    private let kLabelWidth:CGFloat = 200
    private let kCheckRight:CGFloat = -5
    private let kCheckTop:CGFloat = 22
    private let kCheckWidth:CGFloat = 70
    private let kCheckHeight:CGFloat = 60
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.font = UIFont.regular(size:14)
        labelTitle.textColor = UIColor.white
        labelTitle.textAlignment = NSTextAlignment.right
        labelTitle.text = String.localized(key:"VSettingsCellSounds_labelTitle")
        
        let check:UISwitch = UISwitch()
        check.translatesAutoresizingMaskIntoConstraints = false
        check.onTintColor = UIColor.colourSuccess
        check.addTarget(
            self,
            action:#selector(actionCheck(sender:)),
            for:UIControlEvents.valueChanged)
        
        addSubview(labelTitle)
        addSubview(check)
        
        NSLayoutConstraint.equalsVertical(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.rightToLeft(
            view:labelTitle,
            toView:check,
            constant:kLabelRight)
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
        
        guard
        
            let sounds:Bool = MSession.sharedInstance.settings?.sounds
        
        else
        {
            return
        }
        
        check.isOn = sounds
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionCheck(sender check:UISwitch)
    {
        let sounds:Bool = check.isOn
        MSession.sharedInstance.settings?.changeSounds(sounds:sounds)
    }
}
