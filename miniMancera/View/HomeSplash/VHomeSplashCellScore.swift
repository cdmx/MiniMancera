import UIKit

class VHomeSplashCellScore:VHomeSplashCell
{
    private weak var labelScore:UILabel!
    private weak var imageView:UIImageView!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let labelScore:UILabel = UILabel()
        
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(controller:CHomeSplash, model:MHomeSplashProtocol)
    {
        super.config(controller:controller, model:model)
        
    }
}
