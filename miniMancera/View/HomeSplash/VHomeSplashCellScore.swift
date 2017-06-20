import UIKit

class VHomeSplashCellScore:VHomeSplashCell
{
    private weak var labelScore:UILabel!
    private weak var imageView:UIImageView!
    private weak var timer:Timer?
    private var expectedScore:Int
    private var currentScore:Int
    private let numberFormatter:NumberFormatter
    private let kFontSize:CGFloat = 20
    private let kTimerInterval:TimeInterval = 0.1
    private let kMinIntegers:Int = 0
    private let kMaxDecimals:Int = 0
    
    override init(frame:CGRect)
    {
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.minimumIntegerDigits = kMinIntegers
        numberFormatter.maximumFractionDigits = kMaxDecimals
        expectedScore = 0
        currentScore = 0
        
        super.init(frame:frame)
        
        let labelScore:UILabel = UILabel()
        labelScore.translatesAutoresizingMaskIntoConstraints = false
        labelScore.isUserInteractionEnabled = false
        labelScore.font = UIFont.game(size:kFontSize)
        labelScore.textColor = UIColor.white
        labelScore.textAlignment = NSTextAlignment.center
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
    
    deinit
    {
        timer?.invalidate()
    }
    
    override func config(controller:CHomeSplash, model:MHomeSplashProtocol)
    {
        super.config(controller:controller, model:model)
        
        timer?.invalidate()
        
        guard
            
            let model:MHomeSplashScore = model as? MHomeSplashScore
        
        else
        {
            return
        }
        
        currentScore = 0
        expectedScore = model.score
        
        timer = Timer.scheduledTimer(
            timeInterval:kTimerInterval,
            target:self,
            selector:#selector(actionTimer(sender:)),
            userInfo:nil,
            repeats:true)
    }
    
    //MARK: actions
    
    func actionTimer(sender timer:Timer)
    {
        if currentScore >= expectedScore
        {
            timer.invalidate()
        }
        else
        {
            currentScore += 1
            
            print()
        }
    }
    
    //MARK: private
    
    private func print()
    {
        
    }
}
