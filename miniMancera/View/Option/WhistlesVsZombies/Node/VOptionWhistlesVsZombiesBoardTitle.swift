import SpriteKit

class VOptionWhistlesVsZombiesBoardTitle:SKLabelNode
{
    private let kPositionYSubtract:CGFloat = -50
    private let kFontSize:CGFloat = 14
    
    override init()
    {
        super.init()
        fontName = UIFont.kFontGame
        fontSize = kFontSize
        fontColor = SKColor.white
        zPosition = MOptionWhistlesVsZombiesZPosition.BoardTitle.rawValue
        text = String.localizedWhistlesVsZombies(key:"VOptionWhistlesVsZombiesBoardTitle_label")
        
        positionStart()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func positionStart()
    {
        let sceneHeight:CGFloat = MGame.sceneSize.height
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let positionY:CGFloat = sceneHeight_2 + kPositionYSubtract
        
        position = CGPoint(x:0, y:positionY)
    }
}
