import Foundation

class VOptionWhistlesVsZombiesWhistle:ViewGameNode<MOptionWhistlesVsZombies>
{
    private weak var textureExploded:MGameTexture!
    private weak var model:MOptionWhistlesVsZombiesWhistleBase!
    
    init?(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesWhistleBase)
    {
        guard
        
            let texture:MGameTexture = model.whistleType?.texture
        
        else
        {
            return nil
        }
        
        self.model = model
        textureExploded = controller.model.textures.whistleExploded
        
        super.init(
            controller:controller,
            texture:texture)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        position = model.position
    }
    
    //MARK: public
    
    func explode()
    {
        texture = textureExploded.texture
    }
}
