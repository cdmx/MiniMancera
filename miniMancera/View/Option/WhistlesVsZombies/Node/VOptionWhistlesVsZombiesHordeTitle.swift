import SpriteKit

class VOptionWhistlesVsZombiesHordeTitle:SKLabelNode
{
    private let kAddPositionY:CGFloat = 80
    private let kFontSize:CGFloat = 12
    
    override init()
    {
        super.init()
        alpha = 0
        text = String.localizedWhistlesVsZombies(
            key:"VOptionWhistlesVsZombiesHordeTitle_label")
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
