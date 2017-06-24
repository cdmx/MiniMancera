import SpriteKit

class VOptionWhistlesVsZombiesBase:SKSpriteNode
{
    private weak var controller:COptionWhistlesVsZombies!
    private weak var modelBase:MOptionWhistlesVsZombiesBase!
    private weak var model:MOptionWhistlesVsZombiesBaseItem!
    private let kAlphaCharged:CGFloat = 0.5
    
    init(
        controller:COptionWhistlesVsZombies,
        model:MOptionWhistlesVsZombiesBaseItem)
    {
        self.controller = controller
        self.model = model
        modelBase = controller.model.base
        
        super.init(
            texture:modelBase.texture,
            color:UIColor.clear,
            size:modelBase.textureSize)
        zPosition = MOptionWhistlesVsZombiesZPosition.Base.rawValue
        position = CGPoint(x:model.positionX, y:model.positionY)
        isUserInteractionEnabled = true
        model.view = self
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func touchesBegan(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        run(modelBase.actionAnimation)
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        controller.editBase(editingBase:model)
    }
    
    //MARK: public
    
    func charged()
    {
        alpha = kAlphaCharged
    }
}
