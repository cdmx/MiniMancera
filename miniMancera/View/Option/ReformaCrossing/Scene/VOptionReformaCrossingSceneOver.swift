import UIKit

class VOptionReformaCrossingSceneOver:ViewGameScene<MOptionReformaCrossing>
{
    init(
        controller:ControllerGame<MOptionReformaCrossing>,
        gameOver:MOptionReformaCrossingGameOverProtocol)
    {
        super.init(controller:controller)
        factoryNodes(gameOver:gameOver)
    }
    
    required init(controller:ControllerGame<MOptionReformaCrossing>)
    {
        super.init(controller:controller)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryNodes(gameOver:MOptionReformaCrossingGameOverProtocol)
    {
        let textures:MOptionReformaCrossingTextures = controller.model.textures
        let texturePlayer:MGameTexture = gameOver.texture(textures:textures)
        
        let background:VOptionReformaCrossingBackground = VOptionReformaCrossingBackground(
            controller:controller)
        
        let info:ViewGameNodeGameOverInfo = ViewGameNodeGameOverInfo(
            title:gameOver.title,
            descr:gameOver.descr,
            zPosition:MOptionReformaCrossingZPosition.GameOverInfo.rawValue)
        
        let title1up:ViewGameNodeGameOverTitle1up = ViewGameNodeGameOverTitle1up(
            text:String.localizedReformaCrossing(
                key:"VOptionReformaCrossingSceneOver_1up"),
            zPosition:MOptionReformaCrossingZPosition.GameOverTitle1up.rawValue)
        
        let titleExit:ViewGameNodeGameOverTitleExit = ViewGameNodeGameOverTitleExit(
            text:String.localizedReformaCrossing(
                key:"VOptionReformaCrossingSceneOver_exit"),
            zPosition:MOptionReformaCrossingZPosition.GameOverTitleExit.rawValue)
        
        let player:ViewGameNodeGameOverPlayer<MOptionReformaCrossing> = ViewGameNodeGameOverPlayer<MOptionReformaCrossing>(
            controller:controller,
            texture:texturePlayer)
        
        let button1up:ViewGameNodeGameOver1up<MOptionReformaCrossing> = ViewGameNodeGameOver1up<MOptionReformaCrossing>(
            controller:controller,
            texture:textures.gameOver1up)
        
        let buttonExit:ViewGameNodeGameOverExit<MOptionReformaCrossing> = ViewGameNodeGameOverExit<MOptionReformaCrossing>(
            controller:controller,
            texture:textures.gameOverExit)
        
        addChild(background)
        addChild(info)
        addChild(title1up)
        addChild(titleExit)
        addChild(player)
        addChild(button1up)
        addChild(buttonExit)
    }
}
