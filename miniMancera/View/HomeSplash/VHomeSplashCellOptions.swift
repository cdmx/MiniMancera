import UIKit

class VHomeSplashCellOptions:VHomeSplashCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let buttonPlay:UIButton = UIButton()
        
        
        addSubview(buttonPlay)
        
        
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
