import UIKit

class VHomeSplashCellScore:VHomeSplashCell
{
    private weak var labelScore:UILabel!
    private weak var imageView:UIImageView!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let labelScore:UILabel = UILabel()
        labelScore.translatesAutoresizingMaskIntoConstraints = false
        labelScore.isUserInteractionEnabled = false
        labelScore.font = UIFont.game(size:20)
        labelScore.textColor = UIColor.white
        labelScore.textAlignment = NSTextAlignment.center
        labelScore.text = "120"
        self.labelScore = labelScore
        
        addSubview(labelScore)
        
        NSLayoutConstraint.equals(
            view:labelScore,
            toView:self)
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
