import UIKit

class VHomeSplashCellScore:VHomeSplashCell
{
    private weak var labelScore:UILabel!
    private weak var imageView:UIImageView!
    private weak var layoutLabelLeft:NSLayoutConstraint!
    private weak var timer:Timer?
    private var expectedScore:Int
    private var currentScore:Int
    private let numberFormatter:NumberFormatter
    private let kFontSize:CGFloat = 20
    private let kLabelWidth:CGFloat = 150
    private let kImageWidth:CGFloat = 60
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
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.center
        self.imageView = imageView
        
        let labelScore:UILabel = UILabel()
        labelScore.translatesAutoresizingMaskIntoConstraints = false
        labelScore.isUserInteractionEnabled = false
        labelScore.font = UIFont.game(size:kFontSize)
        labelScore.textColor = UIColor.white
        self.labelScore = labelScore
        
        addSubview(imageView)
        addSubview(labelScore)
        
        NSLayoutConstraint.equalsVertical(
            view:labelScore,
            toView:self)
        layoutLabelLeft = NSLayoutConstraint.leftToLeft(
            view:labelScore,
            toView:self)
        NSLayoutConstraint.width(
            view:labelScore,
            constant:kLabelWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:imageView,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:imageView,
            toView:labelScore)
        NSLayoutConstraint.width(
            view:imageView,
            constant:kImageWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        timer?.invalidate()
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let contentWidth:CGFloat = kLabelWidth + kImageWidth
        let remainWidth:CGFloat = width - contentWidth
        let marginLeft:CGFloat = remainWidth / 2.0
        layoutLabelLeft.constant = marginLeft
        
        super.layoutSubviews()
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
        
        imageView.image = model.icon
        numberFormatter.positiveSuffix = model.suffix
        currentScore = 0
        expectedScore = model.score
        
        print()
        
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
        let score:NSNumber = self.currentScore as NSNumber
        
        guard
        
            let scoreString:String = numberFormatter.string(from:score)
        
        else
        {
            return
        }
        
        labelScore.text = scoreString
    }
}
