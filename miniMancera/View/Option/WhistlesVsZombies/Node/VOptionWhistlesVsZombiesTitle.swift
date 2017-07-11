import SpriteKit

class VOptionWhistlesVsZombiesTitle:SKLabelNode
{
    private let kAddPositionY:CGFloat = 120
    private let kFontSize:CGFloat = 15
    
    override init()
    {
        super.init()
        text = String.localizedWhistlesVsZombies(
            key:"VOptionWhistlesVsZombiesTitle_label")
        fontName = UIFont.kFontGame
        fontSize = kFontSize
        fontColor = SKColor.white
        zPosition = MOptionWhistlesVsZombiesZPosition.Title.rawValue
        
        positionStart()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func positionStart()
    {
        let sceneWidth:CGFloat = MGame.sceneSize.height
        let sceneHeight:CGFloat = MGame.sceneSize.width
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let positionY:CGFloat = sceneHeight_2 + kAddPositionY
        position = CGPoint(x:sceneWidth_2, y:positionY)
    }
}
