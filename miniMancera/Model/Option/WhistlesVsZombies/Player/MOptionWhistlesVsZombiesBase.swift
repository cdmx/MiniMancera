import SpriteKit

class MOptionWhistlesVsZombiesBase
{
    let texture:SKTexture
    let textureSize:CGSize
    let actionAnimation:SKAction
    private(set) var items:[MOptionWhistlesVsZombiesBaseItem]
    
    init()
    {
        items = []
        texture = SKTexture(image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleBase"))
        textureSize = texture.size()
        actionAnimation = MOptionWhistlesVsZombiesBase.factoryAnimation()
    }
    
    //MARK: public
    
    func createItems(sceneSize:CGSize)
    {
        items = MOptionWhistlesVsZombiesBase.factoryItems(sceneSize:sceneSize)
    }
}
