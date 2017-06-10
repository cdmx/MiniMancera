import UIKit

class VShareCell:UICollectionViewCell
{
    private(set) weak var controller:CShare?
    
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
    
    func config(controller:CShare)
    {
        self.controller = controller
    }
}
