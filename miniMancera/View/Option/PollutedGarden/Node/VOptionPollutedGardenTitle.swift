import SpriteKit

class VOptionPollutedGardenTitle:SKLabelNode
{
    private let kVerticalAdd:CGFloat = -12
    private let kFontSize:CGFloat = 20
    
    override init()
    {
        super.init()
        fontName = UIFont.kFontGame
        fontSize = kFontSize
        fontColor = SKColor.white
        zPosition = MOptionPollutedGardenZPosition.Title.rawValue
        text = String.localizedPollutedGarden(key:"VOptionPollutedGardenTitle_label")
        
        positionStart()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func positionStart()
    {
        let sceneSize:CGSize = MGame.sceneSize
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let positionY:CGFloat = sceneHeight_2 + kVerticalAdd
        
        position = CGPoint(x:sceneWidth_2, y:positionY)
    }
}
