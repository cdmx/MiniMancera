import SpriteKit

class VOptionWhistlesVsZombiesPointsAmount:SKLabelNode
{
    private let kFontSize:CGFloat = 10
    private let kPositionX:CGFloat = -35
    
    init(amount:Int)
    {
        let localizedString:String = String.localizedPollutedGarden(
            key:"VOptionWhistlesVsZombiesPointsAmount_label")
        let amount:NSNumber = amount as NSNumber
        let string:String = String(
            format:localizedString,
            amount)
        
        super.init()
        fontName = UIFont.kFontGame
        fontSize = kFontSize
        fontColor = SKColor.white
        zPosition = MOptionWhistlesVsZombiesZPosition.PointsAmount.rawValue
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
        position = CGPoint(x:kPositionX, y:0)
    }
}
