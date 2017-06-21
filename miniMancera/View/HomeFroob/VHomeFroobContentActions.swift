import UIKit

class VHomeFroobContentActions:UIView
{
    private weak var controller:CHomeFroob!
    
    init(controller:CHomeFroob)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let buttonStore:UIButton = UIButton()
        
        let buttonCancel:UIButton = UIButton()
        buttonCancel
        
        addSubview(buttonStore)
        addSubview(buttonCancel)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
