import SpriteKit

class VOptionReformaCrossingSceneOver:ViewGameScene<MOptionReformaCrossing>
{
    init(controller:ControllerGame<MOptionReformaCrossing>, gameOver:MOptionReformaCrossingGameOverProtocol)
    {
        super.init(controller:controller)
        
        let background:VOptionReformaCrossingBackground = VOptionReformaCrossingBackground(
            controller:controller)
        
        let title:VOptionReformaCrossingGameOverTitle = VOptionReformaCrossingGameOverTitle(
            model:gameOver)
        
        let descr:VOptionReformaCrossingGameOverDescr = VOptionReformaCrossingGameOverDescr(
            model:gameOver)
        
        let title1up:VOptionReformaCrossingGameOverTitle1up = VOptionReformaCrossingGameOverTitle1up()
        
        let titleExit:VOptionReformaCrossingGameOverTitleExit = VOptionReformaCrossingGameOverTitleExit()
        
        let player:VOptionReformaCrossingGameOverPlayer = VOptionReformaCrossingGameOverPlayer(
            controller:controller,
            gameOver:gameOver)
        
        let button1up:VOptionReformaCrossingGameOver1up = VOptionReformaCrossingGameOver1up(
            controller:controller)
        
        let buttonExit:VOptionReformaCrossingGameOverExit = VOptionReformaCrossingGameOverExit(
            controller:controller)
        
        addChild(background)
        addChild(title)
        addChild(descr)
        addChild(title1up)
        addChild(titleExit)
        addChild(player)
        addChild(button1up)
        addChild(buttonExit)
    }
    
    required init(controller:ControllerGame<MOptionReformaCrossing>)
    {
        super.init(controller:controller)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
