import SpriteKit

class VOptionPollutedGardenGameOverTitle:SKLabelNode
{
    private let kVerticalAdd:CGFloat = 167
    private let kFontSize:CGFloat = 20
    
    override init()
    {
        super.init()
        text = String.localizedPollutedGarden(key:"VOptionPollutedGardenGameOverTitle_label")
        fontName = UIFont.kFontBold
        fontSize = kFontSize
        fontColor = SKColor.white
        zPosition = MOptionPollutedGardenZPosition.GameOverTitle.rawValue
        
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
        let width_2:CGFloat = sceneSize.width / 2.0
        let height_2:CGFloat = sceneSize.height / 2.0
        let positionY:CGFloat = height_2 + kVerticalAdd
        
        position = CGPoint(x:width_2, y:positionY)
    }
}