import UIKit

class VHomeSplashCell:UICollectionViewCell
{
    private(set) weak var controller:CHomeSplash?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func config(controller:CHomeSplash, model:MHomeSplashProtocol)
    {
        self.controller = controller
    }
}
