import Foundation

class MOptionTamalesOaxaquenosControls:MGameUpdate<MOptionTamalesOaxaquenos>
{
    weak var view:VOptionTamalesOaxaquenosControls?
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionTamalesOaxaquenos>)
    {
        guard
        
            let pendingTouch:Bool = view?.pendingTouch()
        
        else
        {
            return
        }
        
        if pendingTouch
        {
            scene.controller.model.player.impulse()
        }
    }
}
