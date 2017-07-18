import SpriteKit

class MOptionTamalesOaxaquenosCamera:MGameUpdate<MOptionTamalesOaxaquenos>
{
    weak var view:SKCameraNode?
    private weak var player:MOptionTamalesOaxaquenosPlayer!
    private let sceneHeight_2:CGFloat
    private let kPlayerDifferenceX:CGFloat = 100
    
    init(player:MOptionTamalesOaxaquenosPlayer)
    {
        let sceneHeight:CGFloat = MGame.sceneSize.height
        sceneHeight_2 = sceneHeight / 2.0
        
        self.player = player
        super.init()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionTamalesOaxaquenos>)
    {
        guard
            
            let playerView:VOptionTamalesOaxaquenosPlayer = player.view
        
        else
        {
            return
        }
        
        let playerViewX:CGFloat = playerView.position.x
        let positionX:CGFloat = playerViewX + kPlayerDifferenceX
        let position:CGPoint = CGPoint(x:positionX, y:sceneHeight_2)
        
        view?.position = position
    }
}
