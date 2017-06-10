import UIKit

class VCreateCell:UICollectionViewCell
{
    private(set) weak var controller:CCreate?
    
    override init(frame:CGRect)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func config(controller:CCreate)
    {
        self.controller = controller
    }
}
