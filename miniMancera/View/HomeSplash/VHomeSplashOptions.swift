import UIKit

class VHomeSplashOptions:UIView
{
    private weak var controller:CHomeSplash!
    private weak var labelScore:UILabel!
    private weak var layoutPlayTop:NSLayoutConstraint!
    private let kScoreLeft:CGFloat = 10
    private let kScoreWidth:CGFloat = 300
    private let kPlayWidth:CGFloat = 90
    private let kPlayHeight:CGFloat = 32
    private let kPlayRight:CGFloat = -10
    private let kCornerRadius:CGFloat = 6
    
    init(controller:CHomeSplash)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let buttonPlay:UIButton = UIButton()
        buttonPlay.translatesAutoresizingMaskIntoConstraints = false
        buttonPlay.clipsToBounds = true
        buttonPlay.backgroundColor = UIColor.colourSuccess
        buttonPlay.layer.cornerRadius = kCornerRadius
        buttonPlay.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        buttonPlay.setTitleColor(
            UIColor(white:1, alpha:0.4),
            for:UIControlState.highlighted)
        buttonPlay.setTitle(
            String.localized(key:"VHomeSplashOptions_buttonPlay"),
            for:UIControlState.normal)
        buttonPlay.titleLabel!.font = UIFont.bold(size:15)
        buttonPlay.addTarget(
            self,
            action:#selector(actionPlay(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let labelScore:UILabel = UILabel()
        labelScore.translatesAutoresizingMaskIntoConstraints = false
        labelScore.isUserInteractionEnabled = false
        labelScore.backgroundColor = UIColor.clear
        self.labelScore = labelScore
        
        addSubview(labelScore)
        addSubview(buttonPlay)
        
        NSLayoutConstraint.equalsVertical(
            view:labelScore,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:labelScore,
            toView:self,
            constant:kScoreLeft)
        NSLayoutConstraint.width(
            view:labelScore,
            constant:kScoreWidth)

        layoutPlayTop = NSLayoutConstraint.topToTop(
            view:buttonPlay,
            toView:self)
        NSLayoutConstraint.height(
            view:buttonPlay,
            constant:kPlayHeight)
        NSLayoutConstraint.rightToRight(
            view:buttonPlay,
            toView:self,
            constant:kPlayRight)
        NSLayoutConstraint.width(
            view:buttonPlay,
            constant:kPlayWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let height:CGFloat = bounds.maxY
        let remainHeight:CGFloat = height - kPlayHeight
        let marginTop:CGFloat = remainHeight / 2.0
        layoutPlayTop.constant = marginTop
        
        super.layoutSubviews()
    }
    
    //MARK: actions
    
    func actionPlay(sender button:UIButton)
    {
        controller.play()
    }
    
    //MARK: private
    
    private func createScore()
    {
        let attributesScoreTitle:[String:AnyObject] = [
            NSFontAttributeName:UIFont.bold(size:14),
            NSForegroundColorAttributeName:UIColor.white]
        let attributesScoreNumber:[String:AnyObject] = [
            NSFontAttributeName:UIFont.regular(size:14),
            NSForegroundColorAttributeName:UIColor.white]
        
        let numberFormatter:NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        
        guard
            
            let scoreInt:Int32 = controller.model.dataOption?.maxScore
            
        else
        {
            return
        }
        
        let score:NSNumber = scoreInt as NSNumber
        
        guard
            
            let scoreString:String = numberFormatter.string(from:score)
            
        else
        {
            return
        }
        
        let stringTitle:NSAttributedString = NSAttributedString(
            string:String.localized(key:"VHomeSplashOptions_scoreTitle"),
            attributes:attributesScoreTitle)
        let stringNumber:NSAttributedString = NSAttributedString(
            string:scoreString,
            attributes:attributesScoreNumber)
        let mutableStringScore:NSMutableAttributedString = NSMutableAttributedString()
        mutableStringScore.append(stringTitle)
        mutableStringScore.append(stringNumber)
        
        labelScore.attributedText = mutableStringScore
    }
    
    //MARK: public
    
    func refresh()
    {
        createScore()
    }
}
