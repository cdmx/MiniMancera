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
        
        createScore()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
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
            toView:self,
            constant:kScoreLeft)
        NSLayoutConstraint.width(
            view:labelScore,
            constant:kScoreWidth)
    }
}
