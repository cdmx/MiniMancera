import SpriteKit

class VOptionWhistlesVsZombiesPointsAmount:SKLabelNode
{
    private let kFontSize:CGFloat = 12
    private let kPositionX:CGFloat = 20
    private let kPositionY:CGFloat = -8
    
    init(amount:Int)
    {
        let string:String = "+ \(amount)"
        
        super.init()
        fontName = UIFont.kFontGame
        fontSize = kFontSize
        fontColor = SKColor.white
        zPosition = MOptionWhistlesVsZombiesZPosition.PointsAmount.rawValue
        horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        text = string
        
        positionStart()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func positionStart()
    {
        position = CGPoint(x:kPositionX, y:kPositionY)
    }
}
