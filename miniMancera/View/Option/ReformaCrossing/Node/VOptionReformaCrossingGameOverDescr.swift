import SpriteKit

class VOptionReformaCrossingGameOverDescr:SKLabelNode
{
    private let kVerticalAdd:CGFloat = 150
    private let kFontSize:CGFloat = 12
    
    init(model:MOptionReformaCrossingGameOverProtocol)
    {
        super.init()
        text = model.descr
        fontName = UIFont.kFontBold
        fontSize = kFontSize
        fontColor = SKColor.white
        zPosition = MOptionReformaCrossingZPosition.GameOverDescr.rawValue
        
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
