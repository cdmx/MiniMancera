import UIKit

class VHomeSplashOptions:UIView
{
    private weak var controller:CHomeSplash!
    private let kScoreLeft:CGFloat = 10
    private let kScoreWidth:CGFloat = 300
    
    init(controller:CHomeSplash)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let attributesScoreTitle:[String:AnyObject] = [
            NSFontAttributeName:UIFont.bold(size:13),
            NSForegroundColorAttributeName:UIColor.white]
        let attributesScoreNumber:[String:AnyObject] = [
            NSFontAttributeName:UIFont.regular(size:15),
            NSForegroundColorAttributeName:UIColor.white]
        
        let numberFormatter:NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        
        let score:NSNumber = controller.dataOption.maxScore as NSNumber
        
        guard
            
            let scoreString:String = numberFormatter.string(from:score)
        
        else
        {
            return
        }
        
        let stringTitle:NSAttributedString = NSAttributedString(
            string:String.localizedReformaCrossing(key:"VHomeSplashOptions_scoreTitle"),
            attributes:attributesScoreTitle)
        let stringNumber:NSAttributedString = NSAttributedString(
            string:scoreString,
            attributes:attributesScoreNumber)
        let mutableStringScore:NSMutableAttributedString = NSMutableAttributedString()
        mutableStringScore.append(stringTitle)
        mutableStringScore.append(stringNumber)
        
        let labelScore:UILabel = UILabel()
        labelScore.translatesAutoresizingMaskIntoConstraints = false
        labelScore.isUserInteractionEnabled = false
        labelScore.backgroundColor = UIColor.clear
        labelScore.attributedText = mutableStringScore
        
        addSubview(labelScore)
        
        NSLayoutConstraint.equalsVertical(
            view:labelScore,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:labelScore,
            toView:self)
        NSLayoutConstraint.width(
            view:labelScore,
            constant:kScoreWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
