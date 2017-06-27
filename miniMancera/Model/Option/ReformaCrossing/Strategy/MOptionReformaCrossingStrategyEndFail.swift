import SpriteKit

class MOptionReformaCrossingStrategyEndFail:MOptionReformaCrossingStrategyEnd
{
    override func timeOut(scene:VOptionReformaCrossingScene)
    {
        let controller:ControllerGame<MOptionReformaCrossing> = scene.controller
        let transition:SKTransition = controller.model.actions.transitionCrossFade
        let scene:VOptionReformaCrossingSceneOver = VOptionReformaCrossingSceneOver(
            controller:controller)
        scene.view?.presentScene(scene, transition:transition)
    }
}
