import React, { Component } from 'react'
import './game.css'

class Game extends Component{
    render(){
        return(
            <>
                <div className='game_left'>
                    <div class="container">
                        <h1>Tic-Tac-Toe</h1>
                        <ul id="game">
                            <li data-pos="0,0"></li>
                            <li data-pos="0,1"></li>
                            <li data-pos="0,2"></li>

                            <li data-pos="1,0"></li>
                            <li data-pos="1,1"></li>
                            <li data-pos="1,2"></li>
                            
                            <li data-pos="2,0"></li>
                            <li data-pos="2,1"></li> 
                            <li data-pos="2,2"></li>
                        </ul>
                    </div>
                </div>
                <div className='game_right'>
                </div>
            </>
        )
    }
}

export default Game

